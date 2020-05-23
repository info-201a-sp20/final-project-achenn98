library("dplyr")
library("ggplot2")
library("lintr")
library("styler")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df <- joined_df[-c(52, 53, 54), ]
<<<<<<< HEAD

=======
 
#creates a table and mutate and summarizes new information 
>>>>>>> 9ced7a9d4fd02fa97f12312dafed1aa820fdc3a9
summary_table <- joined_df %>%
  mutate(Abortion_rate
        = as.numeric(joined_df$Abortion.rate..the.no..of.abortions.per.1.000.women.aged.15.44...by.state.of.occurrence..2017), 
        contraception_percent = as.numeric(joined_df$X..of.women.aged.18.49.using.contraceptives..2017..1., na.rm = T),
         Num_of_abortion_clinics_2017 = as.numeric(joined_df$Num_of_abortion_clinics_2017))%>%
  group_by(Region) %>%
  summarize(Abortion_rate = mean(Abortion_rate, na.rm = T), 
            contraception_percent = mean(contraception_percent, na.rm = T),
            Num_of_abortion_clinics_2017 = sum(Num_of_abortion_clinics_2017, na.rm = T))

