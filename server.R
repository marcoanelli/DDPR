library(shiny)

library (readxl)
library(dplyr)
library(ggplot2)
library(lubridate)


shinyServer(function(input, output) {
 
  #---------------------------------------------------------------------------
  #setwd("C:/Users/MAnelli/Desktop/IC/Coursera/Developing data products/Assignment w4/Fitbit_Stat_Companion")
  
  dati <- read_excel("Fitbit data to use.xls")
  dati <- mutate(dati,Month=as.factor(month(Date)))
  
  #---------------------------------------------------------------------------
  
  output$Table <- renderDataTable({ select(dati, as.integer(input$checkGroup)) })
  output$Summary <- renderDataTable({ summary(select(dati, as.integer(input$checkGroup))) })
  
  #output$Plot <- renderPlot({ ggplot(dati,aes(x=Month, y=Date))+ geom_boxplot()})
  output$Plot2 <- renderPlot({ ggplot(dati,aes(x=Month, y=Total.calories))+ geom_boxplot(fill=2)})
  output$Plot3 <- renderPlot({ ggplot(dati,aes(x=Month, y=Steps))+ geom_boxplot(fill=3)})
  output$Plot4 <- renderPlot({ ggplot(dati,aes(x=Month, y=Distance.km))+ geom_boxplot(fill=4)})
  output$Plot5 <- renderPlot({ ggplot(dati,aes(x=Month, y=Floors))+ geom_boxplot(fill=5)})
  output$Plot6 <- renderPlot({ ggplot(dati,aes(x=Month, y=Inactivity.minutes))+ geom_boxplot(fill=6)})
  output$Plot7 <- renderPlot({ ggplot(dati,aes(x=Month, y=Light.activity.mins))+ geom_boxplot(fill=7)})
  output$Plot8 <- renderPlot({ ggplot(dati,aes(x=Month, y=Moderate.activity.mins))+ geom_boxplot(fill=8)})
  output$Plot9 <- renderPlot({ ggplot(dati,aes(x=Month, y=Intense.activity.minutes))+ geom_boxplot(fill="orange")})
  output$Plot10 <- renderPlot({ ggplot(dati,aes(x=Month, y=Activity.calories))+ geom_boxplot(fill=10)})
  
  output$loaded <- renderText ({ "test dataset succesfully loaded"})
  
})

  
 
  
  
  
  
  
  
  
 
