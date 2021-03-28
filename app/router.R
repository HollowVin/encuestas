library(shiny.router)

PAGES_PATH <- "app/pages/"
pages <- list.files(path = PAGES_PATH, pattern = ".R$", recursive = TRUE)
for (page in pages) {
  page_path <- paste(PAGES_PATH, page, sep = "")
  source(page_path)
}

router_ui <- router_ui()
router <- make_router(
  route("/", root_ui, root_server),
  route("plots", plots_ui, plots_server)
)
