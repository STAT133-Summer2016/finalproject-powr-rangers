library(ggplot2)
library(readr)
library(stringr)
library(dplyr)
#col_types = "cicciiciiciiidicidicddddddiidddddddddddddddddididididididididididididididicccccccccccccccccccccccccd"

clean_years <- read_csv("../data/clean_years.csv") #col_types = col)

clean_years %>%
  group_by(dataset_year, region) %>%  
  # Take the median instead of mean to avoid extreme observations skewing the 
  # result.
  summarise(new_y = median(ablmed, na.rm = T)) %>%
  ggplot(aes(x = dataset_year,   
             y = new_y,   
             colour = region)) + geom_line() +
  labs(x = "year", y = "Median Adjusted Income (per persons)", 
       title = "ABLmed by region")