home_controller <- function(input, output, session) {
  observeEvent(input$dataButton, {
    updateTabItems(session, "tabs", "data")
  })
  
  observeEvent(input$barplotButton, {
    updateTabItems(session, "tabs", "bars")
  })
  
  observeEvent(input$mosaicButton, {
    updateTabItems(session, "tabs", "mosaic")
  })
  
  observeEvent(input$aboutProjectLink, {
    updateTabItems(session, "tabs", "project")
  })
  
  observeEvent(input$aboutCepraLink, {
    updateTabItems(session, "tabs", "cepra")
  })
}
