source("R/modules/mini_sidebar_module.R")
source("R/modules/leaflet_map.R")
# UI Definition
geomonitoring_ui <- function(id) {
  page_fluid(
  mini_sidebar_ui("sidebar"),
  leaflet_map_ui("leaflet_map")
  
)
}
# Server (add moduleServer wrapper)
geomonitoring_server <- function(id) {
  #moduleServer(id, function(input, output, session) {
    mini_sidebar_server("sidebar")
    leaflet_map_server("leaflet_map", map_data = NULL)
  #})
}