library(shiny)
library(datasets)
library(DT)

# Define server logic required to summarize and view the selected dataset
data(state)
statedata = cbind(data.frame(state.x77), state.abb, state.area, state.center,  state.division,state.name, state.region)

str(statedata)
knitr::kable(state.x77)

#state.x77$name <- rownames(state.name)
#state.x77$figure <- dimnames(8)
rownames(state.x77)<- c("Alabama","Alaska",
                        "Arizona","Arkansas",
                        "California","Colorado",
                        "Connecticut","Delaware",
                        "Florida","Georgia",
                        "Hawaii","Idaho",
                        "Illinois","Indiana",
                        "Iowa","Kansas",
                        "Kentucky","Louisiana",
                        "Maine","Maryland",
                        "Massachusetts","Michigan",
                        "Minnesota","Mississippi",
                        "Missouri","Montana",
                        "Nebraska","Nevada",
                        "New Hampshire",
                        "New Jersey", "New Mexico","New York","North Carolina",
                        "North Dakota","Ohio","Oklahoma",
                        "Oregon",
                        "Pennsylvania",
                        "Rhode Island",
                        "South Carolina",
                        "South Dakota",
                        "Tennessee",
                        "Texas",
                        "Utah",
                        "Vermont",
                        "Virginia",
                        "Washington",
                        "West Virginia",
                        "Wisconsin",
                        "Wyoming")

colnames(state.x77) <- c("Population","Income","Illiteracy","LifeExp","Murder","Hs Grad","Frost","Area")
#colnames(state.x77)<- c("Population","Income","Illiteracy","LifeExp","Murder","Hs Grad","Frost","Area")

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
  # Print out the density facts selected  
  output$density <- renderText({
    print(statedensity<- head(state.x77[,"Population"])/head(state.x77[,"Area"]))
    paste("The table below summarises the US State density selected :",statedensity )
  })
  
  output$tabletext <- renderText({
    paste("The table below summarises the US State Facts and Figures selected:")
  })
  # Show table of results for that state
  output$view <- renderDataTable({
    print(viewtab<-head(state.x77$name==input$name,c("Population","Income","Illiteracy","Murder","HS.Grad","Frost","Area")))
  })
  
  # Print out the mean of figure selected
  output$mean <- renderText({knitr::kable(state.x77$dimnames)
statedata<- state.x77[state.x77$name==input$name,input$figure]
paste("The mean value of",head(state.x77[,`colnames<-`(state.x77$name==input$figure)])," is",print(mean(input$figure)))
    })
})