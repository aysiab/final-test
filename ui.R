library(shiny)

shinyUI(fluidPage(
  
  # Title 
  titlePanel("Alignment of Characters Alive vs Deceased"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "align",
                  label = "Alignment",
                  choices = c("Good", "Evil", "Neutral", "All"),
                  selected = "All"),
      radioButtons(inputId = "alive",
                   label = "Still Alive?", 
                   choices = c("Yes","No","All"),
                   selected = "All")
    ),
    
    mainPanel(
      #give your plot a descriptive name
      plotOutput("alignmentMortality")
    )
  )
))