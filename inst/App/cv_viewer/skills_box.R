skills_box <- function(languages, #github_name, allow_github_calendar,
                       nb_projects, nb_publications, nb_conferences, nb_courses,
                       nb_users) {

  tags$div(
    class = "box box-primary", style = "overflow-x: auto;",
    ## Box Header ##
    tags$div(
      class = "box-header with-border",
      tags$h3(class = "box-title", "My Skills"),
      # Buttons
      tags$div(
        class = "box-tools pull-right",
        tags$button(
          type = "button", class = "btn btn-box-tool",
          `data-widget` = "collapse",
          tags$i(class = "fa fa-minus")
        ),
        tags$div(class = "btn-group",
                 tags$button(
                   type = "button", class = "btn btn-box-tool dropdown-toggle",
                   `data-toggle` = "dropdown",
                   tags$i(class = "fa fa-wrench")
                 ),
                 # dropdown menu of buttons (very promising)
                 tags$ul(
                   class = "dropdown-menu", role = "menu",
                   tags$li(tags$a(href = "#", "Action")),
                   tags$li(tags$a(href = "#", "Another action")),
                   tags$li(tags$a(href = "#", "Something else here")),
                   tags$i(class = "divider"),
                   tags$i(tags$a(href = "#", "Separated link"))
                 )
        ),
        tags$button(
          type = "button", class = "btn btn-box-tool", `data-widget` = "remove",
          tags$i(class = "fa fa-times")
        )
      )
    ),
    ## Box Body ##
    tags$div(
      class = "box-body",
      tags$div(
        class = "row",
        # Skills column
        tags$div(
          class = "col-md-8",
          tags$p(
            class = "text-center",
            tags$i(class = "fa fa-suitcase margin-r-5"), tags$strong("Skills")
          ),
          # Radar Chart of Skills
          tags$div(
            class = "chart",
            plotOutput("skillsradar", width = "100%", height = "200px")
          )
        ),
        # Languages column
        tags$div(
          class = "col-md-4",
          tags$p(
            class = "text-center",
            tags$i(class = "fa fa-volume-up margin-r-5"), tags$strong("Languages")
          ),
          # language progress bars are dynamically generated
          if (!is_empty(languages)) {
            tagList(
              lapply(seq_along(languages$value), FUN = function(i) {
                val <- languages$value[i]
                name <- languages$variable[i]
                id <- paste0("language", i)
                progressBar(
                  id = id, value = val,
                  # set a status color code
                  status = if (val >= 0 & val < 25) {
                    "danger"
                  } else if (val >= 25 & val < 75) {
                    "warning"
                  } else if (val >= 75 & val <= 100) {
                    "success"
                  },
                  title = name,
                  striped = TRUE,
                  size = "xs")
              })
            )
          }
        )
      )#,
      # Github calendar (Does not work now)
      # if (!is.null(github_name) & allow_github_calendar == TRUE) {
      #   tagList(
      #     tags$hr(),
      #     tags$p(class = "text-center", tags$strong("Github Contribution")),
      #     tags$div(class = "calendar", "Loading the data just for you")
      #   )
      # },
      #
      # tags$head(tags$script(
      #   HTML('Shiny.addCustomMessageHandler("myCallbackHandler",
      #    function(github_name) {
      #    GitHubCalendar(".calendar", github_name, {responsive: false});
      #    });
      #    ')
      # ))


    ),
    ## Box footer ##
    tags$div(
      class = "box-footer",
      tags$h3(class = "text-center", "Statistics"),
      tags$div(
        class = "row",
        # Total projects statistic
        tags$div(
          class = "col-sm-3 col-xs-6",
          tags$div(
            class = "description-block border-right",
            tags$span(
              class = "badge bg-red",
              nb_projects
            ),
            tags$br(),
            tags$span(class = "description-text", "TOTAL PROJECTS")
          )
        ),
        # Total publications statistic
        tags$div(
          class = "col-sm-3 col-xs-6",
          tags$div(
            class = "description-block border-right",
            tags$span(
              class = "badge bg-red",
              nb_publications
            ),
            tags$br(),
            tags$span(class = "description-text", "TOTAL PUBLICATIONS")
          )
        ),
        # Total conferences statistic
        tags$div(
          class = "col-sm-3 col-xs-6",
          tags$div(
            class = "description-block border-right",
            tags$span(
              class = "badge bg-red",
              nb_conferences
            ),
            tags$br(),
            tags$span(class = "description-text", "TOTAL CONFERENCES")
          )
        ),
        # Total course statistic
        tags$div(
          class = "col-sm-3 col-xs-6",
          tags$div(
            class = "description-block border-right",
            tags$span(
              class = "badge bg-red",
              nb_courses
            ),
            tags$br(),
            tags$span(class = "description-text", "TOTAL COURSES")
          )
        )
      )
    )
  )

  # HTML(
  #   paste0('
  #          <div class="box box-primary" style = "overflow-x: auto;">
  #          <div class="box-header with-border">
  #          <h3 class="box-title">My skills</h3>
  #
  #          <div class="box-tools pull-right">
  #          <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
  #          </button>
  #          <div class="btn-group">
  #          <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
  #          <i class="fa fa-wrench"></i></button>
  #          <ul class="dropdown-menu" role="menu">
  #          <li><a href="#">Action</a></li>
  #          <li><a href="#">Another action</a></li>
  #          <li><a href="#">Something else here</a></li>
  #          <li class="divider"></li>
  #          <li><a href="#">Separated link</a></li>
  #          </ul>
  #          </div>
  #          <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
  #          </div>
  #          </div>
  #          <!-- /.box-header -->
  #          <div class="box-body">
  #          <div class="row">
  #          <div class="col-md-8">
  #          <p class="text-center">
  #          <i class="fa fa-suitcase margin-r-5"></i><strong>Skills</strong>
  #          </p>
  #
  #          <div class="chart">
  #          <!-- Sales Chart Canvas -->
  #          <div id="skillsradar" class="shiny-plot-output" style="width: 100% ; height: 200px"></div>
  #          </div>
  #          <!-- /.chart-responsive -->
  #          </div>
  #          <!-- /.col -->
  #          <div class="col-md-4">
  #          <p class="text-center">
  #          <i class="fa fa-volume-up margin-r-5"></i><strong>Languages</strong>
  #          </p>
  #
  #          <div id="languagelevel" class="shiny-html-output"></div>
  #
  #
  #          </div>
  #          <!-- /.col -->
  #          </div>
  #          <!-- /.row -->
  #
  #
  #          <div id="calendar_githubUI" class="shiny-html-output calendarUI"></div>
  #
  #          <script>
  #           Shiny.addCustomMessageHandler("myCallbackHandler",
  #             function(github_name) {
  #               GitHubCalendar(".calendarUI", github_name, {responsive: false});
  #               });
  #          </script>
  #
  #
  #
  #
  #          </div>
  #          <!-- ./box-body -->
  #          <div class="box-footer">
  #          <h3 class = "text-center">Statistics</h3>
  #          <div class="row">
  #          <div class="col-sm-3 col-xs-6">
  #          <div class="description-block border-right">
  #
  #          <span class="badge bg-red">
  #           <div id="total_projects" class="shiny-text-output"></div>
  #          </span>
  #          <br/>
  #          <span class="description-text">TOTAL PROJECTS</span>
  #
  #          </div>
  #          <!-- /.description-block -->
  #          </div>
  #          <!-- /.col -->
  #          <div class="col-sm-3 col-xs-6">
  #          <div class="description-block border-right">
  #
  #          <span class="badge bg-red">
  #           <div id="total_publications" class="shiny-text-output"></div>
  #          </span>
  #          <br/>
  #          <span class="description-text">TOTAL PUBLICATIONS</span>
  #
  #          </div>
  #          <!-- /.description-block -->
  #          </div>
  #          <!-- /.col -->
  #          <div class="col-sm-3 col-xs-6">
  #          <div class="description-block border-right">
  #
  #          <span class="badge bg-red">
  #           <div id="total_conferences" class="shiny-text-output"></div>
  #          </span>
  #          <br/>
  #          <span class="description-text">TOTAL CONFERENCES</span>
  #
  #          </div>
  #          <!-- /.description-block -->
  #          </div>
  #          <!-- /.col -->
  #          <div class="col-sm-3 col-xs-6">
  #          <div class="description-block">
  #
  #          <span class="badge bg-red">
  #           <div id="total_courses" class="shiny-text-output"></div>
  #          </span>
  #          <br/>
  #          <span class="description-text">TOTAL COURSES</span>
  #
  #          </div>
  #          <!-- /.description-block -->
  #          </div>
  #          </div>
  #          <!-- /.row -->
  #          </div>
  #          <!-- /.box-footer -->
  #          </div>
  #          <!-- /.box -->
  #          ')
  #   )
}
