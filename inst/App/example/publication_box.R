publication_box <- function(input, reference, abstract, pubmed_link, box_index) {

  # box_index is used to create ID number
  # for each publication box.
  # It is shown in a black panel in the header

  tags$div(class = "col-md-6",
           tags$div(
             class = "box box-widget",
             ## Box header ##
             tags$div(
               class = "box-header with-border",
               # user block
               tags$div(
                 class = "user-block",
                 tags$span(class = "badge bg-black", box_index),
                 tags$p(class = "text-center", tags$a(href = "#", reference))
               ),
               tags$div(
                 class = "box-tools",
                 # read button (does not work)
                 tags$button(
                   type = "button",
                   class = "btn btn-box-tool",
                   `data-toggle` = "tooltip",
                   title = "Mark as read",
                   tags$i(class = "fa fa-circle-o")
                 ),
                 # toggle button
                 tags$button(
                   type = "button",
                   class = "btn btn-box-tool",
                   `data-widget` = "collapse",
                   tags$i(class = "fa fa-minus")
                 )
               )
             ),
             ## Box body ##
             tags$div(
               class = "box-body",
               # publication screenshot (does not work with user defined background)
               tags$img(class = "img-responsive pad",
                        src = "text-lines.svg",
                        alt = "text-lines.svg",
                        style = "height: 200px; display: block;
                                 margin-left: auto; margin-right: auto;"),
               # publication abstract
               tags$ul(class = "nav nav-stacked",
                       tags$li(
                         tags$a(
                           `data-toggle` = "collapse", `aria-expanded` = "true", href = "#collapse",
                           tags$p(class = "text-center", "Abstract")
                         ),
                         tags$div(
                           id = "collapse", class = "panel-collapse collapse in",
                           tags$div(class = "body",
                                    abstract
                           )
                         )
                       )
               ),
               tags$br(),
               tags$br(),
               # pubmed link
               tags$button(
                 type = "button", class = "btn btn-danger btn-xs",
                 tags$i(class = "fa fa-info", tags$a(href = pubmed_link, target = "_blank", "Pubmed"))
               )
             ),
             ## box footer ##
             tags$div(class = "box-footer")
           )
  )
}
