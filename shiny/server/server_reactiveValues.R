# 1 Test Data ----

testdata <- reactive({
  mydata
})

# 2 Func: Remove ID columns from data for brief report ----

briefSummaryData <- reactive({
  id_cols <- input$IDCols
  if (is.null(input$IDCols)) {
    read_data()
  } else {
    read_data() %>%
      dplyr::select(-id_cols)
  }
})


# 4 Func: Remove columns from data for correlation matrix

corr_matrix_data <- reactive({
  
  corr_matrix_Cols <- input$corr_mat_Cols
  
  if (is.null(input$corr_mat_Cols)) {
    
    read_data()
    
  } else {
    
    read_data() %>%
      dplyr::select(-corr_matrix_Cols)
    
  }
  

  
})



# 4 Correlation ----

corr <- reactive({

  mydata <- corr_matrix_data()

  corr <- correlation::correlation(mydata)

})



