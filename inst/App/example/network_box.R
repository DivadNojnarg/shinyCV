network_box <- function(input, data, nb_users) {
  tags$div(
    class = "box box-primary",
    # box header
    tags$div(
      class = "box-header with-border",
      tags$h3(class = "box-title", "My Network"),
      tags$div(
        class = "box-tools pull-right",
        tags$span(class = "label label-danger", HTML(paste(icon("users"), nb_users, "members"))),
        tags$button(type = "button", class = "btn btn-box-tool",
                    `data-widget` = "collapse", tags$i(class = "fa fa-minus")),
        tags$button(type = "button", class = "btn btn-box-tool",
                    `data-widget` = "remove", tags$i(class = "fa fa-times"))
      )
    ),
    # box body
    tags$div(
      class = "box-body no-padding",
      tags$ul(
        class = "box-body no-padding",
        # prevent bullets to be printed next to each <li> element
        style = "list-style-type: none;",
        # generate a user interface for each user in the table
        lapply(seq_along(data$title), FUN = function(i) {
          title <- data$title[i]
          name <- data$name[i]
          mail <- data$mail[i]
          phone <- data$phone[i]
          image <- ifelse(data$sex[i] == "male", "man.png", "girl-2.png")
          column(4, align = "center",
          tags$li(
            tags$img(src = image, alt = "User Image"),
            tags$br(),
            tags$a(class = "users-list-name", href = "#", paste(title, name)),
            tags$span(
              class = "users-list-date",
              a(href = paste0("mailto:", mail), target = "_top", mail)),
            tags$span(class = "users-list-date", phone)
          ))
        })
      )
    ),
    # box footer
    tags$div(
      class = "box-footer text-center"
    )
  )
}




