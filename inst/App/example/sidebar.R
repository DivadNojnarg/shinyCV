sidebar <- dashboardSidebar(
  width = 300,

  sidebarMenu(

    id = "sidebar_main",

    menuItem("Info", tabName = "info", icon = icon("info"),
             # these input are needed to use shinyWidgets in the rightsidebar
             selectInput(
               inputId = "fix1",
               label = "test",
               choices = NULL,
               selected = NULL,
               multiple = TRUE),
             materialSwitch(inputId = "somevalue", label = "")
    ),
    menuItem("App", tabName = "main", icon = icon("home"), selected = TRUE)
  )
)
