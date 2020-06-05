#load necessary libraries
library("dplyr")
<<<<<<< HEAD
library("plotly")
=======
library("ggplot2")
<<<<<<< HEAD
#library("ggiraph")
library("shiny")
=======
#library("ggiraph") #download ggiraph package before running
>>>>>>> 4ac6e9c9f8583585db8076505bf5f0ebf0f0fdbc
>>>>>>> 097e79c8e7a4fd97e885ffe47df425c239ccd199

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

#graph 
<<<<<<< HEAD
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
    layout(title = "Number Of Abortion Clinics Per Region",
         xaxis = list("Region"),
         yaxis = list("Total Abortion Clinics"))
=======
bar_function <- function(df, input, y_chosen) {
  graph <- ggplot(data = df) +
<<<<<<< HEAD
    geom_col(mapping = aes(x = input,
                                       y = y_chosen)) +  
=======
    geom_col(mapping = aes(x = input, y = y_chosen)) +  
>>>>>>> 4ac6e9c9f8583585db8076505bf5f0ebf0f0fdbc
    labs(title = "Number Of Abortion Clinics Per Region",
         x = "Region",
         y = "Total Abortion Clinics")
>>>>>>> 097e79c8e7a4fd97e885ffe47df425c239ccd199
  return(graph)
}

#define server
server <- function(input, output) {
  output$bar_graph <- renderPlotly({
    bar <- bar_function(
      region_grouped,
<<<<<<< HEAD
      input$chart_regions
      )
=======
      input$chart_regions,
      region_grouped %>%
        #when graphed with original data, it's multiplied by 4
        mutate(adjusted_abortion_clinics = total_abortion_clinics / 4) %>%
        filter(Region == input$chart_regions) %>%
        pull(adjusted_abortion_clinics)
    )
>>>>>>> 097e79c8e7a4fd97e885ffe47df425c239ccd199
    return(bar)
  })
}

