.mosaic_plot_ui <- fluidPage(
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
