#' dashboard UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dashboard_ui <- function(id){
  ns <- NS(id)
  shinydashboard::tabItem("dashboard",
  fluidPage(
      fluidRow(
        shinydashboard::box(
          title = "box 1",
          width = 3, height = 80
        ),
        shinydashboard::box(
          title = "box 2",
          width = 3, height = 80
        ),
        shinydashboard::box(
          title = "box 3",
          width = 3, height = 80
        ),
        shinydashboard::box(
          title = "box 4",
          width = 3, height = 80
        )
      ),
      fluidRow(
      tabBox(
        title = "first tab box",
        id = "tab1", height = "300px",
        tabPanel("tab1.1", "Tabset box 1.1"),
        tabPanel("tab1.2", "Tabset box 1.2")
      ),
      tabBox(
        title = "second tab box",
        id = "tab2", height = "300px",
        tabPanel("tab2.1", "Tabset box 2.1"),
        tabPanel("tab2.2", "Tabset box 2.2")
        )
      ),
      fluidRow(
        shinydashboard::box(
          width = 3, height = 300,
          title = "param inputs"
        ),
        shinydashboard::box(
          width = 9, height = 300,
          title = "graph additional"
        ),
      )
    )
  )
}

#' dashboard Server Functions
#'
#' @noRd
mod_dashboard_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_dashboard_ui("dashboard_1")

## To be copied in the server
# mod_dashboard_server("dashboard_1")
