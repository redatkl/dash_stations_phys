#leaflet_map.R

# leaflet ui
leaflet_map_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
    leafletOutput(ns("map"), height = "85%", width = "92%"),

    # Add a div for the legend
    div(
      id = ns("legend"),
      class = "leaflet-legend"
    )
  )
}


# leaflet map server
leaflet_map_server <- function(id, map_data) {
  moduleServer(id, function(input, output, session) {
    
    output$map <- renderLeaflet({
      leaflet(map_data) %>%
        addProviderTiles(providers$Esri.WorldImagery)%>%
        addProviderTiles(providers$CartoDB.VoyagerOnlyLabels)%>%
        setView(lng = -6.87, lat = 29 , zoom = 5)  # Adjust initial view as needed
    })
    
    # Add legend if needed
    output$legend <- renderUI({
      tags$div(
        class = "leaflet-legend-content",
        "Legend content goes here"
      )
    })
    
  })
}