#' instruction UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_instruction_ui <- function(id){
  ns <- NS(id)
  shinydashboard::tabItem("instruction" )
}

#' instruction Server Functions
#'
#' @noRd
mod_instruction_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_instruction_ui("instruction_1")

## To be copied in the server
# mod_instruction_server("instruction_1")
