library(shiny)
library(plotly)

# Define UI
ui <- fluidPage(
  titlePanel("Carbon Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("transport_emissions", "Transport Emissions (kg CO2)", value = 0),
      numericInput("energy_emissions", "Energy Emissions (kg CO2)", value = 0),
      numericInput("diet_emissions", "Diet Emissions (kg CO2)", value = 0),
      actionButton("calculate_btn", "Calculate"),
      hr(),
      h4("Your Total Points:"),
      textOutput("total_points")
    ),
    mainPanel(
      plotlyOutput("gauge_chart")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Initialize total points
  total_points <- reactiveVal(0)
  
  # Calculate total points based on inputs
  observeEvent(input$calculate_btn, {
    transport_points <- input$transport_emissions * 10
    energy_points <- input$energy_emissions * 5
    diet_points <- input$diet_emissions * 15
    
    total_points(total_points() + transport_points + energy_points + diet_points)
  })
  
  # Output total points
  output$total_points <- renderText({
    total_points()
  })
  
  # Generate gauge chart
  output$gauge_chart <- renderPlotly({
    plot_ly(
      type = "indicator",
      mode = "gauge+number",
      value = total_points(),
      title = "Total Points",
      gauge = list(
        axis = list(range = list(NULL, 100)),
        steps = list(
          list(range = c(0, 50), color = "red"),
          list(range = c(50, 80), color = "yellow"),
          list(range = c(80, 100), color = "green")
        )
      )
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
