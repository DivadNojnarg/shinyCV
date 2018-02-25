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



      <!-- /.control-sidebar-menu -->
      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
      <h3 class="control-sidebar-heading">Other Options</h3>



      <div data-step="7" data-intro="Here you can change the global &lt;b&gt;theme&lt;/b&gt; &#10;of the dashboard" data-position="left">
      <div class="form-group shiny-input-container">
      <label class="control-label" for="skin">Select a skin:</label>
      <div>
      <select id="skin"><option value="blue">blue</option>
      <option value="black" selected>black</option>
      <option value="purple">purple</option>
      <option value="green">green</option>
      <option value="red">red</option>
      <option value="yellow">yellow</option>
      </select>
      <script type="application/json" data-for="skin" data-nonempty="">{}</script>
      </div>
      </div>
      </div>


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
