#load necessary libraries
library("dplyr")
library("ggplot2")
library("ggiraph")

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
bar_function <- function(df, input, y_chosen) {
  graph <- ggplot(data = df) +
    geom_col_interactive(mapping = aes(x = input,
                                       y = y_chosen)) +  
    labs(title = "Number Of Abortion Clinics Per Region",
         x = "Region",
         y = "Total Abortion Clinics")
  return(graph)
}

#define server
server <- function(input, output) {
  output$bar_graph <- renderPlot({
    bar <- bar_function(
      region_grouped,
      input$chart_regions,
      region_grouped %>%
        mutate(adjusted_abortion_clinics = total_abortion_clinics / 4) %>% #when graphed with original data, it's multiplied by 4
        filter(Region == input$chart_regions) %>%
        pull(adjusted_abortion_clinics)
      )
    return(bar)
  })
  
  output$info <- renderText({
    paste0(
      "Number of Abortion clinics: ",
      region_grouped %>%
        filter(Region == input$chart_regions) %>%
        pull(total_abortion_clinics)
    )
  })
}

