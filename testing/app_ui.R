#load necessary libraries
library("ggplot2")

#side bar content
bar_sidebar_content <- sidebarPanel(
 selectInput(
   inputId = "chart_regions",
   label = "Pick a geographic region:",
   choices = region_grouped$Region                  
   )
)

#main panel content
bar_main_content <- mainPanel(
  p("The bar graph shows the number of abortion clinics in each region.",
    "This is helpful to check or verify this resource in the selected region."),
  plotOutput(
    outputId = "bar_graph",
    hover = region_grouped$total_abortion_clinics
    ),
  verbatimTextOutput(
    outputId = "info"
  )
)

#tabpanel for page with chart one
bar_panel <- tabPanel(
  title = "# Abortion Clinics/Region",
  titlePanel("Number of Abortion Clinics Per Region"),
  sidebarLayout(
    bar_sidebar_content,
    bar_main_content
  )
)

#save into ui variable
ui <- navbarPage(
  title = "Reproduction Rights",
  bar_panel
)