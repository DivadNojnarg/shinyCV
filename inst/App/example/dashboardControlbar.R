#-------------------------------------------------------------------------
#  This code contains the controlsidebar of shinydashboard. It is the
#  sidebar available on the left. Parameters are put in this sidebar.
#  Sliders are handled via a conditionalPanel, but this can be disable
#
#  David Granjon, the Interface Group, Zurich
#  December 4th, 2017
#-------------------------------------------------------------------------

dashboardControlbar <- function(ctrlHTML = NULL) {
  # be very careful! Only 5 tabs maximum in the navigation
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
      <li><a href="#control-sidebar-formation-tab" data-toggle="tab"><i class="fa fa-graduation-cap"></i></a></li>
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

      <div class="form-group shiny-input-container">
        <label class="control-label" for="interests">My Interests</label>
        <div>
          <select id="interests" multiple="multiple"><option value="Mathematics">Mathematics</option>
            <option value="Computer Sciences">Computer Sciences</option>
            <option value="Biology">Biology</option>
            <option value="Physiology">Physiology</option>
            <option value="Neurosciences">Neurosciences</option>
            <option value="Web-develoment">Web-develoment</option></select>
          <script type="application/json" data-for="interests">{}</script>
        </div>
      </div>


      <div class="form-group shiny-input-container">
        <label for="teaser">Caption</label>
        <textarea id="teaser" class="form-control" style="width: 200px;">Write your teaser here</textarea>
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

      <div id="skills" class="form-group shiny-input-radiogroup shiny-input-container shiny-input-container-inline">
      <label class="control-label" for="skills">Section to display:</label>
      <div class="shiny-options-group">
      <div class="pretty p-bigger p-round p-thick p-pulse p-icon">
      <input type="radio" name="skills" value="skills" checked="checked"/>
      <div class="state p-primary">
      <i class="icon fa fa-suitcase"></i>
      <label>
      <span>skills</span>
      </label>
      </div>
      </div>
      <div class="pretty p-bigger p-round p-thick p-pulse p-icon">
      <input type="radio" name="skills" value="languages"/>
      <div class="state p-primary">
      <i class="icon fa fa-volume-up"></i>
      <label>
      <span>languages</span>
      </label>
      </div>
      </div>
      </div>
      </div>

      <div id="skillsUI" class="shiny-html-output"></div>
      <div id="languagesUI" class="shiny-html-output"></div>


      <hr/>

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

      <div id="networkUI" class="shiny-html-output"></div>

      </div>
      <!-- /.tab-pane -->





      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-formation-tab">


      <div id="section" class="form-group shiny-input-radiogroup shiny-input-container shiny-input-container-inline">
      <label class="control-label" for="section">Section to display:</label>
      <div class="shiny-options-group">
      <div class="pretty p-bigger p-round p-thick p-pulse p-icon">
      <input type="radio" name="section" value="formation" checked="checked"/>
      <div class="state p-primary">
      <i class="icon fa fa-graduation-cap"></i>
      <label>
      <span>formation</span>
      </label>
      </div>
      </div>
      <div class="pretty p-bigger p-round p-thick p-pulse p-icon">
      <input type="radio" name="section" value="experience"/>
      <div class="state p-primary">
      <i class="icon fa fa-archive"></i>
      <label>
      <span>experience</span>
      </label>
      </div>
      </div>
      <div class="pretty p-bigger p-round p-thick p-pulse p-icon">
      <input type="radio" name="section" value="publications"/>
      <div class="state p-primary">
      <i class="icon fa fa-pencil"></i>
      <label>
      <span>publications</span>
      </label>
      </div>
      </div>
      <div class="pretty p-bigger p-round p-thick p-pulse p-icon">
      <input type="radio" name="section" value="conferences"/>
      <div class="state p-primary">
      <i class="icon fa fa-microphone"></i>
      <label>
      <span>conferences</span>
      </label>
      </div>
      </div>
      <div class="pretty p-bigger p-round p-thick p-pulse p-icon">
      <input type="radio" name="section" value="teaching"/>
      <div class="state p-primary">
      <i class="icon fa fa-university"></i>
      <label>
      <span>teaching</span>
      </label>
      </div>
      </div>
      </div>
      </div>



      <div id="formationUI" class="shiny-html-output"></div>



      <div id="projectsUI" class="shiny-html-output"></div>


      <div id="publicationsUI" class="shiny-html-output"></div>


      <div id="talksUI" class="shiny-html-output"></div>

      <hr/>

      <div id="teaching_type" class="form-group shiny-input-radiogroup shiny-input-container shiny-input-container-inline">
      <label class="control-label" for="teaching_type">Teaching type:</label>
      <div class="shiny-options-group">
      <div class="pretty p-default p-bigger p-round p-thick p-pulse">
      <input type="radio" name="teaching_type" value="course" checked="checked"/>
      <div class="state p-primary">
      <label>
      <span>course</span>
      </label>
      </div>
      </div>
      <div class="pretty p-default p-bigger p-round p-thick p-pulse">
      <input type="radio" name="teaching_type" value="internship"/>
      <div class="state p-primary">
      <label>
      <span>internship</span>
      </label>
      </div>
      </div>
      </div>
      </div>

      <div id="teachingUI" class="shiny-html-output"></div>


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
