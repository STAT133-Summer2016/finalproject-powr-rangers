library(ggplot2)
library(dplyr)
library(readr)
library(maps)
library(ggmap)

dirty_sample <- read_csv("../data/dirty_sample.csv")

clean_sample <- dirty_sample %>% 
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations) %>%  
  na_if(-9) %>%
  mutate(ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")))

shinyServer(function(input, output) {
  
  output$plot <- renderPlot({ 
    
     clean_sample %>%  
      group_by_("dataset_year", input$sel_var) %>%  
      # Take the median instead of mean to avoid extreme observations skewing the 
      # result. 
      summarise(burden_year = median(burden, na.rm = T)) %>%  
      ggplot(aes_string(x = "dataset_year",   
                        y = "burden_year",   
                        colour = input$sel_var)) +  
      geom_line()

  })
  
})

