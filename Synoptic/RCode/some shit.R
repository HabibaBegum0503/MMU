library(shiny)
library(dplyr)
library(tibble)
library(stringr)
library(ggplot2)

homeUI <- fluidPage(
  titlePanel("Home Page"),
  h2("Welcome to our website!", style = "color: black;"),
  p("This is the home page."),
  theme = "bootstrap.min.css",
  tags$head(tags$style(HTML("
    body {
      background-color: #89CFF0; !important # Change this to white
    }
  ")))
)

# Define UI for about page
aboutUI <- fluidPage(
  titlePanel("About Page"),
  h2("About Us", style = "color: black;"),
  p("This is the about page."),
  theme = "bootstrap.min.css",
  tags$head(tags$style(HTML("
    body {
      background-color: #89CFF0 !important;
    }
  ")))
)

# Define UI for contact page
contactUI <- fluidPage(
  titlePanel("Contact Page"),
  h2("Contact Us", style = "color: black;", font = "T" ),
  p("This is the contact page."),
  img(src = "download.jfif", height = 72, width = 72),
  theme = "bootstrap.min.css",
  tags$head(tags$style(HTML("
    body {
      background-color: #89CFF0 !important;
    }
  ")))
)

FintChangeui <- fluidPage(
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Yusei+Magic&display=swap');
      body {
        background-color: #89CFF0;
        color: white;
      }
      h2 {
        font-family: 'Yusei Magic', sans-serif;
      }
      .shiny-input-container {
        color: #474747;
      }"))
  ),
  titlePanel("Old Faithful Geyser Data"),
)

# Define UI for the histogram page
histui <- fluidPage(
  titlePanel("Numeric Input Histogram"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "num_input", label = "Enter a number:", value = 50)
    ),
    mainPanel(
      plotOutput(outputId = "hist_plot")
    )
  )
)

# Define UI for the bar chart page
barui <- fluidPage(
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

# Define server logic for histogram
histserver <- function(input, output) {
  output$hist_plot <- renderPlot({
    # Create a histogram with the input value
    hist(rep(input$num_input, 100), main = "Histogram", xlab = "Value")
  })
}

# Define server logic for bar chart
barserver <- function(input, output) {
  output$bar_chart <- renderPlot({
    # Create a bar chart with the input value
    barplot(input$num_input, main = "Bar Chart", xlab = "Value", ylab = "Count")
  })
}

# Define server logic for the entire app
server <- function(input, output) {
  # Empty server function as we are not doing any calculations
}
# Define UI for the entire app
ui <- navbarPage(
  title = "Multi-page Website",
  tabPanel("Home", homeUI),
  tabPanel("About", aboutUI),
  tabPanel("Contact", contactUI),
  tabPanel("font", FintChangeui),
  tabPanel("Hist", histui),
  tabPanel("Bar", barui)
)

# Run the application
shinyApp(ui = ui, server = server)
