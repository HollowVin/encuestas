library(vcd)

mosaic_plot_ui <- fluidPage(
  titlePanel("Gráfico Mosaico"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "plotColumn",
        "Columna a graficar",
        vector(),
        selectize = TRUE
      ),
      radioButtons(
        "numericValues",
        "Tipo de dato",
        choices = c("Cualitativo", "Cuantitativo"),
        selected = "Cualitativo"
      ),
    ),
    
    mainPanel(
      plotOutput("mosaicPlot")
    )
  )
)
  
mosaic_plot_server <- function(input, output, session) {
  updateSelectizeInput(
    session,
    "plotColumn",
    choices = names(session$userData$data)
  )
  
  output$barPlot <- renderPlot({
    if (input$numericValues == "Cualitativo") {
      mosaic(x = session$userData$data[,input$plotColumn])
      #barplot(table(x))
    }
    else {
      hist(sapply(x, as.numeric), col = 'darkgray', border = 'white')
    }
  })
}
