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
setwd("~/GitHub/Proj_Portal_Transparencia/Despesas_UFV")
#2013
# LicJan2013 <- "2013/201301_Licitação.csv"
# LicFev2013 <- "2013/201302_Licitação.csv"
# LicMar2013 <- "2013/201303_Licitação.csv"
# LicAbr2013 <- "2013/201304_Licitação.csv"
# LicMai2013 <- "2013/201305_Licitação.csv"
# LicJun2013 <- "2013/201306_Licitação.csv"
# LicJul2013 <- "2013/201307_Licitação.csv"
# LicAgo2013 <- "2013/201308_Licitação.csv"
# LicSet2013 <- "2013/201309_Licitação.csv"
# LicOut2013 <- "2013/201310_Licitação.csv"
# LicNov2013 <- "2013/201311_Licitação.csv"
# LicDez2013 <- "2013/201312_Licitação.csv"
# #2014
# LicJan2014 <- "2014/201401_Licitação.csv"
# LicFev2014 <- "2014/201402_Licitação.csv"
# LicMar2014 <- "2014/201403_Licitação.csv"
# LicAbr2014 <- "2014/201404_Licitação.csv"
# LicMai2014 <- "2014/201405_Licitação.csv"
# LicJun2014 <- "2014/201406_Licitação.csv"
# LicJul2014 <- "2014/201407_Licitação.csv"
# LicAgo2014 <- "2014/201408_Licitação.csv"
# LicSet2014 <- "2014/201409_Licitação.csv"
# LicOut2014 <- "2014/201410_Licitação.csv"
# LicNov2014 <- "2014/201411_Licitação.csv"
# LicDez2014 <- "2014/201412_Licitação.csv"
# #2015
# LicJan2015 <- "2015/201501_Licitação.csv"
# LicFev2015 <- "2015/201502_Licitação.csv"
# LicMar2015 <- "2015/201503_Licitação.csv"
# LicAbr2015 <- "2015/201504_Licitação.csv"
# LicMai2015 <- "2015/201505_Licitação.csv"
# LicJun2015 <- "2015/201506_Licitação.csv"
# LicJul2015 <- "2015/201507_Licitação.csv"
# LicAgo2015 <- "2015/201508_Licitação.csv"
# LicSet2015 <- "2015/201509_Licitação.csv"
# LicOut2015 <- "2015/201510_Licitação.csv"
# LicNov2015 <- "2015/201511_Licitação.csv"
# LicDez2015 <- "2015/201512_Licitação.csv"
# #2016
# LicJan2016 <- "2016/201601_Licitação.csv"
# LicFev2016 <- "2016/201602_Licitação.csv"
# LicMar2016 <- "2016/201603_Licitação.csv"
# LicAbr2016 <- "2016/201604_Licitação.csv"
# LicMai2016 <- "2016/201605_Licitação.csv"
# LicJun2016 <- "2016/201606_Licitação.csv"
# LicJul2016 <- "2016/201607_Licitação.csv"
# LicAgo2016 <- "2016/201608_Licitação.csv"
# LicSet2016 <- "2016/201609_Licitação.csv"
# LicOut2016 <- "2016/201610_Licitação.csv"
# LicNov2016 <- "2016/201611_Licitação.csv"
# LicDez2016 <- "2016/201612_Licitação.csv"
# #2017
# LicJan2017 <- "2017/201701_Licitação.csv"
# LicFev2017 <- "2017/201702_Licitação.csv"
# LicMar2017 <- "2017/201703_Licitação.csv"
# LicAbr2017 <- "2017/201704_Licitação.csv"
# LicMai2017 <- "2017/201705_Licitação.csv"
# LicJun2017 <- "2017/201706_Licitação.csv"
# LicJul2017 <- "2017/201707_Licitação.csv"
# LicAgo2017 <- "2017/201708_Licitação.csv"
# LicSet2017 <- "2017/201709_Licitação.csv"
# LicOut2017 <- "2017/201710_Licitação.csv"
# LicNov2017 <- "2017/201711_Licitação.csv"
# LicDez2017 <- "2017/201712_Licitação.csv"
# #2018
# LicJan2018 <- "2018/201801_Licitação.csv"
# LicFev2018 <- "2018/201802_Licitação.csv"
# LicMar2018 <- "2018/201803_Licitação.csv"
# LicAbr2018 <- "2018/201804_Licitação.csv"
# LicMai2018 <- "2018/201805_Licitação.csv"
# LicJun2018 <- "2018/201806_Licitação.csv"
# LicJul2018 <- "2018/201807_Licitação.csv"
# LicAgo2018 <- "2018/201808_Licitação.csv"
# LicSet2018 <- "2018/201809_Licitação.csv"
# LicOut2018 <- "2018/201810_Licitação.csv"
# LicNov2018 <- "2018/201811_Licitação.csv"
# LicDez2018 <- "2018/201812_Licitação.csv"
# #2019
# LicJan2019 <- "2019/201901_Licitação.csv"
# LicFev2019 <- "2019/201902_Licitação.csv"
# LicMar2019 <- "2019/201903_Licitação.csv"
# LicAbr2019 <- "2019/201904_Licitação.csv"
# LicMai2019 <- "2019/201905_Licitação.csv"
# LicJun2019 <- "2019/201906_Licitação.csv"
# LicJul2019 <- "2019/201907_Licitação.csv"
# LicAgo2019 <- "2019/201908_Licitação.csv"
# LicSet2019 <- "2019/201909_Licitação.csv"
# LicOut2019 <- "2019/201910_Licitação.csv"
# LicNov2019 <- "2019/201911_Licitação.csv"
# LicDez2019 <- "2019/201912_Licitação.csv"
# #2020
# LicJan2020 <- "2020/202001_Licitação.csv"
# LicFev2020 <- "2020/202002_Licitação.csv"
# LicMar2020 <- "2020/202003_Licitação.csv"
# LicAbr2020 <- "2020/202004_Licitação.csv"
# LicMai2020 <- "2020/202005_Licitação.csv"
# LicJun2020 <- "2020/202006_Licitação.csv"
LicJul2020 <- "2020/202007_Licitação.csv"
LicAgo2020 <- "2020/202008_Licitação.csv"
LicSet2020 <- "2020/202009_Licitação.csv"
LicOut2020 <- "2020/202010_Licitação.csv"
LicNov2020 <- "2020/202011_Licitação.csv"
LicDez2020 <- "2020/202012_Licitação.csv"

source("Funcoes/create_tabLicitacao.R")
#start_time <- Sys.time()
# #2013
# Jan2013 <- create_tab(LicJan2013)
# Fev2013 <- create_tab(LicFev2013)
# Mar2013 <- create_tab(LicMar2013)
# Abr2013 <- create_tab(LicAbr2013)
# Mai2013 <- create_tab(LicMai2013)
# Jun2013 <- create_tab(LicJun2013)
# Jul2013 <- create_tab(LicJul2013)
# Ago2013 <- create_tab(LicAgo2013)
# Set2013 <- create_tab(LicSet2013)
# Out2013 <- create_tab(LicOut2013)
# Nov2013 <- create_tab(LicNov2013)
# Dez2013 <- create_tab(LicDez2013)
# Licitacao2013 <- rbind(Jan2013, Fev2013, 
#                        Mar2013, Abr2013, 
#                        Mai2013, Jun2013, 
#                        Jul2013, Ago2013, 
#                        Set2013, Out2013, 
#                        Nov2013, Dez2013)
# write.csv(Licitacao2013, "Ano2013/Licitacao2013.csv", row.names = FALSE)
# 
# #2014
# Jan2014 <- create_tab(LicJan2014)
# Fev2014 <- create_tab(LicFev2014)
# Mar2014 <- create_tab(LicMar2014)
# Abr2014 <- create_tab(LicAbr2014)
# Mai2014 <- create_tab(LicMai2014)
# Jun2014 <- create_tab(LicJun2014)
# Jul2014 <- create_tab(LicJul2014)
# Ago2014 <- create_tab(LicAgo2014)
# Set2014 <- create_tab(LicSet2014)
# Out2014 <- create_tab(LicOut2014)
# Nov2014 <- create_tab(LicNov2014)
# Dez2014 <- create_tab(LicDez2014)
# Licitacao2014 <- rbind(Jan2014, Fev2014, 
#                        Mar2014, Abr2014, 
#                        Mai2014, Jun2014, 
#                        Jul2014, Ago2014, 
#                        Set2014, Out2014, 
#                        Nov2014, Dez2014)
# write.csv(Licitacao2014, "Ano2014/Licitacao2014.csv", row.names = FALSE)
# 
# 
# #2015
# Jan2015 <- create_tab(LicJan2015)
# Fev2015 <- create_tab(LicFev2015)
# Mar2015 <- create_tab(LicMar2015)
# Abr2015 <- create_tab(LicAbr2015)
# Mai2015 <- create_tab(LicMai2015)
# Jun2015 <- create_tab(LicJun2015)
# Jul2015 <- create_tab(LicJul2015)
# Ago2015 <- create_tab(LicAgo2015)
# Set2015 <- create_tab(LicSet2015)
# Out2015 <- create_tab(LicOut2015)
# Nov2015 <- create_tab(LicNov2015)
# Dez2015 <- create_tab(LicDez2015)
# Licitacao2015 <- rbind(Jan2015, Fev2015, 
#                        Mar2015, Abr2015, 
#                        Mai2015, Jun2015, 
#                        Jul2015, Ago2015, 
#                        Set2015, Out2015, 
#                        Nov2015, Dez2015)
# write.csv(Licitacao2015, "Ano2015/Licitacao2015.csv", row.names = FALSE)
# 
# #2016
# Jan2016 <- create_tab(LicJan2016)
# Fev2016 <- create_tab(LicFev2016)
# Mar2016 <- create_tab(LicMar2016)
# Abr2016 <- create_tab(LicAbr2016)
# Mai2016 <- create_tab(LicMai2016)
# Jun2016 <- create_tab(LicJun2016)
# Jul2016 <- create_tab(LicJul2016)
# Ago2016 <- create_tab(LicAgo2016)
# Set2016 <- create_tab(LicSet2016)
# Out2016 <- create_tab(LicOut2016)
# Nov2016 <- create_tab(LicNov2016)
# Dez2016 <- create_tab(LicDez2016)
# Licitacao2016 <- rbind(Jan2016, Fev2016, 
#                        Mar2016, Abr2016, 
#                        Mai2016, Jun2016, 
#                        Jul2016, Ago2016, 
#                        Set2016, Out2016, 
#                        Nov2016, Dez2016)
# write.csv(Licitacao2016, "Ano2016/Licitacao2016.csv", row.names = FALSE)
# 
# #2017
# Jan2017 <- create_tab(LicJan2017)
# Fev2017 <- create_tab(LicFev2017)
# Mar2017 <- create_tab(LicMar2017)
# Abr2017 <- create_tab(LicAbr2017)
# Mai2017 <- create_tab(LicMai2017)
# Jun2017 <- create_tab(LicJun2017)
# Jul2017 <- create_tab(LicJul2017)
# Ago2017 <- create_tab(LicAgo2017)
# Set2017 <- create_tab(LicSet2017)
# Out2017 <- create_tab(LicOut2017)
# Nov2017 <- create_tab(LicNov2017)
# Dez2017 <- create_tab(LicDez2017)
# Licitacao2017 <- rbind(Jan2017, Fev2017, 
#                        Mar2017, Abr2017, 
#                        Mai2017, Jun2017, 
#                        Jul2017, Ago2017, 
#                        Set2017, Out2017, 
#                        Nov2017, Dez2017)
# write.csv(Licitacao2017, "Ano2017/Licitacao2017.csv", row.names = FALSE)
# 
# #2018
# Jan2018 <- create_tab(LicJan2018)
# Fev2018 <- create_tab(LicFev2018)
# Mar2018 <- create_tab(LicMar2018)
# Abr2018 <- create_tab(LicAbr2018)
# Mai2018 <- create_tab(LicMai2018)
# Jun2018 <- create_tab(LicJun2018)
# Jul2018 <- create_tab(LicJul2018)
# Ago2018 <- create_tab(LicAgo2018)
# Set2018 <- create_tab(LicSet2018)
# Out2018 <- create_tab(LicOut2018)
# Nov2018 <- create_tab(LicNov2018)
# Dez2018 <- create_tab(LicDez2018)
# Licitacao2018 <- rbind(Jan2018, Fev2018, 
#                        Mar2018, Abr2018, 
#                        Mai2018, Jun2018, 
#                        Jul2018, Ago2018, 
#                        Set2018, Out2018, 
#                        Nov2018, Dez2018)
# write.csv(Licitacao2018, "Ano2018/Licitacao2018.csv", row.names = FALSE)
# 
# #2019
# Jan2019 <- create_tab(LicJan2019)
# Fev2019 <- create_tab(LicFev2019)
# Mar2019 <- create_tab(LicMar2019)
# Abr2019 <- create_tab(LicAbr2019)
# Mai2019 <- create_tab(LicMai2019)
# Jun2019 <- create_tab(LicJun2019)
# Jul2019 <- create_tab(LicJul2019)
# Ago2019 <- create_tab(LicAgo2019)
# Set2019 <- create_tab(LicSet2019)
# Out2019 <- create_tab(LicOut2019)
# Nov2019 <- create_tab(LicNov2019)
# Dez2019 <- create_tab(LicDez2019)
# Licitacao2019 <- rbind(Jan2019, Fev2019, 
#                        Mar2019, Abr2019, 
#                        Mai2019, Jun2019, 
#                        Jul2019, Ago2019, 
#                        Set2019, Out2019, 
#                        Nov2019, Dez2019)
# write.csv(Licitacao2019, "Ano2019/Licitacao2019.csv", row.names = FALSE)
# 
# #2020
# Jan2020 <- create_tab(LicJan2020)
# Fev2020 <- create_tab(LicFev2020)
# Mar2020 <- create_tab(LicMar2020)
# Abr2020 <- create_tab(LicAbr2020)
# Mai2020 <- create_tab(LicMai2020)
# Jun2020 <- create_tab(LicJun2020)
 Jul2020 <- create_tab(LicJul2020)
 Ago2020 <- create_tab(LicAgo2020)
 Set2020 <- create_tab(LicSet2020)
 Out2020 <- create_tab(LicOut2020)
# # Nov2020 <- create_tab(LicNov2020)
# # Dez2020 <- create_tab(LicDez2020)
# Licitacao2020 <- rbind(Jan2020, Fev2020, 
#                        Mar2020, Abr2020, 
#                        Mai2020, Jun2020)
# write.csv(Licitacao2020, "Ano2020/Licitacao2020.csv", row.names = FALSE)
# 
# end_time <- Sys.time()
# end_time - start_time


# LicitacaoUFV <- rbind(Licitacao2013,
#                       Licitacao2014,
#                       Licitacao2015,
#                       Licitacao2016,
#                       Licitacao2017,
#                       Licitacao2018,
#                       Licitacao2019,
#                       Licitacao2020)

#Banco de Dados sobre Licitacoes

write.csv(LicitacaoUFV, "BancoDados/LicitacaoUFV.csv", row.names = FALSE)

##Atualizacao Base de dados - (outubro-2020)

dados <- fread("BancoDados/LicitacaoUFV.csv")
dados$DataCompra <- as.Date(dados$DataCompra)
dados$DataLicitacao <- as.Date(dados$DataLicitacao)
LicitacaoUFV <- rbind(dados, Jul2020,
                          Ago2020,
                          Set2020,
                          Out2020)
write.csv(LicitacaoUFV,"BancoDados/LicitacaoUFV.csv", row.names = FALSE)
