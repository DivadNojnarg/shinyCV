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
      <li><a href="#control-sidebar-about-tab" data-toggle="tab"><i class="fa fa-info-circle"></i></a></li>
      <li><a href="#control-sidebar-skills-tab" data-toggle="tab"><i class="fa fa-wrench"></i></a></li>
      <li><a href="#control-sidebar-network-tab" data-toggle="tab"><i class="fa fa-user-plus"></i></a></li>
      </ul>
      <!-- Tab panes -->
      <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
      <h3 class="control-sidebar-heading">Profile section</h3>


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
        <input id="name" type="text" class="form-control" value="My name"/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="position">Enter your current job</label>
        <input id="position" type="text" class="form-control" value="My current job"/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="website_url">Personal Website</label>
        <input id="website_url" type="text" class="form-control" value="https://divadnojnarg.github.io"/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="age">Age</label>
        <input id="age" type="text" class="form-control" value=""/>
      </div>


      <!-- /.control-sidebar-menu -->
      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-about-tab">
      <h3 class="control-sidebar-heading">About Section</h3>

      <div class="form-group shiny-input-container">
        <label for="phone_number">Your phone number</label>
      <input id="phone_number" type="text" class="form-control" value=""/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="mail">Your mail adress</label>
        <input id="mail" type="text" class="form-control" value=""/>
      </div>


      <div class="form-group shiny-input-container">
        <label for="location">Your current location</label>
        <input id="location" type="text" class="form-control" value=""/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="linkedinlink">My Linkedin profil</label>
        <input id="linkedinlink" type="text" class="form-control" value="https://www.linkedin.com/uas/login"/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="twitterlink">My Twitter page</label>
        <input id="twitterlink" type="text" class="form-control" value="https://twitter.com"/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="facebooklink">My Facebook page</label>
        <input id="facebooklink" type="text" class="form-control" value="https://www.facebook.com"/>
      </div>

      <div class="form-group shiny-input-container">
        <label for="githublink">My Github profil</label>
        <input id="githublink" type="text" class="form-control" value="https://github.com"/>
      </div>


      </div>
      <!-- /.tab-pane -->


      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-skills-tab">
      <h3 class="control-sidebar-heading">Skills Section</h3>

      <div class="form-group shiny-input-container">
        <div class="material-switch">
          <span style="padding-right: 10px;">Open Skills Editor</span>
          <input id="add_skill" type="checkbox"/>
          <label for="add_skill" class="label-success"></label>
        </div>
      </div>

      <div class="form-group shiny-input-container">
        <div class="material-switch">
          <span style="padding-right: 10px;">Open Languages Editor</span>
          <input id="add_language" type="checkbox"/>
          <label for="add_language" class="label-success"></label>
        </div>
      </div>

      <div id="skillsUI" class="shiny-html-output"></div>
      <div id="languagesUI" class="shiny-html-output"></div>


      <div class="form-group shiny-input-container">
        <div class="material-switch">
      <span style="padding-right: 10px;">Allow Github Calendar</span>
      <input id="allow_github_calendar" type="checkbox"/>
      <label for="allow_github_calendar" class="label-success"></label>
      </div>
      </div>

      <div id="github_username" class="shiny-html-output"></div>


      </div>
      <!-- /.tab-pane -->



      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-network-tab">
      <h3 class="control-sidebar-heading">Network Section</h3>

      <div class="form-group shiny-input-container">
      <div class="material-switch">
      <span style="padding-right: 10px;">Open Network Editor</span>
      <input id="add_user" type="checkbox"/>
      <label for="add_user" class="label-success"></label>
      </div>
      </div>

      <div id="networkUI" class="shiny-html-output"></div>



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
