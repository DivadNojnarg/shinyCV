main_box <- function(input) {
  if (input$academic_cv == TRUE) {
    tabBox(id = "main_body", width = 12,
           tabPanel(title = HTML(paste0(icon("graduation-cap"), "Formation")),
                    uiOutput("formation_timeline")
           ),
           tabPanel(title = HTML(paste0(icon("archive"), "Experience")),
                    uiOutput("experience")
           ),
           tabPanel(
             title = HTML(paste0(icon("university"), "Teaching"))
           ),
           tabPanel(
             title = HTML(paste0(icon("pencil"), "Publications"))
           ),
           tabPanel(
             title = HTML(paste0(icon("microphone"), "Conferences/Talks"))
           ),
           tabPanel(title = HTML(paste0(icon("trophy"), "Awards"))
           )
    )
  } else {
    tabBox(id = "main_body", width = 12,
           tabPanel(title = HTML(paste0(icon("graduation-cap"), "Formation")),
                    uiOutput("formation_timeline")
           ),
           tabPanel(title = HTML(paste0(icon("archive"), "Experience")),
                    uiOutput("experience")
           )
    )
  }
}

