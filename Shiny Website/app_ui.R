library(shiny)


intro <- tabPanel(
  "Page One",
  fluidPage(),
  sidebarLayout(
    sidebarPanel(h1("Heading")),
    mainPanel()
  )
)

interactive_one <- tabPanel(
  "Page Two",
  fluidPage(),
  sidebarLayout(
    sidebarPanel(h1("Heading")),
    mainPanel()
  )
)

interactive_two <- tabPanel(
  "Page Three",
  fluidPage(),
  sidebarLayout(
    sidebarPanel(h1("Heading")),
    mainPanel()
  )
)
interactive_three <- tabPanel(
  "Abortion Clinics x Percent Contraceptive",
  fluidPage("Total Abortion Clinics x Percent Contraceptive by Region", plotOutput("clin_con")),
  sidebarLayout(
    sidebarPanel(h1("Change the y Axis"),
    sliderInput("Slider", "Pick a Max y Value", min = 75, max = 100, value = 5),
    sliderInput("Slider", "Pick a Min y Value", min = 20, max = 60, value = 5)),
    mainPanel()
  )
)


summary <- tabPanel(
  "Page Five",
  fluidPage(),
  sidebarLayout(
    sidebarPanel(h1("Heading")),
    mainPanel()
  )
)
  

ui <- shinyUI(navbarPage(
  titlePanel("Womens Reproductive Resources"),
  includeCSS("style.css"),
  intro,
  interactive_one,
  interactive_two,
  interactive_three,
  summary
  
))
