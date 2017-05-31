# Aysia Brown
# Graph Characteristics vs Year

install.packages('rsconnect')
library(rsconnect)
library(shiny) 
library(ggplot2)
library(dplyr)

marvel <- read.csv(file = "data/marvel-wikia-data.csv")

shinyServer(function(input, output) {
  output$alignmentMortality <- renderPlot({
    
    # Filters data by calories in the cereal 
    # x axis = cereal names
    # y axis = sugar 
    if(input$align == "Good") {
      plot <- marvel %>%
        filter(ALIGN == "Good Characters")
    } else if(input$align == "Evil") {
      plot <- marvel %>%
        filter(ALIGN == "Bad Characters")
    } else if(input$align == "Neutral Characters") {
      plot <- marvel %>%
        filter(ALIGN == "Neutral")
    } else {
      plot <- marvel
    }
    
    if(input$alive == "Yes") {
      plot <- marvel %>%
        filter(ALIVE == "Living Characters")
    } else if(input$alive == "No") {
      plot <- marvel %>%
        filter(ALIVE == "Deceased Characters")
    } else {
      plot <- marvel 
    }
    
    
    ggplot(plot, aes(x = YEAR, y = alive, color = factor(align))) + 
      geom_point() + 
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
      labs(x = "Cereal Brands", y = "Sugars", title = "Calories of Cereal Brands vs Other Nutritional Values")
  })
})