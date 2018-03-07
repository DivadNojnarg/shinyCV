# generate the main box
# 2 tabPanels if input$academic_cv == FALSE
# 6 tabPanels if input$academic_cv == TRUE
main_box <- function(input) {
  if (input$academic_cv == TRUE) {
    tabBox(id = "main_body", width = 12,
           tabPanel(title = HTML(paste0(icon("graduation-cap"), "Formation")),
                    uiOutput("formation_timeline")
           ),
           tabPanel(title = HTML(paste0(icon("archive"), "Experience")),
                    # wrap in fluidRow so that elements
                    # are added by column
                    fluidRow(uiOutput("experience"))
           ),
           tabPanel(
             title = HTML(paste0(icon("university"), "Teaching"))
           ),
           tabPanel(
             title = HTML(paste0(icon("pencil"), "Publications")),
             fluidRow(uiOutput("publications"))
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
                    # wrap in fluidRow so that elements
                    # are added by column
                    fluidRow(uiOutput("experience"))
           )
    )
  }
}

