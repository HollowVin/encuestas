require(plotly)

.barplot_ui <- fluidRow(
  tags$p(
    tags$strong("Consejo: "), 
    tags$span("Para graficar más de una variable, asegúrese 
                  de seleccionar cada variable siguiendo el
                  orden de las pestañas numeradas."),
    style = "color: gray; margin-left: 20px"
  ),
  box(
    tabBox(
      tabPanel(
        "1. Básico",
        selectInput("mainVariable", "Columna a graficar (variable principal)", vector()),
        radioButtons("mainVariableType", "Tipo de dato", choices = c("Cualitativo", "Cuantitativo"), selected = "Cualitativo"),
        textInput("bins", "Número de barras", value = "8", placeholder = "N° de barras para el histograma"),
        icon = icon("chart-bar")
      ),
      tabPanel(
        "2. Facetas",
        selectInput("secondVariable", "Columna de faceta horizontal (segunda variable)", vector()),
        selectInput("thirdVariable", "Columna de faceta vertical (tercera variable)", vector()),
        icon = icon("columns")
      ),
      tabPanel(
        "3. Color",
        selectInput("fourthVariable", "Columna de rellenado de color (cuarta variable)", vector()),
        icon = icon("palette")
      ),
      tabPanel(
        "Otros",
        selectInput("filterVariable", "Columna de filtrado", vector()),
        selectInput("filterValue", "Valor de filtrado", vector()),
        selectInput("barColor", "Paleta de color", choices = c("Magma" = "A", "Inferno" = "B", "Plasma" = "C", "Viridis" = "D", "Cividis" = "E")),
        icon = icon("cog")
      ),
      tags$p(
        tags$strong("Consejo: "), 
        tags$span("Puede guardar un gráfico generado en cualquier 
              momento si hace click con el botón derecho del ratón
              sobre el gráfico y elige la opción para guardar la 
              imagen de su navegador."),
        style = "color: gray"
      ),
      width = 12
    ),
    width = 4
  ),

  box(
    plotOutput("barPlot", height = "100vh"),
    width = 8
  )
)
