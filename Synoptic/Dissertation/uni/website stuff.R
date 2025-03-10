library(shiny)
library(shinyWidgets)
library(bslib)


ui <- fluidPage(
  theme = bslib::bs_theme(
    bg = "#B9D9EB", # Background color
    fg = "#000000", # Foreground (text) color
  ),
  
  # Website title
  titlePanel("Calculate Your Carbon Footprint"),
  
  tabsetPanel(
    type = "tabs",
    tabPanel("Carbon Calculator", 
             page_sidebar(
               sidebar = tabsetPanel(
                 tabPanel("Transportation", "Just a few questions about your travels."),
                 tabPanel("Diet", "Just a few questions about your diet."),
                 tabPanel("Shopping", "Just a few questions about your shopping trips."),
                 tabPanel("Technology", "Just a few questions about technology."),
                 tabPanel("Electricity", "Just a few questions about the electricity you use.")
                 
               ),
               "Main contents"
             )
    ),
    tabPanel("Ways to Reduce", textOutput("reduce"))
  )
)

server <- function(input, output) {
  # Empty server function as there are no current calculations
}

# Run the application
shinyApp(ui = ui, server = server)

