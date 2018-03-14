# create a course box if input$teaching_type = course
course_box <- function(title, topic, nb_students, nb_hours, from, to,
                       place, supervisor, syllabus, box_index) {
  tags$div(class = "col-sm-6",
    tags$div(
      class = "box box-widget widget-user",
      tags$div(
        class = "widget-user-header bg-light-blue-active",
        # Define course title, topic and syllabus
        tags$h3(class = "widget-user-username",
                tags$span(class = "badge bg-black", box_index), title),
        tags$h5(class = "widget-user-desc", topic),
        if (!is.null(syllabus)) {
          tags$h6(class = "widget-user-desc",
            tags$span(class = "badge bg-yellow",
              tags$a(href = syllabus, target = "_blank", " View Syllabus")
            )
          )
        },
        # Define the main supervisor
        tags$h6(class = "widget-user-desc",
                HTML(paste0("<u>","Advisor: ", "</u>", supervisor))
        )
      ),
      tags$div(
        class = "widget-user-image",
        # course image
        tags$img(class = "img-circle",
                 src = "presentation-2.svg",
                 alt = "Course Avatar")
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
internship_box <- function(title, topic, from, to, place, supervisor,
                           level, advert, box_index) {
  tags$div(class = "col-sm-6",
    tags$div(
      class = "box box-widget widget-user",
      tags$div(
        class = "widget-user-header bg-green-active",
        # Define course title, topic and advert
        tags$h3(class = "widget-user-username",
                tags$span(class = "badge bg-black", box_index), title),
        tags$h5(class = "widget-user-desc", topic),
        if (!is.null(advert)) {
          tags$h6(class = "widget-user-desc",
            tags$span(class = "badge bg-orange",
              tags$a(href = advert, target = "_blank", " View Advert")
            )
          )
        },
        # Define the main supervisor
        tags$h6(class = "widget-user-desc",
                HTML(paste0("<u>","Advisor: ", "</u>", supervisor))
        )
      ),
      tags$div(
        class = "widget-user-image",
        # course image
        tags$img(class = "img-circle",
                 src = "student.svg",
                 alt = "Student Avatar")
      ),
      tags$div(
        class = "box-footer",
        tags$div(
          class = "row",
          # column 1: student number
          tags$div(
            class = "col-sm-6 border-right",
            tags$div(
              class = "description-block",
              tags$h5(class = "description-header", level),
              tags$span(class = "description-text", "STUDENTS LEVEL")
            )
          ),
          # column 2 : internship location and dates
          tags$div(
            class = "col-sm-6 border-right",
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
