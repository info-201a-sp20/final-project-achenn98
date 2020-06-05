library("dplyr")
library("ggplot2")
library("gapminder")
library("plotly")



source("app_ui.R")
source("app_server.R")
source("chart_three.R")
source("chart_two.R")




shinyApp(ui = ui, server = server)