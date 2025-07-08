# Load required libraries
library(shiny)
library(bslib)
library(leaflet)
library(DT)
library(plotly)
library(dplyr)
library(shinyjs)

# global settings
source("global.R")

# ui definition
ui <- navbarPage(
  title = div(
    img(src = "logo/logo.png", height = "40px"),
    span("Observatoire de la sécheresse")
  ),
  #selected = 'Geomonitoring',
  #collapsible = TRUE,
  # Move shinyjs and CSS to header
  header = tagList(
    shinyjs::useShinyjs(),
    includeCSS("www/custom.css"),
    # Add favicon
    tags$head(
      tags$link(rel = "icon", type = "image/ico", href = "favicon/favicon.ico"),
      tags$link(rel = "shortcut icon", type = "image/ico", href = "favicon/favicon.ico")
    )
  ),
  
  # tabpanels
  tabPanel(
    title = "Accueil",
    value = "home",
    icon = icon("home"),
    # Placeholder for home content
    h2("Bienvenue à l'Observatoire de la sécheresse")
  ),
  tabPanel(
    title = "Geomonitoring",
    icon = icon("globe"),
    geomonitoring_ui("geomonitoring")
  )
  

)


# Server
server <- function(input, output, session) {
  
  
  # We'll build this step by step
  geomonitoring_server("geomonitoring")
  
  
}


# Run app
shinyApp(ui = ui, server = server)