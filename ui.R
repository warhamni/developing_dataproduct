library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Header title
  headerPanel("Module 9:DevelopingData Products with Shiny App"),
  
  # Sidebar with controls to select a dataset and specify the view
  sidebarPanel(
    h3("United States Fact and Figures", style = "color:blue"),
    
    selectInput("name", "Choose a state", 
                choices = c("Alabama", "Alaska", "Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota")),
    
    
    selectInput("figure", "Choose a state figure", 
                choices = c("Population","Income","Illiteracy","LifeExp","HsGrad", "Murder","Frost","Area")),
    h3("Legend:-", style = "color:blue"),
    p ("1. Population = population estimate"),
    p ("2. Income = per capita income"),
    p ("3. Illiteracy = % of population") ,
    p ("4. LifeExp = life expectancy in years 1969–71"),
    p ("5. Murder = murder/non-negligent manslaughter rate /100,000 population"),
    p ("6. Hs Grad = % high-school graduates 1970"),
    p ("7. Frost = mean num of days with min temperature below freezing"),
    p ("8. Area = land area in square miles")
  ),
  
  # Show a summary of the dataset and HTML table with the requested
  # number of observations
  
  mainPanel(
    list(tags$head(tags$style("body {background-color: #ADD8E6; }"))),
    
    br(),
    
    p("This Project Assignment will give you facts and figures based on selected state your based on state.77 data available in R datasets"),
    img(src="http://www.freeworldmaps.net/northamerica/united-states/us-political-map.jpg", width="60%"),
    
    br(),
    p(""),
    
    verbatimTextOutput("name"),
    
    verbatimTextOutput("figure"),
    
    verbatimTextOutput("tabletext"),
    
    tableOutput("view"),
    
    verbatimTextOutput("mean")))
)

