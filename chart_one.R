#set-up
library("dplyr")
library("leaflet")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv", stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

#bar graph shows the number of abortion clinics per region

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)

#grouping based on region
region_grouped <- joined_df %>%
  mutate(new_num_abortion_clinics = as.numeric(joined_df$Num_of_abortion_clinics_2017)) %>%
  group_by(Region) %>%
  summarise(total_abortion_clinics = sum(new_num_abortion_clinics, na.rm = T))

#bar graph
