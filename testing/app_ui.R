#load necessary libraries
library("ggplot2")

#side bar content
bar_sidebar_content <- sidebarPanel(
 checkboxGroupInput(
   inputId = "chart_regions",
   label = "Pick two geographic regions:",
   choices = list(
     "Midwest" = "Midwest",
     "Northwest" = "Northwest",
     "South" = "South",
     "West" = "West"                       #does this reference to the df?
   )
 )
)

#main panel content
bar_main_content <- mainPanel(
  plotOutput(
    outputId = "bar_graph")
)

#tabpanel for page with chart one
bar_panel <- tabPanel(
  title = "# Abortion Clinics/Region",
  titlePanel("Number of Abortion Clinics Per Region"),
  sidebarLayout(
    p("The bar graph compares different region's number of abortion clinics"),
    bar_sidebar_content,
    bar_main_content
  )
)

#save into ui variable
ui <- navbarPage(
  title = "Reproduction Rights",
  bar_panel
)