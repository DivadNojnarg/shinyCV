project_box <- function(input, images, background_color, title = "Project Title",
                        position = "Project Position", overview = "Project Overview",
                        supervisors = "Project Supervisors", place = "Project place",
                        tasks, box_index) {

  # box_index is used to create unique accordion ID
  # each time a new project_box is created

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
        tags$h3(class = "widget-user-username",
                HTML(paste0(title, tags$td(tags$span(class = "pull-right badge bg-black", box_index))))),
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
              href = paste0("#collapse", box_index),
              tags$p(class = "text-center", "Overview")
            ),
            tags$div(
              id = paste0("collapse", box_index), class = "panel-collapse collapse in",
              tags$div(
                class = "box-body",
                overview
              )
            )
          ),
          # Project Supervisors
          tags$li(tags$a(href = "#", HTML(paste0("<u>", "Supervisors: ", "</u>",
                                                 "<p class = \"text-center\">",
                                                 supervisors, "<p>")))),
          # Project Place
          tags$li(tags$a(href = "#", HTML(paste0("<u>", "Location: ", "</u>",
                                                 "<p class = \"text-center\">",
                                                 place, "<p>")))),
          # Project Main Tasks
          if (nrow(tasks) > 0) {
            tags$li(
              tags$a(
                `data-toggle` = "collapse", `aria-expanded` = "true",
                href = paste0("#collapse", box_index + 100),
                tags$p(class = "text-center", "Main Tasks")
              ),
              tags$div(
                id = paste0("collapse", box_index + 100), class = "panel-collapse collapse in",
                tags$div(
                  class = "box-body",
                  tags$table(
                    class = "table table-bordered",
                    # table labels
                    tags$tr(
                      tags$th(style = "width: 10px", "#"),
                      tags$th("Task"),
                      tags$th("Progress")#,
                      #tags$th(style = "width: 40px", "Label")
                    ),
                    # first line
                    lapply(seq_along(tasks$name), FUN = function(i) {
                      name <- tasks$name[i]
                      status <- tasks$status[i]
                      tags$tr(tags$td(i),
                              tags$td(name),
                              # tags$td(
                              #   tags$div(
                              #     class = "progress progress-xs progress-striped active",
                              #     tags$div(class = "progress-bar progress-bar-danger",
                              #              style = "width: 55%")
                              #   )
                              # ),
                              if (status == "wip") {
                                tags$td(tags$span(class = "badge bg-yellow", "In Progress"))
                              } else {
                                tags$td(tags$span(class = "badge bg-green", "Finished"))
                              }
                      )
                    })
                  )
                )
              )
            )
          }
        )
      )
    )
  )
}
