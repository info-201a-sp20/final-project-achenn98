#set-up
library("dplyr")
library("ggplot2")
abortion_data <- read.csv("guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("states_regions.csv", stringsAsFactors = F)

#bar graph shows the number of abortion clinics per region

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
abortion_clinics_per_region <- function(df) {
  graph <-   ggplot(data = df) +
    geom_col(mapping = aes(x = Region, y = total_abortion_clinics)) +
    labs(title = "Number Of Abortion Clinics Per Region",
         x = "Region",
         y = "Total Abortion Clinics")
  return(graph)
}
