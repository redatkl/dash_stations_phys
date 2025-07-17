# climate_panel_module.R

# climate panel ui function
climate_panel_ui <- function(id) {
  ns <- NS(id)
  
    tagList(
      radioButtons(NS(id, "climate_source"),
        label = " ",
        choices = list(
          "Précipitations" = "precip",
          "Indices" = "index"
        ),
        selected = "precip"
      ),
        
        conditionalPanel(
          condition = paste0("input['", ns("climate_source"), "'] == 'precip'"),
          radioButtons(NS(id, "precip_source"),
                       label = "Source de données",
                       choices = list(
                         "Stations physiques" = "stations_physiques",
                         "Stations virtuelles" = "stations_virtuelles",
                         "Précipitations satellite (CHIRPS)" = "chirps"
                       ),
                       selected = "stations_physiques"),
        ),
        
      selectInput(
        inputId = ns("climate_type"),
        label = "Type d'indice climatique:",
        choices = list(
          "Température" = "temperature",
          "Précipitation" = "precipitation",
          "Humidité" = "humidity",
          "Évapotranspiration" = "evapotranspiration"
        ),
        selected = "temperature"
      ),
      
      actionButton(
        inputId = ns("apply_climate"),
        label = "Appliquer",
        class = "btn-primary",
        style = "width: 100%;"
      )
  )
}

# climate panel server function 
climate_panel_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Server logic for the climate panel
  ns <- session$ns
  
  })
}