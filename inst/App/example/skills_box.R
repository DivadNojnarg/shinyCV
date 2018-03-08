skills_box <- function() {
  HTML(
    paste0('
           <div class="box box-primary" style = "overflow-x: auto;">
           <div class="box-header with-border">
           <h3 class="box-title">My skills</h3>

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
           <i class="fa fa-suitcase margin-r-5"></i><strong>Skills</strong>
           </p>

           <div class="chart">
           <!-- Sales Chart Canvas -->
           <div id="skillsradar" class="shiny-plot-output" style="width: 100% ; height: 200px"></div>
           </div>
           <!-- /.chart-responsive -->
           </div>
           <!-- /.col -->
           <div class="col-md-4">
           <p class="text-center">
           <i class="fa fa-volume-up margin-r-5"></i><strong>Languages</strong>
           </p>

           <div id="languagelevel" class="shiny-html-output"></div>


           </div>
           <!-- /.col -->
           </div>
           <!-- /.row -->


           <div id="calendar_githubUI" class="shiny-html-output calendarUI"></div>

           <script>
            Shiny.addCustomMessageHandler("myCallbackHandler",
              function(github_name) {
                GitHubCalendar(".calendarUI", github_name, {responsive: false});
                });
           </script>




           </div>
           <!-- ./box-body -->
           <div class="box-footer">
           <h3 class = "text-center">Statistics</h3>
           <div class="row">
           <div class="col-sm-3 col-xs-6">
           <div class="description-block border-right">

           <span class="badge bg-red">
            <div id="total_projects" class="shiny-text-output"></div>
           </span>
           <br/>
           <span class="description-text">TOTAL PROJECTS</span>

           </div>
           <!-- /.description-block -->
           </div>
           <!-- /.col -->
           <div class="col-sm-3 col-xs-6">
           <div class="description-block border-right">

           <span class="badge bg-red">
            <div id="total_publications" class="shiny-text-output"></div>
           </span>
           <br/>
           <span class="description-text">TOTAL PUBLICATIONS</span>

           </div>
           <!-- /.description-block -->
           </div>
           <!-- /.col -->
           <div class="col-sm-3 col-xs-6">
           <div class="description-block border-right">

           <span class="badge bg-red">
            <div id="total_conferences" class="shiny-text-output"></div>
           </span>
           <br/>
           <span class="description-text">TOTAL CONFERENCES</span>

           </div>
           <!-- /.description-block -->
           </div>
           <!-- /.col -->
           <div class="col-sm-3 col-xs-6">
           <div class="description-block">

           <span class="badge bg-red">
            <div id="total_courses" class="shiny-text-output"></div>
           </span>
           <br/>
           <span class="description-text">TOTAL COURSES</span>

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
}
