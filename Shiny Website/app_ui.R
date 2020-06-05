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
    sidebarPanel(h4("Zoom in or out on the Abortion Rates Axis"),
                 sliderInput(inputId = "Max_y", "Pick a Max y Value", min = 0, max = 300, value = 300),
                 sliderInput(inputId = "Min_y", "Pick a Min y Value", min = 0, max = 300, value = 100)),
    mainPanel(
       plotlyOutput("clin_rates"),
       tags$p(
         id = "graph_two_paragraph",
         "This point chart attempts to show the relationship between the total number of 
         abortion clinics and the total abortion rate in each region. I used a scatterplot
         to show this correlation, however from the results it demostrates there is a small
         correlation between the two. However, the results disprove our hypothesis that the more 
         amount of abortion clinics the more about of abortion rates. The graph displays
         (with one outlier) that the more abortion clinics the less total abortion rates in that region.
         This implies that less people need abortions in regions that have more abortion clinics available.
         This could be due to the fact that abortion clinics also provide other
         health care resources such as contraceptive, family planning, Plan B,
         health education and more, which can decrease the need for an unwanted pregnancy 
         and therefore lessens the need for an abortion. "
         ))
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
  "Summary",
  fluidPage(),
  sidebarLayout(
    sidebarPanel(p("Guys I have no idea what to put in this side bar. :/ ")),
    mainPanel(h4("Takeaway #1"),
              h5("Table"),
              tableOutput("table_1"),
              h5("Explanation"),
              h4("Takeaway #2"),
              h5("Table"),
              tableOutput("table_clin_rates"),
              h5("Explanation"),
              h4("Takeaway #3"),
              h5("Table"),
              tableOutput("table_clin_con"),
              h5("Explanation"))
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


