# Character Gender vs Mortality Rate 

library(plotly)
library(dplyr)

# Uses bar graph to show the mortality rate between genders 
GenderMortality <- function(dataset) {
  all.data <- Gendertable(dataset) 
  colnames(all.data) <- c("YEAR","Male","Female")
  plot <- plot_ly(all.data, x = ~YEAR, y = ~Male, type = 'bar', name = 'Male') %>%
    add_trace(y = ~Female, name = 'Female') %>%
    layout(yaxis = list(title = 'Count'), barmode = 'group')
  return()
  }
  

Gendertable <- function(dataset) {
  # Alive characters
  male <- dataset %>%
    filter(SEX == "", is.na(YEAR) == FALSE) %>%
    group_by(YEAR) %>%
    summarise(freq = n())
  colnames(male) <- c("YEAR","Male")
  
  # Deceased characters
  female <- dataset %>%
    filter(SEX == "", is.na(YEAR) == FALSE) %>%
    group_by(YEAR) %>%
    summarise(freq = n())
  colnames(female) <- c("YEAR", "Female")
  
  all.data <- left_join(male, female, by = "YEAR")
  all.data[is.na(all.data)] <- 0
  colnames(all.data) <- c("Year", "Total Female Characters", "Total Male Characters")
  
  return(all.data)
}
  # select gender 
  # select mortality 
  