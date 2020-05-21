#set-up
library("dplyr")
library("leaflet")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv", stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

#density map that shows the number of abortion clinics per region

#binding states dataframe with regions dataframe
region_grouped <- full_join(abortion_data, states_regions)
