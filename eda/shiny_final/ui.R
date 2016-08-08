library(readr)

clean_sample <- read_csv("../../clean_data/clean_years.csv")

shinyUI(fluidPage(

  titlePanel("Burden by year and category"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("sel_color",
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
                  selected = "burden"),
      selectInput("sel_x",
                  label = "X axis",
                  choices = names(clean_sample),
                  # Select "ownrent" as initial value to avoid getting a 
                  # non-categorical variable by default
                  selected = "year")
      ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
))
