shinyUI(fluidPage(

  titlePanel("Burden by year and category"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("sel_var",
                  label = "Grouping variable",
                  choices = names(clean_sample),
                  # Select "ownrent" as initial value to avoid getting a 
                  # non-categorical variable by default
                  selected = "ownrent")
      
      ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
))
