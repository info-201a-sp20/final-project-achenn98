library("dplyr")
library("ggplot2")
library("plotly")
library("gapminder")
abortion_data <- read.csv("guttmacher_abortion_data.csv",
  stringsAsFactors = F
)
states_regions <- read.csv("states_regions.csv", stringsAsFactors = F)

# binding states dataframe with regions dataframe
joined_df <- full_join(abortion_data, states_regions)
joined_df <- joined_df[-c(52, 53, 54), ]

# grouping abortion rate and number of clinics based on region
abortion_rate_and_clinics <- joined_df %>%
  mutate(
    new_num_abortion_clinics =
      as.numeric(joined_df$Num_of_abortion_clinics_2017),
    new_abortion_rate =
      as.numeric(joined_df$Abortion.rate..the.no..of.abortions.per.1.000.women.aged.15.44...by.state.of.occurrence..2017)
  ) %>%
  group_by(Region) %>%
  summarize(
    total_abortion_clinics = sum(new_num_abortion_clinics, na.rm = T),
    total_abortion_rate =
      sum(new_abortion_rate, na.rm = T)
  )
# makes scatterplot interactive and render
scatterplot <- function(df, max, min) {
  chart2 <- plot_ly(
    df,
    x = ~total_abortion_clinics,
    y = ~total_abortion_rate,
    type = "scatter",
    mode = "markers",
    text = ~ paste(
      "Region:", Region,
      "<br>Total Abortion Clinics:", total_abortion_clinics,
      "<br> Total Abortion Rates:", total_abortion_rate
    ),
    color = ~Region, size = ~total_abortion_rate,
    sizes = c(20, 50),
    marker = list(sizemode = "diameter")
  )

  chart2 <- chart2 %>%
    layout(yaxis = list(range = c(min, max)))
  chart2 <- chart2 %>%
    layout(
      xaxis = list(title = "Total Abortion Clinics"),
      yaxis = list(title = "Total Abortion Rates "),
      title = "Total Abortion Clinics x Abortion Rates"
    )
  return(chart2)
}

scatterplot(abortion_rate_and_clinics, 80, 300)
