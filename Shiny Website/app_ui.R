library("shiny")


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
  "Abortion Clinics x Abortion Rates",
  fluidPage(h1("Total Abortion Clinics x Abortion Rates ")),
  sidebarLayout(
    sidebarPanel(h4("Zoom in or out on the Percent of abortion rate Axis")),
    mainPanel()
  )
)

interactive_three <- tabPanel(
  "Abortion Clinics x Contraceptives",
  fluidPage(h1("Total Abortion Clinics x Percent Contraceptive by Region")),
  sidebarLayout(
    sidebarPanel(h4("Zoom in or out on the Percent of Contraceptives Axis"),
    sliderInput(inputId = "Max", "Pick a Max y Value", min = 75, max = 115, value = 80),
    sliderInput(inputId = "Min", "Pick a Min y Value", min = 20, max = 60, value = 60)),
    mainPanel(
      plotlyOutput("clin_con"),
      tags$p(
      id = "graph_three_paragraph",
      "This bubble chart attempts to show the relationship, if any, between
      the number of abortion clinics in a region and the percentage of women
      aged 18 to 49 that use contraceptives. If there is a relationship then
      one could argue that abortion clincs being around might sway the number
      of women on contraceptives. As you can see this chart shows little to no
      correlation between the number of abortion clincs and the percentage of
      women on contraceptives. This implies that it doesn't matter if you have
      an easy option or not to abort, because either way most women are going to
      be on contraceptives."
    ))
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

