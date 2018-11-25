#Final Project for Developing Data Products
#
# This is the user-interface definition of a Shiny web application. 
# 
 

library(shiny)
library(leaflet)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Baja Fresh Locations in US"),
  
  # Ask user questions
  sidebarLayout(
    sidebarPanel(
       textInput("name", "What's your nanme?"),
       numericInput("locCount",
                   "Can you guess how many locations are in US?",
                    min = 1,
                    max = 10,
                    value = ''  ),
       checkboxInput("showMap", "Show Stores", value= TRUE ),
       submitButton("Submit")
      
    ),
    
    # Show store locations and answer to the question
    mainPanel(
       textOutput("greeting"),
       textOutput("showAnswer"),
       leafletOutput("distMap")
    )
  )
))
