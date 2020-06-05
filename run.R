library("dplyr")
library("ggplot2")
library("gapminder")
library("plotly")


source("H_app_ui.R")
source("H_app_server.R")
source("chart_three.R")
source("chart_two.R")




shinyApp(ui = ui, server = server)