server <- function(input, output) {
        
        
        
        rv <- reactiveValues(data = rnorm(100))
        
        observeEvent(input$norm, {rv$data <- rnorm(input$num)})
        observeEvent(input$unif, {rv$data <- runif(input$num)})
        
        output$hist <- renderPlot({
                hist(rv$data,
                     main = isolate({input$title}))
        })
}
