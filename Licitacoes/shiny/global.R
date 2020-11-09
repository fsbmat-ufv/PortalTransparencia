## Load packages
library("tidyr")
library("httr")
library("lubridate")
library("knitr")
library("shiny")
library("shinyjs")
library("shinyBS")
library("plotly")
library("shinythemes")
library("shinycssloaders")
library("markdown")
library("flexdashboard")
library("tidyverse")
library("ggthemes")
library("treemap")
library("leaflet")
library("readxl")
library("readODS")
library("htmlTable")
library("stringr")
library("esquisse")
library("gridExtra")
library("ggpubr")
library("RColorBrewer")
library("data.table")
options(DT.options = list(scrollY="300px",scrollX="300px", 
                          pageLength = 100, 
                          columnDefs = list(list(className = 'dt-center', targets = "_all"))))
library("shinydashboard")
library("shinyWidgets") # nicer inputs
##############################################################################

## Define font to be used later
f1 = list(family = "Arial", size = 10, color = "rgb(30,30,30)")

## Function to format the dates for better plotting
printDate = function(date){
  # paste0(day(date),"/",month(date, lab=T, locale="us"))
  monthsEn=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
  paste0(day(date),"/",monthsEn[month(date)])
}

## colors for observed data
blu = 'rgb(100,140,240)'
dblu = 'rgb(0,0,102)'
red = 'rgb(200,30,30)'
dred = 'rgb(100,30,30)'

##############################################################################
## DATA SOURCES
#setwd("~/GitHub/Proj_Portal_Transparencia/Licitacoes/BancoDados")
# Clear console
#cat("\014")


# Definindo tempo zero com 18h/horário de São Paulo:
#t0 <- as_datetime(as.Date("2020-03-31") + dhours(21), tz = "America/Sao_Paulo")
#saveRDS(t0, file = "./time0.rds")
#t0 <- readRDS(file = "./time0.rds")

# Pegando hora atual de acordo com horário de São Paulo:
#t1 <- as_datetime(Sys.time(), tz = "America/Sao_Paulo")


# if (duration(int_length(interval(t0, t1))) >= duration(2592000)) {
#   # Baixando os dados de 12 em 12 horas de acordo com acessos a aplicação:
#   download.file(url = "https://data.brasil.io/dataset/covid19/caso.csv.gz", destfile = "./covid19.csv.gz")
#   t0 <- t1
#   saveRDS(t1, file = "./time0.rds")
# }
# library(R.utils)
# gunzip("covid19.csv.gz", remove=FALSE, overwrite=TRUE)


options(datatable.fread.input.cmd.message=FALSE)
dados <- data.table::fread("ItemLicitacaoUFV.csv", dec = ",", encoding = "Latin-1")
dados$Valor <- as.numeric(as.character(dados$Valor))
dados$Mes <- as.factor(as.character(dados$Mes))
# dados <- dados %>% 
#   mutate(Mes = factor(
#     month(Mes, label = FALSE),   # thing you're converting
#     1:12,                                  # values it could take
#     labels =                               # how they should appear
#       c("Janeiro", "Fevereiro", "Marco", "Abril",
#         "Maio", "Junho", "Julho", "Agosto",
#         "Setembro", "Outubro", "Novembro", "Dezembro"),
#     ordered = TRUE))
CEDAF <- dados %>% filter(CodUG=="154052")
