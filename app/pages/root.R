root_ui <- fluidPage(
  # Application title
  titlePanel("Analizador de Datos de Encuestas"),

  mainPanel(
    renderText(
      "Para comenzar, haga click aquí"
    ),
    
    textAreaInput(
      "dataInput", "Ingreso de datos de encuestas en formato CSV"
    )
  )
)

root_server <- function(input, output, session) {

}
