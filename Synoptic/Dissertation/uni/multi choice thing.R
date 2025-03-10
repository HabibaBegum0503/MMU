library(shiny)
library(shinyWidgets)
library(bslib)

# Function to generate random questions
generate_questions <- function(n_questions) {
  questions <- c(
    "How important is this to you?",
    "On a scale of 1 to 10, how much do you value this?",
    "Rate your preference for this option.",
    "How much do you prioritize this?"
  )
  sample(questions, n_questions, replace = TRUE)
}

ui <- fluidPage(
  setBackgroundColor("#B9D9EB"),
  
  # Website title
  titlePanel("Checking if the tabset works"),
  
  tabsetPanel(
    type = "tabs",
    tabPanel("Carbon Calculator",
             pageWithSidebar(
               headerPanel(NULL),
               sidebarPanel(
                 width = 4, # Adjust the width of the side panel
                 tabsetPanel(
                   id = "sideTab",
                   type = "tabs",
                   tabPanel("Personal", 
                            lapply(1:2, function(i) {
                              fluidRow(
                                column(12,
                                       radioButtons(paste0("personal_radio", i), generate_questions(2)[i], 
                                                    choices = c("Low" = 25, "Medium" = 50, "High" = 75),
                                                    selected = 50)
                                )
                              )
                            })
                   ),
                   tabPanel("Travel", 
                            lapply(1:2, function(i) {
                              fluidRow(
                                column(12,
                                       radioButtons(paste0("travel_radio", i), generate_questions(2)[i], 
                                                    choices = c("Low" = 25, "Medium" = 50, "High" = 75),
                                                    selected = 50)
                                )
                              )
                            })
                   ),
                   tabPanel("Diet", 
                            lapply(1:2, function(i) {
                              fluidRow(
                                column(12,
                                       radioButtons(paste0("diet_radio", i), generate_questions(2)[i], 
                                                    choices = c("Low" = 25, "Medium" = 50, "High" = 75),
                                                    selected = 50)
                                )
                              )
                            })
                   ),
                   tabPanel("Technology", 
                            lapply(1:2, function(i) {
                              fluidRow(
                                column(12,
                                       radioButtons(paste0("tech_radio", i), generate_questions(2)[i], 
                                                    choices = c("Low" = 25, "Medium" = 50, "High" = 75),
                                                    selected = 50)
                                )
                              )
                            })
                   ),
                   tabPanel("Electricity", 
                            lapply(1:2, function(i) {
                              fluidRow(
                                column(12,
                                       radioButtons(paste0("electricity_radio", i), generate_questions(2)[i], 
                                                    choices = c("Low" = 25, "Medium" = 50, "High" = 75),
                                                    selected = 50)
                                )
                              )
                            })
                   )
                 )
               ),
               mainPanel(
                 textOutput("personal_value"),
                 textOutput("travel_value"),
                 textOutput("diet_value"),
                 textOutput("tech_value"),
                 textOutput("electricity_value")
               )
             )
    ),
    tabPanel("Ways to Reduce", textOutput("reduce"))
  )
)

server <- function(input, output) {
  output$personal_value <- renderText({
    paste("Responses to Personal questions:", 
          paste(sapply(1:2, function(i) input[[paste0("personal_radio", i)]]), collapse = ", "))
  })
  output$travel_value <- renderText({
    paste("Responses to Travel questions:", 
          paste(sapply(1:2, function(i) input[[paste0("travel_radio", i)]]), collapse = ", "))
  })
  output$diet_value <- renderText({
    paste("Responses to Diet questions:", 
          paste(sapply(1:2, function(i) input[[paste0("diet_radio", i)]]), collapse = ", "))
  })
  output$tech_value <- renderText({
    paste("Responses to Technology questions:", 
          paste(sapply(1:2, function(i) input[[paste0("tech_radio", i)]]), collapse = ", "))
  })
  output$electricity_value <- renderText({
    paste("Responses to Electricity questions:", 
          paste(sapply(1:2, function(i) input[[paste0("electricity_radio", i)]]), collapse = ", "))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
