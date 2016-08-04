library(readr)
library(dplyr)
library(stringr)
library(tidyr)

combined_years <- read_csv("../data/combined_years.csv",
                           # Add col_types manually to avoid parsing failures
                           col_types = "cicciiciiciiidicidicddddddiidddddddddddddddddididididididididididididididicccccccccccccccccccccccccd",
                           na = c("","NA", "-9", "-6", "-7", "'.'"))

NoQuotations <- function(x) {
  str_replace_all(x, "^\\'|\\'$", "")
}

# Cleaning the data
clean_years <- combined_years %>% 
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations) %>%  
  # Clean ownrent
  mutate(ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")))

# Free some memory
remove(combined_years)

# Make a sample for faster developing etc.
set.seed(1337)  
clean_sample <- sample_n(clean_years, 1000)
clean_years = clean_years[sample(nrow(clean_years)),]
# Write csv files
write_csv(clean_years, path = "../data/clean_years.csv")
write_csv(clean_sample, path = "../data/clean_sample.csv")
