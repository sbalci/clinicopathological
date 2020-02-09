# generate UI: Survival ----

output$surv_time_ui <- renderUI({
  if (is.null(input$input_type))
    return()
  
  if (input$input_type == "ac")
    textInput(inputId = "survivaltime",
              label = "Survival Time",
              value = "OverallTime")
  
})


output$surv_time_ui2 <- renderUI({
  if (is.null(input$input_type))
    return()
  
  if (input$input_type == "c_diff")
    
    wellPanel(
      selectInput(
        inputId = "initialdate",
        label = "Initial Date",
        selected = "SurgeryDate",
        choices = names(mydata)
      ),
      
      selectInput(
        inputId = "finaldate",
        label = "Follow-up Date",
        selected = "LastFollowUpDate",
        choices = names(mydata)
      )
    )
})

