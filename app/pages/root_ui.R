.about_project_ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  h2("Proyecto de titulación"),
  tags$p(
    tags$strong("Autor: "),
    tags$span("Juan Corral"),
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
    href = "", alt = "placeholder UDA"
  ),
)

.about_cepra_ui <- fluidPage(
  h2("Proyecto de CEPRA-RES"),
  "Evaluación de entornos urbanos peatonales para la identificación de rutas escolares seguras en ciudades intermedias del Ecuador, 2020.",
  
  h2("Financiadores"),
  tags$ul(
    tags$li("Corporación Ecuatoriana para el Desarrollo de la Investigación y la Academia (CEDIA)"),
    tags$li("Universidad de Cuenca"),
    tags$li("Universidad del Azuay"),
    tags$li("Pontificia Universidad Católica del Ecuador Sede Ibarra")
  ),
    
  h2("Investigadores"),
  h3("Universidad de Cuenca"),
  tags$ul(
    tags$li("Daniel Augusto Orellana Vintimilla `daniel.orellana@ucuenca.edu.ec`"),
    tags$li("Adriana Eulalia Quezada Larriva `adriana.quezada@ucuenca.edu.ec`"),
    tags$li("Andrea Daniela Cobo Torres  `daniela.cobot@ucuenca.edu.ec`"),
    tags$li("Javier Andrés García Galarza  `jgarcia@ubicacuenca.com`"),
    tags$li("Joseline Gabriela Carrión Astudillo `gabriela.carrion@ucuenca.edu.ec`"),
    tags$li("Camila Mariana Pérez Calle  `camila.perez@ucuenca.edu.ec`")
  ),
    
  h3("Universidad del Azuay"),
  tags$ul(
    tags$li("Carla Marcela Hermida Palacios  `chermida@uazuay.edu.ec`"),
    tags$li("Daniela Elisabet Ballari `dballari@uazuay.edu.ec`"),
    tags$li("Gabriela Lituma `mlitumapau@es.uazuay.edu.ec`"),
    tags$li("Jaime Andrés Peña Rosas `jmepr@es.uazuay.edu.ec`"),
    tags$li("Francisco David Salgado Castillo  `fdsalgado@uazuay.edu.ec`")
  ),
    
  h3("Pontificia Universidad Católica del Ecuador Sede Ibarra"),
  tags$ul(
    tags$li("Jorge Javier Andrade Benítez  `jjandrade@pucesi.edu.ec`"),
    tags$li("Mónica Gabriela Naranjo Serrano  `mgnaranjo@puce.edu.ec`"),
    tags$li("María José Valdospinos Carvajal `mariajosevaldospinos@gmail.com`"),
    tags$li("Iveth Alejandra Ortega Pérez;  Pontificia Universidad Católica del Ecuador Sede Ibarra; `ivethortega2016@gmail.com`"),
    tags$li("Álvaro Sebastián Galarza Bastidas `asgalarza1@pucesi.edu.ec`")
  ),
    
  h2("Descripción de instrumento cuantitativo a padres"),
  "Encuesta a padre/madre o representante legal: La encuesta se aplicó al grupo de padres o madres o representantes legales de niños(as) de 7mo año de educación básica (entre 10 y 12 aÃ±os) de las escuelas seleccionadas para los casos de estudio. Previamente a la aplicación se realizará una explicación del proyecto y se solicitará el consentimiento informado. Para la selección y diseño del instrumento se realizó una revisión de literatura en la que se identificaron las variables relacionadas con la movilidad activa de niños - de 9 a 12 años- a la escuela y la influencia de los padres en el modo de transporte de los niños. Como resultado se identificó el Cuestionario de familias del proyecto Pedalea y Anda al COle (PACO) el cual fue adaptado, ajustado y validado para las ciudades de Cuenca e Ibarra (Ecuador). Se realizó una validación transcultural, la revisión de temas y preguntas por un grupo de expertos, y el desarrollo de pruebas piloto.  La experticia de los revisores se enfoca en el estudio del entorno construido, la movilidad activa y psicología infantil. La revisión de expertos contribuyó en: i) identificar la pertinencia de los temas y las variables que incluye el cuestionario, ii) identificar los temas y variables que se considere relevante incluir para el contexto del estudio, y iii) estructurar las preguntas y definir contenidos que garanticen que la guía aplicada sea adecuada para los participantes. Una vez realizados los ajustes recomendados por los expertos, el cuestionario guía se aplicó a padres de familia que no formarán parte del estudio con el propósito de determinar la claridad del instrumento y realizar los ajustes finales a la encuesta que finalmente fue revisada nuevamente por el grupo de expertos.",

  h2("Fecha de aplicación del instrumento"),
  "Febrero/Marzo 2020",

  h2("Escuelas participantes"),
  h3("Cuenca"),
  tags$ul(
    tags$li("Luis Cordero"),
    tags$li("Nicolás Sojos"),
    tags$li("Isabel Moscoso")
  ),
  
  h3("Ibarra"),
  tags$ul(
    tags$li("Agustín Cueva"),
    tags$li("Ana Luisa Leoro"),
    tags$li("Velasco Ibarra")
  )
)

root_ui <- navbarPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  "Analizador de Datos de Encuestas",
  tabPanel("Acerca de este proyecto", .about_project_ui),
  tabPanel("Acerca De CEPRA-RES", .about_cepra_ui),
  tabPanel("Gráficos", a("Gráficos", href = route_link("plots"))
  )
)
