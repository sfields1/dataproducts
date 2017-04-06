library(shiny)
library(datasets)
library(dplyr)
library(tidyr)
library(plotly)

shinyServer(function(input, output) {

        

        
      output$table <- renderDataTable({
              
              nottem <- tapply(nottem, list(year = floor(time(nottem)), month = month.name[cycle(nottem)]), c)
              nottem <- as.data.frame(nottem)
              nottem <- nottem %>%
                      mutate(Year = rownames(nottem)) %>%
                      select(Year, January, February, March, April, May, June, 
                             July, August, September, October, November, December) %>%
                      gather(Month, Temperature, -Year) %>%
                      filter(Month %in% input$month, Year %in% input$year)
              
              
              
              nottem$Month <- factor(nottem$Month, level = unique(nottem$Month))
              
              nottem
              
      }, options = list(lengthMenu = c(5, 15, 25), pageLength = 25))
      
      output$bar <- renderPlotly({
              
              nottem <- tapply(nottem, list(year = floor(time(nottem)), month = month.name[cycle(nottem)]), c)
              nottem <- as.data.frame(nottem)
              nottem <- nottem %>%
                      mutate(Year = rownames(nottem)) %>%
                      select(Year, January, February, March, April, May, June, 
                             July, August, September, October, November, December) %>%
                      gather(Month, Temperature, -Year) %>%
                      filter(Month %in% input$month, Year %in% input$year)
              
              
              
              nottem$Month <- factor(nottem$Month, level = unique(nottem$Month))
              
              plot_ly(nottem, x = ~Year, y = ~Temperature, color = ~Month, type = 'bar', colors = "Set3")
      })
})

