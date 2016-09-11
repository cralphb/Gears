#
# This is the server logic of a Shiny web application
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
library(datasets)

# Here the label of the "am" field in the "mtcars" dataset is
# adjusted to something more user friendly. As this is only to 
# make it easier to understand for the user, it is done in the 
# background and then used for the lifetime of the application.
#
mtcars$am <- factor(mtcars$am, labels = c("Auto", "Manual"))

# Define server logic necessary to plot selected parameters.
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # also used by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Plot the requested variable against mpg allowing outliers, 
  # if requested
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
        data = mtcars,
        pch = 2,
        col = "green")
  })
})
