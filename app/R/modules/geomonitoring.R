source("R/modules/mini_sidebar_module.R")
# UI Definition
geomonitoring_ui <- function(id) {
  page_fluid(

  mini_sidebar_ui("sidebar")
)
}
# Server (add moduleServer wrapper)
geomonitoring_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    mini_sidebar_server("sidebar")
  })
}