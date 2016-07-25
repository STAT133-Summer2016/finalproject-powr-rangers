library(ggplot2)
library(dplyr)
library(readr)
library(maps)
library(ggmap)

# dirty_sample is just a sample of the full combined but unmodified dataset,
# saved to a separate file for convenience:
# sample_n(combined_years, 10000)
dirty_sample <- read_csv("../data/dirty_sample.csv")

# Cleaning the data
clean_sample <- dirty_sample %>% 
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations) %>%  
  # -9 has been used as a marker for NA, replace them with NA
  na_if(-9) %>%
  mutate(ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")))

shinyServer(function(input, output) {
  
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

