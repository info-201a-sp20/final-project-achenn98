library("dplyr")
library("ggplot2")
abortion_data <- read.csv("data/guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("data/states_regions.csv", stringsAsFactors = F)
colnames(joined_df)
#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df <- joined_df[-c(52, 53, 54), ]

percent_and_clinics <- joined_df %>%
  mutate(new_num_abortion_clinics =
           as.numeric(joined_df$Num_of_abortion_clinics_2017),
         percent_contraceptive=
           as.numeric(joined_df$X..of.women.aged.18.49.using.contraceptives..2017..1.)) %>%
  group_by(Region) %>%
  summarize(total_abortion_clinics = sum(new_num_abortion_clinics, na.rm = T),
            percent_contraceptive =
              mean(percent_contraceptive, na.rm = T))

chart_3 <- function(df) {
  plot <- ggplot(data = df) +
    geom_point(mapping = aes(x = total_abortion_clinics, y = percent_contraceptive,
                             color = Region)) +
    labs(title = "Total Abortion Rates x Percent Contraceptive by Region",
         x = "Total Abortion Clinics",
         y = "Total Contraceptive")
  return(plot)
}
chart_3(percent_and_clinics)
