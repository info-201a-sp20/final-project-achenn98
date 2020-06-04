library(dplyr)
library(ggplot2)
library(gapminder)
library(plotly)

source("app_ui.R")
source("app_server.R")
source("Char_Three.R")



shinyApp(ui = ui, server = server)