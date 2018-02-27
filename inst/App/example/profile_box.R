profile_box <- function() {
  HTML(
    paste0('<!-- Profile Image -->
           <div class="box box-danger">
           <div class="box-body box-profile">

           <div id="image" class="shiny-image-output" style="width: 100%"></div>

           <h3 class="profile-username text-center"><div id="name" class="shiny-text-output"></div></h3>

           <div id="position" class="text-muted text-center shiny-text-output"></div>

           <ul class="list-group list-group-unbordered">
           <li class="list-group-item">
           <b>Date of Birth</b> <a class="pull-right"><div id="age" class="shiny-text-output"></div></a>
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
    )
}
