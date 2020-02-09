# Select Data to Read With Button ----
button_val <- reactiveVal("init")

observeEvent(input$test_Button, {
  new_val <- "test"
  button_val(new_val)
})

observeEvent(input$excel_Button, {
  new_val <- "excel"
  button_val(new_val)
})

observeEvent(input$spss_Button, {
  new_val <- "sav"
  button_val(new_val)
})


output$value55 <- renderText({
  button_val()
})


read_data <- reactiveVal()

observe({

  button <- button_val()

  if (button == "excel") {

    read_data(uploaded_excel_data())

    # } else if (button == "sav") {
    #
    #   read_data(uploaded_spss_data())

      } else if (button == "test" | button == "init") {

        read_data(testdata())
  }
})


# observe({
#   
#   button <- button_val()
#   
#   mydata <- switch (button,
#     "test" = testdata(),
#     "init" = testdata(),
#     "excel" = uploaded_excel_data(),
#     "sav" = uploaded_spss_data()
#   )
#   
#   read_data(mydata)
# 
# })




# Names Columns for inputs ----

# All Names ----

observe({
  mydata <- read_data()
  names_data <- names(mydata)
  updateSelectizeInput(session,
                       'IDCols',
                       choices = names_data,
                       server = TRUE)
})


# Func: Get Categorical Variables ----
observe({
  mydata <- read_data()
  catVar1 <-
    names(which(# is.factor(mydata)
      sapply(mydata, class) == "character"))
  updateSelectInput(session,
                    'survfactor',
                    choices = catVar1)
})


observe({
  mydata <- read_data()
  # numericVars <- names(get_numeric_variables(mydata))
  numericVars <- names(mydata)
  updateSelectInput(session,
                    "x_variable",
                    choices = numericVars,
                    selected = numericVars[1]
  )
  
  updateSelectInput(session,
                    "y_variable",
                    choices = numericVars,
                    selected = numericVars[2]
  )
  
  cat_vars <-
    names(get_category_variables(mydata))
  
  updateSelectInput(session,
                    "color_variable",
                    choices = cat_vars,
                    selected = cat_vars[1])
  
  updateSelectInput(session,
                    "size_variable",
                    choices = cat_vars,
                    selected = cat_vars[1])
})


observe({
  
  mydata <- read_data()
  # numericVars <- names(get_numeric_variables(mydata))
  numericVars_cor <- names(mydata)
  
  updateSelectizeInput(session,
                       "corr_mat_Cols",
                       choices = numericVars_cor,
                       server = TRUE
  )
})


