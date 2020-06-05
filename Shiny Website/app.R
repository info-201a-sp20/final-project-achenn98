#load libraries 
library("shiny")
library("dplyr")
library("ggplot2")
library("gapminder")
library("plotly")
library("tidyverse")
library("kableExtra")
library("pixiedust")

#sources file
source("app_ui.R")
source("app_server.R")
source("chart_three.R")
source("chart_two.R")
source("bar_graph.R")



#called shiny ui and server
shinyApp(ui = ui, server = server)