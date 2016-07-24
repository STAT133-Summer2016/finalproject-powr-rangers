shinyUI(fluidPage(

  titlePanel("Dialects"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("sel_var",
                  label = "Variable",
                  choices = names(clean_sample),
                  selected = "ownrent")
      
      ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
))
