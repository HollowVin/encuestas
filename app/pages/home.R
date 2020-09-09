library(shiny.router)

page <- function(title, content) {
  div(
    titlePanel(title),
    p(content)
  )
}

home_page <- page("Home page", "Hello World")

home_server <- function(input, output, session) {
  
}
