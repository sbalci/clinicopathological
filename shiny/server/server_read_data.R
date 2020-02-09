# 1 Uploaded csv Data ----


uploaded_csv_data <- reactive({
  req(input$uploaded_csv_file)
  
  readr::read_csv2(
    file = input$uploaded_csv_file$datapath,
    # header = input$header,
    # sep = input$sep,
    quote = input$quote,
    na = c("NA", "NaN", "")
  )
  
})

# 1 Uploaded Excel Data ----


uploaded_excel_data <- reactive({
  
  req(input$uploaded_excel_file)
  
  readxl::read_excel(path = input$uploaded_excel_file$datapath)
  
})

# 1 Uploaded SPSS Data ----


uploaded_spss_data <- reactive({
  
  req(input$uploaded_spss_file)
  
  foreign::read.spss(input$uploaded_spss_file$datapath,
                     use.value.labels = TRUE,
                     to.data.frame = TRUE)
    
})

