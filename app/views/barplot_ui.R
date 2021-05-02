.barplot_ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("mainVariable", "Columna a graficar", vector()),
      radioButtons("mainVariableType", "Tipo de dato", choices = c("Cualitativo", "Cuantitativo"), selected = "Cualitativo"),
      selectInput("filterVariable", "Columna de filtrado", vector()),
      textInput("filterValue", "Valor de filtrado"),
      selectInput("barColor", "Paleta de color", choices = c("Magma" = "A", "Inferno" = "B", "Plasma" = "C", "Viridis" = "D", "Cividis" = "E")),
      selectInput("secondVariable", "Columna de faceta horizontal", vector()),
      selectInput("thirdVariable", "Columna de faceta vertical", vector()),
      selectInput("fourthVariable", "Columna de rellenado de color", vector()),
      width = 3
    ),
    
    mainPanel(
      plotlyOutput("barPlot", height = "100vh"),
      width = 9
    )
  )
)
