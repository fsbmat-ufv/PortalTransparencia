create_tab <- function(x){
  #x=LicAgo2020
  #y=salario dos Licitacao
  library("tidyverse")
  library("stringr")
  library("lubridate")
  #Sys.setlocale(category = "LC_TIME", locale = "pt_BR")
  #source("Funcoes/Siglas.R")
  options(datatable.fread.input.cmd.message=FALSE)
  Licitacao <- data.table::fread(x, dec = ",", encoding = "Latin-1")
  Licitacao <- Licitacao %>% select(-c(3,9,10))
  names(Licitacao) <- c("NumLic", "CodUG", "Instituicao", 
                      "ModComp", "Processo", "Objeto", 
                     "Situacao", "CodOrgao", "NomeOrgao", "Municipio", "DataCompra", 
                     "DataLicitacao", "Valor")
  Licitacao$DataCompra <- as.Date(as.character(Licitacao$DataCompra), format = "%d/%m/%Y")
  Licitacao$DataLicitacao <- as.Date(as.character(Licitacao$DataLicitacao), format = "%d/%m/%Y")
  Licitacao$Mes <- month(Licitacao$DataCompra[1])
  Licitacao$Ano <- year(Licitacao$DataCompra[1])
  Licitacao <- Licitacao %>% filter(CodUG %in% c("154051","154052"))
  #Transformar as letras em maiusculas
  Licitacao$Instituicao <- str_to_upper(Licitacao$Instituicao)
  Licitacao$ModComp     <- str_to_upper(Licitacao$ModComp    )
  Licitacao$Objeto      <- str_to_upper(Licitacao$Objeto     )
  Licitacao$Situacao    <- str_to_upper(Licitacao$Situacao   )
  Licitacao$NomeOrgao   <- str_to_upper(Licitacao$NomeOrgao  )
  Licitacao$Municipio   <- str_to_upper(Licitacao$Municipio  )
  
  #Remover acentos desnecessarios
  Licitacao$Instituicao <- abjutils::rm_accent(Licitacao$Instituicao)
  Licitacao$ModComp     <- abjutils::rm_accent(Licitacao$ModComp    )
  Licitacao$Objeto      <- abjutils::rm_accent(Licitacao$Objeto     )
  Licitacao$Situacao    <- abjutils::rm_accent(Licitacao$Situacao   )
  Licitacao$NomeOrgao   <- abjutils::rm_accent(Licitacao$NomeOrgao  )
  Licitacao$Municipio   <- abjutils::rm_accent(Licitacao$Municipio  )
  #Apagar Espacos antes e apos o texto
  Licitacao$Instituicao <- str_trim(Licitacao$Instituicao)
  Licitacao$ModComp     <- str_trim(Licitacao$ModComp    )
  Licitacao$Objeto      <- str_trim(Licitacao$Objeto     )
  Licitacao$Situacao    <- str_trim(Licitacao$Situacao   )
  Licitacao$NomeOrgao   <- str_trim(Licitacao$NomeOrgao  )
  Licitacao$Municipio   <- str_trim(Licitacao$Municipio  )
  
  # Licitacao <- Licitacao %>% 
  #   mutate(Mes = replace(Mes, Mes == 5, "Maio"))
  #month.abb[Licitacao$Mes
  Licitacao <- Licitacao %>% mutate(Mes = as.character(lubridate::month(as.numeric(Licitacao$Mes), label = TRUE, abbr = FALSE)))
  
  return(Licitacao)
}

