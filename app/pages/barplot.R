barplot_ui <- fluidPage(
  titlePanel("Histograma/Gráfico de barras"),

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
        "Tipo de valores de la columna",
        choices = c("Nominales", "Numericos"),
        selected = "Nominales"
      ),
    ),

    mainPanel(
      plotOutput("barPlot")
    )
  )
)

barplot_server <- function(input, output, session) {
  updateSelectizeInput(
    session,
    "plotColumn",
    choices = names(session$userData$data)
  )

  output$barPlot <- renderPlot({
    x    <- session$userData$data[,input$plotColumn]

    if (input$numericValues == "Nominales") {
      barplot(table(x))
    }
    else {
      hist(sapply(x, as.numeric), col = 'darkgray', border = 'white')
    }
  })
}
