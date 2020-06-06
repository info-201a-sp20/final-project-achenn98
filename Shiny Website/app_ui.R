# load necessary libraries
library("shiny")

# intro page
intro <-
  mainPanel(
    h1("Reproductive Health and Resources"),
    strong("Purpose and Importance of the Project"),
    p("As a group, we believe that women should have reproductive rights. We
      think this would serve as an opportunity to delve into learning which
      reproductive resources are provided in the United States and the
      differences between in each geographic region. We also find it
      interesting how there are many different sub-categories that fall under
      reproductive health such as teen health, resources, infant health,
      abortion, etc."),
    strong("Origin of Sources"),
    p(
      "The", a("Guttmacher Institute", href = "https://data.guttmacher.org/states/table?dataset=data&state=AL+AK+AZ+AR+CA+CO+CT+DE+DC+FL+GA+HI+ID+IL+IN+IA+KS+KY+LA+ME+MD+MA+MI+MN+MS+MO+MT+NE+NV+NH+NJ+NM+NY+NC+ND+OH+OK+OR+PA+RI+SC+SD+TN+TX+UT+VT+VA+WA+WV+WI+WY&topics=57+283+65"),
      " dataframe has information on number of abortions, number of abortion
      clinics, percent of women taking contraceptive, etc. The",
      a("Kaggle", href = "https://www.kaggle.com/omer2040/usa-states-to-region"),
      " dataframe labels each of the United States into the four
      different geographic regions. We then joined these dataframes to create
      our new dataset that's grouped by regions."
    ),
    img("We support women's reproductive health!", src = "https://www.plannedparenthood.org/uploads/filer_public_thumbnails/filer_public/cb/c4/cbc45653-b657-4b15-97fd-490aeefcd262/damore_ppla_da_7867.jpg__1200x675_q75_crop_subsampling-2.jpg")
  )
# Interactive page one
interactive_one <- sidebarLayout(
  sidebarPanel(
    h4("Choose which region you want to highlight"),
    selectInput(
      inputId = "chart_regions",
      label = "Pick a geographic region below:",
      choices = region_grouped$Region
    )
  ),
  mainPanel(
    h1("Number of Abortion Clinics Per Region"),
    plotlyOutput("bar_graph"),
    tags$p(
      id = "graph_two_paragraph",
      "This bar graph shows the number of abortion clinics in each region.
      It attempts to show the general differences while attempting to
      highlight specific regions upon user selection on the left. A bar graph
      is ideal because the numerical data points aren’t closely related. As
      shown, the West region has the most abortion clinics - more than 250,
      with the midwest region having the least - less than 100. When hovering
      with the cursor over each bar, the specific number of abortion clinics
      is displayed."
    )
  )
)

# Interactive page two
interactive_two <-
  sidebarLayout(# creates a side bar and provides a wdiget to adjust Y axis
    sidebarPanel(
      h4("Zoom in or out on the Abortion Rates Axis"),
      sliderInput(
        inputId = "Max_y", "Pick a Max y Value",
        min = 0, max = 300, value = 300
      ),
      sliderInput(
        inputId = "Min_y", "Pick a Min y Value",
        min = 0, max = 300, value = 100
      )
    ),
    mainPanel(
      h1("Abortion Clinics x Abortion Rates"), # page title
      plotlyOutput("clin_rates"), # ID
      tags$p(
        id = "graph_two_paragraph", # page paragraph definition
        "This point chart attempts to show the relationship between the total
         number of abortion clinics and the total abortion rate in each region.
         I used a scatterplot to show this correlation, however from the
         results it demostrates there is a small correlation between the two.
         However, the results disprove our hypothesis that the more
         amount of abortion clinics the more about of abortion rates. The
         graph displays (with one outlier) that the more abortion clinics
         the less total abortion rates in that region. This implies that
         less people need abortions in regions that have more abortion
         clinics available. This could be due to the fact that abortion
         clinics also provide other health care resources such as
         contraceptive, family planning, Plan B, health education and more,
         which can decrease the need for an unwanted pregnancy
         and therefore lessens the need for an abortion. "
      )
    )
  )

# Interactive page three
interactive_three <-
  sidebarLayout(
    sidebarPanel(
      h4("Zoom in or out on the Percent of Contraceptives Axis"),
      sliderInput(
        inputId = "Max", "Pick a Max y Value",
        min = 75, max = 115, value = 80
      ),
      sliderInput(
        inputId = "Min", "Pick a Min y Value",
        min = 20, max = 60, value = 60
      )
    ),
    mainPanel(
      h1("Abortion Clinics x Contraceptives"),
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
      an easy option or not to abort, because either way most women are going
      to be on contraceptives."
      )
    )
  )

# Conclusion Page
summary <- mainPanel(
  h1("Summary Information and Data"),
  h3("Takeaway #1"),
  h4("Table"),
  tableOutput("table_1"),
  h4("Explanation"),
  tags$p(
    id = "Expanation_1",
    "When looking at the total number of abortion clinics
                throughout the four different regions of the United States we
                found that the West had the most recorded number of
                clinics - 277 clinics - and the least being the Midwest - 91
                clinics. We can see that the West had over three times the
                number of abortion clinics compared to Midwest. This could
                imply that there's a lower need for demand in the Midwest than
                in the other regions, hence the lower number of clinics.
                Higher population regions such as the West and Northeast
                may have more clinics to serve more people. Beliefs and feeling
                towards abortion in specific regions may also be a large
                contributor to the significant difference in how many clinics
                that are opened."
  ),
  h3("Takeaway #2"),
  h4("Table"),
  tableOutput("table_clin_rates"),
  h4("Explanation"),
  tags$p(
    id = "Explanation_2",
    "As we took a look at the total number of abortion clinics to
                the total abortion rate in each of the four regions we found
                that there was no clear correlations in the data. While the
                West had the most number of abortion clinics, it had the 2nd
                lowest abortion rate. However the South, which had the 2nd
                least number of clinics, surprisingly had the highest recorded
                abortion rates. Meanwhile the Midwest had the lowest number
                of abortion clinics and rates. These insights inform us that
                the abortion rate can vary region to region regardless of the
                number of clinics provided."
  ),
  h3("Takeaway #3"),
  h4("Table"),
  tableOutput("table_clin_con"),
  h4("Explanation"),
  tags$p(
    id = "Explanation_3",
    "As we pulled and analyzed the information on the total
                abortion clinics and the percentage of contraceptive usage
                in each region, we found that data for contraceptive was fairly
                the same falling within the bracket of 71.86% - 68.68 %. This
                is very interesting to observe as that tells us the rate of
                contraceptive usage isn't directly impacted by the total number
                of clinics provided in the region."
  )
)


# UI
ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "Womens Reproductive Resources",
    tabPanel("Overview", intro),
    tabPanel("Abortion Clinics/Region", interactive_one),
    tabPanel("Abortion Clinics x Abortion Rates", interactive_two),
    tabPanel("Abortion Clinics x Contraceptives", interactive_three),
    tabPanel("Summary Information", summary)
  )
)
