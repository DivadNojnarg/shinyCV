body <- dashboardBody(
  useShinyjs(),
  withMathJax(),
  useShinyFeedback(),

  tags$script(src = "https://cdn.rawgit.com/IonicaBizau/github-calendar/gh-pages/dist/github-calendar.min.js"),
  tags$link(rel = "stylesheet",
            href = "https://cdn.rawgit.com/IonicaBizau/github-calendar/gh-pages/dist/github-calendar.css"),

  tabItems(
    tabItem(
      tabName = "main",
      column(4, offset = 0, style = 'padding:0px;',
             profile_box(),
             about_box(),
             skills_box(),
             uiOutput("networkbox")
      ),
      column(8, offset = 0, style = 'padding:0px;',
             uiOutput("main_box")
      ),
      # add e new empty row to prevent previous boxes from being displayed out of
      # the dashboard footer
      fluidRow()
      #,
      # tabItem(
      #   tabName = "info",
      #   box(
      #     title = tagList(shiny::icon("info"), "Infos"), width = 12,
      #     collapsible = T, solidHeader = TRUE,
      #     p("In this app you can:"),
      #     tags$ol(tags$li(""),
      #             tags$li("Make a beautiful CV using adminLTE2"),
      #             tags$li("Export the result as a web page or pdf document")
      #     )
      #   )
      # )
    )
  )
)
