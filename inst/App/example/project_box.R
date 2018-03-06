project_box <- function() {
  HTML(
    paste0('<!-- Widget: user widget style 1 -->
           <div class="row">
           <div class="col-md-6">
           <div class="box box-widget widget-user-2">
           <!-- Add the bg color to the header using any of the bg-* classes -->
           <div class="widget-user-header bg-yellow">
           <div class="widget-user-image">
           <img class="img-circle" src="../dist/img/user7-128x128.jpg" alt="User Avatar">
           </div>
           <!-- /.widget-user-image -->
           <h3 class="widget-user-username">Project Title</h3>
           <h5 class="widget-user-desc">Your position</h5>
           </div>
           <div class="box-footer no-padding">
           <ul class="nav nav-stacked">


           <li>
           <a data-toggle="collapse" aria-expanded="true" href="#collapseOne">
           <p class = "text-center">Project Overview</p>
           </a>
           <div id="collapseOne" class="panel-collapse collapse in">
           <div class="box-body">
           Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
           wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
           eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla
           assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred
           nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer
           farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus
           labore sustainable VHS.
           </div>
           </div></li>


           <li><a href="#">Supervisors <span class="pull-right badge bg-aqua">5</span></a></li>
           <li><a href="#">Place/Lab <span class="pull-right badge bg-maroon">5</span></a></li>


           <li><p class = "text-center"> Main Tasks</p><table class="table table-bordered">
           <tr>
           <th style="width: 10px">#</th>
           <th>Task</th>
           <th>Progress</th>
           <th style="width: 40px">Label</th>
           </tr>
           <tr>
           <td>1.</td>
           <td>Update software</td>
           <td>
           <div class="progress progress-xs">
           <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
           </div>
           </td>
           <td><span class="badge bg-red">55%</span></td>
           </tr>
           <tr>
           <td>2.</td>
           <td>Clean database</td>
           <td>
           <div class="progress progress-xs">
           <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
           </div>
           </td>
           <td><span class="badge bg-yellow">70%</span></td>
           </tr>
           <tr>
           <td>3.</td>
           <td>Cron job running</td>
           <td>
           <div class="progress progress-xs progress-striped active">
           <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
           </div>
           </td>
           <td><span class="badge bg-light-blue">30%</span></td>
           </tr>
           <tr>
           <td>4.</td>
           <td>Fix and squish bugs</td>
           <td>
           <div class="progress progress-xs progress-striped active">
           <div class="progress-bar progress-bar-success" style="width: 90%"></div>
           </div>
           </td>
           <td><span class="badge bg-green">90%</span></td>
           </tr>
           </table></li>


           </ul>
           </div>
           </div>
           </div>
           </div>
           <!-- /.widget-user -->
           ')
  )
}
