create_tab <- function(x){
  #x=LicJan2013
  #y=salario dos Licitacao
  library("tidyverse")
  library("stringr")
  library(lubridate)
  #Sys.setlocale(category = "LC_TIME", locale = "pt_BR")
  #source("Funcoes/Siglas.R")
  options(datatable.fread.input.cmd.message=FALSE)
  Licitacao <- data.table::fread(x, dec = ",", encoding = "Latin-1")
  Licitacao <- Licitacao %>% select(-3)
  names(Licitacao) <- c("NumLic", "CodUG", "Instituicao", 
                      "ModComp", "Processo", "CodOrgao", 
                     "NomeOrgao", "CNPJVencedor", "NomeVencedor", 
                     "Descricao", "Quant","Valor")
  Licitacao <- Licitacao %>% filter(CodUG %in% c("154051","154052"))
  #Transformar as letras em maiusculas
  Licitacao$Instituicao <- str_to_upper(Licitacao$Instituicao )
  Licitacao$ModComp     <- str_to_upper(Licitacao$ModComp     )
  Licitacao$NomeOrgao   <- str_to_upper(Licitacao$NomeOrgao   )
  Licitacao$NomeVencedor<- str_to_upper(Licitacao$NomeVencedor)
  Licitacao$Descricao   <- str_to_upper(Licitacao$Descricao   )
  
  #Remover acentos desnecessarios
  Licitacao$Instituicao  <- abjutils::rm_accent(Licitacao$Instituicao )
  Licitacao$ModComp      <- abjutils::rm_accent(Licitacao$ModComp     )
  Licitacao$NomeOrgao    <- abjutils::rm_accent(Licitacao$NomeOrgao   )
  Licitacao$NomeVencedor <- abjutils::rm_accent(Licitacao$NomeVencedor)
  Licitacao$Descricao    <- abjutils::rm_accent(Licitacao$Descricao   )
  #Apagar Espacos antes e apos o texto
  Licitacao$Instituicao <- str_trim(Licitacao$Instituicao )
  Licitacao$ModComp     <- str_trim(Licitacao$ModComp     )
  Licitacao$NomeOrgao   <- str_trim(Licitacao$NomeOrgao   )
  Licitacao$NomeVencedor<- str_trim(Licitacao$NomeVencedor)
  Licitacao$Descricao   <- str_trim(Licitacao$Descricao   )

  # Licitacao <- Licitacao %>% 
  #   mutate(Mes = replace(Mes, Mes == 5, "Maio"))
  
  #Licitacao <- Licitacao %>% mutate(Mes = as.character(month(Mes, label = TRUE, abbr = FALSE)))
  
  return(Licitacao)
}

