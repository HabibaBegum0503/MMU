getwd()#get working directory - which folder R is in
setwd("C:/Users/21312966.AD/OneDrive - MMU/Documents")
# setting the working directory so where R should look
x<-(read.csv("data.csv"))
#reading the csv file and storing it in variable x
# <- is the same as =
x<-lapply(x, as.numeric)
#chnage the list to numeric type lapply = list apply
x<-as.data.frame(x)
#chnaging x from list to data frame
x<-as.data.frame.numeric(x)
#chnaging x to a numeric data frame
?read.csv
#? to find more help on the line
# load the shiny package
library(shiny)
runExample("06_tabsets")
# define the user interface object with the appearance of the app
ui <- fluidPage(
  numericInput(inputId = "n", label = "Sample size", value = 25),
  plotOutput(outputId = "hist")
)

# define the server function with instructions to build the
# objects displayed in the ui
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(unlist(x))
    #histogram of x, unlist before use
    
  })
}

# call shinyApp() which returns the Shiny app object
shinyApp(ui = ui, server = server)
