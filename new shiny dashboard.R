library(tidyverse)
library(shiny)
library(shinydashboard)
library(DT)
library(rsconnect)
library(here)

ui <- dashboardPage(
  dashboardHeader(title = "Project Outcomes Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Table", tabName = "table", icon = icon("table")),
      menuItem("Plots", tabName = "plots", icon = icon("bar-chart"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "table",
              fluidRow(
                box(title = "Progress Overview", width = 12, solidHeader = TRUE, status = "primary",
                    DTOutput("progressTable"))
              )),
      tabItem(tabName = "plots",
              fluidRow(
                box(title = "Filter Options", width = 12, solidHeader = TRUE, status = "primary",
                    checkboxGroupInput("selectedVars", "Select Variables:", 
                                       choices = c("Annual HIV cohort reports generated for 47 counties.",
                                                   "National DQA reports for 47 counties.",
                                                   "County-specific DQA/DQI reports for HIV programs.",
                                                   "Enhanced skills and capabilities in surveillance units."),
                                       selected = c("Annual HIV cohort reports generated for 47 counties.",
                                                    "National DQA reports for 47 counties.",
                                                    "County-specific DQA/DQI reports for HIV programs.",
                                                    "Enhanced skills and capabilities in surveillance units.")),
                    actionButton("applyChanges", "Apply Changes")
                )
              ),
              fluidRow(
                box(title = "Annual HIV cohort reports generated for 47 counties", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot1")),
                box(title = "National DQA reports for 47 counties", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot2"))),
              fluidRow(
                box(title = "County-specific DQA/DQI reports for HIV programs", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot3")),
                box(title = "Enhanced skills and capabilities in surveillance units", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot4"))
              ))
    )
  )
)

server <- function(input, output, session) {
  # Data
  project_data <- read.csv(here("rdata folder"))
  # Render data table
  output$progressTable <- renderDT({
    datatable(project_data, options = list(pageLength = 5))
  })
  
  observeEvent(input$applyChanges, {
    output$progressPlot1 <- renderPlot({
      if ("Annual HIV cohort reports generated for 47 counties." %in% input$selectedVars) {
        barplot(as.numeric(project_data[1, -1]), beside = TRUE, col = "blue",
                names.arg = colnames(project_data)[-1])
        title(main = project_data$ProjectOutcome[1], xlab = "Quarter", ylab = "Percentage")
      }
    })
    
    output$progressPlot2 <- renderPlot({
      if ("National DQA reports for 47 counties." %in% input$selectedVars) {
        barplot(as.numeric(project_data[2, -1]), beside = TRUE, col = "green",
                names.arg = colnames(project_data)[-1])
        title(main = project_data$ProjectOutcome[2], xlab = "Quarter", ylab = "Percentage")
      }
    })
    
    output$progressPlot3 <- renderPlot({
      if ("County-specific DQA/DQI reports for HIV programs." %in% input$selectedVars) {
        barplot(as.numeric(project_data[3, -1]), beside = TRUE, col = "red",
                names.arg = colnames(project_data)[-1])
        title(main = project_data$ProjectOutcome[3], xlab = "Quarter", ylab = "Percentage")
      }
    })
    
    output$progressPlot4 <- renderPlot({
      if ("Enhanced skills and capabilities in surveillance units." %in% input$selectedVars) {
        barplot(as.numeric(project_data[4, -1]), beside = TRUE, col = "purple",
                names.arg = colnames(project_data)[-1])
        title(main = project_data$ProjectOutcome[4], xlab = "Quarter", ylab = "Percentage")
      }
    })
  })
}

shinyApp(ui, server)
