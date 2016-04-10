library(shiny)
library(datasets)
library(DT)

# Define server logic required to summarize and view the selected dataset
data(state)
statedata = cbind(data.frame(state.x77), state.abb, state.area, state.center,  state.division,state.name, state.region)

str(statedata)

state.x77$name <- rownames(state.name)
state.x77$figure <- dimnames(8)

#df = data.frame(A=1:10, B=11:20)
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
           "Minnesota" = Minnesota)
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
  
  output$tabletext <- renderText({
    paste("The table below summarises the US State Facts and Figures selected:" )
  })
  
  # Show table of results for that state
  output$view <- renderDataTable({
    print(state.x77[state.x77$name==input$name,c("Population","Income","Illiteracy","Murder","HS.Grad","Frost","Area")])
  })
  
  # Print out the mean of figure selected
  output$mean <- renderText({
#statedata<- state.x77[state.x77$name==input$name,input$figure]
paste("The mean value of",input$name," is",print(mean(statedata)))
    })
})