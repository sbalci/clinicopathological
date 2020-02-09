# 1 genUI: Upload csv Data ----

output$upload_csv_ui <- renderUI({
  if (is.null(input$select_data_ui))
    return()
  
  if (input$select_data_ui == "csv_ui")
    
    wellPanel(
      p("The analysis will be made with your data"),
      p("Upload your data here"),
      
      
      tags$h3("Upload Your File"),
      tags$br(),
      tags$br(),
      
      # Input: Upload csv file ----
      
      fileInput(
        inputId = "uploaded_csv_file",
        label =  "Upload your own CSV File",
        multiple = FALSE,
        accept = c(
          "text/csv",
          "text/comma-separated-values,text/plain",
          ".csv"
        )
      ),
      
      # Horizontal line
      tags$hr(),
      
      # Input: Checkbox if file has header
      checkboxInput("header", "Header", TRUE),
      
      # Input: Select separator
      radioButtons(
        "sep",
        "Separator",
        choices = c(
          Comma = ",",
          Semicolon = ";",
          Tab = "\t"
        ),
        selected = ";"
      ),
      
      # Input: Select quotes
      radioButtons(
        "quote",
        "Quote",
        choices = c(
          None = "",
          "Double Quote" = '"',
          "Single Quote" = "'"
        ),
        selected = '"'
      ),
      
      tags$br(),
      tags$br(),
      
      actionButton(inputId = "csv_Button", "Approve"),
      p("Click the button to approve using data below"),
      
      tags$br(),
      tags$br(),
      
      tags$h3("Uploaded Data"),
      reactable::reactableOutput("uploaded_csv_data_tab")
      
    )
})
