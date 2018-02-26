#-------------------------------------------------------------------------
#  This code contains the controlsidebar of shinydashboard. It is the
#  sidebar available on the left. Parameters are put in this sidebar.
#  Sliders are handled via a conditionalPanel, but this can be disable
#
#  David Granjon, the Interface Group, Zurich
#  December 4th, 2017
#-------------------------------------------------------------------------

dashboardControlbar <- function(ctrlHTML = NULL) {

  if ( is.null(ctrlHTML) ) {

    HTML(paste0(
      '<!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
      <!-- Create the tabs -->
      <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
      </ul>
      <!-- Tab panes -->
      <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
      <h3 class="control-sidebar-heading">Parameters</h3>


      <div class="form-group shiny-input-container">
        <label>Choose a picture</label>
        <div class="input-group">
          <label class="input-group-btn">
            <span class="btn btn-default btn-file">
              Browse...
              <input id="my_picture" name="my_picture" type="file" style="display: none;" accept="image/png,image/jpeg"/>
            </span>
          </label>
          <input type="text" class="form-control" placeholder="No file selected" readonly="readonly"/>
        </div>
        <div id="my_picture_progress" class="progress progress-striped active shiny-file-input-progress">
          <div class="progress-bar"></div>
        </div>
      </div>

      <div class="form-group shiny-input-container">
        <label for="name">Enter your name</label>
        <input id="name" type="text" class="form-control" value=""/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="position">Enter your current job</label>
        <input id="position" type="text" class="form-control" value=""/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="website_url">Personal Website</label>
        <input id="website_url" type="text" class="form-control" value=""/>
      </div>


      <!-- /.control-sidebar-menu -->
      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
      <h3 class="control-sidebar-heading">Other Options</h3>






      </div>
      <!-- /.tab-pane -->
      </div>
      </aside>
      <!-- /.control-sidebar -->
      <!-- Add the sidebar"s background. This div must be placed
      immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
      '))

  } else {

    ctrlHTML

  }
}
