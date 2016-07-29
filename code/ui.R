library(readr)

clean_sample <- read_csv("../data/clean_sample.csv")

shinyUI(fluidPage(

  titlePanel("Burden by year and category"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("sel_x",
                  label = "Colour",
                  choices = names(clean_sample),
                  # Select "ownrent" as initial value to avoid getting a 
                  # non-categorical variable by default
                  selected = "ownrent"),
      selectInput("sel_y",
                  label = "Y axis",
                  choices = names(clean_sample),
                  # Select "ownrent" as initial value to avoid getting a 
                  # non-categorical variable by default
                  selected = "burden")
      ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
))
