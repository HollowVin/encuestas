.about_project_ui <- fluidPage(
  id = "aboutProjectPage",
  h2("Proyecto de titulación"),
  tags$p(
    tags$strong("Autor: "),
    tags$span("Ana Corral"),
  ),
  tags$p(
    tags$strong("Directora de tesis: "),
    tags$span("Agrim. Daniela Elisabet Ballari")
  ),
  tags$p(
    tags$strong("Tribunal de tesis: "),
    tags$span("Ing. Andrés Patiño León e Ing. Chester Sellers Walden"),
  ),
  tags$p(
    "El proyecto de Análisis y desarrollo de aplicación web para el análisis estadístico de
     datos de encuestas es un proyecto realizado como trabajo de graduación para la
     carrera de Ingeniería de Sistemas y Telemática en la Universidad del Azuay."
  ),
  tags$img(
    src = "assets/uda.jpg", alt = "placeholder UDA", width = "300px"
  )
)
