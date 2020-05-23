library("dplyr")
library("ggplot2")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df <- joined_df[-c(52, 53, 54), ]

min_region_clinics <- joined_df %>%
  mutate(Num_of_abortion_clinics_2017 = as.numeric(joined_df$Num_of_abortion_clinics_2017))%>%
  group_by(Region)%>%
  summarize(Num_of_abortion_clinics_2017 = sum(Num_of_abortion_clinics_2017, na.rm = T))%>%
  filter(Num_of_abortion_clinics_2017 == min(Num_of_abortion_clinics_2017))%>%
  pull(Region)

min_num_region_clinics <- joined_df %>%
  mutate(Num_of_abortion_clinics_2017 = as.numeric(joined_df$Num_of_abortion_clinics_2017))%>%
  group_by(Region)%>%
  summarize(Num_of_abortion_clinics_2017 = sum(Num_of_abortion_clinics_2017, na.rm = T))%>%
  filter(Num_of_abortion_clinics_2017 == min(Num_of_abortion_clinics_2017))%>%
  pull(Num_of_abortion_clinics_2017)

max_num_region_clinics <- joined_df %>%
  mutate(Num_of_abortion_clinics_2017 = as.numeric(joined_df$Num_of_abortion_clinics_2017))%>%
  group_by(Region)%>%
  summarize(Num_of_abortion_clinics_2017 = sum(Num_of_abortion_clinics_2017, na.rm = T))%>%
  filter(Num_of_abortion_clinics_2017 == max(Num_of_abortion_clinics_2017))%>%
  pull(Num_of_abortion_clinics_2017)

max_region_clinics <- joined_df %>%
  mutate(Num_of_abortion_clinics_2017 = as.numeric(joined_df$Num_of_abortion_clinics_2017))%>%
  group_by(Region)%>%
  summarize(Num_of_abortion_clinics_2017 = sum(Num_of_abortion_clinics_2017, na.rm = T))%>%
  filter(Num_of_abortion_clinics_2017 == max(Num_of_abortion_clinics_2017))%>%
  pull(Region)

percentage_max <- joined_df %>%
  mutate( percent_contraceptive =
           as.numeric(joined_df$X..of.women.aged.18.49.using.contraceptives..2017..1.)) %>%
  group_by(Region) %>%
  summarize( percent_contraceptive =
              mean(percent_contraceptive, na.rm = T))%>%
  filter(percent_contraceptive == max(percent_contraceptive))%>%
pull(percent_contraceptive)

percentage_min <- joined_df %>%
  mutate( percent_contraceptive =
            as.numeric(joined_df$X..of.women.aged.18.49.using.contraceptives..2017..1.)) %>%
  group_by(Region) %>%
  summarize( percent_contraceptive =
               mean(percent_contraceptive, na.rm = T))%>%
  filter(percent_contraceptive == min(percent_contraceptive))%>%
  pull(percent_contraceptive)



