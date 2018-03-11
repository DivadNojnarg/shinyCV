header <- dashboardHeader(
  title = HTML(paste0(
    '<span class = "logo-lg">shinyCV</span>',
    '<img src= "curriculum-vitae.svg">'
  )),

  titleWidth = 300,

  tags$li(
    class = "dropdown",
    actionBttn(inputId = "save", label = "Save", icon = icon("save"),
               style = "fill", color = "royal")
  )

  # tags$li(
  #   class = "dropdown",
  #   tags$a(class = "btn btn-xs btn-app", tags$i(class = "fa fa-save"), "save")
  # )

)
