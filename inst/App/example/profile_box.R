profile_box <- function() {
  HTML(
    paste0('<!-- Profile Image -->
           <div class="box box-primary">
           <div class="box-body box-profile">

           <div id="image" class="shiny-image-output" style="width: 100%"></div>

           <h3 class="profile-username text-center"><div id="name" class="shiny-text-output"></div></h3>

           <div id="position" class="text-muted text-center shiny-text-output"></div>

           <ul class="list-group list-group-unbordered">
           <li class="list-group-item">
           <i class="fa fa-birthday-cake margin-r-5"></i><b>Age</b> <a class="pull-right"><div id="age" class="shiny-text-output"></div></a>
           </li>
           <li class="list-group-item">
           <i class="fa fa-heart margin-r-5"></i><b>My interests</b> <div id="interests" class="shiny-html-output"></div>
           </li>
           <li class="list-group-item">
           <i class="fa fa-commenting-o margin-r-5"></i><b>Teaser</b> <div id="teaser" class="shiny-text-output"></div>
           </li>
           </ul>

           <div id="website" class="shiny-html-output"></div>
           </div>
           <!-- /.box-body -->
           </div>
           <!-- /.box -->
           ')
    )
}
