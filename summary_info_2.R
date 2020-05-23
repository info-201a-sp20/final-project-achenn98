library("dplyr")
library("ggplot2")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df <- joined_df[-c(52, 53, 54), ]
