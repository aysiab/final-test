library(shiny)

shinyUI(fluidPage(
  
  # Title 
  titlePanel("Alignment of Characters Alive vs Deceased"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "mortality",
                  label = "Mortality:",
                  choices = c("Living Characters", "Deceased Characters", "All" = "***"),
                  selected = "All")
    ),
    
    mainPanel(
      #give your plot a descriptive name
      plotOutput("genderMortality")
    )
  )
))