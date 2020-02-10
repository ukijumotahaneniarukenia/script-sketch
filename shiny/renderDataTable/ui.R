#https://www.randpy.tokyo/entry/shiny_25

library(shiny)
library(DT)

shinyUI(fluidPage(
  titlePanel("DT::renderDataTable"),
  DT::dataTableOutput("table")
))
