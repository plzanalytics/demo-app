#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(
        title = "Rock & Rose Financial App",
        titleWidth = 350
      ),
    shinydashboard::dashboardSidebar(
       width = 120,
      shinydashboard::sidebarMenu(
        shinydashboard::menuItem("Instructions", tabName = "instruction", icon = icon("info")),
        shinydashboard::menuItem("Dashboard", tabName = "dashboard",
                                 icon = icon("tachometer-alt")),
        selectInput("catergory", "Catagory", c("1","2")),
        sliderInput(inputId = "Profit Range", label = "Profit Range",
                    min = 0, max = 100, step = 10, value = 50),
        radioButtons(inputId = "team", label = "Team", choices =
                       c("Construction", "Maintanence", "Office")),
        shinydashboard::menuItem("Download", tabName = "download", icon = icon("download"))
      )
    ),
    shinydashboard::dashboardBody(
      shinydashboard::tabItems(
        mod_instruction_ui("instruction"),
        mod_dashboard_ui("dashboard"),
        mod_download_ui("download")
      ), tags$head(tags$style(HTML('
        /* logo */
          .skin-blue .main-header .logo {
            background-color: #00402C;
          }
           /* logo when hovered */
        .skin-blue .main-header .logo:hover {
                              background-color: #00402C;
        }
          /* navbar (rest of the header) */
        .skin-blue .main-header .navbar {
                              background-color: #005440;
        }
        /* toggle button when hovered  */
        .skin-blue .main-header .navbar .sidebar-toggle:hover{
         background-color: #00402C;
        }
           '))),
      tags$head(
        tags$script(src = "sidebar.js")
      )
    )
  )
)
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "RockandRose"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
