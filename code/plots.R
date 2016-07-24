library(dplyr)
library(ggplot2)

set.seed(1337)
# Take a sample from the data to have a lighter and faster dataset
cleaned_sample <- sample_n(cleaned_years, 10000)

cleaned_sample %>% 
  group_by(dataset_year) %>% 
  # Take the median instead of mean to avoid extreme observations skewing the
  # result.
  summarise(burden_year = median(burden)) %>% 
  ggplot(aes(x = dataset_year, y = burden_year)) + 
  geom_line()

# The housing price bubble can be seen
## But we want to analyze the effect of falling incomes as well. To be expanded.