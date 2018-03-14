# generate the main box
# 2 tabPanels if input$academic_cv == FALSE
# 6 tabPanels if input$academic_cv == TRUE
main_box <- function(cv_mode) {
  if (cv_mode == "full") {
    tabBox(
      id = "main_body", width = 12,
      tabPanel(
        title = HTML(paste0(icon("graduation-cap"), "Formation")),
        uiOutput("formation_timeline")
      ),
      tabPanel(
        title = HTML(paste0(icon("archive"), "Experience")),
        # wrap in fluidRow so that elements
        # are added by column
        fluidRow(uiOutput("experience"))
      ),
      tabPanel(
        title = HTML(paste0(icon("university"), "Teaching")),
        fluidRow(uiOutput("teaching_courses"), uiOutput("teaching_internships"))
      ),
      tabPanel(
        title = HTML(paste0(icon("pencil"), "Publications")),
        fluidRow(uiOutput("publications"))
      ),
      tabPanel(
        title = HTML(paste0(icon("microphone"), "Conferences/Talks")),
        uiOutput("talk_timeline")
      )
    )

  } else if (cv_mode == "basic") {
    tabBox(
      id = "main_body", width = 12,
      tabPanel(
        title = HTML(paste0(icon("graduation-cap"), "Formation")),
        uiOutput("formation_timeline")
      ),
      tabPanel(
        title = HTML(paste0(icon("archive"), "Experience")),
        # wrap in fluidRow so that elements
        # are added by column
        fluidRow(uiOutput("experience"))
      )
    )
  } else if (cv_mode == "academic") {
    tabBox(
      id = "main_body", width = 12,
      tabPanel(
        title = HTML(paste0(icon("graduation-cap"), "Formation")),
        uiOutput("formation_timeline")
      ),
      tabPanel(
        title = HTML(paste0(icon("archive"), "Experience")),
        # wrap in fluidRow so that elements
        # are added by column
        fluidRow(uiOutput("experience"))
      ),
      tabPanel(
        title = HTML(paste0(icon("university"), "Teaching")),
        fluidRow(uiOutput("teaching_courses"), uiOutput("teaching_internships"))
      ),
      tabPanel(
        title = HTML(paste0(icon("microphone"), "Conferences/Talks")),
        uiOutput("talk_timeline")
      )
    )
  } else if (cv_mode == "academic_light") {
    tabBox(
      id = "main_body", width = 12,
      tabPanel(
        title = HTML(paste0(icon("graduation-cap"), "Formation")),
        uiOutput("formation_timeline")
      ),
      tabPanel(
        title = HTML(paste0(icon("archive"), "Experience")),
        # wrap in fluidRow so that elements
        # are added by column
        fluidRow(uiOutput("experience"))
      ),
      tabPanel(
        title = HTML(paste0(icon("university"), "Teaching")),
        fluidRow(uiOutput("teaching_courses"), uiOutput("teaching_internships"))
      )
    )
  } else if (cv_mode == "research") {
    tabBox(
      id = "main_body", width = 12,
      tabPanel(
        title = HTML(paste0(icon("graduation-cap"), "Formation")),
        uiOutput("formation_timeline")
      ),
      tabPanel(
        title = HTML(paste0(icon("archive"), "Experience")),
        # wrap in fluidRow so that elements
        # are added by column
        fluidRow(uiOutput("experience"))
      ),
      tabPanel(
        title = HTML(paste0(icon("pencil"), "Publications")),
        fluidRow(uiOutput("publications"))
      ),
      tabPanel(
        title = HTML(paste0(icon("microphone"), "Conferences/Talks")),
        uiOutput("talk_timeline")
      )
    )
  }
}

