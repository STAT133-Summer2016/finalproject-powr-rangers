README.md file of your repository should contain a brief description of your project, the folders in your repository, libraries and packages you used, and instructions on how to produce your final paper (ideally this should be “Open RStudio and knit the paper”).

# PowR Rangers final project

This is the repository for the final project for stat133 course in Berkeley, summer 2016. We analyze data from https://www.huduser.gov/portal/datasets/hads/hads.html to inspect housing affordability in the US. 

The repository contains four folders: raw_data, clean_data, paper and eda. 
    * **raw_data** contains the compressed raw data files for the years and documentation for their contents.
    * **clean_data** contains the script _CleanData.R_ to combine and clean raw data. This is also where the clean csv file will be saved. The clean dataset was too big to store on Github, hence it has to be compiled on every machine separately.
    * **paper** contains the final report in Rmd and pdf.
    * **eda** contains information about the exploration process. _Exploration_process.html_ contains a static version of the description, while _Exploration_process.Rmd can be run to include interactive shiny apps in the document. Subfolder **originals** includes old graphs, and two shiny folders include the first and final versions of the shiny app.
