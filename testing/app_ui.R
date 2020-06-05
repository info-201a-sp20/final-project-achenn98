#load necessary libraries
library("ggplot2")

#intro
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
<<<<<<< HEAD
    )
=======
    hover = region_grouped$total_abortion_clinics
  ),
  verbatimTextOutput(
    outputId = "info"
  )
>>>>>>> 097e79c8e7a4fd97e885ffe47df425c239ccd199
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

#save into ui variable
ui <- navbarPage(
  title = "Reproduction Rights",
<<<<<<< HEAD
  intro,
  interactive_one
)
=======
  bar_panel
)

>>>>>>> 097e79c8e7a4fd97e885ffe47df425c239ccd199
