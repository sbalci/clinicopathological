# References ----

output$references <-
    renderPrint({
    sessionInfo()
  })


output$packagesreport <-
  
  renderTable({
    report::cite_packages(session = sessionInfo())
    
  })


output$packagesreport2 <-
  
  renderTable({
    report::show_packages(session = sessionInfo())
    
  })


output$packagescitation <-
  
  renderText({
    citation("tidyverse")
    citation("readxl")
    citation("janitor")
    citation("report")
    citation("finalfit")
    citation("ggstatsplot")
    
  })






output$packagespacman <-
  
  renderText({
    pacman::p_loaded(all = TRUE)
    
  })
