

library(shiny)

# 
shinyUI(navbarPage(("Fitbit Stats Companion v1.0"),
                   
                   tabPanel("Documentation",
                            
                            h1("Welcome to the Fitbit Stats Companion v1.0"),
                            
                            tags$img(height = 100,
                                     width = 250,
                                     src = "Fitbit.png"),
                            
                            tags$p(" "),
                            tags$p("As you all know, the Fitbit wearables upload data about your physical activity onto the company website"), 
                            tags$p(" "),
                            tags$p("If you log on, you can get a very nice graphical display of the number of steps, the distance walked, the amount of calories burned, etc."),
                            tags$p(" "),
                            tags$a(href= "http://www.fitbit.com","Fitbit.com"),
                            tags$p(" "),
                            tags$p("As a person who likes to play with data, however, I would like to get more insights, such as for example, dispersion measures."),
                            tags$p(" "),
                            tags$p("This app takes the Excel file that can be downloaded from the website and shows summary statistics for the desired variables (tab <Stats> in the upper part of the screen) or a series of boxplots (tab <Plots>) for all the relevant variables."),
                            tags$p(" "),tags$p(" "),
                            tags$p("This version uses a test dataset on the shiny.io website. The set contains my data for the months of March, April and May 2017."),
                            tags$p("A more advanced version will allow to upload the file remotely, and to have it analyzed."),
                            tags$p(" "),tags$p(" "),tags$p(" "),tags$p(" "),
                            tags$p("Please wait for the confirmation message that the dataset has loaded successfully."),
                            tags$p(" "),
                            tags$p(" "),
                            tags$p(" "),
                            tags$p(" "),
                            span(em(textOutput("loaded"), style="color:blue"))
                            ),
                   tabPanel("Stats",
  
  titlePanel(h3("Summary Stata and raw data")),
  
  sidebarLayout(
    sidebarPanel(
      h3("Select the variable(s) to analyse"),
      
      
      checkboxGroupInput("checkGroup", label = "Parameter", choices=list("Date"=1,"Total calories"=2,"Steps"=3,
                                                                         "Distance"=4, "Floors Climbed"=5, "Inactivity(mins.)"=6,
                                                                         "Light Activity (mins.)"=7, "Moderate Activity (mins.)"=8,
                                                                         "Intense Activity (mins.)"=9,"Activity Calories"=10),
    selected=2)),
    
    
    mainPanel(
      tabsetPanel(
        # tabPanel("Box Plots", plotOutput("Plot")), 
        tabPanel("Summary Stats", dataTableOutput("Summary")), 
        tabPanel("Raw Data", dataTableOutput("Table"))
      )
    )
  )),
  
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  tabPanel("Plots",
           
           titlePanel(h4("Summary boxplots by month")),
           sidebarLayout(
             sidebarPanel(
               h5("The top and bottom of the box are 25th and 75th percentile, and the centerline is the 50th.
                         The dots at the end of the boxplot represent the outliers. ")
               
               
             
             ),
             mainPanel(
               h4(" "),
               #plotOutput("Plot"),
               plotOutput("Plot2"),
               plotOutput("Plot3"),
               plotOutput("Plot4"),
               plotOutput("Plot5"),
               plotOutput("Plot6"),
               plotOutput("Plot7"),
               plotOutput("Plot8"),
               plotOutput("Plot9"),
               plotOutput("Plot10")
               
               
             )
           )
           
           
           
           )
))

