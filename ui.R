#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

VIEWS_PATH <- "app/views/"
views <- list.files(path = VIEWS_PATH, pattern = "_ui.R$", recursive = TRUE)
for (view in views) {
  view_path <- paste(VIEWS_PATH, view, sep = "")
  source(view_path)
}

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Analizador de Datos de Encuestas"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Inicio", tabName = "home", icon = icon("home")),
        menuItem("Datos", tabName = "data", icon = icon("database")),
        menuItem("Gráfico Barras", tabName = "bars", icon = icon("chart-bar")),
        menuItem("Gráfico Mosaico", tabName = "mosaic", icon = icon("table")),
        menuItem("Acerca del proyecto", tabName = "project", icon = icon("book")),
        menuItem("Acerca De CEPRA-RES", tabName = "cepra", icon = icon("id-card"))
      )
    ),
    dashboardBody(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "table.css")
      ),
      tabItems(
        tabItem(tabName = "home", "Test"),
        tabItem(tabName = "data", .data_ui),
        tabItem(tabName = "bars", .barplot_ui),
        tabItem(tabName = "mosaic", .mosaic_plot_ui),
        tabItem(tabName = "project", .about_project_ui),
        tabItem(tabName = "cepra", .about_cepra_ui)
      )
    )
  )
)
