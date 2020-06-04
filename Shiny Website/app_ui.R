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
  "Page Four",
  fluidPage(),
  sidebarLayout(
    sidebarPanel(h1("Heading")),
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
  intro,
  interactive_one,
  interactive_two,
  interactive_three,
  summary
  
))
