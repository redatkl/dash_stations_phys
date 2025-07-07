# mini_sidebar_module.R

mini_sidebar_ui <- function(id) {
  ns <- NS(id)
  
  tagList(
  # Just a simple div to start
  div(
    class = "mini-sidebar-container",
    # Just one icon for now
    actionButton(
      inputId = ns("climate_icon"),
      label = icon("cloud"),
      class = "sidebar-icon",
      title = "Indices Climat"
    ),
    actionButton(
      inputId = ns("vegetation_icon"),
      label = icon("leaf"),
      class = "sidebar-icon",
      title = "Indices de Végétation"
    ), 
    actionButton(
      inputId = ns("soil_icon"),
      label = icon("earth"),
      class = "sidebar-icon",
      title = "Indices de Sol"
    ),
    actionButton(
      inputId = ns("water_icon"),
      label = icon("droplet"),
      class = "sidebar-icon",
      title = "Indices d'Eau"
    ),
    actionButton(
      inputId = ns("composite_icon"),
      label = icon("layer-group"),
      class = "sidebar-icon",
      title = "Indices Combinés"
    )
  ),
  
  # Panel for the climate indices that will appear/disappear
  div(
    id = ns("climate_panel"),
    class = "control-panel",
    style = "display: none;",  # Hidden by default
    
    # Panel header with minus button
    div(
      class = "panel-header",
      h4("Indices Climat"),
      actionButton(
        inputId = ns("close_panel"),
        label = icon("minus"),
        class = "close-btn"
      )
    ),
    
    # Panel content
    div(
      class = "panel-content",
      p("This is the stations panel content"))),
  
  # Panel for the soil indices that will appear/disappear
  div(
    id = ns("soil_panel"),
    class = "control-panel",
    style = "display: none;",  # Hidden by default
    
    # Panel header with minus button
    div(
      class = "panel-header",
      h4("Indices de sol"),
      actionButton(
        inputId = ns("close_panel_soil"),
        label = icon("minus"),
        class = "close-btn"
      )
    ),
    
    # Panel content
    div(
      class = "panel-content",
      p("This is the soil panel content"))),
  
  # Panel for the vegetation indices that will appear/disappear
  div(
    id = ns("vegetation_panel"),
    class = "control-panel",
    style = "display: none;",  # Hidden by default
    
    # Panel header with minus button
    div(
      class = "panel-header",
      h4("Indices Végétation"),
      actionButton(
        inputId = ns("close_panel_veg"),
        label = icon("minus"),
        class = "close-btn"
      )
    ),
    
    # Panel content
    div(
      class = "panel-content",
      p("This is the stations panel content"))),
  
  
  # Panel for the climate indices that will appear/disappear
  div(
    id = ns("water_panel"),
    class = "control-panel",
    style = "display: none;",  # Hidden by default
    
    # Panel header with minus button
    div(
      class = "panel-header",
      h4("Indices d'eau"),
      actionButton(
        inputId = ns("close_panel_water"),
        label = icon("minus"),
        class = "close-btn"
      )
    ),
    
    # Panel content
    div(
      class = "panel-content",
      p("This is the stations panel content"))),
  
  # Panel for the combined indices that will appear/disappear
  div(
    id = ns("combine_panel"),
    class = "control-panel",
    style = "display: none;",  # Hidden by default
    
    # Panel header with minus button
    div(
      class = "panel-header",
      h4("Indices Combinés"),
      actionButton(
        inputId = ns("close_panel_combine"),
        label = icon("minus"),
        class = "close-btn"
      )
    ),
    
    # Panel content
    div(
      class = "panel-content",
      p("This is the stations panel content")))
  
  )
}

mini_sidebar_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # Function to close all panels
    close_all_panels <- function() {
      shinyjs::hide("climate_panel")
      shinyjs::hide("vegetation_panel")
      shinyjs::hide("soil_panel")
      shinyjs::hide("water_panel")
      shinyjs::hide("combine_panel")
    }
    
    # Show panel when icon clicked
    observeEvent(input$climate_icon, {
      close_all_panels()
      shinyjs::show("climate_panel")
    })
    
    # Show panel for vegetation
    observeEvent(input$vegetation_icon, {
      close_all_panels()
      shinyjs::show("vegetation_panel")
    })
    
    # show panel for soil
    observeEvent(input$soil_icon, {
      close_all_panels()
      shinyjs::show("soil_panel")
    })
    
    # Show panel for water
    observeEvent(input$water_icon, {
      close_all_panels()
      shinyjs::show("water_panel")
    })
    
    # Show panel for combined indices
    observeEvent(input$water_icon, {
      close_all_panels()
      shinyjs::show("water_panel")
    })
    
    # Hide panel when minus button clicked
    observeEvent(input$close_panel, {
      shinyjs::hide("climate_panel")
    })
    
    # Hide veg panel when minus button clicked
    observeEvent(input$close_panel_veg, {
      shinyjs::hide("vegetation_panel")
    })
    
    #hide soil panel when minus button clicked
    observeEvent(input$close_panel_soil, {
      shinyjs::hide("soil_panel")
    })
    
    # Hide water panel when minus button clicked
    observeEvent(input$close_panel_water, {
      shinyjs::hide("water_panel")
    })
    
  })
}