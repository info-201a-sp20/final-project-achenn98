library("shiny")
source("chart_one.R")
#intro page
intro <- tabPanel(
  "Overview",
  fluidPage(
    h1("Reproductive Health and Resources"),
    strong("Purpose and Importance of the Project"),
    p("As a group, we believe that women should have reproductive rights. We
    think this would serve as an opportunity to delve into learning which
    reproductive resources are provided in the United States and the
    differences between in each geographic region. We also find it interesting
    how there are many different sub-categories that fall under reproductive
    health such as teen health, resources, infant health, abortion, etc."),
    strong("Origin of Sources"),
    p("The", a("Guttmacher Institute", href = "https://data.guttmacher.org/states/table?dataset=data&state=AL+AK+AZ+AR+CA+CO+CT+DE+DC+FL+GA+HI+ID+IL+IN+IA+KS+KY+LA+ME+MD+MA+MI+MN+MS+MO+MT+NE+NV+NH+NJ+NM+NY+NC+ND+OH+OK+OR+PA+RI+SC+SD+TN+TX+UT+VT+VA+WA+WV+WI+WY&topics=57+283+65"),
      " dataframe has information on number of abortions, number of abortion
  clinics, percent of women taking contraceptive, etc. The",
      a("Kaggle", href = "https://www.kaggle.com/omer2040/usa-states-to-region"),
      " dataframe labels each of the United States into the four
    different geographic regions. We then joined these dataframes to create
    our new dataset that's grouped by regions."),
    img("We support women's reproductive health!", src = "https://www.plannedparenthood.org/uploads/filer_public_thumbnails/filer_public/cb/c4/cbc45653-b657-4b15-97fd-490aeefcd262/damore_ppla_da_7867.jpg__1200x675_q75_crop_subsampling-2.jpg")
  )
)

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
  plotlyOutput(
    outputId = "bar_graph",
  )
)

#tabpanel for page with chart one
interactive_one <- tabPanel(
  title = "Abortion Clinics/Region",
  titlePanel("Number of Abortion Clinics Per Region"),
  sidebarLayout(
    bar_sidebar_content,
    bar_main_content
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
  #includeCSS("style.css"),
  intro,
  interactive_one,
  interactive_two,
  interactive_three,
  summary
  
))


