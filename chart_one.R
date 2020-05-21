#set-up
library("dplyr")
library("leaflet")
abortion_data <- read.csv("testing/states_regions.csv", stringsAsFactors = F)
wstates_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

#density map that shows the number of abortion clinics per region

#binding states dataframe with regions dataframe
region_grouped <- full_join(abortion_data, states_regions,
                            by = c("State" = "state_name"))
