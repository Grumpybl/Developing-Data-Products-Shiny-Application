require(shiny)  
require(ggplot2)  
shinyServer(function(input, output) {  
  output$histogramofdicerolls <- renderPlot({  
    #number of rolls  
    num_rolls = input$num_sim  
    #number of sides  
    num_sides = 6 
    #number of dice  
    num_dice = 2  
    #get a vector of rolls  
    #set up vector of rolls  
    total.roll.total = c(rep(NA, num_rolls))  
    #with each number of rolls of user input, calculate roll total  
    for(j in 1:num_rolls) {  
      one.roll.total = c(rep(NA, num_dice))  
      for(i in 1:num_dice){   
        one.roll.total[i] = sample(1:num_sides, 1, replace = T)  
      }  
      total.roll.total[j] = sum(one.roll.total)  
    }  
    mytable = table(total.roll.total)   
    mytable = as.data.frame(mytable)  
    mytable$total.roll.total = factor(mytable$total.roll.total, levels = as.character(c(1:(num_dice*num_sides))))  
    #plots  
    p <- ggplot(data = mytable,  
                aes(x = total.roll.total, y = Freq)) +  
      geom_bar(color = 'black', fill = 'purple', stat = 'identity') +  
      theme_bw() +
      scale_x_discrete(drop = FALSE) +  
      guides(fill = FALSE) +  
      xlab("Sum of Dice") +  
      ylab("Frequency") +  
      ggtitle("Histogram of Dice Results")  
    print(p)  
  })  
})  