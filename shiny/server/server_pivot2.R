pivot2Data <- reactive({
  id_cols <- input$pivot2Cols
  if (is.null(input$pivot2Cols)) {
    read_data()
  } else {
    read_data() %>%
      dplyr::select(-id_cols)
  }
})


observe({
  mydata <- read_data()
  names_data <- names(mydata)
  updateSelectizeInput(session,
                       'pivot2Cols',
                       choices = names_data,
                       server = TRUE)
})



output$pivot2 <- rpivotTable::renderRpivotTable({
  
  mydata <- pivot2Data()
  
  rpivotTable::rpivotTable(mydata)
  
})
