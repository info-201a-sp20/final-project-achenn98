library("shiny")

source("app_ui.R")
source("chart_three.R")


server <- shinyServer(function(input, output){
  
  output$clin_con <- renderPlotly({
    
    chart3 <- chart_3(percent_and_clinics, input$Max, input$Min)
    plot(chart3)
    
  })
  
})
  


