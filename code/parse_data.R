library(readr)
library(dplyr)
library(stringr)
library(tidyr)

combined_years <- read_csv("../data/combined_years.csv",
                           # Add col_types manually to avoid parsing failures
                           col_types = "cicciiciiciiidicidicddddddiidddddddddddddddddididididididididididididididicccccccccccccccccccccccccd")

NoQuotations <- function(x) {
  str_replace_all(x, "^\\'|\\'$", "")
}

# Cleaning the data
clean_years <- combined_years %>% 
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations) %>%  
  # -9 has been used as a marker for NA, replace them with NA
  na_if(-9)  %>%
  mutate(ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")))

  clean_sample <- mutate(clean_sample, ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")))
# Free some memory
remove(combined_years)

set.seed(1337)  
clean_sample <- sample_n(clean_years, 10000)

# Write csv files
write_csv(clean_years, path = "../data/clean_years.csv")
write_csv(clean_sample, path = "../data/clean_sample.csv")
