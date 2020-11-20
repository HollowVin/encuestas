library(plotly)
library(readxl)
library(readr)
library(shinyFeedback)
source("services/graph.R")

.data_ui <- fluidPage(
  useShinyFeedback(),
  titlePanel("Manejo de datos"),
  fluidRow(
    tags$p("La aplicación ya cuenta con datos de la encuesta CEPRA RES. Si desea usar sus propios datos, puede subir un archivo con el siguiente boton", style = "padding-left: 15px"),
  ),
  fluidRow(
    column(3, fileInput("file", "Subir datos", accept = c(".csv", ".xls", ".xlsx"), buttonLabel = "Elegir archivo...")),
    column(4, actionButton("reset", "Volver a datos de CEPRA-RES", class = "btn-warning float-left", style = "margin-top: 25px")),
  ),
  tags$label("Visualización de datos actuales"),
  tableOutput("tableData"),
)

.barplot_tab_ui <- fluidPage(
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
  titlePanel("Gráfico de mosaico"),
  
  sidebarLayout(
    sidebarPanel(),
    
    mainPanel(
      plotlyOutput("mosaicPlot", height = "100vh"),
      width = 9
    )
  )
)

plots_ui <- navbarPage(
  "Datos y graficacion",
  tabPanel("Datos", .data_ui),
  tabPanel("Barplot", .barplot_tab_ui),
  tabPanel("Mosaic Plot", .mosaic_plot_ui)
)

plots_server <- function(input, output, session) {
  values <- reactiveValues(
    data = read_excel("data/RESULTADOS ENCUESTA A PADRES.xlsx")
  )
  
  observeEvent(input$file, {
    path <- input$file$datapath
    extension <- tools::file_ext(path)
    condition <- extension == "csv" || extension == "xls" || extension == "xlsx"
    feedbackWarning("file", !condition, "Please upload a .csv, .xls or .xlsx file")
    req(condition)
    
    ifelse(extension == "csv", values$data <- read_csv(path), values$data <- read_excel(path))
  })
  
  observeEvent(input$reset, {
    values$data <- read_excel("data/RESULTADOS ENCUESTA A PADRES.xlsx")
  })

  output$tableData <- renderTable({values$data}, striped = TRUE, hover = TRUE, bordered = TRUE, spacing = "xs", width = "100%")
  
  emptyColumn <- "__(N/A)__"
  
  observeEvent(values$data, {
    updateSelectizeInput(session, "mainVariable", choices = names(values$data))
    updateSelectizeInput(session, "secondVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "thirdVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "fourthVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "filterVariable", choices = c(emptyColumn, names(values$data)))
  })

  output$barPlot <- renderPlotly({
    x <- values$data
    qualitative <- input$mainVariableType == "Cualitativo"
    na.values <- "No sabe/No contesta"
    filter_variable <- ifelse(input$filterVariable != emptyColumn, input$filterVariable, NA)
    filter_value <- ifelse(input$filterValue != "", input$filterValue, NA)

    if (input$fourthVariable != emptyColumn && input$thirdVariable != emptyColumn && input$secondVariable != emptyColumn) {
      barplot.4(x, input$mainVariable, input$secondVariable, input$thirdVariable, input$fourthVariable, qualitative = qualitative, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    } else if (input$thirdVariable != emptyColumn && input$secondVariable != emptyColumn) {
      barplot.3(x, input$mainVariable, input$secondVariable, input$thirdVariable, qualitative = qualitative, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    } else if (input$secondVariable != emptyColumn) {
      barplot.2(x, input$mainVariable, input$secondVariable, qualitative = qualitative, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    } else {
      barplot.1(x, input$mainVariable, qualitative = qualitative, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    }
  })
}
