library(shiny.router)

PAGES_PATH <- "app/pages/"
pages <- list.files(path = PAGES_PATH, pattern = ".R$")
for (page in pages) {
  page_path <- paste(PAGES_PATH, page, sep = "")
  source(page_path)
}

router_ui <- router_ui()
router <- make_router(
  route("/", root_ui, root_server),
  route("barplot", barplot_ui, barplot_server)
)
