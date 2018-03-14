body <- dashboardBody(

  # some script for the github part
  tags$script(src = "https://cdn.rawgit.com/IonicaBizau/github-calendar/gh-pages/dist/github-calendar.min.js"),
  tags$link(rel = "stylesheet",
            href = "https://cdn.rawgit.com/IonicaBizau/github-calendar/gh-pages/dist/github-calendar.css"),

  # Display all the boxes
  column(3, offset = 0, style = 'padding:0px;',
         uiOutput("profilebox"),
         uiOutput("aboutbox")
  ),
  column(6, offset = 0, style = 'padding:0px;', uiOutput("main_box")),
  column(3, offset = 0, style = 'padding:0px;',
         uiOutput("skillsbox"),
         uiOutput("networkbox")
  ),
  # add e new empty row to prevent previous boxes from being displayed out of
  # the dashboard footer
  fluidRow()
)
