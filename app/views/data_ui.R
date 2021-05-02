.data_ui <- fluidPage(
  useShinyFeedback(),
  fluidRow(
    tags$p(
      tags$strong("Nota: "),
      tags$span("La aplicación ya cuenta con datos de la encuesta CEPRA RES. Si desea usar sus propios datos, puede subir un archivo con el siguiente botón")
    )
  ),
  fluidRow(
    column(3, fileInput("file", "Subir datos", accept = c(".csv", ".xls", ".xlsx"), buttonLabel = "Elegir archivo...")),
    column(4, actionButton("reset", "Volver a datos de CEPRA-RES", class = "btn-warning float-left", style = "margin-top: 25px")),
  ),
  fluidRow(
    valueBoxOutput("columnCount"),
    valueBoxOutput("rowCount")
  ),
  tags$label("Visualización de datos actuales"),
  dataTableOutput("tableData"),
)
