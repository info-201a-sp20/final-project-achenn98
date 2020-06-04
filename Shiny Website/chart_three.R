library("dplyr")
library("ggplot2")
library("gapminder")
library("plotly")
abortion_data <- read.csv("guttmacher_abortion_data.csv",
                          stringsAsFactors = F)
states_regions <- read.csv("states_regions.csv", stringsAsFactors = F)

#binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
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

chart_3 <- function(df) { #plots the chart and titles, x and y axis label
  plot <- ggplot(data = df) +
    geom_point(mapping = aes(x = Region,
                             y = percent_contraceptive,
                             size = total_abortion_clinics, color = Region)) +
    labs(title = "Total Abortion Clinics x Percent Contraceptive by Region",
         x = "Region",
         y = "Percent Contraceptive") +
    scale_size(range = c(6, 10), name = "Total Abortion Clinics") +
    coord_cartesian(ylim = c(60, 80))
  plot <- ggplotly(plot) 
  return(plot)
}
chart_3(percent_and_clinics)

