# encuestas
App Shiny para Encuesta Cepra RES

# Instructions to run the app
1. Clone the repository
2. Open the project with RStudio.
3. Either ask me for the missing file with the data from the CEPRA-RES study, or change line 6 in `app/controllers/graph_controller.R` to point to a file of your choosing. Note that the original file is placed inside a `data` folder at the root level, so you might wanna do that too. The original file is not available by default in this repository due to privacy reasons.
4. Run renv restore. You can either do this through RStudio with an option on the lower right navigation panel, or just run renv::restore() in the console. If this fails, install renv through RStudio first.
5. Run the app and have fun!
