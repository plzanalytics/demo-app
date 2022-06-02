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
  css <- HTML("
             .html-widget.gauge svg{
             height: 90px:
             }")

  ns <- NS(id)
  shinydashboard::tabItem("dashboard",
  fluidPage(
      fluidRow(
         shinydashboard::valueBoxOutput(
           ns("box1"),
           width = 3
         ),
         shinydashboard::valueBoxOutput(
           ns("box2"),
           width = 3
         ),
         shinydashboard::valueBoxOutput(
           ns("box3"),
           width = 3
         ),
         shinydashboard::valueBoxOutput(
           ns("box4"),
           width = 3
         ),
      ),
      fluidRow(
      tabBox(
        title = "first tab box",
        id = "tab1", height = "300px",
        tabPanel("tab1.1",
          plotly::plotlyOutput(ns("tab1_1"),
          height = 230,
          width = "100%")
          ),
        tabPanel("tab1.2",
          plotly::plotlyOutput(
          ns("tab1_2"),
          height = 230,
          width = "100%")
          ),
      ),
      tabBox(
        title = "second tab box",
        id = "tab2", height = "300px",
        tabPanel("tab2.1",
          plotly::plotlyOutput(
          ns("tab2_1"),
          height = 230,
          width = "100%")
          ),
        tabPanel("tab2.2",
          plotly::plotlyOutput(
          ns("tab2_2"),
          height = 230,
          width = "100%")
          ),
        )
      ),
      fluidRow(
        shinydashboard::box(
          width = 3, height = 325,
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
          width = 9, height = 325,
          title = "Table",
          DT::dataTableOutput(
            ns("table")
          )
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

    #top row boxes
    output$box1 <- shinydashboard::renderValueBox({
      shinydashboard::valueBox(
        paste0("$", "200,000"), "Month Sales",
        color = "green"
      )
    })

    output$box2 <- shinydashboard::renderValueBox({
      shinydashboard::valueBox(
        paste0("$", "210,000"), "Expected Month Sales",
        color = "yellow"
      )
    })

    output$box3 <- shinydashboard::renderValueBox({
      shinydashboard::valueBox(
        paste0("$", "5,000,000"), "YTD Sales",
        color = "green"
      )
    })

    output$box4 <- shinydashboard::renderValueBox({
      shinydashboard::valueBox(
        paste0("$", "4,050,020"), "Expected YTD Sales",
        color = "yellow"
      )
    })

    # second row tables
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

    #3rd row table
    output$table <- DT::renderDataTable({
      DT::datatable(iris,
      options = list(dom = "lbfrtip", buttons = c("copy", "excel"),
                     pagelength = nrow(iris),
                     scrollY = 150,
                     autowidth = T))
                       })
  })
}

## To be copied in the UI
# mod_dashboard_ui("dashboard_1")

## To be copied in the server
# mod_dashboard_server("dashboard_1")
