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
      group_by(dataset_year, ownrent) %>%  
      # Take the median instead of mean to avoid extreme observations skewing the 
      # result. 
      summarise(burden_year = median(burden, na.rm = T)) %>%  
      ggplot(aes(x = dataset_year,  
                 y = burden_year,  
                 colour = ownrent)) +  
      geom_line()

  })
  
})

