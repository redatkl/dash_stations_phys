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
      leaflet(map_data, 
              options = leafletOptions(
                worldCopyJump = TRUE,  # Prevents multiple worlds
                maxBounds = list(
                  list(-90, -180),  # Southwest corner (lat, lng)
                  list(90, 180)     # Northeast corner (lat, lng)
                ),
                maxBoundsViscosity = 1.0,  # How much to resist dragging outside bounds
                minZoom = 2,  # Minimum zoom level to prevent seeing multiple worlds
                maxZoom = 18,  # Optional: set maximum zoom level
                attributionControl = FALSE
              )) %>%
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