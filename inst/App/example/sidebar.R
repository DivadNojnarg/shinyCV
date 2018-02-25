sidebar <- dashboardSidebar(
  width = 300,

  sidebarMenu(

    id = "sidebar_main",

    menuItem("Info", tabName = "info", icon = icon("info")),
    menuItem("App", tabName = "main", icon = icon("home"), selected = TRUE)
  )
)
