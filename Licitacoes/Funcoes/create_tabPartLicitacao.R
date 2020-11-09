create_tab <- function(x){
  #x=LicMai2013
  #y=salario dos Licitacao
  library("tidyverse")
  library("stringr")
  library("lubridate")
  #Sys.setlocale(category = "LC_TIME", locale = "pt_BR")
  #source("Funcoes/Siglas.R")
  options(datatable.fread.input.cmd.message=FALSE)
  Licitacao <- data.table::fread(x, dec = ",", encoding = "Latin-1")
  Licitacao <- Licitacao %>% select(-3)
  names(Licitacao) <- c("NumLic", "CodUG", "Instituicao", 
                      "ModComp", "Processo", "CodOrgao", 
                      "NomeOrgao", "CodItem", "Descricao", 
                     "CNPJ", "Participante","Vencedor")
  Licitacao <- Licitacao %>% filter(CodUG %in% c("154051","154052"))
  #Transformar as letras em maiusculas
  Licitacao$Instituicao <- str_to_upper(Licitacao$Instituicao)
  Licitacao$ModComp     <- str_to_upper(Licitacao$ModComp    )
  Licitacao$NomeOrgao   <- str_to_upper(Licitacao$NomeOrgao  )
  Licitacao$Descricao   <- str_to_upper(Licitacao$Descricao  )
  Licitacao$Participante<- str_to_upper(Licitacao$Participante  )
  
  #Remover acentos desnecessarios
  Licitacao$Instituicao <- abjutils::rm_accent(Licitacao$Instituicao )
  Licitacao$ModComp     <- abjutils::rm_accent(Licitacao$ModComp     )
  Licitacao$NomeOrgao   <- abjutils::rm_accent(Licitacao$NomeOrgao   )
  Licitacao$Descricao   <- abjutils::rm_accent(Licitacao$Descricao   )
  Licitacao$Participante<- abjutils::rm_accent(Licitacao$Participante)
  #Apagar Espacos antes e apos o texto
  Licitacao$Instituicao <- str_trim(Licitacao$Instituicao )
  Licitacao$ModComp     <- str_trim(Licitacao$ModComp     )
  Licitacao$NomeOrgao   <- str_trim(Licitacao$NomeOrgao   )
  Licitacao$Descricao   <- str_trim(Licitacao$Descricao   )
  Licitacao$Participante<- str_trim(Licitacao$Participante)

  return(Licitacao)
}

