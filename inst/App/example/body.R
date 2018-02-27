body <- dashboardBody(
  useShinyjs(),
  withMathJax(),
  useShinyFeedback(),

  tabItems(
    tabItem(
      tabName = "main",
      column(4, offset = 0, style = 'padding:0px;',
             HTML(
               paste0('<!-- Profile Image -->
                      <div class="box box-danger">
                        <div class="box-body box-profile">

                        <div id="image" class="shiny-image-output" style="width: 100%"></div>

                        <h3 class="profile-username text-center"><div id="name" class="shiny-text-output"></div></h3>

                        <div id="position" class="text-muted text-center shiny-text-output"></div>

                        <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                        <b>Followers</b> <a class="pull-right">1,322</a>
                        </li>
                        <li class="list-group-item">
                        <b>Following</b> <a class="pull-right">543</a>
                        </li>
                        <li class="list-group-item">
                        <b>Friends</b> <a class="pull-right">13,287</a>
                        </li>
                        </ul>

                        <div id="website" class="shiny-html-output"></div>
                        </div>
                        <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        ')
             ),
             HTML(
               paste0('
                        <div class="box box-danger">
                        <div class="box-header with-border">
                        <h3 class="box-title">About Me</h3>
                        <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                        <strong><i class="fa fa-book margin-r-5"></i> Education</strong>

                        <p class="text-muted">
                        B.S. in Computer Science from the University of Tennessee at Knoxville
                        </p>

                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

                        <p class="text-muted">Malibu, California</p>

                        <hr>

                        <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

                        <p>
                        <span class="label label-danger">UI Design</span>
                        <span class="label label-success">Coding</span>
                        <span class="label label-info">Javascript</span>
                        <span class="label label-warning">PHP</span>
                        <span class="label label-primary">Node.js</span>
                        </p>

                        <hr>

                        <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
                        </div>
                        <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        ')
             ),
             HTML(
               paste0('
                        <div class="box box-danger">
                        <div class="box-header with-border">
                        <h3 class="box-title">Monthly Recap Report</h3>

                        <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <div class="btn-group">
                        <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-wrench"></i></button>
                        <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        </ul>
                        </div>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                        <div class="row">
                        <div class="col-md-8">
                        <p class="text-center">
                        <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
                        </p>

                        <div class="chart">
                        <!-- Sales Chart Canvas -->
                        <canvas id="salesChart" style="height: 180px;"></canvas>
                        </div>
                        <!-- /.chart-responsive -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-4">
                        <p class="text-center">
                        <strong>Goal Completion</strong>
                        </p>

                        <div class="progress-group">
                        <span class="progress-text">Add Products to Cart</span>
                        <span class="progress-number"><b>160</b>/200</span>

                        <div class="progress sm">
                        <div class="progress-bar progress-bar-aqua" style="width: 80%"></div>
                        </div>
                        </div>
                        <!-- /.progress-group -->
                        <div class="progress-group">
                        <span class="progress-text">Complete Purchase</span>
                        <span class="progress-number"><b>310</b>/400</span>

                        <div class="progress sm">
                        <div class="progress-bar progress-bar-red" style="width: 80%"></div>
                        </div>
                        </div>
                        <!-- /.progress-group -->
                        <div class="progress-group">
                        <span class="progress-text">Visit Premium Page</span>
                        <span class="progress-number"><b>480</b>/800</span>

                        <div class="progress sm">
                        <div class="progress-bar progress-bar-green" style="width: 80%"></div>
                        </div>
                        </div>
                        <!-- /.progress-group -->
                        <div class="progress-group">
                        <span class="progress-text">Send Inquiries</span>
                        <span class="progress-number"><b>250</b>/500</span>

                        <div class="progress sm">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%"></div>
                        </div>
                        </div>
                        <!-- /.progress-group -->
                        </div>
                        <!-- /.col -->
                        </div>
                        <!-- /.row -->
                        </div>
                        <!-- ./box-body -->
                        <div class="box-footer">
                        <div class="row">
                        <div class="col-sm-3 col-xs-6">
                        <div class="description-block border-right">
                        <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 17%</span>
                        <h5 class="description-header">$35,210.43</h5>
                        <span class="description-text">TOTAL REVENUE</span>
                        </div>
                        <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-3 col-xs-6">
                        <div class="description-block border-right">
                        <span class="description-percentage text-yellow"><i class="fa fa-caret-left"></i> 0%</span>
                        <h5 class="description-header">$10,390.90</h5>
                        <span class="description-text">TOTAL COST</span>
                        </div>
                        <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-3 col-xs-6">
                        <div class="description-block border-right">
                        <span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 20%</span>
                        <h5 class="description-header">$24,813.53</h5>
                        <span class="description-text">TOTAL PROFIT</span>
                        </div>
                        <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-3 col-xs-6">
                        <div class="description-block">
                        <span class="description-percentage text-red"><i class="fa fa-caret-down"></i> 18%</span>
                        <h5 class="description-header">1200</h5>
                        <span class="description-text">GOAL COMPLETIONS</span>
                        </div>
                        <!-- /.description-block -->
                        </div>
                        </div>
                        <!-- /.row -->
                        </div>
                        <!-- /.box-footer -->
                        </div>
                        <!-- /.box -->
                        ')
             )
      ),
      column(8, offset = 0, style = 'padding:0px;',
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
