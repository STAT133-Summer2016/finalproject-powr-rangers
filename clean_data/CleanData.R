# Running this code may take up to ten minutes because of the large size
# of the datasets. Running from terminal instead of RStudio
# ("Rscript CleanData.R") or on a powerful server is recommended.

library(readr)
library(dplyr)
library(stringr)
library(tidyr)

MutateYears <- function(data, year) {
  # Simply marks the dataset with the year to categorize the original data.
  mutate(data, 
         YEAR = year)
}

UpperCaseColNames <- function(frame) {
  # Years vary over the years, so this converts the column 
  # names to the same style as that of the latest dataset.
  setNames(frame, 
           (toupper(names(frame)) %>% 
              str_replace("^COSTMED(.+)",
                          "COSTMed\\1")))
}

AddMissingCols <- function(frame) {
  # Datasets before 2003 are missing the three columns below, 
  # so this function adds them to unify all of the datasets
  mutate(frame, 
         L30 = 0.6 * L50, 
         GL30 = 0.6 * GL50, 
         ABL30 = 0.6 * ABL50)
}

RenameCols <- function(frame) {
  # Naming convention changed after the 1995 dataset, 
  # so we match the column names.
  rename(frame, 
         "AGE1" = `AGE`, 
         "FMTMETRO3" = `FMTMETRO`, 
         "STATUS" = `ISTATUS`, 
         "METRO3" = `METRO`)
}

NoQuotations <- function(x) {
  # Removes quotes from input string x.
  str_replace_all(x, "^\\'|\\'$", "")
}
# Total list of invalid values, done due to insufficient documentation.
NA_LIST = c("","NA","-5","-6","-7","-9",".")
# Loading the most recent datasets first to give reference for other
# two sets.
base_files <- paste("../raw_data/hads",          
                c(seq(2003, 2013, by = 2)),  
                ".bz2",                     
                sep = "") %>%  
  lapply(read_csv, na=NA_LIST) %>% 
  # Have to convert to data frames as lapply seems to recognize csv output 
  # as named lists.
  lapply(data.frame,   
         stringsAsFactors = F)
# Need to distinguish different years for datasets, so we add a column 
# to do just that.
base_files <- mapply(MutateYears, 
                 base_files,     #
                 as.list(seq(2003, 2013, by = 2)))

# The 2009 dataset has an extra unspecified column that we need to remove.
modified_year <- base_files[[4]] %>% 
  select(-VCHRMOV)      

# Combine all of the recent years into one. 
modern_files <- rbind(do.call(rbind, 
                            base_files[c(1, 2, 3, 5, 6)]), 
                    modified_year)
# Load first decade separately to account for missing columns and different 
# names.
first_decade <- paste("../raw_data/hads",             
                     c(seq(1985, 1995, by = 2)), 
                     ".bz2",               
                     sep = "") %>%              
  lapply(read_csv, na=NA_LIST) %>% 
  lapply(data.frame, stringsAsFactors = F) %>% 
  lapply(UpperCaseColNames) %>% 
  lapply(AddMissingCols) %>% # Need missing columns for completeness.
  lapply(RenameCols) # Column names need to match the recent years.

first_decade <- mapply(MutateYears, 
                      first_decade, 
                      as.list(seq(1985, 1995, by = 2)), 
                      SIMPLIFY = FALSE) %>% 
  # To properly bind the datasets, the data has to be in the same order.
  lapply(select_, 
         .dots=names(modern_files)) 

first_old_set <- do.call(rbind,      
                        first_decade)
#Same as above, except with no renaming.
second_decade <- paste("../raw_data/hads", 
                      c(seq(1997, 2001, by = 2)), 
                      ".bz2", 
                      sep ="") %>% 
  lapply(read_csv, na=NA_LIST) %>% 
  lapply(data.frame, stringsAsFactors= F) %>% 
  lapply(UpperCaseColNames) %>% 
  lapply(AddMissingCols)

second_decade <- mapply(MutateYears, 
                       second_decade, 
                       as.list(seq(1997, 2001, by = 2)), 
                       SIMPLIFY = FALSE) %>% 
  lapply(select_, 
         .dots = names(modern_files))

second_old_set <- do.call(rbind, second_decade)

old_sets <- rbind(first_old_set, second_old_set) 

# Free some memory
remove(first_old_set, 
       second_old_set, 
       base_files, 
       first_decade, 
       second_decade, 
       modified_year)

combined_years <- rbind(old_sets, modern_files)

# Free some memory
remove(old_sets, modern_files)

# Cleaning the data
clean_years <- combined_years %>% 
  setNames(str_to_lower(names(.))) %>%  
  mutate_if(is.character, NoQuotations) %>%  
  # Refactoring ownrent data
  mutate(ownrent = factor(ownrent,   
                          levels = c("1", "2"), 
                          labels = c("own", "rent")),
         fmtburden = str_replace_all(fmtburden, "^[0-9] ", ""),
         fmtstructuretype = str_replace_all(fmtstructuretype, "^[0-9] ", ""))

# Free some memory
remove(combined_years)

# Set the seed to ensure reproducability
set.seed(1337)  
# Make a sample for demonstration purposes
clean_sample <- sample_n(clean_years, 10000)
# Randomize rows to avoid column type detection problems when reading data
clean_years <- sample_n(clean_years, nrow(clean_years))

# Save the results
write_csv(clean_sample, path = "clean_sample.csv")
write_csv(clean_years, path = "clean_years.csv")
