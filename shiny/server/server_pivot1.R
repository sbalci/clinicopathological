output$pivot1 <- renderUI({
  
  df1 <- read_data() %>%
    select_if(is.character)
  
  pivot_vars1 <- get_pivot_vars(df1)
  
  pivot_module_UI(id = "id1", pivot_vars = pivot_vars1)
  
  })


observe({
  df1 <- read_data() %>%
    select_if(is.character)
  
  pivot_vars1 <- get_pivot_vars(df1)
  
callModule(shinyPivot::pivot_module, id = "id1", ns_id = "id1", df = df1, pivot_vars = pivot_vars1)
  
})


