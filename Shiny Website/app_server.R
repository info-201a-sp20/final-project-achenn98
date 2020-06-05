#load necessary libraries
library("shiny")
library("dplyr")
library("plotly")

#source files
source("app_ui.R")
source("chart_two.R")
source("chart_three.R")
source("Conclusion.R")
source("bar_graph.R")

#Server
server <- shinyServer(function(input, output) {
  #Renders Chart 3 on interactive page 3
  output$clin_con <- renderPlotly({
    chart3 <- chart_3(percent_and_clinics, input$Max, input$Min)
    plot(chart3)
  })

  #Renders chart 2 on interactive page 2
  output$clin_rates <- renderPlotly({
    chart2 <- scatterplot(abortion_rate_and_clinics, input$Max_y, input$Min_y)
    plot(chart2)   #displays graph
  })

  #Renders chart 1 on interactive page 1
  output$bar_graph <- renderPlotly({
    bar <- bar_function(
      region_grouped,
      input$chart_regions
    )
    return(bar)
  })

  #Renders table 3 on Conclusion page
  output$table_clin_con <- renderTable({
    clin_con
  })

  #Renders table 2 on Conclusion page
  output$table_clin_rates <- renderTable({
   clin_rate
  })

  #Renders table 1 on Conclusion page
  output$table_1 <- renderTable({
    table_1
  })
})