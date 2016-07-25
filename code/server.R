library(ggplot2)
library(dplyr)
library(readr)
library(stringr)
 

shinyServer(function(input, output) {
 
clean_sample <- read_csv("../data/clean_sample.csv")

  output$plot <- renderPlot({ 
    
     clean_sample %>%  
      # Use NSE
      group_by_("dataset_year", input$sel_var) %>%  
      # Take the median instead of mean to avoid extreme observations skewing the 
      # result.
      summarise(burden_year = median(burden, na.rm = T)) %>%  
      # Use NSE
      ggplot(aes_string(x = "dataset_year",   
                        y = "burden_year",   
                        colour = input$sel_var)) +  
      geom_line()

  })
  
})

