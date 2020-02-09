# 1 Download Test Data ----


output$downloadExample <- downloadHandler(
  filename = function() {
    paste(Sys.Date(), "histopathR", "fakedata.xlsx", sep = "-")
    
  },
  
  content = function(file) {
    rio::export(x = exampleData,
                file = file,
                format = "xlsx")
  }
  
)





# Download Modified Data ----


output$downloadModified <- downloadHandler(
  filename = function() {
    paste(Sys.Date(), "histopathR", "modifiedData.xlsx", sep = "-")
    
  },
  
  
  content = function(file) {
    rio::export(x = read_data(),
                file = file,
                format = "xlsx")
  }
  
)




# Download References as bib ----


output$downloadbib <- downloadHandler(
  filename = function() {
    paste(Sys.Date(), "histopathR", "packages.bib", sep = "-")
  },
  
  
  content = function(file) {
    knitr::write_bib(x = c(.packages(), "knitr", "shiny"),
                     file = file)
    
  }
  
)
