
library(shiny)

# Define UI for application that takes in text and generates analysis
shinyUI(fluidPage(
  
  #App title
  titlePanel("HSK Level Analysis on Chinese Text"),
  
  #Sidebar layout 
  sidebarPanel(
    
    #Tabs for text input and web scraping
    tabsetPanel(type="tabs",
                tabPanel("Text Input", 
                         textAreaInput("text",
                                       NULL,
                                   value=" ",
                                   width='100%',
                                   height='75%',
                                   resize="vertical"),
                         actionButton("submit", 
                                      "Analyze")))
  ),
  
  #Main panel for displaying summary, frequency graph, and word lists
  mainPanel(
    plotOutput("bar"),
    dataTableOutput("hsk")
  )
  
))
