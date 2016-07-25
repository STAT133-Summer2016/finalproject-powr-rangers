library(readr)
library(dplyr)
library(stringr)
library(tidyr)

# dirty_sample is just a sample of the full combined but unmodified dataset,
# saved to a separate file for convenience:
combined_years <- read_csv("../data/combined_years.csv")


NoQuotations <- function(x) {
  str_replace_all(x, "^\\'|\\'$", "")
}

# Cleaning the data
clean_years <- combined_years %>% 
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations) %>%  
  # -9 has been used as a marker for NA, replace them with NA
  na_if(-9) %>%
  mutate(ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")))

#plot
clean %>% 
  group_by(dataset_year) %>% 
  summarise(burden_year = mean(burden)) %>% 
  ggplot(aes(x = dataset_year, y = burden_year)) + 
  geom_line()
  
 
  
set.seed(1337)  
clean_sample <- sample_n(clean_years, 100000)

