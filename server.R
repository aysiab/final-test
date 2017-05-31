# server

library(ggplot2)
library(dplyr)

source("./script/alignment_vs_mortality.R")

marvel <- read.csv("data/marvel-wikia-data.csv")


shinyServer(function(input, output) {
  #Alignment vs Mortality 
  
})