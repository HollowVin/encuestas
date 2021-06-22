library(readxl)
library(readr)
library(plotly)
library(shinyFeedback)

.data_file_name <- "data/Datos Concatenados.xlsx"

graph_controller <- function(input, output, session) {
  values <- reactiveValues(
    data = read_excel(.data_file_name)
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
    values$data <- read_excel(.data_file_name)
  })
  
  observeEvent(input$mainVariableType, {
    toggleState("bins", condition = input$mainVariableType == "Cuantitativo")
  })
  
  observeEvent(input$filterVariable, {
    if (input$filterVariable == "__(N/A)__") {
      updateSelectizeInput(session, "filterValue", choices = vector())
    } else {
      updateSelectizeInput(session, "filterValue", choices = values$data[[input$filterVariable]])
    }
  })
  
  output$tableData <- renderDataTable({values$data})
  
  emptyColumn <- "__(N/A)__"
  
  observeEvent(values$data, {
    output$columnCount <- renderValueBox( {valueBox(ncol(values$data), "Columnas", width = 1, icon = icon("columns"))} )
    output$rowCount <- renderValueBox( {valueBox(nrow(values$data), "Filas", width = 1, color = "yellow", icon = icon("th-list", lib = "glyphicon"))} )
    updateSelectizeInput(session, "mainVariable", choices = names(values$data))
    updateSelectizeInput(session, "secondVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "thirdVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "fourthVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "filterVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "mosaicFirstVariable", choices = names(values$data))
    updateSelectizeInput(session, "mosaicSecondVariable", choices = names(values$data))
  })
  
  output$barPlot <- renderPlot({
    x <- values$data
    qualitative <- input$mainVariableType == "Cualitativo"
    if (!qualitative) {
      condition <- strtoi(input$bins) > 0
      feedbackWarning("bins", is.na(condition) || !condition, "Por favor ingrese un valor numérico mayor a 0")
      req(condition)
    }

    bins <- strtoi(input$bins)
    na.values <- "No sabe/No contesta"
    filter_variable <- ifelse(input$filterVariable != emptyColumn, input$filterVariable, NA)
    filter_value <- ifelse(input$filterValue != "", input$filterValue, NA)
    
    if (input$fourthVariable != emptyColumn && input$thirdVariable != emptyColumn && input$secondVariable != emptyColumn) {
      barplot.4(x, input$mainVariable, input$secondVariable, input$thirdVariable, input$fourthVariable, qualitative = qualitative, bins = bins, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    } else if (input$thirdVariable != emptyColumn && input$secondVariable != emptyColumn) {
      barplot.3(x, input$mainVariable, input$secondVariable, input$thirdVariable, qualitative = qualitative, bins = bins, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    } else if (input$secondVariable != emptyColumn) {
      barplot.2(x, input$mainVariable, input$secondVariable, qualitative = qualitative, bins = bins, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    } else {
      barplot.1(x, input$mainVariable, qualitative = qualitative, bins = bins, filter_variable = filter_variable, filter_value = filter_value, na.values = na.values, color = input$barColor)
    }
  })
  
  output$mosaicPlot <- renderPlot({
    x <- values$data
    na.values <- "No sabe/No contesta"
    req(input$mosaicFirstVariable, input$mosaicSecondVariable)
    
    mosaic.plot(x, input$mosaicFirstVariable, input$mosaicSecondVariable, na.values = na.values)
  })
}
