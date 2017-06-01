library(shiny)

shinyUI(fluidPage(
  
  # Title 
  titlePanel("Gender Comparisons of Mortality Rates"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "mortality",
                  label = "Mortality:",
                  choices = c("Living" = "Living Characters", "Deceased" =  "Deceased Characters", "All" = "***"),
                  selected = "All")
    ),
    
    mainPanel(
      #give your plot a descriptive name
      plotOutput("genderMortality")
    )
  )
))