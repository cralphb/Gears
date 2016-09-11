#
# This is the user-interface definition of a Shiny web application
# that return miles per gallon based on parameters entered.
#
# If viewing this file in RStudio, you can run the application by 
# clicking the 'Run App' button above.
#
# You can find out more about building applications with Shiny at 
# the following URL:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define the User Interface (UI)
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Miles Per Gallon"),
  
  # Sidebar with controls to select the parameter to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Cylinders" = "cyl", 
                     "Transmission" = "am", 
                     "Gears" = "gear")),
    
    checkboxInput("outliers", "Show outliers", FALSE)
  ),
  
  # Show the caption and plot the requested parameter.
  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput("mpgPlot")
  )
))
