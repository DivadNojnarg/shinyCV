about_box <- function() {
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
           <strong><i class="fa fa-at margin-r-5"></i> Tel/Mail & Web</strong>

           <p class="text-muted"><div id="cellphone" class="shiny-text-output"></div></p>
           <p class="text-muted"><div id="mailadress" class="shiny-html-output"></div></p>

           <hr>

           <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

           <p class="text-muted"><div id="location" class="shiny-text-output"></div></p>

           <hr>

           <strong><i class="fa fa-pencil margin-r-5"></i> Social Networks</strong>

           <p>
           <span class="label label-danger">Google +</span>
           <span class="label label-info">Twitter</span>
           <span class="label label-primary">Facebook</span>
           </p>

           <hr>

           <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
           </div>
           <!-- /.box-body -->
           </div>
           <!-- /.box -->
           ')
    )
}
