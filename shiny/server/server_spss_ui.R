# 1 genUI: Upload spss Data ----

output$upload_spss_ui <- renderUI({
  if (is.null(input$select_data_ui))
    return()
  
  if (input$select_data_ui == "spss_ui")
    
    
    wellPanel(p("Work in progress SPSS"),
              
              fileInput(
                inputId = "uploaded_spss_file",
                label =  "Upload your own SPSS File",
                multiple = FALSE,
                accept = c(".sav")
              ),
              
              tags$br(),
              tags$br(),
              
              actionButton(inputId = "spss_Button", "Approve SPSS"),
              p("Click the button to approve using data below"),
              
              tags$br(),
              tags$br(),
              
              tags$h3("Uploaded SPSS Data"),
              reactable::reactableOutput("uploaded_spss_data_tab")
              
    )
  
})
