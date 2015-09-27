require(shiny)  
require(ggplot2)  

shinyUI(pageWithSidebar(  
 
  headerPanel("SHINY App - Histogram of Dice Roll Results"),  
  
  sidebarPanel(  
        
    #create a slider for number of dice rolls  
    sliderInput("num_sim",  
                "Move the slider to desired # of dice rolls:",  
                min = 10,  
                max = 109,  
                value = 50)  
  ),   
  #create a panel of histograms  
  mainPanel(  
    plotOutput("histogramofdicerolls")  
  )  
)) 
