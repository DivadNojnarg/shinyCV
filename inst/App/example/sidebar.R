sidebar <- dashboardSidebar(
  width = 300,

  sidebarMenu(

    id = "sidebar_main",

    menuItem("Interface", tabName = "interface", icon = icon("tv"),
             # input to handle tabPanels in the main box
             prettySwitch(inputId = "academic_cv",
                          label = "Academic CV",
                          slim = TRUE,
                          status = "success"),
             # these input are also needed to use shinyWidgets in the rightsidebar
             selectInput(
               inputId = "academic_filter",
               label = "Filter academic panels",
               choices = c("teaching", "publications", "talks"),
               selected = NULL,
               multiple = TRUE),
             # enable network box or not
             prettySwitch(inputId = "enable_network_box",
                          label = "Network box",
                          value = TRUE,
                          slim = TRUE,
                          status = "success")
    ),
    menuItem("App", tabName = "main", icon = icon("home"), selected = TRUE)
  )
)
