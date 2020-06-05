library("dplyr")
library("knitr")

abortion_data <- read.csv("guttmacher_abortion_data.csv", 
                          stringsAsFactors = F)
regions <- read.csv("states_regions.csv",
                    stringsAsFactors = F)

#Code for Table for graph 3

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, regions)
joined_df <- joined_df[-c(52, 53, 54), ]
colnames(joined_df)
#grouping percent contraception and number of clinics based on region
percent_and_clinics <- joined_df %>%
  mutate(new_num_abortion_clinics =
           as.numeric(joined_df$Num_of_abortion_clinics_2017),
         percent_contraceptive=
           as.numeric(joined_df$X..of.women.aged.18.49.using.contraceptives..2017..1.)) %>%
  group_by(Region) %>%
  summarize(total_abortion_clinics = sum(new_num_abortion_clinics, na.rm = T),
            percent_contraceptive =
              mean(percent_contraceptive, na.rm = T))
#Making Table
 mutate(percent_and_clinics)

#Code for Table 2
#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, regions)
joined_df <- joined_df[-c(52, 53, 54), ]

#grouping abortion rate and number of clinics based on region
abortion_rate_and_clinics <- joined_df %>%
  mutate(new_num_abortion_clinics =
           as.numeric(joined_df$Num_of_abortion_clinics_2017),
         new_abortion_rate =
           as.numeric(joined_df$Abortion.rate..the.no..of.abortions.per.1.000.women.aged.15.44...by.state.of.occurrence..2017)) %>%
  group_by(Region) %>%
  summarize(total_abortion_clinics = sum(new_num_abortion_clinics, na.rm = T),
            total_abortion_rate =
              sum(new_abortion_rate, na.rm = T))
#Making Table
clin_rate <- mutate(abortion_rate_and_clinics)


#Code for Table 1
#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, regions)
joined_df <-  joined_df[-c(52, 53, 54), ]

#grouping based on region
region_grouped <- joined_df %>%
  mutate(new_num_abortion_clinics =
           as.numeric(joined_df$Num_of_abortion_clinics_2017)) %>%
  group_by(Region) %>%
  summarise(total_abortion_clinics =
              sum(new_num_abortion_clinics, na.rm = T)) %>%
  filter(Region != "NA")
#Making Table
 table_1 <- mutate(region_grouped)
 
 