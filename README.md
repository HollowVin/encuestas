# encuestas
App Shiny para Encuesta Cepra RES

# Instructions to run the app
1. Clone the repository
2. Open the project with RStudio.
3. Either ask me for the missing file with the data from the CEPRA-RES study, or change line 6 in `app/controllers/graph_controller.R` to point to a file of your choosing. Note that the original file is placed inside a `data` folder at the root level, so you might wanna do that too. The original file is not available by default in this repository due to privacy reasons.
4. Ensure you have [renv installed](https://github.com/rstudio/renv) first
5. If on Windows, run `renv::equip()` first. Then, on any system, just run `renv::restore()` on the R console to reproduce the environment the project was created in, with all the necessary packages. If any package fails to install even when having run `renv::equip()` on Windows, try [installing RTools](https://cran.r-project.org/bin/windows/Rtools/) if you're on Windows and try again. If it still fails on Windows or you are on some other system, see what you need to install to have the tools needed for your system to build R packages from source, since renv is most likely trying to install some packages from source and not through binaries. Unfortunately there's no easy way around this, as the [renv project itself describes in their Reproducibility section](https://rstudio.github.io/renv/articles/renv.html)
6. Run the app from RStudio, either by opening `server.R` or `ui.R` on the project root, hit the "Run App" button and you're good to go!
