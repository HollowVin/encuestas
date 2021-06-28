.faq_ui <- fluidPage(
  id = "aboutProjectPage",
  h2("Preguntas Frecuentes"),
  tags$p(
    tags$strong("¿Qué tipo de datos puedo subir a la aplicación?"),
    tags$p("Se pueden subir datos que se encuentren tabulados en formato .csv o 
           en formato .xlsx (Excel).")
  ),
  tags$p(
    tags$strong("¿Cómo puedo previsualizar los datos subidos?"),
    tags$p("Los datos subidos se pueden previsualizar para asegurarse que 
           contienen la información esperada en la pestaña Datos, al ver 
           la tabla que se encuentra en la parte inferior de dicha pestaña. 
           Esta tabla contiene los datos en forma paginada, y permite realizar 
           búsquedas por columna por medio del campo de texto disponible debajo 
           de cada columna de la tabla. Por ejemplo, si se desea encontrar si 
           una columna tiene un cierto valor, basta digitar dicho valor en el 
           campo de texto de la columna para realizar un filtrado y saber 
           si se encuentra o no en la tabla de datos.")
  ),
  tags$p(
    tags$strong("¿Cómo realizo un análisis de múltiples variables en los gráficos de barras?"),
    tags$p("El campo de 'Columna a graficar' es donde se elige la variable 
           que se representará siempre como las alturas de las barras (las 
           frecuencias) en los gráficos. Para realizar análisis de múltiples 
           variables en base a la variable principal elegida como frecuencias, 
           debe seguirse el orden de las pestañas numeradas.")
  ),
  tags$p(
    tags$strong("Quiero realizar un análisis de múltiples variables pero los gráficos no cambian. ¿Qué está mal?"),
    tags$p("Los gráficos de barras e histogramas siguen un orden. Primero, se 
           elige la variable principal en la pestaña '1. Básico'. Luego, 
           se eligen las variables de facetas horizontal y vertical, en ese orden, 
           dentro de la pestaña '2. Facetas'. Finalmente, se elige la variable 
           de rellenado de color en la pestaña '3. Color' si anteriormente 
           se han elegido las variables de facetas. En otras palabras, el gráfico 
           no cambia si se intenta elegir una columna '3. Color' pero antes no 
           se han seleccionado ambas variables de facetas. Similarmente, la columna 
           de faceta vertical tampoco tendrá efecto si no se tiene una columna seleccionada 
           en la columna de faceta horizontal. Es importante siempre seguir el orden 
           de graficación para obtener los resultados deseados.")
  ),
  tags$p(
    tags$strong("Realicé un gráfico de mosaico pero no tengo familiarización con este tipo de gráficos. ¿Cómo puedo interpretarlo?"),
    tags$p("La pestaña de gráficos de mosaico incluye ya, en la parte inferior 
           de donde se escogen las columnas a graficar, una explicación breve 
           sobre qué son los gráficos de mosaico y qué representan, así como 
           un ejemplo que utiliza los datos de CEPRA-RES que se puede seguir paso 
           a paso para generar un gráfico de mosaico con los distintos tipos de 
           asociaciones. Si entender los gráficos de mosaico aún resulta difícil 
           luego de leer estas explicaciones, puede leer la información contenida 
           en el siguiente sitio web externo (nota: la información se encuentra 
           en inglés):"),
    tags$a("UNDERSTANDING AREA BASED PLOTS: MOSAIC PLOTS", href = "http://www.theusrus.de/blog/understanding-mosaic-plots/")
  )
)
