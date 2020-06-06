library("dplyr")
library("ggplot2")
library("gapminder")
library("plotly")
abortion_data <- read.csv("guttmacher_abortion_data.csv",
  stringsAsFactors = F
)
states_regions <- read.csv("states_regions.csv", stringsAsFactors = F)

# binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df <- joined_df[-c(52, 53, 54), ]
colnames(joined_df)
# grouping percent contraception and number of clinics based on region
percent_and_clinics <- joined_df %>%
  mutate(
    new_num_abortion_clinics =
      as.numeric(joined_df$Num_of_abortion_clinics_2017),
    percent_contraceptive =
      as.numeric(joined_df$X..of.women.aged.18.49.using.contraceptives..2017..1.)
  ) %>%
  group_by(Region) %>%
  summarize(
    total_abortion_clinics = sum(new_num_abortion_clinics, na.rm = T),
    percent_contraceptive =
      mean(percent_contraceptive, na.rm = T)
  )
# Bubble chart that plots the percent contraceptive use x Region. Size of
# bubbles are based on the Total Abortion clinics in each region.

chart3 <- function(df, max, min) {
  chart3 <- plot_ly(
    df,
    x = ~Region,
    y = ~percent_contraceptive,
    type = "scatter",
    mode = "markers",
    text = ~ paste(
      "Region: ", Region,
      "<br>Percent of Contraceptive Use:", round(percent_contraceptive, 3),
      "<br>Total Abortion Clinics:", total_abortion_clinics
    ),
    color = ~Region, size = ~total_abortion_clinics,
    sizes = c(20, 50),
    marker = list(sizemode = "diameter")
  )

  chart3 <- chart3 %>%
    layout(yaxis = list(range = c(min, max)))
  chart3 <- chart3 %>%
    layout(
      xaxis = list(title = "Region"),
      yaxis = list(title = "Percent Contraceptive"),
      title = "Total Abortion Clinics x Percent Contraceptive by Region"
    )
  return(chart3)
}
chart3(percent_and_clinics, 80, 60)
