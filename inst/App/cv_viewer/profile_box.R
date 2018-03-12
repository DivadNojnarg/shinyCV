profile_box <- function(name, position, age, interests, website_url, teaser,
                        image, color) {
  tags$div(
    class = "box box-primary",
    tags$div(
      class = "box-body box-profile",
      if (is.null(image)) {
        # show a default image if nothing is uploaded
        # by the user
        tags$img(class = "profile-user-img img-responsive img-circle",
                 alt = "User profile picture",
                 src = "text-lines.svg",
                 style = "height: 100px; display: block;
                         margin-left: auto; margin-right: auto;")
      } else {
        # otherwise display the image provided by the user
        imageOutput("image", width = "auto", height = "auto")
      },
      tags$h3(class = "profile-username text-center", name),
      tags$h5(class = "text-muted text-center", position),
      tags$ul(
        class = "list-group list-group-unbordered",
        # user age
        tags$li(
          class = "list-group-item",
          tags$i(class = "fa fa-birthday-cake margin-r-5", " Age"),
          tags$a(class = "pull-right",
                 HTML(paste0("<b>", age, "</b>")))
        ),
        # user interests
        tags$li(
          class = "list-group-item",
          tags$i(class = "fa fa-heart margin-r-5", " Interests"),
          lapply(seq_along(interests), FUN = function(i) {
            interest <- interests[[i]]
            tags$span(class = paste0("bg-", color[[i]], "-active color-palette"), interest)
          })
        ),
        # user teaser
        if (!is.null(teaser)) {
          tags$li(
            class = "list-group-item",
            tags$i(class = "fa fa-commenting-o margin-r-5", " Teaser"),
            teaser
          )}
      ),
      # website button
      if (!is.null(website_url)) {
        a(href = website_url, class = "btn btn-primary btn-block",
          target = "_blank", "website")
      }
    )
  )
}

