#load necessary libraries
library("shiny")
library("dplyr")
library("plotly")

#source files
source("app_ui.R")
source("chart_two.R")
source("chart_three.R")
source("Conclusion.R")

#read in csv files
abortion_data <- read.csv("guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("states_regions.csv", stringsAsFactors = F)

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df <-  joined_df[-c(52, 53, 54), ]

#grouping based on region
region_grouped <- joined_df %>%
  mutate(new_num_abortion_clinics =
           as.numeric(joined_df$Num_of_abortion_clinics_2017)) %>%
  group_by(Region) %>%
  summarise(total_abortion_clinics =
              sum(new_num_abortion_clinics, na.rm = T)) %>%
  filter(Region != "NA")

#bar graph 
bar_function <- function(df, input) {
  if (input == "Midwest") {
    input_color = list(color = c('rgba(222,45,38,0.8)', 'rgb(200,200,200)', 
                                 'rgb(200,200,200)', 'rgb(200,200,200)'))
  } else if (input == "Northeast") {
    input_color = list(color = c('rgb(200,200,200)', 'rgba(222,45,38,0.8)',
                                 'rgb(200,200,200)', 'rgb(200,200,200)'))
  } else if (input == "South") {
    input_color = list(color = c('rgb(200,200,200)', 'rgb(200,200,200)',
                                 'rgba(222,45,38,0.8)', 'rgb(200,200,200)'))
  } else {
    input_color = list(color = c('rgb(200,200,200)', 'rgb(200,200,200)',
                                 'rgb(200,200,200)', 'rgba(222,45,38,0.8)'))
  }
  
  graph <- plot_ly(data = region_grouped,
                   x = ~Region,
                   y = ~total_abortion_clinics,
                   marker = input_color,
                   type = 'bar',
                   text = paste("Number of Abortion Clinics: ",
                                region_grouped$total_abortion_clinics)) %>%
    layout(xaxis = list(title = "Region"),
           yaxis = list(title = "Number of Abortion Clinics"))
  return(graph)
}
#Server
server <- shinyServer(function(input, output){
  #Renders Chart 3 on interactive page 3
  output$clin_con <- renderPlotly({
    
    chart3 <- chart_3(percent_and_clinics, input$Max, input$Min)
    plot(chart3)
    
  })
  #Renders chart 2 on interactive page 2
  output$clin_rates <- renderPlotly({  #interactive graph 2, renders plot and adds interactive min/max y values 
    
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

