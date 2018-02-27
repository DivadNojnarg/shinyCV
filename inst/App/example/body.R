body <- dashboardBody(
  useShinyjs(),
  withMathJax(),
  useShinyFeedback(),

  tabItems(
    tabItem(
      tabName = "main",
      column(4, offset = 0, style = 'padding:0px;',
             profile_box(),
             about_box(),
             skills_box(),
             network_box()
      ),
      column(8, offset = 0, style = 'padding:0px;',
             main_box()
      ),
      fluidRow(
        column(3, offset = 0, style = 'padding:0px;',
               HTML(
                 paste0('<!-- small box -->
                        <div class="small-box bg-aqua">
                        <div class="inner">
                        <h3>150</h3>

                        <p>New Orders</p>
                        </div>
                        <div class="icon">
                        <i class="ion ion-bag"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                        ')
               )

        ),
        column(3, offset = 0, style = 'padding:0px;',
               HTML(
                 paste0('<div class="small-box bg-green">
                        <div class="inner">
                        <h3>53<sup style="font-size: 20px">%</sup></h3>

                        <p>Bounce Rate</p>
                        </div>
                        <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                        ')
               )
        ),
        column(3, offset = 0, style = 'padding:0px;',
               HTML(
                 paste0('<div class="small-box bg-yellow">
                   <div class="inner">
                   <h3>44</h3>

                   <p>User Registrations</p>
                   </div>
                   <div class="icon">
                   <i class="ion ion-person-add"></i>
                   </div>
                   <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                   </div>
                   ')
               )
        ),
        column(3, offset = 0, style = 'padding:0px;',
               HTML(
                 paste0('<div class="small-box bg-red">
                        <div class="inner">
                        <h3>65</h3>

                        <p>Unique Visitors</p>
                        </div>
                        <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                        ')
               )
        )
      )#,
      # tabItem(
      #   tabName = "info",
      #   box(
      #     title = tagList(shiny::icon("info"), "Infos"), width = 12,
      #     collapsible = T, solidHeader = TRUE,
      #     p("In this app you can:"),
      #     tags$ol(tags$li(""),
      #             tags$li("Make a beautiful CV using adminLTE2"),
      #             tags$li("Export the result as a web page or pdf document")
      #     )
      #   )
      # )
    )
  )
)
