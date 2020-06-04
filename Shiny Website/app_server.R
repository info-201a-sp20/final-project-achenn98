library("shiny")

source("app_ui.R")
source("chart_three.R")


server <- shinyServer(function(input, output){
  
  output$clin_con <- renderPlot({

    ggplot(percent_and_clinics, aes(x = Region, y = percent_contraceptive,
                                   color = c("purple", "green", "blue", "red"))) +
    geom_point(stat = "identity") +
    coord_cartesian(ylim = c(60, 80))+
    ggtitle("Total Abortion Clinics x Percent Contraceptive by Region")
    
  })
  
})
  


