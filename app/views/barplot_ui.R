require(plotly)

.barplot_ui <- fluidRow(
  box(
    tabBox(
      tabPanel(
        "1. Básico",
        selectInput("mainVariable", "Columna a graficar", vector()),
        radioButtons("mainVariableType", "Tipo de dato", choices = c("Cualitativo", "Cuantitativo"), selected = "Cualitativo"),
        textInput("bins", "Número de barras", value = "8", placeholder = "N° de barras para el histograma")
      ),
      tabPanel(
        "2. Facetas",
        selectInput("secondVariable", "Columna de faceta horizontal", vector()),
        selectInput("thirdVariable", "Columna de faceta vertical", vector())
      ),
      tabPanel(
        "3. Color",
        selectInput("fourthVariable", "Columna de rellenado de color", vector())
      ),
      tabPanel(
        "Otros",
        selectInput("filterVariable", "Columna de filtrado", vector()),
        textInput("filterValue", "Valor de filtrado"),
        selectInput("barColor", "Paleta de color", choices = c("Magma" = "A", "Inferno" = "B", "Plasma" = "C", "Viridis" = "D", "Cividis" = "E"))
      ),
      tags$p(
        tags$strong("Consejo: "), 
        tags$span("Para graficar más de una variable, asegúrese 
                  de seleccionar cada variable siguiendo el
                  orden de las pestañas numeradas."),
        style = "color: gray"
      ),
      width = 12
    ),
    width = 4
  ),

  box(
    plotlyOutput("barPlot", height = "100vh"),
    width = 8
  )
)
