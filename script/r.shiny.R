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
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
    )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(title = "Progress Overview", width = 12, solidHeader = TRUE, status = "primary",
                    DTOutput("progressTable"))),
              fluidRow(
                box(title = "Annual HIV cohort reports generated for 47 counties", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot1")),
                box(title = "National DQA reports for 47 counties", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot2"))),
              fluidRow(
                box(title = "County-specific DQA/DQI reports for HIV programs", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot3")),
                box(title = "Enhanced skills and capabilities in surveillance units", width = 6, solidHeader = TRUE, status = "primary",
                    plotOutput("progressPlot4")))))))

server <- function(input, output) {
  # Data
  project_data <- read.csv(here("rdata folder","shndata.csv"))
  # Render data table
  output$progressTable <- renderDT({
    datatable(project_data, options = list(pageLength = 5))
  })
  
  # Render individual plots
  output$progressPlot1 <- renderPlot({
    barplot(as.numeric(project_data[1, -1]), beside = TRUE, col = "blue",
            names.arg = colnames(project_data)[-1])
    title(main = project_data$ProjectOutcome[1], xlab = "Quarter", ylab = "Percentage")
  })
  
  output$progressPlot2 <- renderPlot({
    barplot(as.numeric(project_data[2, -1]), beside = TRUE, col = "green",
            names.arg = colnames(project_data)[-1])
    title(main = project_data$ProjectOutcome[2], xlab = "Quarter", ylab = "Percentage")
  })
  
  output$progressPlot3 <- renderPlot({
    barplot(as.numeric(project_data[3, -1]), beside = TRUE, col = "red",
            names.arg = colnames(project_data)[-1])
    title(main = project_data$ProjectOutcome[3], xlab = "Quarter", ylab = "Percentage")
  })
  
  output$progressPlot4 <- renderPlot({
    barplot(as.numeric(project_data[4, -1]), beside = TRUE, col = "purple",
            names.arg = colnames(project_data)[-1])
    title(main = project_data$ProjectOutcome[4], xlab = "Quarter", ylab = "Percentage")
  })
}

shinyApp(ui, server)

rsconnect::setAccountInfo(name='brimag-j',
                          token='C1D60546C18E7CF69657D348021A59FB',
                          secret='<SECRET>')
library(rsconnect)
rsconnect::deployApp('path/to/your/app')

