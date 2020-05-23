#Summary Info 
library("dplyr")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv", stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df<-  joined_df[-c(52, 53, 54),]  #delete last columns
joined_df <- joined_df %>%   #rename
  rename(
    Abortion_rate_2017 = Abortion.rate..the.no..of.abortions.per.1.000.women.aged.15.44...by.state.of.occurrence..2017
  )
colnames(joined_df)
  max_clinic_region <- joined_df%>%
  filter(Num_of_abortion_clinics_2017 == max(Num_of_abortion_clinics_2017)) %>%
  pull(Region)

max_clinic_state <- joined_df%>%
  filter(Num_of_abortion_clinics_2017 == max(Num_of_abortion_clinics_2017)) %>%
  pull(State)
  
max_clinic_num <- joined_df%>%
  filter(Num_of_abortion_clinics_2017 == max(Num_of_abortion_clinics_2017)) %>%
  pull(Num_of_abortion_clinics_2017)

max_rate_state <- joined_df%>%
  filter(Abortion_rate_2017 == max(Abortion_rate_2017)) %>%
  pull(State)

max_rate_region <- joined_df%>%
  filter(Abortion_rate_2017 == max(Abortion_rate_2017)) %>%
  pull(Region) 

max_rate_num <- joined_df%>%
  filter(Abortion_rate_2017 == max(Abortion_rate_2017)) %>%
  pull(Abortion_rate_2017) 
View(joined_df)
