.home_ui <- fluidPage(
  id = "homePage",
  fluidRow(
    h1("Análisis estadístico de datos de encuestas tabuladas"),
    tags$p("Use su propio archivo de datos Excel o CSV para generar gráficos 
           estadísticos y generar información de forma ágil, sencilla e 
           intuitiva"),
    tags$img(src = "assets/example.png", alt = "Example Graph", width = 380, id = "exampleImg")
  ),
  fluidRow(
    actionButton("dataButton", "Subir Datos", class = "btn-primary"),
    actionButton("barplotButton", "Ver Gráfico de Barras", class = "btn-primary"),
    actionButton("mosaicButton", "Ver Gráfico de Mosaico", class = "btn-primary")
  ),
  fluidRow(
    id = "aboutLinks",
    actionLink("aboutProjectLink", "Acerca del Proyecto"),
    span(" | "),
    actionLink("aboutCepraLink", "Acerca de CEPRA-RES")
  )
)
