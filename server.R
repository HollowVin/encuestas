#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("services/graph.R")

CONTROLLERS_PATH <- "app/controllers/"
controllers <- list.files(path = CONTROLLERS_PATH, pattern = "_controller.R$", recursive = TRUE)
for (controller in controllers) {
  controller_path <- paste(CONTROLLERS_PATH, controller, sep = "")
  source(controller_path)
}

shinyServer(function(input, output, session) {
  graph_controller(input, output, session)
})
