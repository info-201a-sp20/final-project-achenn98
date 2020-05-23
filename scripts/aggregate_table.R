#Aggregate Table
library("dplyr")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv", stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)