# https://www.randpy.tokyo/entry/shiny_25

library(shiny)
library(DT)

#https://niszet.hatenablog.com/entry/2018/05/02/073000
suppressPackageStartupMessages(library(dplyr))

#https://qiita.com/gigamori/items/0152639dc0a68a400525
tgt_dat<-read.csv("test.csv")
shinyServer(function(input, output) {
  output$table = DT::renderDataTable(tgt_dat, 
                                     extensions = c('Buttons'), 
                                     options = list(lengthMenu = c(5, 10, 20),
                                                    dom = 'Blfrtip',
                                                    pageLength = 5, 
                                                    buttons = c('csv', 'excel', 'pdf')))
})
