 # Load necessary libraries
  library(shiny)
library(shinydashboard)
library(tidyverse)

# Create the data frame
data <- data.frame(
  Project = c(
    "Annual HIV cohort reports generated for 47 counties",
    "National DQA reports for 47 counties",
    "County-specific DQA/DQI reports for HIV programs",
    "Enhanced skills and capabilities in surveillance units"
  ),
  Q1 = c(10, 20, 50, 25),
  Q2 = c(20, 10, 20, 50),
  Q3 = c(50, 50, 10, 75),
  Q4 = c(100, 100, 100, 100)
)
 # Load the necessary libraries
  library(shiny)
library(shinydashboard)

# Define the UI
ui <- dashboardPage(
  dashboardHeader(title = "Project Progress Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(title = "Project Progress by Quarter", width = 12, status = "primary",
                    tableOutput("progressTable"))
              )
      )
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$progressTable <- renderTable({
    data
  })}
# plot graph
output$progressPlot <- renderPlot({
  selected_data <- data %>% filter(Project == input$project)
  
  ggplot(selected_data, aes(x = factor(c("Q1", "Q2", "Q3", "Q4")), y = as.numeric(selected_data[1, 2:5]))) +
    geom_line(group = 1, color = "blue") +
    geom_point(color = "red", size = 3) +
    labs(title = paste("Progress of", input$project),
         x = "Quarter",
         y = "Progress (%)") +
    theme_minimal()})

# Run the application
shinyApp(ui = ui, server = server)
