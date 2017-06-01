# Character Gender vs Mortality Rate 

library(plotly)
library(dplyr)

# Uses pie graph to show the mortality rate between genders 
GenderMortality <- function(dataset) {
  print("Kyle sucks")
  p <- dataset %>%
  group_by(ALIVE) %>%
  summarize(count = n()) %>%
  plot_ly(labels = ~ALIVE, values = ~count) %>%
  add_pie(hole = 0.6) %>%
  layout(title = "Donut charts using Plotly",  showlegend = F,
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
}


