# create a course box if input$teaching_type = course
course_box <- function(input, title, topic, nb_students, nb_hours, from, to,
                       place, supervisor, syllabus) {
  tags$div(class = "col-sm-6",
    tags$div(
      class = "box box-widget widget-user",
      tags$div(
        class = "widget-user-header bg-light-blue-active",
        # Define course title and topic
        tags$h3(class = "widget-user-username", title),
        tags$h5(class = "widget-user-desc", topic),
        # Define the main supervisor
        tags$h6(class = "pull-right",
                HTML(paste0("<u>","Advisor: ", "</u>", supervisor))
        )
      ),
      tags$div(
        class = "widget-user-image",
        # course image
        tags$img(class = "img-circle",
                 src = "presentation-2.svg",
                 alt = "User Avatar")
      ),
      tags$div(
        class = "box-footer",
        tags$div(
          class = "row",
          # column 1: student number
          tags$div(
            class = "col-sm-4 border-right",
            tags$div(
              class = "description-block",
              tags$h5(class = "description-header",
                      tags$span(class = "badge bg-red", nb_students)),
              tags$span(class = "description-text", "NB STUDENTS")
            )
          ),
          # column 2 : course duration
          tags$div(
            class = "col-sm-4 border-right",
            tags$div(
              class = "description-block",
              tags$h5(class = "description-header",
                      tags$span(class = "badge bg-red", nb_hours)),
              tags$span(class = "description-text", "NB HOURS")
            )
          ),
          # column 3 : course location and dates
          tags$div(
            class = "col-sm-4 border-right",
            tags$div(
              class = "description-block",
              tags$h5(class = "description-header", place),
              tags$br(),
              tags$h6(class = "text-center", paste0(from, " -> ", to)),
              tags$span(class = "description-text", "PLACE-DATES")
            )
          )
        )
      )
    )
  )
}

# create an internship box if input$teaching_type = course
internship_box <- function() {
  tags$div(class = "col-sm-6",
    tags$div(
      class = "box box-widget widget-user",
      tags$div(
        class = "widget-user-header bg-light-blue-active",
        # Define course title and topic
        tags$h3(class = "widget-user-username", "Course Title"),
        tags$h5(class = "widget-user-desc", "Course Topic")
      ),
      tags$div(
        class = "widget-user-image",
        # course image
        tags$img(class = "img-circle",
                 src = "../dist/img/user1-128x128.jpg",
                 alt = "User Avatar")
      ),
      tags$div(
        class = "box-footer",
        tags$div(
          class = "row",
          # column 1: student number
          tags$div(
            class = "col-sm-4 border-right",
            tags$div(
              class = "description-block",
              tags$h5(class = "description-header", "nb students"),
              tags$span(class = "description-text", "NB STUDENTS")
            )
          ),
          # column 2 : course duration
          tags$div(
            class = "col-sm-4 border-right",
            tags$div(
              class = "description-block",
              tags$h5(class = "description-header", "nb hours"),
              tags$span(class = "description-text", "NB HOURS")
            )
          ),
          # column 3 : course location
          tags$div(
            class = "col-sm-4 border-right",
            tags$div(
              class = "description-block",
              tags$h5(class = "description-header", "location"),
              tags$span(class = "description-text", "PLACE")
            )
          )
        )
      )
    )
  )
}
