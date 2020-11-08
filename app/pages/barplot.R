library(plotly)
source("services/graph.R")

barplot_ui <- fluidPage(
  titlePanel("Histograma/Gráfico de barras"),

  sidebarLayout(
    sidebarPanel(
      selectInput("mainVariable", "Columna a graficar", vector()),
      radioButtons("mainVariableType", "Tipo de dato", choices = c("Cualitativo", "Cuantitativo"), selected = "Cualitativo"),
      selectInput("secondVariable", "Columna de faceta horizontal", vector()),
      selectInput("thirdVariable", "Columna de faceta vertical", vector()),
      selectInput("fourthVariable", "Columna de rellenado de color", vector()),
      selectInput("fifthVariable", "Columna de filtrado", vector()),
      textInput("fifthVariableFilter", "Valor de filtrado"),
      width = 3
    ),

    mainPanel(
      plotlyOutput("barPlot", height = "100vh"),
      width = 9
    )
  )
)

barplot_server <- function(input, output, session) {
  emptyColumn <- "__(N/A)__"
  updateSelectizeInput(session, "mainVariable", choices = names(session$userData$data))
  updateSelectizeInput(session, "secondVariable", choices = c(emptyColumn, names(session$userData$data)))
  updateSelectizeInput(session, "thirdVariable", choices = c(emptyColumn, names(session$userData$data)))
  updateSelectizeInput(session, "fourthVariable", choices = c(emptyColumn, names(session$userData$data)))
  updateSelectizeInput(session, "fifthVariable", choices = c(emptyColumn, names(session$userData$data)))

  output$barPlot <- renderPlotly({
    x    <- session$userData$data
    qualitative <- input$mainVariableType == "Cualitativo"
    na.values <- "No sabe/No contesta"

    if (input$fifthVariable != emptyColumn && input$fourthVariable != emptyColumn && input$thirdVariable != emptyColumn && input$secondVariable != emptyColumn) {
      filter = ifelse(input$fifthVariableFilter == "", NA, input$fifthVariableFilter)
      print(filter)
      barplot.5(x, input$mainVariable, input$secondVariable, input$thirdVariable, input$fourthVariable, input$fifthVariable, filter = filter, qualitative = qualitative, na.values = na.values)
    } else if (input$fourthVariable != emptyColumn && input$thirdVariable != emptyColumn && input$secondVariable != emptyColumn) {
      barplot.4(x, input$mainVariable, input$secondVariable, input$thirdVariable, input$fourthVariable, qualitative = qualitative, na.values = na.values)
    } else if (input$thirdVariable != emptyColumn && input$secondVariable != emptyColumn) {
      barplot.3(x, input$mainVariable, input$secondVariable, input$thirdVariable, qualitative = qualitative, na.values = na.values)
    } else if (input$secondVariable != emptyColumn) {
      barplot.2(x, input$mainVariable, input$secondVariable, qualitative = qualitative, na.values = na.values)
    } else {
      barplot.1(x, input$mainVariable, qualitative = qualitative, na.values = na.values)
    }
  })
}
