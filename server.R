library(shiny)
#library(datasets)
library(DT)

datastate<-read.csv("USstatedata1.csv",header = TRUE, sep = ",")
datastate$figure <- rownames(datastate)

shinyServer(function(input, output) {
  
  # Return the requested dataset
  nameInput <- reactive({
    switch(input$name,
           "Alabama" = Alabama,
           "Alaska" = Alaska,
           "Arizona" = Arizona,
           "Arkansas" = Arkansas,
           "California" = California,
           "Colorado" = Colorado,
           "Connecticut" = Connecticut,
           "Delaware" = Delaware,
           "Florida" = Florida,
           "Georgia" = Georgia,
           "Hawaii" = Hawaii,
           "Idaho" = Idaho,
           "Illinois" = Illinois,
           "Indiana" = Indiana,
           "Iowa" = Iowa,
           "Kansas" = Kansas,
           "Kentucky" = Kentucky,
           "Louisiana" = Louisiana,
           "Maine" = Maine,
           "Maryland" = Maryland,
           "Massachusetts" = Massachusetts,
           "Michigan" = Michigan,
           "Minnesota" = Minnesota,
           "Mississippi"= Mississippi,
           "Missouri"=Missouri,
           "Montana"=Montana,
           "Nebraska"=Nebraska,
           "Nevada"=Nevada,
           "New Hampshire"=NewHampshire,
           "New Jersey"=NewJersey)
  })
  
  figureInput <- reactive({
    switch(input$figure,
           "Population" = Population,
           "Income" = Income,
           "Illiteracy" = Illiteracy,
           "LifeExp" = LifeExp,
           "Murder" = Murder,
           "Hs Grad"=HsGrad,
           "Frost" = Frost,
           "Area" = Area)
           
  })
  
  
  # Print out the state selected
  output$name <- renderText({
    paste("You have selected",input$name,"as the US state")
  })
  
  # Print out the facts selected
  output$figure <- renderText({
    paste(input$figure,"is the facts selection for the",input$name,"state")
  })
  # Print out the Population facts selected  
  output$density <- renderText({
    print(statepop<- mean(datastate$Population))
    paste("The mean Population for whole US State is :",statepop )
  })
  
  output$tabletext <- renderText({
    paste("The data value of",input$name," is:")
  })
  
  # Print out the mean of figure selected
 output$mean <- renderText({
statedata<- datastate[(datastate$State==input$name),1:9]
#paste("The data value of",input$name," is",print(statedata))
paste(print(statedata))
    })
})