project_box <- function(input, images, background_color, title = "Project Title",
                        position = "Project Position", overview = "Project Overview",
                        supervisors = "Project Supervisors", place = "Project place",
                        tasks = NULL) {
  # project_box
  tags$div(
    class = "col-md-6",
    tags$div(
      class = "box box-widget widget-user-2",
      tags$div(
        # background color (random)
        class = paste0("widget-user-header bg-", sample(background_color)),
        tags$div(
          # user image (random)
          class = "widget-user-image",
          tags$img(class = "img-circle", src =
                     sample(images), alt = "User Avatar")

        ),
        # Project Title
        tags$h3(class = "widget-user-username", title),
        # Project Position
        tags$h5(class = "widget-user-desc", position)
      ),
      tags$div(
        class = "box-footer no-padding",
        tags$ul(
          class = "nav nav-stacked",
          # Project Overview (accordion)
          tags$li(
            tags$a(
              `data-toggle` = "collapse", `aria-expanded` = "true",
              href = "#collapseOne",
              tags$p(class = "text-center", "overview")
            ),
            tags$div(
              id = "collapseOne", class = "panel-collapse collapse in",
              tags$div(
                class = "box-body",
                overview
              )
            )
          ),
          # Project Supervisors
          tags$li(tags$a(href = "#", supervisors)),
          # Project Place
          tags$li(tags$a(href = "#", place)),
          # Project Main Tasks
          if (nrow(tasks) > 0) {

              tags$li(
                tags$p(class = "text-center", "Main Tasks"),
                tags$table(
                  class = "table table-bordered",
                  # table labels
                  tags$tr(
                    tags$th(style = "width: 10px", "#"),
                    tags$th("Task"),
                    tags$th("Progress"),
                    tags$th(style = "width: 40px", "Label")
                  ),
                  # first line
                  lapply(seq_along(tasks), FUN = function(i) {
                    name <- tasks$name[i]
                    status <- tasks$status[i]
                  tags$tr(tags$td("1."),
                          tags$td(name),
                          tags$td(
                            tags$div(
                              class = "progress progress-xs progress-striped active",
                              tags$div(class = "progress-bar progress-bar-danger",
                                       style = "width: 55%")
                            )
                          ),
                          tags$td(tags$span(class = "badge bg-red", "55%"))
                  )
                  })
                )
              )
          }
        )
      )
    )
  )
}
