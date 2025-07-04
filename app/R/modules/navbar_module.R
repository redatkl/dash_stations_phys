# navbar_module.R

# ui element
navbar_ui <- function(id) {
  ns <- NS(id)
  # div for the navbar
  div(class = "navbar",
      div(
        class = "navbar-left",
        h3("Observatoire de la sécheresse", class = "navbar-title")
      ),
      
      # Right side - Controls and status
      div(
        class = "navbar-right",
        
        actionButton(
          inputId = ns("acceuil_tab"),
          label = "Acceuil",
          class = "nav-tab"
        ),
        
        actionButton(
          inputId = ns("geomonitoring_tab"),
          label = "Geomonitoring",
          class = "nav-tab active"  # Active by default
        ),
        
        actionButton(
          inputId = ns("reporting_tab"),
          label = "Reporting",
          class = "nav-tab"
        )
      ),
      
      # Right side - Status/controls (optional)
      div(
        class = "navbar-right",
        span(id = ns("current_page"), "Geomonitoring", class = "current-page")
      )
  )
}



# server logic
navbar_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # Track active tab
    active_tab <- reactiveVal("geomonitoring")
    
    # Handle tab clicks
    observeEvent(input$acceuil_tab, {
      active_tab("acceuil")
      update_active_tab("acceuil")
    })
    
    observeEvent(input$geomonitoring_tab, {
      active_tab("geomonitoring")
      update_active_tab("geomonitoring")
    })
    
    observeEvent(input$reporting_tab, {
      active_tab("reporting")
      update_active_tab("reporting")
    })
    
    # Function to update active tab styling
    update_active_tab <- function(tab_name) {
      # Remove active class from all tabs
      shinyjs::removeClass("acceuil_tab", "active")
      shinyjs::removeClass("geomonitoring_tab", "active")
      shinyjs::removeClass("reporting_tab", "active")
      
      # Add active class to clicked tab
      shinyjs::addClass(paste0(tab_name, "_tab"), "active")
      
      # Update current page display
      tab_labels <- list(
        "acceuil" = "Acceuil",
        "geomonitoring" = "Geomonitoring", 
        "reporting" = "Reporting"
      )
      
      session$sendCustomMessage("updateText", 
                                list(id = session$ns("current_page"), text = tab_labels[[tab_name]]))
    }
    
    # Return active tab for other modules to use
    return(
      list(
        active_tab = active_tab
      )
    )
    
  })
}