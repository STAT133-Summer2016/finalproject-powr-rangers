library(readr)
library(dplyr)
library(stringr)
library(tidyr)

NoQuotations <- function(x) {
  str_replace_all(x, "^\\'|\\'$", "")
}

clean <- modernfiles %>%
  na_if(., -9) %>%
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations)

#plot
clean %>% 
  group_by(dataset_year) %>% 
  summarise(burden_year = mean(burden)) %>% 
  ggplot(aes(x = dataset_year, y = burden_year)) + 
  geom_line()
  
 
  
