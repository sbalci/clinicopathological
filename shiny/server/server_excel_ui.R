# 1 genUI: Upload excel Data ----

output$upload_excel_ui <- renderUI({

    if (is.null(input$select_data_ui))
    return()
  
  if (input$select_data_ui == "excel_ui")
    
    wellPanel(
      fileInput(
        inputId = "uploaded_excel_file",
        label =  "Upload your own Excel File",
        multiple = FALSE,
        accept = c(".xls",
                   ".xlsx")
      ),
      
      tags$br(),
      tags$br(),
      
      actionButton(inputId = "excel_Button", "Approve Excel"),
      p("Click the button to approve using data below"),
      
      
      tags$br(),
      tags$br(),
      
      tags$h3("Uploaded Excel Data"),
      reactable::reactableOutput("uploaded_excel_data_tab")
      
    )
  
})
