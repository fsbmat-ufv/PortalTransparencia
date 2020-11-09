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
setwd("~/GitHub/Proj_Portal_Transparencia/Licitacoes")
# Clear console
cat("\014")
#########################################################################################
#####################**********Leitura dos Dados*************############################
#########################################################################################
#2013
LicJan2013 <- "2013/201301_ParticipantesLicitação.csv"
LicFev2013 <- "2013/201302_ParticipantesLicitação.csv"
LicMar2013 <- "2013/201303_ParticipantesLicitação.csv"
LicAbr2013 <- "2013/201304_ParticipantesLicitação.csv"
LicMai2013 <- "2013/201305_ParticipantesLicitação.csv"
LicJun2013 <- "2013/201306_ParticipantesLicitação.csv"
LicJul2013 <- "2013/201307_ParticipantesLicitação.csv"
LicAgo2013 <- "2013/201308_ParticipantesLicitação.csv"
LicSet2013 <- "2013/201309_ParticipantesLicitação.csv"
LicOut2013 <- "2013/201310_ParticipantesLicitação.csv"
LicNov2013 <- "2013/201311_ParticipantesLicitação.csv"
LicDez2013 <- "2013/201312_ParticipantesLicitação.csv"
#2014
LicJan2014 <- "2014/201401_ParticipantesLicitação.csv"
LicFev2014 <- "2014/201402_ParticipantesLicitação.csv"
LicMar2014 <- "2014/201403_ParticipantesLicitação.csv"
LicAbr2014 <- "2014/201404_ParticipantesLicitação.csv"
LicMai2014 <- "2014/201405_ParticipantesLicitação.csv"
LicJun2014 <- "2014/201406_ParticipantesLicitação.csv"
LicJul2014 <- "2014/201407_ParticipantesLicitação.csv"
LicAgo2014 <- "2014/201408_ParticipantesLicitação.csv"
LicSet2014 <- "2014/201409_ParticipantesLicitação.csv"
LicOut2014 <- "2014/201410_ParticipantesLicitação.csv"
LicNov2014 <- "2014/201411_ParticipantesLicitação.csv"
LicDez2014 <- "2014/201412_ParticipantesLicitação.csv"
#2015
LicJan2015 <- "2015/201501_ParticipantesLicitação.csv"
LicFev2015 <- "2015/201502_ParticipantesLicitação.csv"
LicMar2015 <- "2015/201503_ParticipantesLicitação.csv"
LicAbr2015 <- "2015/201504_ParticipantesLicitação.csv"
LicMai2015 <- "2015/201505_ParticipantesLicitação.csv"
LicJun2015 <- "2015/201506_ParticipantesLicitação.csv"
LicJul2015 <- "2015/201507_ParticipantesLicitação.csv"
LicAgo2015 <- "2015/201508_ParticipantesLicitação.csv"
LicSet2015 <- "2015/201509_ParticipantesLicitação.csv"
LicOut2015 <- "2015/201510_ParticipantesLicitação.csv"
LicNov2015 <- "2015/201511_ParticipantesLicitação.csv"
LicDez2015 <- "2015/201512_ParticipantesLicitação.csv"
#2016
LicJan2016 <- "2016/201601_ParticipantesLicitação.csv"
LicFev2016 <- "2016/201602_ParticipantesLicitação.csv"
LicMar2016 <- "2016/201603_ParticipantesLicitação.csv"
LicAbr2016 <- "2016/201604_ParticipantesLicitação.csv"
LicMai2016 <- "2016/201605_ParticipantesLicitação.csv"
LicJun2016 <- "2016/201606_ParticipantesLicitação.csv"
LicJul2016 <- "2016/201607_ParticipantesLicitação.csv"
LicAgo2016 <- "2016/201608_ParticipantesLicitação.csv"
LicSet2016 <- "2016/201609_ParticipantesLicitação.csv"
LicOut2016 <- "2016/201610_ParticipantesLicitação.csv"
LicNov2016 <- "2016/201611_ParticipantesLicitação.csv"
LicDez2016 <- "2016/201612_ParticipantesLicitação.csv"
#2017
LicJan2017 <- "2017/201701_ParticipantesLicitação.csv"
LicFev2017 <- "2017/201702_ParticipantesLicitação.csv"
LicMar2017 <- "2017/201703_ParticipantesLicitação.csv"
LicAbr2017 <- "2017/201704_ParticipantesLicitação.csv"
LicMai2017 <- "2017/201705_ParticipantesLicitação.csv"
LicJun2017 <- "2017/201706_ParticipantesLicitação.csv"
LicJul2017 <- "2017/201707_ParticipantesLicitação.csv"
LicAgo2017 <- "2017/201708_ParticipantesLicitação.csv"
LicSet2017 <- "2017/201709_ParticipantesLicitação.csv"
LicOut2017 <- "2017/201710_ParticipantesLicitação.csv"
LicNov2017 <- "2017/201711_ParticipantesLicitação.csv"
LicDez2017 <- "2017/201712_ParticipantesLicitação.csv"
#2018
LicJan2018 <- "2018/201801_ParticipantesLicitação.csv"
LicFev2018 <- "2018/201802_ParticipantesLicitação.csv"
LicMar2018 <- "2018/201803_ParticipantesLicitação.csv"
LicAbr2018 <- "2018/201804_ParticipantesLicitação.csv"
LicMai2018 <- "2018/201805_ParticipantesLicitação.csv"
LicJun2018 <- "2018/201806_ParticipantesLicitação.csv"
LicJul2018 <- "2018/201807_ParticipantesLicitação.csv"
LicAgo2018 <- "2018/201808_ParticipantesLicitação.csv"
LicSet2018 <- "2018/201809_ParticipantesLicitação.csv"
LicOut2018 <- "2018/201810_ParticipantesLicitação.csv"
LicNov2018 <- "2018/201811_ParticipantesLicitação.csv"
LicDez2018 <- "2018/201812_ParticipantesLicitação.csv"
#2019
LicJan2019 <- "2019/201901_ParticipantesLicitação.csv"
LicFev2019 <- "2019/201902_ParticipantesLicitação.csv"
LicMar2019 <- "2019/201903_ParticipantesLicitação.csv"
LicAbr2019 <- "2019/201904_ParticipantesLicitação.csv"
LicMai2019 <- "2019/201905_ParticipantesLicitação.csv"
LicJun2019 <- "2019/201906_ParticipantesLicitação.csv"
LicJul2019 <- "2019/201907_ParticipantesLicitação.csv"
LicAgo2019 <- "2019/201908_ParticipantesLicitação.csv"
LicSet2019 <- "2019/201909_ParticipantesLicitação.csv"
LicOut2019 <- "2019/201910_ParticipantesLicitação.csv"
LicNov2019 <- "2019/201911_ParticipantesLicitação.csv"
LicDez2019 <- "2019/201912_ParticipantesLicitação.csv"
#2020
LicJan2020 <- "2020/202001_ParticipantesLicitação.csv"
LicFev2020 <- "2020/202002_ParticipantesLicitação.csv"
LicMar2020 <- "2020/202003_ParticipantesLicitação.csv"
LicAbr2020 <- "2020/202004_ParticipantesLicitação.csv"
LicMai2020 <- "2020/202005_ParticipantesLicitação.csv"
LicJun2020 <- "2020/202006_ParticipantesLicitação.csv"
LicJul2020 <- "2020/202007_ParticipantesLicitação.csv"
LicAgo2020 <- "2020/202008_ParticipantesLicitação.csv"
LicSet2020 <- "2020/202009_ParticipantesLicitação.csv"
LicOut2020 <- "2020/202010_ParticipantesLicitação.csv"
LicNov2020 <- "2020/202011_ParticipantesLicitação.csv"
LicDez2020 <- "2020/202012_ParticipantesLicitação.csv"

source("Funcoes/create_tabPartLicitacao.R")
start_time <- Sys.time()
#2013
Jan2013 <- create_tab(LicJan2013)
Fev2013 <- create_tab(LicFev2013)
Mar2013 <- create_tab(LicMar2013)
Abr2013 <- create_tab(LicAbr2013)
Mai2013 <- create_tab(LicMai2013)
Jun2013 <- create_tab(LicJun2013)
Jul2013 <- create_tab(LicJul2013)
Ago2013 <- create_tab(LicAgo2013)
Set2013 <- create_tab(LicSet2013)
Out2013 <- create_tab(LicOut2013)
Nov2013 <- create_tab(LicNov2013)
Dez2013 <- create_tab(LicDez2013)
Jan2013$Mes <- "Janeiro"
Jan2013$Ano <- "2013"
Fev2013$Mes <- "Fevereiro"
Fev2013$Ano <- "2013"
Mar2013$Mes <- "Marco"
Mar2013$Ano <- "2013"
Abr2013$Mes <- "Abril"
Abr2013$Ano <- "2013"
Mai2013$Mes <- "Maio"
Mai2013$Ano <- "2013"
Jun2013$Mes <- "Junho"
Jun2013$Ano <- "2013"
Jul2013$Mes <- "Julho"
Jul2013$Ano <- "2013"
Ago2013$Mes <- "Agosto"
Ago2013$Ano <- "2013"
Set2013$Mes <- "Setembro"
Set2013$Ano <- "2013"
Out2013$Mes <- "Outubro"
Out2013$Ano <- "2013"
Nov2013$Mes <- "Novembro"
Nov2013$Ano <- "2013"
Dez2013$Mes <- "Dezembro"
Dez2013$Ano <- "2013"
ParticipantesLicitacao2013 <- rbind(Jan2013, Fev2013,
                           Mar2013, Abr2013,
                           Mai2013, Jun2013,
                           Jul2013, Ago2013,
                           Set2013, Out2013,
                           Nov2013, Dez2013)
write.csv(ParticipantesLicitacao2013, "Ano2013/ParticipantesLicitacao2013.csv", row.names = FALSE)

#2014
Jan2014 <- create_tab(LicJan2014)
Fev2014 <- create_tab(LicFev2014)
Mar2014 <- create_tab(LicMar2014)
Abr2014 <- create_tab(LicAbr2014)
Mai2014 <- create_tab(LicMai2014)
Jun2014 <- create_tab(LicJun2014)
Jul2014 <- create_tab(LicJul2014)
Ago2014 <- create_tab(LicAgo2014)
Set2014 <- create_tab(LicSet2014)
Out2014 <- create_tab(LicOut2014)
Nov2014 <- create_tab(LicNov2014)
Dez2014 <- create_tab(LicDez2014)
Jan2014$Mes <- "Janeiro"
Jan2014$Ano <- "2014"
Fev2014$Mes <- "Fevereiro"
Fev2014$Ano <- "2014"
Mar2014$Mes <- "Marco"
Mar2014$Ano <- "2014"
Abr2014$Mes <- "Abril"
Abr2014$Ano <- "2014"
Mai2014$Mes <- "Maio"
Mai2014$Ano <- "2014"
Jun2014$Mes <- "Junho"
Jun2014$Ano <- "2014"
Jul2014$Mes <- "Julho"
Jul2014$Ano <- "2014"
Ago2014$Mes <- "Agosto"
Ago2014$Ano <- "2014"
Set2014$Mes <- "Setembro"
Set2014$Ano <- "2014"
Out2014$Mes <- "Outubro"
Out2014$Ano <- "2014"
Nov2014$Mes <- "Novembro"
Nov2014$Ano <- "2014"
Dez2014$Mes <- "Dezembro"
Dez2014$Ano <- "2014"
ParticipantesLicitacao2014 <- rbind(Jan2014, Fev2014,
                           Mar2014, Abr2014,
                           Mai2014, Jun2014,
                           Jul2014, Ago2014,
                           Set2014, Out2014,
                           Nov2014, Dez2014)
write.csv(ParticipantesLicitacao2014, "Ano2014/ParticipantesLicitacao2014.csv", row.names = FALSE)


#2015
Jan2015 <- create_tab(LicJan2015)
Fev2015 <- create_tab(LicFev2015)
Mar2015 <- create_tab(LicMar2015)
Abr2015 <- create_tab(LicAbr2015)
Mai2015 <- create_tab(LicMai2015)
Jun2015 <- create_tab(LicJun2015)
Jul2015 <- create_tab(LicJul2015)
Ago2015 <- create_tab(LicAgo2015)
Set2015 <- create_tab(LicSet2015)
Out2015 <- create_tab(LicOut2015)
Nov2015 <- create_tab(LicNov2015)
Dez2015 <- create_tab(LicDez2015)
Jan2015$Mes <- "Janeiro"
Jan2015$Ano <- "2015"
Fev2015$Mes <- "Fevereiro"
Fev2015$Ano <- "2015"
Mar2015$Mes <- "Marco"
Mar2015$Ano <- "2015"
Abr2015$Mes <- "Abril"
Abr2015$Ano <- "2015"
Mai2015$Mes <- "Maio"
Mai2015$Ano <- "2015"
Jun2015$Mes <- "Junho"
Jun2015$Ano <- "2015"
Jul2015$Mes <- "Julho"
Jul2015$Ano <- "2015"
Ago2015$Mes <- "Agosto"
Ago2015$Ano <- "2015"
Set2015$Mes <- "Setembro"
Set2015$Ano <- "2015"
Out2015$Mes <- "Outubro"
Out2015$Ano <- "2015"
Nov2015$Mes <- "Novembro"
Nov2015$Ano <- "2015"
Dez2015$Mes <- "Dezembro"
Dez2015$Ano <- "2015"
ParticipantesLicitacao2015 <- rbind(Jan2015, Fev2015,
                           Mar2015, Abr2015,
                           Mai2015, Jun2015,
                           Jul2015, Ago2015,
                           Set2015, Out2015,
                           Nov2015, Dez2015)
write.csv(ParticipantesLicitacao2015, "Ano2015/ParticipantesLicitacao2015.csv", row.names = FALSE)

#2016
Jan2016 <- create_tab(LicJan2016)
Fev2016 <- create_tab(LicFev2016)
Mar2016 <- create_tab(LicMar2016)
Abr2016 <- create_tab(LicAbr2016)
Mai2016 <- create_tab(LicMai2016)
Jun2016 <- create_tab(LicJun2016)
Jul2016 <- create_tab(LicJul2016)
Ago2016 <- create_tab(LicAgo2016)
Set2016 <- create_tab(LicSet2016)
Out2016 <- create_tab(LicOut2016)
Nov2016 <- create_tab(LicNov2016)
Dez2016 <- create_tab(LicDez2016)
Jan2016$Mes <- "Janeiro"
Jan2016$Ano <- "2016"
Fev2016$Mes <- "Fevereiro"
Fev2016$Ano <- "2016"
Mar2016$Mes <- "Marco"
Mar2016$Ano <- "2016"
Abr2016$Mes <- "Abril"
Abr2016$Ano <- "2016"
Mai2016$Mes <- "Maio"
Mai2016$Ano <- "2016"
Jun2016$Mes <- "Junho"
Jun2016$Ano <- "2016"
Jul2016$Mes <- "Julho"
Jul2016$Ano <- "2016"
Ago2016$Mes <- "Agosto"
Ago2016$Ano <- "2016"
Set2016$Mes <- "Setembro"
Set2016$Ano <- "2016"
Out2016$Mes <- "Outubro"
Out2016$Ano <- "2016"
Nov2016$Mes <- "Novembro"
Nov2016$Ano <- "2016"
Dez2016$Mes <- "Dezembro"
Dez2016$Ano <- "2016"
ParticipantesLicitacao2016 <- rbind(Jan2016, Fev2016,
                           Mar2016, Abr2016,
                           Mai2016, Jun2016,
                           Jul2016, Ago2016,
                           Set2016, Out2016,
                           Nov2016, Dez2016)
write.csv(ParticipantesLicitacao2016, "Ano2016/ParticipantesLicitacao2016.csv", row.names = FALSE)

#2017
Jan2017 <- create_tab(LicJan2017)
Fev2017 <- create_tab(LicFev2017)
Mar2017 <- create_tab(LicMar2017)
Abr2017 <- create_tab(LicAbr2017)
Mai2017 <- create_tab(LicMai2017)
Jun2017 <- create_tab(LicJun2017)
Jul2017 <- create_tab(LicJul2017)
Ago2017 <- create_tab(LicAgo2017)
Set2017 <- create_tab(LicSet2017)
Out2017 <- create_tab(LicOut2017)
Nov2017 <- create_tab(LicNov2017)
Dez2017 <- create_tab(LicDez2017)
Jan2017$Mes <- "Janeiro"
Jan2017$Ano <- "2017"
Fev2017$Mes <- "Fevereiro"
Fev2017$Ano <- "2017"
Mar2017$Mes <- "Marco"
Mar2017$Ano <- "2017"
Abr2017$Mes <- "Abril"
Abr2017$Ano <- "2017"
Mai2017$Mes <- "Maio"
Mai2017$Ano <- "2017"
Jun2017$Mes <- "Junho"
Jun2017$Ano <- "2017"
Jul2017$Mes <- "Julho"
Jul2017$Ano <- "2017"
Ago2017$Mes <- "Agosto"
Ago2017$Ano <- "2017"
Set2017$Mes <- "Setembro"
Set2017$Ano <- "2017"
Out2017$Mes <- "Outubro"
Out2017$Ano <- "2017"
Nov2017$Mes <- "Novembro"
Nov2017$Ano <- "2017"
Dez2017$Mes <- "Dezembro"
Dez2017$Ano <- "2017"
ParticipantesLicitacao2017 <- rbind(Jan2017, Fev2017,
                           Mar2017, Abr2017,
                           Mai2017, Jun2017,
                           Jul2017, Ago2017,
                           Set2017, Out2017,
                           Nov2017, Dez2017)
write.csv(ParticipantesLicitacao2017, "Ano2017/ParticipantesLicitacao2017.csv", row.names = FALSE)

#2018
Jan2018 <- create_tab(LicJan2018)
Fev2018 <- create_tab(LicFev2018)
Mar2018 <- create_tab(LicMar2018)
Abr2018 <- create_tab(LicAbr2018)
Mai2018 <- create_tab(LicMai2018)
Jun2018 <- create_tab(LicJun2018)
Jul2018 <- create_tab(LicJul2018)
Ago2018 <- create_tab(LicAgo2018)
Set2018 <- create_tab(LicSet2018)
Out2018 <- create_tab(LicOut2018)
Nov2018 <- create_tab(LicNov2018)
Dez2018 <- create_tab(LicDez2018)
Jan2018$Mes <- "Janeiro"
Jan2018$Ano <- "2018"
Fev2018$Mes <- "Fevereiro"
Fev2018$Ano <- "2018"
Mar2018$Mes <- "Marco"
Mar2018$Ano <- "2018"
Abr2018$Mes <- "Abril"
Abr2018$Ano <- "2018"
Mai2018$Mes <- "Maio"
Mai2018$Ano <- "2018"
Jun2018$Mes <- "Junho"
Jun2018$Ano <- "2018"
Jul2018$Mes <- "Julho"
Jul2018$Ano <- "2018"
Ago2018$Mes <- "Agosto"
Ago2018$Ano <- "2018"
Set2018$Mes <- "Setembro"
Set2018$Ano <- "2018"
Out2018$Mes <- "Outubro"
Out2018$Ano <- "2018"
Nov2018$Mes <- "Novembro"
Nov2018$Ano <- "2018"
Dez2018$Mes <- "Dezembro"
Dez2018$Ano <- "2018"
ParticipantesLicitacao2018 <- rbind(Jan2018, Fev2018,
                           Mar2018, Abr2018,
                           Mai2018, Jun2018,
                           Jul2018, Ago2018,
                           Set2018, Out2018,
                           Nov2018, Dez2018)
write.csv(ParticipantesLicitacao2018, "Ano2018/ParticipantesLicitacao2018.csv", row.names = FALSE)

#2019
Jan2019 <- create_tab(LicJan2019)
Fev2019 <- create_tab(LicFev2019)
Mar2019 <- create_tab(LicMar2019)
Abr2019 <- create_tab(LicAbr2019)
Mai2019 <- create_tab(LicMai2019)
Jun2019 <- create_tab(LicJun2019)
Jul2019 <- create_tab(LicJul2019)
Ago2019 <- create_tab(LicAgo2019)
Set2019 <- create_tab(LicSet2019)
Out2019 <- create_tab(LicOut2019)
Nov2019 <- create_tab(LicNov2019)
Dez2019 <- create_tab(LicDez2019)
Jan2019$Mes <- "Janeiro"
Jan2019$Ano <- "2019"
Fev2019$Mes <- "Fevereiro"
Fev2019$Ano <- "2019"
Mar2019$Mes <- "Marco"
Mar2019$Ano <- "2019"
Abr2019$Mes <- "Abril"
Abr2019$Ano <- "2019"
Mai2019$Mes <- "Maio"
Mai2019$Ano <- "2019"
Jun2019$Mes <- "Junho"
Jun2019$Ano <- "2019"
Jul2019$Mes <- "Julho"
Jul2019$Ano <- "2019"
Ago2019$Mes <- "Agosto"
Ago2019$Ano <- "2019"
Set2019$Mes <- "Setembro"
Set2019$Ano <- "2019"
Out2019$Mes <- "Outubro"
Out2019$Ano <- "2019"
Nov2019$Mes <- "Novembro"
Nov2019$Ano <- "2019"
Dez2019$Mes <- "Dezembro"
Dez2019$Ano <- "2019"
ParticipantesLicitacao2019 <- rbind(Jan2019, Fev2019,
                           Mar2019, Abr2019,
                           Mai2019, Jun2019,
                           Jul2019, Ago2019,
                           Set2019, Out2019,
                           Nov2019, Dez2019)
write.csv(ParticipantesLicitacao2019, "Ano2019/ParticipantesLicitacao2019.csv", row.names = FALSE)

#2020
Jan2020 <- create_tab(LicJan2020)
Fev2020 <- create_tab(LicFev2020)
Mar2020 <- create_tab(LicMar2020)
Abr2020 <- create_tab(LicAbr2020)
Mai2020 <- create_tab(LicMai2020)
Jun2020 <- create_tab(LicJun2020)
Jul2020 <- create_tab(LicJul2020)
Ago2020 <- create_tab(LicAgo2020)
Set2020 <- create_tab(LicSet2020)
Out2020 <- create_tab(LicOut2020)
# Nov2020 <- create_tab(LicNov2020)
# Dez2020 <- create_tab(LicDez2020)
Jan2020$Mes <- "Janeiro"
Jan2020$Ano <- "2020"
Fev2020$Mes <- "Fevereiro"
Fev2020$Ano <- "2020"
Mar2020$Mes <- "Marco"
Mar2020$Ano <- "2020"
Abr2020$Mes <- "Abril"
Abr2020$Ano <- "2020"
Mai2020$Mes <- "Maio"
Mai2020$Ano <- "2020"
Jun2020$Mes <- "Junho"
Jun2020$Ano <- "2020"
Jul2020$Mes <- "Julho"
Jul2020$Ano <- "2020"
Ago2020$Mes <- "Agosto"
Ago2020$Ano <- "2020"
Set2020$Mes <- "Setembro"
Set2020$Ano <- "2020"
Out2020$Mes <- "Outubro"
Out2020$Ano <- "2020"
# Nov2020$Mes <- "Novembro"
# Nov2020$Ano <- "2020"
# Dez2020$Mes <- "Dezembro"
# Dez2020$Ano <- "2020"
ParticipantesLicitacao2020 <- rbind(Jan2020, Fev2020,
                           Mar2020, Abr2020,
                           Mai2020, Jun2020)
write.csv(ParticipantesLicitacao2020, "Ano2020/ParticipantesLicitacao2020.csv", row.names = FALSE)

end_time <- Sys.time()
end_time - start_time


ParticipantesLicitacaoUFV <- rbind(ParticipantesLicitacao2013,
                          ParticipantesLicitacao2014,
                          ParticipantesLicitacao2015,
                          ParticipantesLicitacao2016,
                          ParticipantesLicitacao2017,
                          ParticipantesLicitacao2018,
                          ParticipantesLicitacao2019,
                          ParticipantesLicitacao2020)

#Banco de Dados sobre Licitacoes

write.csv(ParticipantesLicitacaoUFV, "BancoDados/ParticipantesLicitacaoUFV.csv", row.names = FALSE)


##Atualizacao Base de dados - (outubro-2020)

dados <- fread("BancoDados/ParticipantesLicitacaoUFV.csv")
# dados$DataCompra <- as.Date(dados$DataCompra)
# dados$DataLicitacao <- as.Date(dados$DataLicitacao)
ParticipantesLicitacaoUFV <- rbind(dados, Jul2020,
                      Ago2020,
                      Set2020,
                      Out2020)
write.csv(ParticipantesLicitacaoUFV,"BancoDados/ParticipantesLicitacaoUFV.csv", row.names = FALSE)
