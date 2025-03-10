library(shiny)




# Define UI
ui <- fluidPage(
  titlePanel("Numeric Input Bar Chart"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "num_input", label = "Enter a number:", value = 50)
    ),
    mainPanel(
      plotOutput(outputId = "bar_chart")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$bar_chart <- renderPlot({
    # Create a bar chart with the input value
    barplot(input$num_input, main = "Bar Chart", xlab = "Value", ylab = "Count")
  })
}


# Run the application
shinyApp(ui = ui, server = server)

