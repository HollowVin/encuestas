.mosaic_plot_ui <- fluidRow(
  box(
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
    tags$p(
      tags$strong("Ejemplo: "),
      tags$span("Con los datos de CEPRA-RES, seleccione como primera variable
      la de 'Escuela', y como segunda la variable '12. ¿Cuánto tarda 
      habitualmente su hijo/a en llegar a la escuela, desde que sale de casa?'. 
      Aquí, las categorías Entre 5 y 15 minutos, y Entre 30 y 60 minutos 
      son dependientes de las escuelas Luisa Leor y Velasco Ibarra. 
      Es decir, para Luisa Leor, se observa una asociación positiva con las 
      categorías Entre 30 y 60 mins. y negativa con Entre 15 y 30 minutos."),
      style = "color: gray"
    ),
    width = 4
  ),
  
  box(
    plotOutput("mosaicPlot", height = "100vh"),
    width = 8
  )
)
