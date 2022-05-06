library(shiny)
library(dplyr)
library(tidytext)
library(quanteda)
library(jiebaR)
library(stringi)
library(stringr)
library(ggplot2)
library(DT)

#Get HSK vocabulary (2018) / credits to plaktos on github
hsk <- readRDS("hsk_vocab.Rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  #Clean text (i.e. keeps Chinese characters in CJK Unified Ideographs - Unicode 4E00-9FFF)
  clean_text <- function(t) {
    t <- gsub("[^\U4E00-\U9FFF]", "", t)
    return(t)
  }
  
  #Tokenize clean text
  #Create word frequency table
  #Left join HSK levels to word frequency table
  
  get_freq <- function(t) {
    worker <- worker()
    t <- clean_text(t)
    text_seg <- segment(t, jiebar=worker)
    text_df <- as.data.frame(text_seg)
    
    text_freq <- text_df %>%
      group_by(text_seg) %>%
      summarize(freq = n())
    
    text_freq <- text_freq %>%
      left_join(hsk, by=c("text_seg" = "chinese"))
    
    text_freq$level <- addNA(text_freq$level)
    
    return(text_freq)
  }
  
  text_freq <- eventReactive(input$submit, {
    input$text %>%
      get_freq()
  })

  output$bar <- renderPlot({
    if (dim(text_freq())[1] > 0) {
      ggplot(data=text_freq(), 
             aes(x=level)) +
        geom_bar(stat="count") +
        labs(title="HSK Word Frequency") +
        scale_x_discrete("HSK Level", drop=FALSE) +
        ylab("Distinct Vocabulary Count")
    }
  })
  
  output$hsk <- DT::renderDataTable({
    if (dim(text_freq())[1] > 0) {
      DT::datatable(data=text_freq() %>% 
                      select(level, text_seg, freq) %>%
                      rename("HSK Level"=level, Token=text_seg, Frequency=freq), 
                    filter='top',
                    options=list(pageLength=10), 
                    rownames=FALSE)
    }
  })
  
})
