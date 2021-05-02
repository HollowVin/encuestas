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
  
  output$tableData <- renderDataTable({values$data})
  
  emptyColumn <- "__(N/A)__"
  
  observeEvent(values$data, {
    updateSelectizeInput(session, "mainVariable", choices = names(values$data))
    updateSelectizeInput(session, "secondVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "thirdVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "fourthVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "filterVariable", choices = c(emptyColumn, names(values$data)))
    updateSelectizeInput(session, "mosaicFirstVariable", choices = names(values$data))
    updateSelectizeInput(session, "mosaicSecondVariable", choices = names(values$data))
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
  
  output$mosaicPlot <- renderPlot({
    x <- values$data
    na.values <- "No sabe/No contesta"
    req(input$mosaicFirstVariable, input$mosaicSecondVariable)
    
    mosaic.plot(x, input$mosaicFirstVariable, input$mosaicSecondVariable, na.values = na.values)
  })
}
