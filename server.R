# server

library(ggplot2)
library(dplyr)

source("./script/gender_vs_mortality.R")

marvel <- read.csv("data/marvel-wikia-data.csv")


shinyServer(function(input, output) {
  output$genderMortality <- renderPlotly({
    mortality.selected <- input$mortality
    if(mortality.selected != "***") {
      data <- marvel %>%
        filter(ALIVE == mortality.selected)
    }
    return(GenderMortality(marvel))
  })
  
})