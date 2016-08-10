# PowR Rangers final project

This is the repository for the final project for stat133 course in Berkeley, summer 2016. We analyze data from https://www.huduser.gov/portal/datasets/hads/hads.html to inspect housing affordability in the US. 

## Folders

The repository contains five folders: raw_data, clean_data, paper, presentation and eda. 
- **raw_data** contains the compressed raw data files for the years and documentation for their contents.
- **clean_data** contains the script _CleanData.R_ to combine and clean raw data. This is also where the clean csv files will be saved. The clean dataset was too big to store on Github, hence it has to be compiled on every machine separately. The compilation takes five to ten minutes on an average laptop.
- **paper** contains the final report in Rmd and pdf.
- **presentation** contains the slidedeck Rmd and html as well as the image etc. files for the html.
- **eda** contains information about the exploration process. _Exploration_process.html_ contains a static version of the description, while _Exploration_process.Rmd can be run to include interactive shiny apps in the document. Subfolder **originals** includes old graphs, and the two shiny subfolders include the first and final versions of the shiny app.


## Instructions to produce the final paper

To produce the final paper, one has to run _CleanData.R_ from the **clean_data** directory to obtain the combined dataset. This is because of file size limitations on github. Once the code is cleaned, the paper can be reproduced by opening RStudio and knitting _paper.Rmd_.

## Packages used
- readr
- dplyr
- stringr
- ggplot2
- xml2
- rvest
- tidyr
- purrr
- scales
- maps
- ggthemes
