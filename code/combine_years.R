library(readr)
library(dplyr)
library(stringr)
MutateYears = function(data, year) {
  # Simply marks the dataset with the year to categorize the original data.
  mutate(data, 
         DATASET_YEAR = year)
  }
UpperCaseColNames = function(frame) {
  # Years vary over the years, so this converts the column 
  # names to the same style as that of the latest dataset.
  setNames(frame, 
           (toupper(names(frame)) %>% 
              str_replace("^COSTMED(.+)",
                          "COSTMed\\1")))
  }
AddMissingCols = function(frame) {
  # Datasets before 2003 are missing the three columns below, 
  # so this function adds them to unify all of the datasets
  mutate(frame, 
         L30 = 0.6 * L50, 
         GL30 = 0.6 * GL50, 
         ABL30 = 0.6 * ABL50)
  }
RenameCols = function(frame) {
  # Naming convention changed after the 1995 dataset, 
  # so we match the column names.
  rename(frame, 
         "AGE1"=`AGE`, 
         "FMTMETRO3" = `FMTMETRO`, 
         "STATUS"=`ISTATUS`, 
         "METRO3"=`METRO`)
  }
base_files = paste("../data/hads",          # Loading the most recent datasets 
                c(seq(2003, 2013, by = 2)), # first to give reference for other
                ".bz2",                     # two sets.
                sep ="") %>%  
  lapply(read_csv) %>% 
  lapply(data.frame,  # Have to convert to data frames as lapply seems 
         stringsAsFactors= F) #to recognize csv output as named lists.
base_files = mapply(MutateYears, # Need to distinguish different years
                 base_files,     #for datasets, so add column to do just that.
                 as.list(seq(2003,2013,by=2)))
modified_year = base_files[[4]] %>% # The 2009 dataset has an extra unspecified
  select(-VCHRMOV)                  # column that we need to remove.
modern_files = rbind(do.call(rbind, # Combine all of the recent years into one.
                            base_files[c(1,2,3,5,6)]), 
                    modified_year)
first_decade = paste("../data/hads",             # Load first decade separately 
                     c(seq(1985, 1995, by = 2)), # to account for missing 
                     ".bz2",                     # columns and different 
                     sep ="") %>%                # names.
  lapply(read_csv) %>% 
  lapply(data.frame, stringsAsFactors= F) %>% 
  lapply(UpperCaseColNames) %>% 
  lapply(AddMissingCols) %>% # Need missing columns for completeness.
  lapply(RenameCols) # Column names need to match the recent years.
first_decade = mapply(MutateYears, 
                      first_decade, 
                      as.list(seq(1985,1995,by=2)), 
                      SIMPLIFY = FALSE) %>% 
  lapply(select_, 
         .dots=names(modern_files)) # To properly bind the datasets, the data
first_old_set = do.call(rbind,      # has to be in the same order.
                        first_decade)
second_decade = paste("../data/hads", #Same as above, except with no renaming.
                      c(seq(1997, 2001, by = 2)), 
                      ".bz2", 
                      sep ="") %>% 
  lapply(read_csv) %>% 
  lapply(data.frame, stringsAsFactors= F) %>% 
  lapply(UpperCaseColNames) %>% 
  lapply(AddMissingCols)
second_decade = mapply(MutateYears, 
                       second_decade, 
                       as.list(seq(1997,2001,by=2)), 
                       SIMPLIFY = FALSE) %>% 
  lapply(select_, 
         .dots=names(modern_files))
second_old_set = do.call(rbind, 
                         second_decade)
complete_dataset = rbind(rbind(first_old_set,  #Final combined dataset.
                               second_old_set), 
                         modern_files)
write_csv(complete_dataset,  # Writing dataset to save intermediate result.
          "../data/combined_years.csv") 
