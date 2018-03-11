# Define UI
dashboardPage(
  skin = "black", title = "shinyCV",
  collapse_sidebar = TRUE, header, sidebar, body,
  footerOutput(outputId = "dynamicFooter"),
  div(id = "controlbar",
      dashboardControlbar()
  )
)
