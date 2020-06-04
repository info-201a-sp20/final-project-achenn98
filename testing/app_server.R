#load necessary libraries
library("dplyr")
library("ggplot2")

#read in csv files
abortion_data <- read.csv("data/guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

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
#need to add hover information 
bar_function <- function(df, input) {
  graph <- ggplot(data = df) +
    geom_col(mapping = aes(x = input, y = total_abortion_clinics)) + #chart_region selected results are in a list, 
    labs(title = "Number Of Abortion Clinics Per Region",            #would it work as an input for x?
         x = "Region",
         y = "Total Abortion Clinics")
  return(graph)
}

#define server
server <- function(input, output) {
  output$bar_graph <- renderPlot({
    bar <- bar_function(region_grouped, input$chart_regions) 
    return(bar)
  })
}

