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
        tabPanel("tab1.1"
          # plotly::plotlyOutput(ns("tab1_1"),
          # height = 230,
          # width = "100%")
          ),
        tabPanel("tab1.2"
          # plotly::plotlyOutput(
          # ns("tab1_2"),
          # height = 230,
          # width = "100%")
          ),
      ),
      tabBox(
        title = "second tab box",
        id = "tab2", height = "300px",
        tabPanel("tab2.1"
          # plotly::plotlyOutput(
          # ns("tab2_1"),
          # height = 230,
          # width = "100%")
          ),
        tabPanel("tab2.2"
          # plotly::plotlyOutput(
          # ns("tab2_2"),
          # height = 230,
          # width = "100%")
          ),
        )
      ),
      fluidRow(
        shinydashboard::box(
          width = 3, height = 300,
          selectizeInput(
            ns("employee"),
            label = "Select employee",
            choices = c("frank", "heywood", "jablowme", "putjafingainma")
          ),
          radioButtons(
            ns("quarter"),
            label = "select quarter",
            choices = c("Q1", "Q2", "Q3", "Q4"),
            inline = T
          ),
          sliderInput(inputId = "UB", label = "Actual Billability %",
                      min = 0, max = 100, step = 10, value = 50),
        dateRangeInput(
          ns("date"),
          label = "Select Date",
          start = "1776/07/04",
          end = Sys.Date()
        )),
        shinydashboard::box(
          width = 9, height = 300,
          title = "Table"
        )
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

    output$tab1_1 <-  plotly::renderPlotly({
      shinipsum::random_ggplotly()
    })

    output$tab1_2 <- plotly::renderPlotly({
      shinipsum::random_ggplotly()
    })

    output$tab2_1 <- plotly::renderPlotly({
      shinipsum::random_ggplotly()
    })

    output$tab2_2 <- plotly::renderPlotly({
      shinipsum::random_ggplotly()
    })


  })
}

## To be copied in the UI
# mod_dashboard_ui("dashboard_1")

## To be copied in the server
# mod_dashboard_server("dashboard_1")
