#load necessary libraries
library("shiny")

#source files
source("app_ui.R")
source("app_server.R")

#create shiny app with ui and server variables
shinyApp(ui = ui, server = server)