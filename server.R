#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(readxl)
source("app/router.R")

shinyServer(function(input, output, session) {
    router(input, output, session)
    session$userData$data <- read_excel("data/RESULTADOS ENCUESTA A PADRES.xlsx")
})
