# load packages
library(shiny)
library(ygdashboard)
library(shinyWidgets)
library(ggplot2)
library(purrr)
library(stringr)

# Load the template components
source("header.R")
source("sidebar.R")
source("profile_box.R")
source("about_box.R")
source("skills_box.R")
source("network_box.R")
source("project_box.R")
source("publication_box.R")
source("teaching_box.R")
source("main_box.R")
source("body.R")
source("dashboardControlbar.R")

# take random adminLTE colors (I just removed black)
col <- rep(c(
  "light-blue",
  "aqua",
  "green",
  "orange",
  "purple",
  "maroon",
  "gray",
  "teal",
  "navy",
  "red",
  "yellow"
), 10)

# images for the projects
project_images = c(
  "checklist.svg",
  "calendar.svg",
  "bulb.svg",
  "document.svg",
  "checklist-2.svg",
  "checklist-3.svg",
  "presentation.svg"
)
