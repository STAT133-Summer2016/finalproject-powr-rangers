library(readr)
library(dplyr)
library(stringr)
library(tidyr)

NoQuotations <- function(x) {
  str_replace_all(x, "^\\'|\\'$", "")
}

y2013 <- read_csv("data/thads2013n.txt") %>%
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations)
  
  
