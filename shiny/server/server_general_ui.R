# 1 genUI: Upload spss Data ----

output$upload_general_ui <- renderUI({
  
  if (is.null(input$select_data_ui))
    return()
  
  if (input$select_data_ui == "general_ui")
    
    
    wellPanel(p("Work in progress General Data"),
             
              
                  tags$style(type='text/css', ".well { max-width: 20em; }"),
                  # Tags:
                  tags$head(
                    tags$style(type="text/css", "select[multiple] { width: 100%; height:10em}"),
                    tags$style(type="text/css", "select { width: 100%}"),
                    tags$style(type="text/css", "input { width: 19em; max-width:100%}")
                  ),
                  # Select filetype:
                  selectInput("readFunction", "Function to read data:", c(
                    # Base R:
                    "read.table",
                    "read.csv",
                    "read.csv2",
                    "read.delim",
                    "read.delim2",
                    # foreign functions:
                    "read.spss",
                    "read.arff",
                    "read.dbf",
                    "read.dta",
                    "read.epiiinfo",
                    "read.mtp",
                    "read.octave",
                    "read.ssd",
                    "read.systat",
                    "read.xport",
                    # Advanced functions:
                    "scan",
                    "readLines"
                  )),
                  # Argument selecter:
                  htmlOutput("ArgSelect"),
                  # Argument field:
                  htmlOutput("ArgText"),
                  # Upload data:
                  fileInput("file", "Upload data-file:"),
                  # Variable selection:
                  htmlOutput("varselect"),
                  br(),
                  textInput("name","Dataset name:","Data"),
                  downloadLink('downloadDump', 'Download source'),
                  downloadLink('downloadSave', 'Download binary'),
                
                # Main:
                
                  tableOutput("table"),

              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              tags$hr(), 
              tags$hr(), 
              fileInput(
                inputId = "uploaded_general_file",
                label =  "Upload your own SPSS File",
                multiple = FALSE
              ),
              
              tags$br(),
              tags$br(),
              
              actionButton(inputId = "general_Button", "Approve SPSS"),
              p("Click the button to approve using data below"),
              
              tags$br(),
              tags$br(),
              
              tags$h3("Uploaded Data"),
              reactable::reactableOutput("uploaded_general_data_tab")
              
    )
  
})
