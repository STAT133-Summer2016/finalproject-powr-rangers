library(readr)
library(dplyr)
library(stringr)
library(tidyr)

NoQuotations <- function(x) {
  str_replace_all(x, "^\\'|\\'$", "")
}

cleaned_years <- read_csv("../data/cleaned_years.csv") %>%
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations)
  
  
