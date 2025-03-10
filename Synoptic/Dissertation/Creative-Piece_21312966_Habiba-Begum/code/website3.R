library(shiny)
library(shinyWidgets)
library(bslib)
library(plotly)



ui <- fluidPage(
  setBackgroundColor("#B9D9EB"), #columbia blue
  
  # Website title
  titlePanel("Calculate Your Carbon Footprint"),
  
  tabsetPanel(  # tab panel going across horizontally, one for each page
    type = "tabs",
    tabPanel("Carbon Calculator", 
             page_sidebar( 
               sidebar = tabsetPanel(# tab panels in side bar for the question topics
                 
                 
                 tabPanel("Transportation",
                          radioGroupButtons(
                            inputId = "transport1",
                            label = "How do you usually travel?",
                            choices = c("Car", "Public Transport", "Bicycle", "Walk"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          conditionalPanel(
                            condition = "input.transport1 == 'Car'",
                            radioGroupButtons(
                              inputId = "transport2",
                              label = "How big is the car?",
                              choices = c("Small", "Medium", "Large"),
                              direction = "vertical",
                              checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                            ),
                            radioGroupButtons(
                              inputId = "transport3",
                              label = "How often do you travel by car?",
                              choices = c("Daily", "Sometimes", "Rarely"),
                              direction = "vertical",
                              checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                            )
                          )
                 ),
                 
                 
                 tabPanel("Flights",
                          radioGroupButtons(
                            inputId = "flight1",
                            label = "How often do you take flights?",
                            choices = c("Often", "Sometimes", "Rarely", "Never"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          conditionalPanel(
                            condition = "input.flight1 != 'Never'",
                              radioGroupButtons(
                                inputId = "flight2",
                                label = "What types of flights do you usually take?",
                                choices = c("Short-haul", "Long-haul", "Both"),
                                direction = "vertical",
                                checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          )
                          )
                 ),
                 
                 
                 tabPanel("Diet",
                          radioGroupButtons(
                            inputId = "diet1",
                            label = "what is your diet like?",
                            choices = c("Mainly Meat", "Mixed", "Mainly Plants"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          conditionalPanel(
                            condition = "input.diet1 == 'Mixed'",
                            radioGroupButtons(
                              inputId = "diet2",
                              label = "how often do you consume meat?",
                              choices = c("Daily", "Sometimes", "Rarely"),
                              direction = "vertical",
                              checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                            )),
                          radioGroupButtons(
                            inputId = "diet3",
                            label = "how much of your produce is thrown away?",
                            choices = c("Most", "Some", "None"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "diet4",
                            label = "Do you put your produce in a compost?",
                            choices = c("Yes", "No"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          )
                 ),
                 
                 
                 tabPanel("Shopping",
                          radioGroupButtons(
                            inputId = "shop1",
                            label = "How often do you shop?",
                            choices = c("Daily", "Weekly", "Monthly"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "shop2",
                            label = "Do your shopping items have minimal packaging or are they environmentally friendly?",
                            choices = c("Yes", "No"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "shop3",
                            label = "Do you recycle?",
                            choices = c("Yes", "No"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          )
                 ),
                 
                 
                 tabPanel("Technology",
                          radioGroupButtons(
                            inputId = "tech1",
                            label = "How many devices do you use daily?",
                            choices = c("0-1", "2-4", "4+"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "tech2",
                            label = "How often do you upgrade your device?",
                            choices = c("Always have the newest model", "Sometimes", "Only when necessary"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "tech3",
                            label = "Do you power off devices when they aren't in use?",
                            choices = c("Yes", "No"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          )
                 ),
                 
                 
                 tabPanel("Electricity",
                          radioGroupButtons(
                            inputId = "elec1",
                            label = "Does your house use solar panels or any renewable energy?",
                            choices = c("Yes", "No", "Unsure"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "elec2",
                            label = "Do you turn power off when not in use?",
                            choices = c("Yes", "No"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "elec3",
                            label = "How often do you heat/cool your house using air conditioning/heating?",
                            choices = c("Everyday", "Sometimes", "Rarely"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          )
                 ),
                 tabPanel("Water",
                          radioGroupButtons(
                            inputId = "water1",
                            label = "How long are your showers on average?",
                            choices = c("Less than 10 minutes", "10-20 minutes", "More than 20 minutes"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "water2",
                            label = "Do you leave the tap running while brushing your teeth?",
                            choices = c("Always", "Sometimes", "Never"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          ),
                          radioGroupButtons(
                            inputId = "water3",
                            label = "How often do you wash dishes by dishwasher?",
                            choices = c("Daily", "Weekly", "Rarely", "Wash by hand"),
                            direction = "vertical",
                            checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                          )
                 )
                 
               ),
               mainPanel(
                 uiOutput("Help"),
                 "Please choose which type of graph you would like to see",
                         textOutput("Carbon"),
                         
                         radioGroupButtons(
                           inputId = "graphType",
                           choices = c("Footprint of Each Section", "Comparison to Average"),
                           direction = "horizontal",
                           
                           checkIcon = list(yes = icon("ok", lib = "glyphicon"))
                         ),
                         plotlyOutput("footprint_plot"), # Displaying the footprint bar chart
                         textOutput("Information"),
                         uiOutput("sources")
                         
               ),
             )
    ),
    tabPanel("Ways to Reduce", uiOutput("reduce"))
    )
)

server <- function(input, output) {
  
  
  output$Help <- renderUI({
    tags$div(
      "On the sidebar, please choose the most appropriate answer from the choices given",
    br(),
    br()
    )
  })
  
  
  
  
  # Reactive expression to calculate result based on transportation inputs
  Transport_Result <- reactive({
          # Default value 0
          TransportValue <- 0
          
          # Set values based on transportation choices
          if (input$transport1 == "Public Transport") {
            TransportValue <- 1
          } else if (input$transport1 == "Bicycle" || input$transport1 == "Walk") {
            TransportValue <- 0
          } else if (input$transport1 == "Car")
            {
                if (input$transport2 == "Large" && input$transport3 == "Daily") {
                    TransportValue <- 2
                } else if (input$transport2 == "Large" && input$transport3 == "Sometimes") {
                    TransportValue <- 1.25
                } else if (input$transport2 == "Large" && input$transport3 == "Rarely") {
                    TransportValue <- 0.75
                } else if (input$transport2 == "Medium" && input$transport3 == "Daily") {
                    TransportValue <- 1.25
                } else if (input$transport2 == "Medium" && input$transport3 == "Sometimes") {
                    TransportValue <- 0.75
                } else if (input$transport2 == "Medium" && input$transport3 == "Rarely") {
                    TransportValue <- 0.5
                } else if (input$transport2 == "Small" && input$transport3 == "Daily") {
                    TransportValue <- 1
                } else if (input$transport2 == "Small" && input$transport3 == "Sometimes") {
                    TransportValue <- 0.5
                } else if (input$transport2 == "Small" && input$transport3 == "Rarely") {
                    TransportValue <- 0.25
                }
          }
          return(TransportValue)
    })
  
  Transport_Footprint <- reactive({
          TransportValue <- Transport_Result()
          Transport_Footprint <- TransportValue * (4.7 * 0.19)
          return(Transport_Footprint)
  })
  
  
  
  # Flight footprint calculation
  Flight_Result <- reactive({
    # Default value 0
    FlightValue <- 0
    
    # Determine the flight value based on input selections
    if (input$flight1 == "Often") {
      FlightValue <- 1
    } else if (input$flight1 == "Sometimes") {
      FlightValue <- 0.5
    } else if (input$flight1 == "Rarely") {
      FlightValue <- 0.25
    }
    
    # Add to FlightValue only if flight1 is not "Never"
    if (input$flight1 != "Never") {
      if (input$flight2 == "Short-haul") {
        FlightValue <- FlightValue + 0.5
      } else if (input$flight2 == "Long-haul") {
        FlightValue <- FlightValue + 1
      } else if (input$flight2 == "Both") {
        FlightValue <- FlightValue + 0.75
      }
    }
    
    return(FlightValue)
  })
  
  Flight_Footprint <- reactive({
            FlightValue <- Flight_Result()
            Flight_Footprint <- FlightValue * (4.7 * 0.15)
            return(Flight_Footprint)
  })
  

  
  Diet_Result <- reactive({
            # Default value 0
            DietValue <- 0
            
          
            if (input$diet1 == "Mainly Meat") {
              DietValue <- 1.75
            } else if (input$diet1 == "Mixed") {
                if(input$diet2 == "Daily"){
                  DietValue <- 1.25
                }else if(input$diet2 == "Sometimes"){
                  DietValue <- 1
                }else if(input$diet2 == "Rarely"){
                  DietValue <- 0.75
                }
            }
            else if (input$diet1 == "Mainly Plants"){
              DietValue <- 0.5
            }
            
            if(input$diet3 == "Most"){
              DietValue <- DietValue + 0.15
            }else if(input$diet3 == "Some"){
              DietValue <- DietValue + 0.05
            }else if(input$diet3 == "None"){
              DietValue <- DietValue + 0
            }
            
            if(input$diet4 == "Yes"){
              DietValue <- DietValue + 0.01
            }else if(input$diet4 == "No"){
              DietValue <- DietValue + 0.1
            }
            
            return(DietValue)
  })
  Diet_Footprint <- reactive({
            DietValue <- Diet_Result()
            Diet_Footprint <- DietValue * (4.7 * 0.20)
            return(Diet_Footprint)
  })
  
  
  
  Shopping_Result <- reactive({
            ShopValue <- 0

            if (input$shop1 == "Daily") {
              ShopValue <- 0.8
            }else if (input$shop1 == "Weekly") {
              ShopValue <- 0.5
            }else if (input$shop1 == "Monthly") {
              ShopValue <- 0.2
            }
            if (input$shop2 == "Yes") {
              ShopValue <- ShopValue + 0.01
            }else if (input$shop2 == "No") {
              ShopValue <- ShopValue + 0.1
            }
            if (input$shop3 == "Yes") {
              ShopValue <- ShopValue + 0.01
            }else if (input$shop3 == "No") {
              ShopValue <- ShopValue + 0.1
            }
            
            if(input$tech2 == "Always have the newest model"){
              ShopValue <- ShopValue + 1
            }else if(input$tech2 == "Sometimes"){
              ShopValue <- ShopValue + 0.5
            }else if(input$tech2 == "Only when necessary"){
              ShopValue <- ShopValue + 0.1
            }
            
            return(ShopValue)
  })
  
  Shopping_Footprint <- reactive({
            ShopValue <- Shopping_Result()
            Shopping_Footprint <- ShopValue * (4.7 * 0.17)
            return(Shopping_Footprint)
  })
  
  
  
  Electricity_Result <- reactive({
    
            ElectricityValue <- 0
            
            if (input$tech1 == "0-1") {
              ElectricityValue <- 0.1
            }else if (input$tech1 == "2-4") {
              ElectricityValue <- 0.25
            }else if (input$tech1 == "4+") {
              ElectricityValue <- 0.5
            }
            if (input$tech3 == "Yes") {
              ElectricityValue <- ElectricityValue + 0.01
            }else if (input$tech3 == "No") {
              ElectricityValue <- ElectricityValue + 0.1
            }
            
            if (input$elec1 == "Yes") {
              ElectricityValue <- ElectricityValue + 0.05
            }else if (input$elec1 == "No") {
              ElectricityValue <- ElectricityValue + 0.5
            }else if (input$elec1 == "Unsure") {
              ElectricityValue <- ElectricityValue + 0.5
            }
            
            
            if (input$elec2 == "Yes") {
              ElectricityValue <- ElectricityValue + 0.01
            }else if (input$elec2 == "No") {
              ElectricityValue <- ElectricityValue + 0.1
            }
            
            if (input$elec3 == "Everyday") {
              ElectricityValue <- ElectricityValue + 0.8
            }else if (input$elec3 == "Sometimes") {
              ElectricityValue <- ElectricityValue + 0.4
            }else if (input$elec3 == "Rarely") {
              ElectricityValue <- ElectricityValue + 0.2
            }
            
            return(ElectricityValue)
  })
  
  Electricity_Footprint <- reactive({
            ElectricityValue <- Electricity_Result()
            Electricity_Footprint <- ElectricityValue * (4.7 * 0.19)
            return(Electricity_Footprint)
  })
  
  
  Water_Result <- reactive({
            # Default value 0
            WaterValue <- 0
            
            if (input$water1 == "Less than 10 minutes") {
              WaterValue <- 0.25
            }else if (input$water1 == "10-20 minutes") {
              WaterValue <- 0.3
            }else if (input$water1 == "More than 20 minutes") {
              WaterValue <- 0.75
            }
            if (input$water2 == "Always") {
              WaterValue <- WaterValue + 0.5
            }else if (input$water2 == "Sometimes") {
              WaterValue <- WaterValue + 0.25
            }else if (input$water2 == "Never") {
              WaterValue <- WaterValue + 0
            }
            if (input$water3 == "Daily") {
              WaterValue <- WaterValue + 0.75
            }else if (input$water3 == "Weekly") {
              WaterValue <- WaterValue + 0.5
            }else if (input$water3 == "Rarely") {
              WaterValue <- WaterValue + 0.25
            }else if (input$water3 == "Wash by hand") {
              WaterValue <- WaterValue + 0.5
            }
        
            return(WaterValue)
  })
  
  Water_Footprint <- reactive({
            WaterValue <- Water_Result()
            Water_Footprint <- WaterValue * (4.7 * 0.10)
            return(Water_Footprint)
  })
  
  
  
  Carbon_Footprint <- reactive({
    WaterValue <- Water_Result()
    FlightValue <- Flight_Result()
    TransportValue <- Transport_Result()
    ShopValue <- Shopping_Result()
    ElectricityValue <- Electricity_Result()
    DietValue <- Diet_Result()
    Carbon_Footprint <- WaterValue + FlightValue + TransportValue + ElectricityValue + ShopValue + DietValue
    return(Carbon_Footprint)
  })

  # Creating the bar chart for displaying footprints
  output$footprint_plot <- renderPlotly({
    # Data for the bar chart
    
    if(input$graphType == "Footprint of Each Section")
    {
      
    data <- data.frame(
      Category = c("Transport", "Flights", "Diet", "Shopping", "Electricity", "Water"),
      Footprint = c(Transport_Footprint(), Flight_Footprint(), Diet_Footprint(), Shopping_Footprint(), Electricity_Footprint(), Water_Footprint()),
      Results = c(Transport_Result(), Flight_Result(), Diet_Result(), Shopping_Result(), Electricity_Result(), Water_Result())
    )
    
    data$Color <- ifelse(data$Results > 1, "red", "#B9D9EB")
      
    # Create the plotly bar chart
    p <- plot_ly(data, x = ~Category, y = ~Footprint, type = 'bar', marker = list(color = ~Color)) %>%
      layout(title = "Carbon Footprint by Category",
             xaxis = list(title = ""),
             yaxis = list(title = "metric tons"))
    
    # Display the plot
    p
  } else if (input$graphType == "Comparison to Average")
  {
    data <- data.frame(
      Category = c("Carbon Footprint", "Average"),
      Footprint = c(Carbon_Footprint(), 4.7)
    )
    
    
    data$Color <- ifelse(data$Category == "Carbon Footprint" & data$Footprint > data$Footprint[data$Category == "Average"], "red", "#B9D9EB")
    
    # Create the plotly bar chart
    p <- plot_ly(data, x = ~Category, y = ~Footprint, type = 'bar', marker = list(color = ~Color)) %>%
      layout(title = "Comparison of Carbon Footprint to Average",
             xaxis = list(title = ""),
             yaxis = list(title = "metric tons"))
    
    # Display the plot
    p
  }
  
  })
  
  output$Information <- renderText({
    if (input$graphType == "Footprint of Each Section") {
      "This graph shows the output of the footprint for each section of the quiz. If the bar is red then the value of the footprint is high."
    } else if (input$graphType == "Comparison to Average") {
      "This graph shows your total carbon footprint compared to the average. If the bar is red then your carbon footprint is greater than the average and requires improvement."
    }
  })
  
  
  
  output$reduce <- renderUI({
    tags$div(
      h1("Reducing your Carbon Footprint"),
      br(),
      "Knowing our carbon footprint helps us understand how much we are contributing to climate change. By monitoring it and taking actions to reduce it, we can help protect the environment in the future.",
      br(),
      "Taking action not only helps the environment but also helps us. For example, turning lights off can help save the planet and reduce electricity bills.",
      br(),
      br(),
      h4("Here are a few helpful webpages to reduce your carbon footprint:"),
      br(),
      tags$a(href = "https://sustainability.georgetown.edu/community-engagement/things-you-can-do/", 
             "Simple Tips to Reduce Your Carbon Footprint"),
      br(),
      tags$a(href = "https://www.constellation.com/energy-101/energy-innovation/how-to-reduce-your-carbon-footprint.html", 
             "35 ways to reduce your Carbon Footprint"),
      br(),
      tags$a(href = "https://explore.panda.org/climate/how-to-reduce-your-carbon-footprint", 
             "How you can reduce your carbon footprint"),
      br(),
      br(),
      "Making significant changes, such as switching to more sustainable energy sources, may appear daunting at first, but simple changes can have a tremendous impact.",
      "Begin with small steps and work your way up. Every effort, no matter how small, helps to create a more sustainable future."
    )
  })
  
  output$sources <- renderUI({
    tags$div(
      br(),
      br(),
      h3("Sources"),
      br(),
      "It is important to give credit where it is due:",
      br(),
      "The calculation for this Carbon Calculator was obtained from ",
      tags$a(href = "https://clevercarbon.io/how-to-calculate-your-carbon-footprint/", 
             "Clever Carbon"),
      br(),
      "The average for the UK carbon footprint was retrieved from ",
      tags$a(href = "https://www.statista.com/statistics/1299198/co2-emissions-per-capita-united-kingdom/#:~:text=Carbon%20dioxide%20emissions%20per%20capita%20in%20the%20United%20Kingdom%201970-2022&text=Per%20capita%20carbon%20dioxide%20(CO%E2%82%82,4.7%20metric%20tons%20in%202022.", 
             "Statista"),
      br(),
      
    )
  })
    
  
}

# Run the application
shinyApp(ui = ui, server = server)

