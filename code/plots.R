library(dplyr)
library(ggplot2)
library(readr)

# Take a sample from the data to have a lighter and faster dataset

#set.seed(1337)
dirty_sample <- read_csv("../data/cleaned_years.csv") %>%
  sample_n(10000) 

dirty_sample <- read_csv("../data/dirty_sample.csv")

clean_sample <- dirty_sample %>% 
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations) %>%  
  na_if(-9) %>%
  mutate(ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")))

clean_sample %>% 
  group_by(dataset_year, ownrent) %>% 
  # Take the median instead of mean to avoid extreme observations skewing the
  # result.
  summarise(burden_year = median(burden)) %>% 
  ggplot(aes(x = dataset_year, y = burden_year, colour = ownrent)) + geom_line()

# The housing price bubble can be seen
## But we want to analyze the effect of falling incomes as well. To be expanded.