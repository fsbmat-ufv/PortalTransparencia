# Clear plots
if(!is.null(dev.list())) dev.off()
# Clean workspace
rm(list=ls())
library("tidyverse")
library("plotly")
library("readr")
library("data.table")
library("stringr")
library("lubridate")
library("htmlTable")
library("magrittr")
library("writexl")
setwd("~/GitHub/Proj_Portal_Transparencia/Licitacoes/BancoDados")
# Clear console
cat("\014")
options(datatable.fread.input.cmd.message=FALSE)
dados <- data.table::fread("ItemLicitacaoUFV.csv", dec = ",", encoding = "Latin-1")
dados$Valor <- as.numeric(as.character(dados$Valor))
CEDAF <- dados %>% filter(CodUG=="154052")
str(CEDAF$Valor)

options(scipen = 999)
dados %>% group_by(Instituicao) %>% summarise(Valor=sum(Valor), .groups = 'drop') %>% 
  ggplot(aes(reorder(Instituicao, desc(Valor)), 
                     Valor, fill=Instituicao, label=Valor))+ 
  scale_x_discrete(name ="Instituição", 
                   labels=c("UFV (CAV + CRP)", "CAF"))+
  geom_col(show.legend = FALSE)+ ylim(0,650000000)+
  geom_text(aes(label=paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5)+
  theme_bw() + ggtitle("Valor Total investido em Compras desde 2013 (em R$)") + 
  ylab("Valor Total (R$)") + xlab(NULL)

unique(dados$CodUG)

options(scipen = 999)
dados %>% filter(CodUG=="154051")%>% group_by(Instituicao, Ano) %>% 
  summarise(Valor=sum(Valor), .groups = 'drop') %>% 
  ggplot(aes(Ano, 
             Valor, fill=Ano, label=Valor))+ 
  scale_x_continuous(breaks = c(2013:2020), 
                     labels = factor(2013:2020), 
                     limits = c(2012.5,2021.5))+
  geom_col(show.legend = FALSE)+ ylim(0,115000000)+
  geom_text(aes(label= paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f'))), 
            vjust = -0.6, hjust=0.2, angle=10)+
  theme_bw() + ggtitle("Valor Total investido em Compras desde 2013 (em R$)") + 
  ylab("Valor Total (R$)") + xlab(NULL)




CEDAF %>% group_by(Ano) %>% tally() %>% 
  ggplot(aes(Ano, n, fill=Ano, label=n)) + geom_col(show.legend = FALSE) + 
  scale_x_continuous(breaks = c(2013:2020), 
                     labels = factor(2013:2020), 
                     limits = c(2012.5,2020.5)) + 
  scale_y_continuous(limits = c(0,3000))+
  geom_text(vjust = -0.5)+
  theme_bw() + ggtitle("Quantidade de Processos de Licitação do Campus") + 
  ylab("Quantidade")



CEDAF %>% count(NomeVencedor, sort = TRUE) %>% top_n(5) %>% 
  ggplot(aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(n)), n, fill=NomeVencedor, label=n)) + 
  geom_col(show.legend = FALSE) + 
  scale_y_continuous(limits = c(0,300))+
  geom_text(vjust = -0.5)+
  theme_bw() + ggtitle("As Cinco Empresas que mais Venderam para o Campus \n desde 2013") + 
  ylab("Quantidade de Vendas") + xlab(NULL)

options(scipen = 999)

df <- CEDAF %>% group_by(NomeVencedor) %>% summarise(Total = sum(Valor))%>% top_n(5)

  ggplot(df, aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(Total)), Total, fill=NomeVencedor, label=Total)) + 
  geom_bar(stat='identity', show.legend = FALSE) + 
  scale_y_continuous(limits = c(0,3000000))+
  geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5)+
  theme_bw() + ggtitle("As Cinco Empresas que mais Venderam para o Campus \n 
                       desde 2013 e os Respectivos Totais (em R$)") + 
  ylab("Valor Total de Vendas (R$)") + xlab(NULL)

df <- CEDAF %>% filter(Ano=="2020") %>% group_by(NomeVencedor) %>% summarise(Total = sum(Valor))%>% top_n(5)
  
ggplot(df, aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(Total)), Total, fill=NomeVencedor, label=Total)) + 
    geom_bar(stat='identity', show.legend = FALSE) + 
    scale_y_continuous(limits = c(0,3000000))+
    geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5)+
    theme_bw() + ggtitle("As Cinco Empresas que mais Venderam para o Campus \n 
                       em 2020 e os Respectivos Totais (em R$)") + 
    ylab("Valor Total de Vendas (R$)") + xlab(NULL)
  

df <- CEDAF %>% filter(Ano=="2019") %>% group_by(NomeVencedor) %>% summarise(Total = sum(Valor))%>% top_n(5)

ggplot(df, aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(Total)), Total, fill=NomeVencedor, label=Total)) + 
  geom_bar(stat='identity', show.legend = FALSE) + 
  scale_y_continuous(limits = c(0,3000000))+
  geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5)+
  theme_bw() + ggtitle("As Cinco Empresas que mais Venderam para o Campus \n 
                       em 2019 e os Respectivos Totais (em R$)") + 
  ylab("Valor Total de Vendas (R$)") + xlab(NULL)

options(scipen = 999)
CEDAF %>% group_by(Descricao) %>% 
  summarise(Total = sum(Valor))%>% top_n(10) %>%  arrange(Total, decrease=TRUE) 
  


  theme(axis.text.x=element_text(size = 8, colour = "black", angle = 30, hjust = 0, 
                                 vjust = 0.5))



TopPart <- CEDAF %>% group_by(NomeVencedor) %>% summarise(Total=sum(Valor)) %>% arrange(desc(Total))
TopVit <- CEDAF %>% filter(Vencedor=="SIM") %>% group_by(Participante)%>% summarise(Vit=n()) %>% arrange(desc(Vit))

TopVit <- CEDAF %>% filter(Vencedor=="SIM", Ano=="2019") %>% group_by(Participante)%>% summarise(Vit=n()) %>% arrange(desc(Vit))


unique(dados$CodUG)

install.packages('rsconnect')
rsconnect::setAccountInfo(name='maf172',
                          token='81C0A49A8C3278A8EC9FA4B8426BEA2E',
                          secret='<SECRET>')
