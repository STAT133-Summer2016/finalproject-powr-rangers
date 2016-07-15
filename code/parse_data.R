library(readr)
library(dplyr)
library(stringr)
library(tidyr)
y2013 <- read_csv("data/thads2013n.txt") %>%
  setNames(str_to_lower(names(y2013))) %>%
  mutate(control = str_replace_all(control, "\\'*", "")) %>%
  head
