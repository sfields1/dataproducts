ui <- fluidPage(
        sidebarLayout(
                sidebarPanel = 
        
        sliderInput(inputId = "num",
                    label = "Choose how large a sample to use",
                    value = 100, min = 1, max = 1000),
        
        textInput(inputId = "title", 
                  label = "Write a title",
                  value = "Histogram of Normal or Uniform Numbers"),
        ),
        mainPanel(
        actionButton(inputId = "norm", label = "Normal"),
        actionButton(inputId = "unif", label = "Uniform"),
        
        plotOutput("hist")
        )
)
