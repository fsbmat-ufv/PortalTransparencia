#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    ##################################################################
    #########################Dados do Participante####################
    ##################################################################
    output$table1 <- DT::renderDataTable({
        
        
        table1 <- dados %>% select(-CodOrgao, -NomeOrgao)
        DT::datatable(table1,
                      class = 'cell-border stripe',
                      extensions = 'Buttons', options = list(
                          dom = 'Bfrtip',
                          buttons = c('pageLength','copy', 'csv', 'excel', 'pdf', 'print')
                      ))%>% 
            DT::formatRound(c("Valor"), digits=2) %>% DT::formatCurrency( c("Valor"), currency="R$ ")
        
    })
    
    output$table2 <- DT::renderDataTable({
        
        
        table2 <- CEDAF %>% select(-CodOrgao, -NomeOrgao)
        DT::datatable(table2,
                      class = 'cell-border stripe',
                      extensions = 'Buttons', options = list(
                          dom = 'Bfrtip',
                          buttons = c('pageLength','copy', 'csv', 'excel', 'pdf', 'print')
                      ))%>% 
            DT::formatRound(c("Valor"), digits=2) %>% DT::formatCurrency( c("Valor"), currency="R$ ")
        
    })
    
    output$plot1 <- renderPlotly({
        options(scipen = 999)
        plot1 <- dados %>% group_by(Instituicao) %>% summarise(Valor=sum(Valor), .groups = 'drop') %>% 
            ggplot(aes(reorder(Instituicao, desc(Valor)), 
                       Valor, fill=Instituicao, label=Valor, 
                       text=paste("Instituição:",Instituicao, "<br>", 
                                  "Valor Total:", paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f')))))+ 
            scale_x_discrete(name ="Instituição", 
                             labels=c("UFV (CAV + CRP)", "CAF"))+
            geom_col(show.legend = FALSE)+ ylim(0,650000000)+
            geom_text(aes(label=paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5)+
            theme_bw() + ggtitle("Valor Total investido em Compras desde 2013 (em R$)") + 
            ylab("Valor Total Investido (R$)") + xlab(NULL)
        ggplotly(plot1, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
    
    })
    
    output$plot2 <- renderPlot({
        if(input$Campus1=="154051"){
            
            options(scipen = 999)
            dados %>% filter(CodUG=="154051")%>% group_by(Instituicao, Ano) %>% 
                summarise(Valor=sum(Valor), .groups = 'drop') %>% 
                ggplot(aes(Ano, 
                           Valor, fill=Ano, label=Valor, 
                           text=paste("Ano:",Ano, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f')))))+ 
                scale_x_continuous(breaks = c(2013:2020), 
                                   labels = as.character(2013:2020), 
                                   limits = c(2012.5,2020.5))+
                geom_col(show.legend = FALSE)+ ylim(0,115000000)+
                geom_text(aes(label= paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f'))), 
                          vjust = -0.6, hjust=0.5, size=5)+
                theme_bw() + 
                theme(text = element_text(size=15))+
                ggtitle("Valor Total investido em Compras desde 2013 (em R$)") + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            
            
        }else{
            options(scipen = 999)
            dados %>% filter(CodUG=="154052")%>% group_by(Instituicao, Ano) %>% 
                summarise(Valor=sum(Valor), .groups = 'drop') %>% 
                ggplot(aes(Ano, 
                           Valor, fill=Ano, label=Valor, 
                           text=paste("Ano:",Ano, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f')))))+ 
                scale_x_continuous(breaks = c(2013:2020), 
                                   labels = as.character(2013:2020), 
                                   limits = c(2012.5,2020.5))+
                geom_col(show.legend = FALSE)+ ylim(0,12000000)+
                geom_text(aes(label= paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f'))), 
                          vjust = -0.6, hjust=0.5, size=5)+
                theme_bw() + 
                theme(text = element_text(size=15))+
                ggtitle("Valor Total investido em Compras desde 2013 (em R$)") + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            
        }
    })
    
    output$plot3 <- renderPlotly({
        if(input$Campus2=="154051"){
            
            options(scipen = 999)
            plot3 <- dados %>% filter(CodUG=="154051", Ano==input$Ano1) %>% 
                group_by(NomeVencedor) %>% 
                summarise(Total = sum(Valor))%>% top_n(10) %>%
            ggplot(aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(Total)), Total, fill=NomeVencedor, label=Total, 
                       text=paste("Nome da Empresa:",NomeVencedor, "<br>", 
                                  "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .1)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("As Dez Empresas que mais Venderam para o Campus de Viçosa e Rio Paranaíba em", input$Ano1)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot3, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }else{
            options(scipen = 999)
            plot3 <- dados %>% filter(CodUG=="154052", Ano==input$Ano1) %>% 
                group_by(NomeVencedor) %>% 
                summarise(Total = sum(Valor))%>% top_n(10) %>%
                ggplot(aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(Total)), Total, fill=NomeVencedor, label=Total, 
                           text=paste("Nome da Empresa:",NomeVencedor, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .2)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("As Dez Empresas que mais Venderam para o Campus UFV - Florestal em", input$Ano1)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot3, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }
    })
    
    output$plot4 <- renderPlotly({
        if(input$Campus3=="154051"){
            
            options(scipen = 999)
            plot4 <- dados %>% filter(CodUG=="154051", Ano==input$Ano2) %>% 
                group_by(Descricao) %>% 
                summarise(Total = sum(Valor))%>% top_n(10) %>%
                ggplot(aes(reorder(stringr::str_wrap(Descricao, 5), desc(Total)), Total, fill=Descricao, label=Total, 
                           text=paste("Nome da Empresa:",Descricao, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .1)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("Os 10 produtos que demandaram mais recursos pelo Campus de Viçosa e Rio Paranaíba em", input$Ano2)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot4, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }else{
            options(scipen = 999)
            plot4 <- dados %>% filter(CodUG=="154052", Ano==input$Ano2) %>% 
                group_by(Descricao) %>% 
                summarise(Total = sum(Valor))%>% top_n(10) %>%
                ggplot(aes(reorder(stringr::str_wrap(Descricao, 5), desc(Total)), Total, fill=Descricao, label=Total, 
                           text=paste("Nome da Empresa:",Descricao, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .2)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("Os 10 produtos que demandaram mais recursos pelo Campus Florestal em", input$Ano2)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot4, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }
    })
    
    
    output$plot5 <- renderPlot({
        if(input$Campus4=="154051"){
            #Ordered by Month
            dfM <- dados %>% mutate(Mes = factor(Mes, 
                                                levels = c("Janeiro", "Fevereiro", "Marco", "Abril",
                                                                    "Maio", "Junho", "Julho", "Agosto",
                                                                    "Setembro", "Outubro", "Novembro", "Dezembro"),
                                                ordered = TRUE))
            options(scipen = 999)
            dfM %>% filter(CodUG=="154051", Ano == input$Ano3)%>% group_by(Instituicao, Mes) %>% 
                summarise(Valor=sum(Valor), .groups = 'drop') %>% 
                ggplot(aes(Mes, 
                           Valor, fill=Mes, label=Valor, 
                           text=paste("Mes:",Mes, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f')))))+ 
                #scale_x_discrete(limits = mes)+
                geom_col(show.legend = FALSE)+# ylim(0,115000000)+
                geom_text(aes(label= paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f'))), 
                          vjust = -0.6, hjust=0.5, size=5)+
                theme_bw() + 
                theme(text = element_text(size=15))+
                ggtitle(label=paste("Valor Total investido por mês em Compras no ano de", input$Ano3)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            
            
        }else{
            #Ordered by Month
            dfM <- dados %>% mutate(Mes = factor(Mes, 
                                                 levels = c("Janeiro", "Fevereiro", "Marco", "Abril",
                                                            "Maio", "Junho", "Julho", "Agosto",
                                                            "Setembro", "Outubro", "Novembro", "Dezembro"),
                                                 ordered = TRUE))
            options(scipen = 999)
            dfM %>% filter(CodUG=="154052", Ano == input$Ano3)%>% group_by(Instituicao, Mes) %>% 
                summarise(Valor=sum(Valor), .groups = 'drop') %>% 
                ggplot(aes(Mes, 
                           Valor, fill=Mes, label=Valor, 
                           text=paste("Mes:",Mes, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f')))))+ 
                geom_col(show.legend = FALSE)+ #ylim(0,12000000)+
                geom_text(aes(label= paste0('R$',formatC(Valor, digits = 2, big.mark=',', format = 'f'))), 
                          vjust = -0.6, hjust=0.5, size=5)+
                theme_bw() + 
                theme(text = element_text(size=15))+
                ggtitle(label=paste("Valor Total investido por mês em Compras no ano de", input$Ano3)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            
        }
    })
    
    output$plot6 <- renderPlotly({
        if(input$Campus5=="154051"){
            dfM <- dados %>% mutate(Mes = factor(Mes, 
                                                 levels = c("Janeiro", "Fevereiro", "Marco", "Abril",
                                                            "Maio", "Junho", "Julho", "Agosto",
                                                            "Setembro", "Outubro", "Novembro", "Dezembro"),
                                                 ordered = TRUE))
            options(scipen = 999)
            plot6 <- dfM %>% filter(CodUG=="154051", Ano==input$Ano4, Mes==input$Mes1) %>% 
                group_by(NomeVencedor) %>% 
                summarise(Total = sum(Valor)) %>% top_n(10) %>%
                ggplot(aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(Total)), Total, fill=NomeVencedor, label=Total, 
                           text=paste("Nome da Empresa:",NomeVencedor, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .1)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("As Empresas que mais Venderam para o Campus de Viçosa e Rio Paranaíba em", input$Mes1, "de", input$Ano4)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot6, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }else{
            dfM <- dados %>% mutate(Mes = factor(Mes, 
                                                 levels = c("Janeiro", "Fevereiro", "Marco", "Abril",
                                                            "Maio", "Junho", "Julho", "Agosto",
                                                            "Setembro", "Outubro", "Novembro", "Dezembro"),
                                                 ordered = TRUE))
            options(scipen = 999)
            plot6 <- dfM %>% filter(CodUG=="154052", Ano==input$Ano4, Mes==input$Mes1) %>% 
                group_by(NomeVencedor) %>% 
                summarise(Total = sum(Valor))%>% top_n(10) %>%
                ggplot(aes(reorder(stringr::str_wrap(NomeVencedor, 5), desc(Total)), Total, fill=NomeVencedor, label=Total, 
                           text=paste("Nome da Empresa:",NomeVencedor, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .1)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("As Empresas que mais Venderam para o Campus Florestal em", input$Mes1, "de", input$Ano4)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot6, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }
    })
    
    output$plot7 <- renderPlotly({
        if(input$Campus6=="154051"){
            dfM <- dados %>% mutate(Mes = factor(Mes, 
                                                 levels = c("Janeiro", "Fevereiro", "Marco", "Abril",
                                                            "Maio", "Junho", "Julho", "Agosto",
                                                            "Setembro", "Outubro", "Novembro", "Dezembro"),
                                                 ordered = TRUE))
            options(scipen = 999)
            plot7 <- dfM %>% filter(CodUG=="154051", Ano==input$Ano5, Mes==input$Mes2) %>% 
                group_by(Descricao) %>% 
                summarise(Total = sum(Valor))%>% top_n(10) %>%
                ggplot(aes(reorder(stringr::str_wrap(Descricao, 5), desc(Total)), Total, fill=Descricao, label=Total, 
                           text=paste("Nome da Empresa:",Descricao, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .1)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("Os produtos que demandaram mais recursos pelo Campus de Viçosa e Rio Paranaíba em", input$Mes2, "de", input$Ano5)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot7, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }else{
            dfM <- dados %>% mutate(Mes = factor(Mes, 
                                                 levels = c("Janeiro", "Fevereiro", "Marco", "Abril",
                                                            "Maio", "Junho", "Julho", "Agosto",
                                                            "Setembro", "Outubro", "Novembro", "Dezembro"),
                                                 ordered = TRUE))
            options(scipen = 999)
            plot7 <- dfM %>% filter(CodUG=="154052", Ano==input$Ano5, Mes==input$Mes2) %>% 
                group_by(Descricao) %>% 
                summarise(Total = sum(Valor))%>% top_n(10) %>%
                ggplot(aes(reorder(stringr::str_wrap(Descricao, 5), desc(Total)), Total, fill=Descricao, label=Total, 
                           text=paste("Nome da Empresa:",Descricao, "<br>", 
                                      "Valor Total:", paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))))) + 
                geom_bar(stat='identity', show.legend = FALSE) +
                scale_y_continuous(expand = expansion(mult = c(0, .2)))+
                geom_text(aes(label=paste0('R$',formatC(Total, digits = 2, big.mark=',', format = 'f'))), vjust = -0.5, size=3)+
                theme_bw() + ggtitle(label=paste("Os produtos que demandaram mais recursos pelo Campus Florestal em", input$Mes2, "de", input$Ano5)) + 
                ylab("Valor Total Investido (R$)") + xlab(NULL)
            ggplotly(plot7, tooltip = "text") %>% layout(showlegend = FALSE) %>% style(textposition = "top")
            
            
        }
        
        
        
    })
    
    output$text1 <- renderText({
        
        "Observação: Caso apareça alguma informação de erro, significa que no mês escolhido não foi comprado 
            nada pelo Campus. Basta escolher outro mês!"
    })
    
    output$text2 <- renderText({
        
        "Observação: Caso apareça alguma informação de erro, significa que no mês escolhido não foi comprado 
            nada pelo Campus. Basta escolher outro mês!"
    })
    
})
