library(shiny)

# Define UI for random distribution app ----
ui <- fluidPage(
  
  # Custom CSS to change background color to baby blue
  tags$head(
    tags$style(HTML("
      body {
        background-color: #AEEEEE; /* Baby Blue */
      }
      .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
        background-color: green !important;
        # this changes the tab colours
      }
      .tab-content {
        background-color: pink !important;
        #this changes the background colour of the page corresponding to the tab
      }
      .plot-container {
        background-color: pink !important;
      }
      .summary-container {
        background-color: pink !important;
      }
    "))
  ),
  
  
  # App title ----
  titlePanel("Tabsets"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select the random distribution type ----
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp")),
      
      # br() element to introduce extra vertical spacing ----
      br(),
      
      # Input: Slider for the number of observations to generate ----
      sliderInput("n",
                  "Number of observations:",
                  value = 500,
                  min = 1,
                  max = 1000)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table"))
      )
      
    )
  )
)


server <- function(input, output) {
  
  # Reactive expression to generate random distribution data
  d <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)
    
    dist(input$n)
  })
  
  
  # Render histogram plot
  output$plot <- renderPlot({
    dist <- input$dist
    n <- input$n
    
    # Create histogram with specified breaks without plotting
    h <- hist(d(), breaks = 20, plot = FALSE)
    
    # Calculate colors based on frequencies
    colors <- ifelse(h$counts == max(h$counts), "red", "green")
    
    # Plot histogram with custom colors
    barplot(h$counts, col = colors, main = paste("r", dist, "(", n, ")", sep = ""))
  })
  
  # Render summary of the data
  output$summary <- renderPrint({
    summary(d())
  })
  
  # Render HTML table view of the data
  output$table <- renderTable({
    d()
  })
  
}

# Create Shiny app ----
shinyApp(ui, server)
