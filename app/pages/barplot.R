library(plotly)
library(readxl)
library(readr)
library(shinyFeedback)
source("services/graph.R")

.data_ui <- fluidPage(
  useShinyFeedback(),
  "La aplicación ya cuenta con datos de la encuesta CEPRA RES.",
  "Si desea usar sus propios datos, puede subir un archivo con el siguiente boton",
  fileInput("file", "Subir datos", accept = c(".csv", ".xls", ".xlsx"), buttonLabel = "Elegir archivo..."),
  actionButton("reset", "Volver a datos de CEPRA-RES"),
  tableOutput("tableData"),
)

.barplot_tab_ui <- fluidPage(
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

barplot_ui <- navbarPage(
  "Datos y graficacion",
  tabPanel("Datos", .data_ui),
  tabPanel("Barplot", .barplot_tab_ui)
)

barplot_server <- function(input, output, session) {
  values <- reactiveValues(data = read_excel("data/RESULTADOS ENCUESTA A PADRES.xlsx"))
  
  observeEvent(input$file, {
    path <- input$file$datapath
    extension <- tools::file_ext(path)
    condition <- extension == "csv" || extension == "xls" || extension == "xlsx"
    feedbackWarning("file", !condition, "Please upload a .csv, .xls or .xlsx file")
    req(condition)
    values$data <- read_csv(path)
  })
  
  observeEvent(input$reset, {
    values$data <- read_excel("data/RESULTADOS ENCUESTA A PADRES.xlsx")
  })

  output$tableData <- renderTable({values$data}, striped = TRUE, hover = TRUE, bordered = TRUE, spacing = "xs", width = "100%")
  
  emptyColumn <- "__(N/A)__"
  test <- function(){
    updateSelectizeInput(session, "mainVariable", choices = names(values$data))
    updateSelectizeInput(session, "secondVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "thirdVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "fourthVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "fifthVariable", choices = c(emptyColumn, names(values$data)))
  }

  output$barPlot <- renderPlotly({
    test()
    x <- values$data
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
