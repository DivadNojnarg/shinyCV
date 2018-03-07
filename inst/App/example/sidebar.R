sidebar <- dashboardSidebar(
  width = 300,

  sidebarMenu(

    id = "sidebar_main",

    menuItem("Interface", tabName = "interface", icon = icon("tv"),
             # these input are needed to use shinyWidgets in the rightsidebar
             selectInput(
               inputId = "fix1",
               label = "test",
               choices = NULL,
               selected = NULL,
               multiple = TRUE),

             # input to handle tabPanels in the main box
             prettySwitch(inputId = "academic_cv",
                          label = "Academic CV:",
                          slim = TRUE,
                          status = "success")
    ),
    menuItem("App", tabName = "main", icon = icon("home"), selected = TRUE)
  )
)
