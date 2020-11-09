#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Define UI for application
shinyUI(fluidPage(
    navbarPage(title="Licitações e Compras (Em Construção)",
               tabPanel("Tabela de Dados",
                        tabsetPanel(
                            tabPanel("UFV",
                                     fluidRow(
                                         column(12,
                                                DT::dataTableOutput("table1")))),
                            tabPanel("CAF",
                                     fluidRow(
                                       column(12,
                                              DT::dataTableOutput("table2"))))
                            ##
                            
                        )# barra de navegacao interna
                    ),# barra de navegacao superior (Dados do Participante)
               
               tabPanel("Visualizações Gráficas (Anual)",
                        tabsetPanel(
                          
                          ##
                          tabPanel("Total Geral",
                                   fluidRow(column(9,
                                                   plotlyOutput("plot1")))),
                          ##
                          tabPanel("Total Geral (Anual)",
                                   fluidRow(column(3, 
                                                   selectInput("Campus1", 
                                                               strong("Escolha um Campus:"), 
                                                               choices=c("CAV+CRP"="154051",
                                                                         "CAF"="154052"),
                                                               selected = "154052")),
                                            column(9,
                                                   plotOutput("plot2")))),
                          tabPanel("Empresas",
                                   fluidRow(column(3, 
                                                   selectInput("Campus2", 
                                                               strong("Escolha um Campus:"), 
                                                               choices=c("CAV+CRP"="154051",
                                                                         "CAF"="154052"),
                                                               selected = "154052"),
                                                   selectInput("Ano1", 
                                                               strong("Ano de Interesse:"), 
                                                               choices=c("2013",
                                                                         "2014",
                                                                         "2015",
                                                                         "2016",
                                                                         "2017",
                                                                         "2018",
                                                                         "2019",
                                                                         "2020"),
                                                              selected = "2020")),
                                            column(9,
                                                   plotlyOutput("plot3")))),
                          
                          tabPanel("Produtos",
                                   fluidRow(column(3, 
                                                   selectInput("Campus3", 
                                                               strong("Escolha um Campus:"), 
                                                               choices=c("CAV+CRP"="154051",
                                                                         "CAF"="154052"),
                                                               selected = "154052"),
                                                   selectInput("Ano2", 
                                                               strong("Ano de Interesse:"), 
                                                               choices=c("2013",
                                                                         "2014",
                                                                         "2015",
                                                                         "2016",
                                                                         "2017",
                                                                         "2018",
                                                                         "2019",
                                                                         "2020"),
                                                               selected = "2020")),
                                            column(9,
                                                   plotlyOutput("plot4"))))
                          
                          
                        )# barra de navegacao interna
               ),# barra de navegacao superior (Dados da Escola)
               
               tabPanel("Visualizações Gráficas (Mensais)",
                        tabsetPanel(
                          
                          ##
                          tabPanel("Total Geral (Mensal)",
                                   fluidRow(column(3, 
                                                   selectInput("Campus4", 
                                                               strong("Escolha um Campus:"), 
                                                               choices=c("CAV+CRP"="154051",
                                                                         "CAF"="154052"),
                                                               selected = "154052"),
                                                   selectInput("Ano3", 
                                                               strong("Ano de Interesse:"), 
                                                               choices=c("2013",
                                                                         "2014",
                                                                         "2015",
                                                                         "2016",
                                                                         "2017",
                                                                         "2018",
                                                                         "2019",
                                                                         "2020"),
                                                               selected = "2020")),
                                            column(9,
                                                   plotOutput("plot5")))),
                          tabPanel("Empresas",
                                   fluidRow(column(3, 
                                                   selectInput("Campus5", 
                                                               strong("Escolha um Campus:"), 
                                                               choices=c("CAV+CRP"="154051",
                                                                         "CAF"="154052"),
                                                               selected = "154052"),
                                                   selectInput("Ano4", 
                                                               strong("Ano de Interesse:"), 
                                                               choices=c("2013",
                                                                         "2014",
                                                                         "2015",
                                                                         "2016",
                                                                         "2017",
                                                                         "2018",
                                                                         "2019",
                                                                         "2020"),
                                                               selected = "2020"),
                                                   selectInput("Mes1", 
                                                               strong("Mês de Interesse:"), 
                                                               choices=c("Janeiro", 
                                                                         "Fevereiro", 
                                                                         "Marco", 
                                                                         "Abril",
                                                                         "Maio", 
                                                                         "Junho", 
                                                                         "Julho", 
                                                                         "Agosto",
                                                                         "Setembro", 
                                                                         "Outubro", 
                                                                         "Novembro", 
                                                                         "Dezembro"),
                                                               selected = "Janeiro")),
                                            column(9,
                                                   plotlyOutput("plot6"),
                                                   textOutput("text1")))),
                          
                          tabPanel("Produtos",
                                   fluidRow(column(3, 
                                                   selectInput("Campus6", 
                                                               strong("Escolha um Campus:"), 
                                                               choices=c("CAV+CRP"="154051",
                                                                         "CAF"="154052"),
                                                               selected = "154052"),
                                                   selectInput("Ano5", 
                                                               strong("Ano de Interesse:"), 
                                                               choices=c("2013",
                                                                         "2014",
                                                                         "2015",
                                                                         "2016",
                                                                         "2017",
                                                                         "2018",
                                                                         "2019",
                                                                         "2020"),
                                                               selected = "2020"),
                                                   selectInput("Mes2", 
                                                               strong("Mês de Interesse:"), 
                                                               choices=c("Janeiro", 
                                                                         "Fevereiro", 
                                                                         "Marco", 
                                                                         "Abril",
                                                                         "Maio", 
                                                                         "Junho", 
                                                                         "Julho", 
                                                                         "Agosto",
                                                                         "Setembro", 
                                                                         "Outubro", 
                                                                         "Novembro", 
                                                                         "Dezembro"),
                                                               selected = "Janeiro")),
                                            column(9,
                                                   plotlyOutput("plot7"),
                                                   textOutput("text2"))))
                          
                          
                        )# barra de navegacao interna
               )# barra de navegacao superior (Visualizacoes Graficas Mensais)
               
    )#navbarPage
)#fluidPage
)#shinyUI
