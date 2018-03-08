network_box <- function() {
  HTML(
    paste0('<!-- USERS LIST -->
           <div class="box box-primary">
           <div class="box-header with-border">
           <h3 class="box-title">My Network</h3>

           <div class="box-tools pull-right">
           <div id="usernumber" class="shiny-html-output"></div>
           </div>
           </div>
           <!-- /.box-header -->
           <div class="box-body no-padding">
           <ul class="users-list clearfix">

           <div id="userlist" class="shiny-html-output"></div>

           </ul>
           <!-- /.users-list -->
           </div>
           <!-- /.box-body -->
           <div class="box-footer text-center">

           </div>
           <!-- /.box-footer -->
           </div>
           ')
    )
}
