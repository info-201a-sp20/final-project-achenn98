library("shiny")
source("app_ui.R")
source("chart_two.R")
source("chart_three.R")
source("Conclusion.R")



server <- shinyServer(function(input, output){
  
  output$clin_con <- renderPlotly({
    
    chart3 <- chart_3(percent_and_clinics, input$Max, input$Min)
    plot(chart3)
    
  })
  output$clin_rates <- renderPlotly({
    
    chart2 <- scatterplot(abortion_rate_and_clinics, input$Max_y, input$Min_y)
    plot(chart2)
    
  })
  
  output$table_clin_con <- renderTable({
    
    mutate(percent_and_clinics)
    
  })
  
  output$table_clin_rates <- renderTable({
    
   clin_rate
    
  })
  
  output$table_1 <- renderTable({
    
    table_1
    
  })
  
})

