main_box <- function() {
  tabBox(id = "main_body", width = 12,
         tabPanel(title = "Formation",

                  timelineBox(

                    timelineLabel(
                      text = HTML("<b>&nbsp;2016-07-02&nbsp;</b>"), color = "purple"
                    ),

                    timelineItem(
                      icon = shiny::icon("github bg-purple"),
                      header = HTML('<strong><a href="#">Guang Yang</strong>'),
                      body = "Git push ygdashboard and ygdashboard/app.",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-07-02 05:14:22"
                    ),

                    timelineLabel(
                      text = HTML("<b>&nbsp;2016-06-26&nbsp;</b>"), color = "red"
                    ),

                    timelineItem(
                      icon = shiny::icon("code bg-red"),
                      header = HTML('<strong><a href="#">Guang Yang</strong>'),
                      body = "Fix sidebarUserPanel background conflict with leaflet
                      in ygdashboard (shinydashboard).",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-06-26 23:22:48"
                    ),

                    timelineItem(
                      icon = shiny::icon("envelope bg-red"),
                      header = HTML('<strong><a href="#">Ex Machina</strong>'),
                      body = "Request on adding chatBox - I would like to chat!",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-06-23 17:22:54"
                    ),

                    timelineLabel(
                      text = HTML("<b>&nbsp;2016-06-22&nbsp;</b>"), color = "yellow"),

                    timelineItem(
                      icon = shiny::icon("file-text bg-yellow"),
                      header = HTML('<strong><a href="#">Guang Yang</strong>'),
                      body = "Create a template dashboard using ygdashboard in ygdashboard/app",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-06-22 05:22:14"
                    ),

                    timelineItem(
                      icon = shiny::icon("code bg-yellow"),
                      header = HTML('<strong><a href="#">Guang Yang</strong>'),
                      body = "Add dashboardUser, dashboardFooter and dashboardControlbar in ygdashboard.",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-06-22 14:23:46"
                    ),

                    timelineItem(
                      icon = shiny::icon("cloud bg-yellow"),
                      header = HTML('<strong><a href="#">Guang Yang</strong>'),
                      body = "Request on an user info panel on header.",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-06-22 04:22:54"
                    ),

                    timelineLabel(
                      text = HTML("<b>&nbsp;2016-06-16&nbsp;</b>"), color = "green"
                    ),

                    timelineItem(
                      icon = shiny::icon("code bg-green"),
                      header = HTML('<strong><a href="#">Guang Yang</strong>'),
                      body = "Create ygdashboard with modifying shinydashboard source
                      code so that a collapse sidebar showing menuItem icons
                      when collapsed.",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-06-16 17:23:46"
                    ),

                    timelineItem(
                      icon = shiny::icon("cloud bg-green"),
                      header = HTML('<strong><a href="#">Guang Yang</strong>'),
                      body = "Request on a collapse sidebar showing menuItem icons
                      when collapsed.",
                      footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                                    '<a class="btn btn-danger btn-xs">Delete</a>'),
                      itemText = "2016-06-16 14:22:54"
                    )
                  )
         ),
         tabPanel(title = "Experience"

         ),
         tabPanel(title = "Teaching"

         )
  )
}
