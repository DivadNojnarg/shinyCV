# shinyCV

- http://ionicabizau.github.io/github-calendar/example/ (integrate Github activity to the CV)
- https://adminlte.io/themes/AdminLTE ( main theme)


This package uses 2 shiny apps to build awesome CVs based on the AdminLTE2 template.
Launch the builder by using:

```{r}
library(shinyCV)
build_shinyCV()
```

Fill the form to build your cv step by step and save the current state at any time.
Indeed, it may take some time to fill it properly. If you reload your app, it will
be launched in the previous state.
The saved files are stored in a "data_cv.rds" as well as in the 
"Publication_img_saved" and "Profile_img_saved" folders. From the R console,
you can navigate to the cv_builder directory of this package:

```{r}
setwd("/Library/Frameworks/R.framework/Versions/3.3/Resources/library/shinyCV/App/cv_builder/www/")
list.files()
```

Be **careful** to replace "/Library/Frameworks/R.framework/Versions/3.3/Resources" by
the location where your packages are installed (which may not be the same as mine).

At any time, you can preview your cv by running the dedicated function:

```{r}
view_shinyCV()
```

which will launch the previously built CV in a showcase mode. The function
view_shinyCV starts by copying the generated files by build_shinyCV into its own
directory.

```{r}
setwd("/Library/Frameworks/R.framework/Versions/3.3/Resources/library/shinyCV/App/cv_viewer/www/")
list.files()
```

Each time this package is reinstalled for any reason (update, ...), 
the CV datas are unfortunately **erased**. Therefore, it means that
for the moment, you should make a copy of the generated datas ("data_cv.rds" as well as in the 
"Publication_img_saved" and "Profile_img_saved") to a safe folder and copy them
to your newly installed shinyCV so that you can restart your CV from the last 
saved state, without loosing all your work.

Below are some preview pictures of the builder mode:
![Right sidebar options](inst/images/shinyCV_preview_1.png) <br/>


![Left sidebar options](inst/images/shinyCV_options.png) <br/>


![Timeline Overview](inst/images/shinyCV_timeline.png) <br/>


![Projects overview](inst/images/shinyCV_projects.png) <br/>


![Projects overview](inst/images/shinyCV_projects2.png) <br/>


![Teaching overview](inst/images/shinyCV_teaching.png) <br/>

