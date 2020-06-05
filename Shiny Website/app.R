library("shiny")
library("dplyr")
library("ggplot2")
library("gapminder")
library("plotly")


source("app_ui.R")
source("app_server.R")
source("chart_three.R")
source("chart_two.R")
source("chart_one.R")




shinyApp(ui = ui, server = server)