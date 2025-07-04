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


# UI Definition
ui <- page_fluid(
  useShinyjs(),  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  navbar_ui("navbar"),
  mini_sidebar_ui("sidebar")
)

# Server
server <- function(input, output, session) {
  
  
  # We'll build this step by step
  navbar_server("navbar")
  
  mini_sidebar_server("sidebar")
}


# Run app
shinyApp(ui = ui, server = server)