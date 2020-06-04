library(shiny)

source("app_ui.R")
source("chart_three.R")

server <- shinyServer(function(input, output){

  output$clin_con <- renderPlot({
    ggplot(percent_and_clinics, aes(x = Region,
                                    y = percent_contraceptive,
                                    size = total_abortion_clinics,
                                    color = Region)) +
      scale_size(range = c(6, 10), name = "Total Abortion Clinics") +
      coord_cartesian(ylim = c(60, 80)) +
      labs(title = "Total Abortion Clinics x Percent Contraceptive by Region",
           x = "Region",
           y = "Percent Contraceptive") 
  })
  
})
