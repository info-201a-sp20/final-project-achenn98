#Scatterplot of % of women on contraceptives VS 
## of abortion clincs grouped by region

#Loading Libraries

library(dplyr)
library(ggplot2)
library(gapminder)
library(plotly)

#Reading CSV's

Resources_csv <- read.csv('guttmacher_abortion_data.csv', 
                          stringsAsFactors = FALSE)
Region_csv <- read.csv('states_regions.csv', stringsAsFactors
                       = FALSE)

#Combinding the CSV's and moving data around

Region_csv <- select(Region_csv, State, Region)
Resources_csv <- select(Resources_csv, State, 
                        X..of.women.aged.18.49.using.contraceptives..2017..1.,
                        Num_of_abortion_clinics_2017)
Resources_Region_csv <- left_join(Resources_csv, 
                                  Region_csv, by = "State")
Resources_Region_csv <- head(Resources_Region_csv, -3)
Resources_Region_csv <- select(Resources_Region_csv,Region,
                          X..of.women.aged.18.49.using.contraceptives..2017..1.,
                          Num_of_abortion_clinics_2017)

#Making the number of clinics column numbers

num_clinics <- as.numeric(Resources_Region_csv$Num_of_abortion_clinics_2017)
Resources_Region_csv$num_clinics <- num_clinics

#Grouping

Number_Clinics <- Resources_Region_csv %>%
  group_by(Region) %>%
  summarise(Num_Clinics = sum(num_clinics))

#Making the % of contraceptives column numbers

Percentage_Contraceptives <- as.numeric(Resources_Region_csv$X..of.women.aged.18.49.using.contraceptives..2017..1.)
Resources_Region_csv$Percentage_Contraceptives <- Percentage_Contraceptives

#Grouping

Percentage_Contraceptives <- Resources_Region_csv %>%
  group_by(Region) %>%
  summarise(Percent_Contraceptive_Use = round(mean(Percentage_Contraceptives,
                                                   na.rm = TRUE)))

#Combinding Number_Clinics and Percentage_Contraceptives

Region_Contraceptives_Clinics <- left_join(Number_Clinics,
                                           Percentage_Contraceptives,
                                           by = "Region")

#Scatterplot Graphing Function

Percentage_Contraceptives_VS_Num_Clinics <- function(df){
  
  plot <- ggplot(data = df) + 
    geom_point(mapping = aes(x = Num_Clinics,
               y = Percent_Contraceptive_Use, color = Region),
              size = 5)+labs(title = 
              "% of Women Using Contraceptives vs Number of Abortion Clinics",
              x = "Number of Abortion Clincs",
              y = "% of Women Aged 18-49 Using Contraceptives") +
              coord_cartesian(ylim = c(60, 80))
  return(plot)
  
}
Percentage_Contraceptives_VS_Num_Clinics(Region_Contraceptives_Clinics)


Per_Con_VS_Num_CLIN <- ggplot(Region_Contraceptives_Clinics, aes(x = Region,
                                          y = Percent_Contraceptive_Use,
                                          size = Num_Clinics, color = Region)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(6, 10), name = "Number of Abortion Clinics")+
  labs(title = "% of Women Using Contraceptives vs Number of Abortion Clinics",
     x = "Number of Abortion Clincs",
      y = "% of Women Aged 18-49 Using Contraceptives") +
    coord_cartesian(ylim = c(60, 80))

ggplotly(Per_Con_VS_Num_CLIN) 
