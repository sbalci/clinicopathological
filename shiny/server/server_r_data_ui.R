# 1 genUI: Upload R Data ----

output$upload_r_ui <- renderUI({
  if (is.null(input$select_data_ui))
    return()
  
  if (input$select_data_ui == "r_ui")
    
    wellPanel(p("Work in progress R")
              
              # TODO
    )
  
})
