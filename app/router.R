library(shiny.router)

source("app/pages/root.R")
source("app/pages/home.R")

router_ui <- router_ui()

router <- make_router(
  route("/", root_page, root_server),
  route("home", home_page, home_server)
)
