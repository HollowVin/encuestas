library(shinyFeedback)

.data_ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  useShinyFeedback(),
  titlePanel("Manejo de datos"),
  fluidRow(
    tags$p("La aplicación ya cuenta con datos de la encuesta CEPRA RES. Si desea usar sus propios datos, puede subir un archivo con el siguiente botón", style = "padding-left: 15px"),
  ),
  fluidRow(
    column(3, fileInput("file", "Subir datos", accept = c(".csv", ".xls", ".xlsx"), buttonLabel = "Elegir archivo...")),
    column(4, actionButton("reset", "Volver a datos de CEPRA-RES", class = "btn-warning float-left", style = "margin-top: 25px")),
  ),
  tags$label("Visualización de datos actuales"),
  tableOutput("tableData"),
)

.barplot_tab_ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  titlePanel("Histograma/Gráfico de barras"),
  
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

.mosaic_plot_ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  titlePanel("GrÃ¡fico de mosaico"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("mosaicFirstVariable", "Primera variable", vector()),
      selectInput("mosaicSecondVariable", "Segunda variable", vector()),
      tags$p(
        tags$strong("Interpretación del mosaico: "), 
        tags$span("El tamaño de los cuadros es proporcional 
          al número de registros. Los cuadros coloreados en azul significan 
          que contienen más registros que los esperados bajo la hipótesis nula 
          de independencia. Los cuadros en rojo significan que han habido menos 
          registros que los esperados. Es decir, los cuadros coloredos muestran 
          asociaciones o dependiencias (positivas o negativas) entre las 
          categorías."),
        style = "color: gray"
      ),
      tags$br(),
      tags$p("En este caso, las categorías Caminando, Buseta Escolar, Bus Escolar y 
        Bus Público, son dependientes de la ciudad de Cuenca e Ibarra. Es decir, 
        para Cuenca, se observa una asociación positiva entre las categorías 
        Caminando y Buseta Escolar y negataiva con bus público. Mientras que 
        para Ibarra, se observa una asociación postiva con Bus Público y 
        negativa con Caminando.", style = "color: gray")
    ),
    
    mainPanel(
      plotOutput("mosaicPlot", height = "100vh"),
    )
  )
)

plots_ui <- navbarPage(
  "Datos y graficación",
  tabPanel("Datos", .data_ui),
  tabPanel("Barplot", .barplot_tab_ui),
  tabPanel("Mosaic Plot", .mosaic_plot_ui)
)
