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
  tabItem("instruction",
  fluidPage(
    mainPanel(
      width = 12,
      h3(strong("Introduction")),
      tabsetPanel(
        tabPanel(
          title = "Instructions",
          h4(strong("here is instruction panel"), style = "color:green"),
          h4(strong("1"), "- example bullet style", style = "padding-left:50px")
          ),
        tabPanel(
          title = "Upload File",
          h4(strong("Upload File using box below"), style = "color:green"),
          box(
            title = "Dataset Uploads",
            width = 8,
            fluidRow(
              fileInput(
                ns("fileInput"),
                "Choose Excel File",
                multiple = FALSE,
                accept = c("xls*")
                )
              )
            )
          )
        )
      )
    )
  )
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
