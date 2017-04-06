library(shiny)
library(datasets)
library(dplyr)
library(tidyr)
library(plotly)

shinyUI(navbarPage("Average Monthly Temperatures at Nottingham, 1920-1939",
                   tabPanel("Table",
                            
                   sidebarLayout(
                           sidebarPanel(
                                   submitButton("Submit"),
                                   helpText("Choose which months and year to include"),
                                   checkboxGroupInput("month", "Month", choices = c("January", "February",
                                                                                    "March", "April", "May", 
                                                                                    "June", "July", "August",
                                                                                    "September", "October",
                                                                                    "November", "December"),
                                                      selected = c("January", "February", "March", "April", "May",
                                                      "June", "July", "August", "September", "October",
                                                      "November", "December")),
                                   checkboxGroupInput("year", "Year", choices = c(1920:1939),
                                                      selected = c(1920:1939))
                                   
                                   ),
                           
                           mainPanel(
                                   dataTableOutput("table")
                                   )
                           )
                   ),
                   
                   tabPanel("Chart",
                            plotlyOutput("bar")
                   ),
                   
                   tabPanel("About",
                            mainPanel(
                                    print("This app uses data from the 'nottem' dataset which comes with base R.
                                          The dataset contains average monthly temperatures at Nottingham
                                          between the years of 1920 and 1939. The app itself allows the user 
                                          to select what months and years to include in the dataset which is 
                                          displayed on the 'Table' tab. There is a bar graph on the 'Chart'
                                          tab that will update as different checkboxes are marked.")
                            ))
        
))
