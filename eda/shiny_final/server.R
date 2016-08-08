library(ggplot2)
library(dplyr)
library(readr)
library(stringr)
 
clean_sample <- read_csv("../../clean_data/clean_years.csv")

shinyServer(function(input, output) {
 
  output$plot <- renderPlot({ 
     clean_sample %>%  
      # Use NSE
      group_by_(input$sel_x, input$sel_color) %>%  
      # Take the median instead of mean to avoid extreme observations skewing the 
      # result.
      summarise_(new_y= as.formula(paste0("~ median(",input$sel_y, ",na.rm=T)"))) %>%  
      # Use NSE
      ggplot(aes_string(x = input$sel_x,   
                        y = "new_y",   
                        colour = input$sel_color)) +  
      geom_line()

  })
  
})

