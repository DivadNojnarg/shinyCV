body <- dashboardBody(

  tags$script(src = "https://cdn.rawgit.com/IonicaBizau/github-calendar/gh-pages/dist/github-calendar.min.js"),
  tags$link(rel = "stylesheet",
            href = "https://cdn.rawgit.com/IonicaBizau/github-calendar/gh-pages/dist/github-calendar.css"),

  tabItems(
    tabItem(
      tabName = "main",
      column(4, offset = 0, style = 'padding:0px;',
             uiOutput("profilebox"),
             uiOutput("aboutbox"),
             uiOutput("skillsbox"),
             uiOutput("networkbox")
      ),
      column(8, offset = 0, style = 'padding:0px;', uiOutput("main_box")),
      # add e new empty row to prevent previous boxes from being displayed out of
      # the dashboard footer
      fluidRow()
    )
  )
)
