# server

library(ggplot2)
library(dplyr)

source("./script/gender_vs_mortality.R")

marvel <- read.csv("data/marvel-wikia-data.csv", stringsAsFactors = FALSE)
colnames(marvel)[13] <- "YEAR"


shinyServer(function(input, output) {
  output$genderMortality <- renderPlotly({
    mortality.selected <- input$mortality
    if(mortality.selected != "***") {
      marvel <- marvel %>%
        filter(ALIVE == mortality.selected)
    } else {
      marvel <- marvel
    }
    return(GenderMortality(marvel))
  })
  
})