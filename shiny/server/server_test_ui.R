# 1 genUI: Test Data ----

output$test_ui <- renderUI({
  
  if (is.null(input$select_data_ui))
    return()
  
  if (input$select_data_ui == "testdata_ui")
    
    wellPanel(
      p("The analysis will be made with an example data"),
      p("You may download the data to see how an organized data should be"),
      
      tags$b("Download Fake Example Data"),
      tags$br(),
      tags$br(),
      
      downloadButton(outputId = "downloadExample", label = "Download Fake Excel"),
      
      tags$br(),
      tags$br(),
      
      # shinyWidgets::switchInput(inputId = "test_Button", value = FALSE),
      
      # actionButton(inputId = "test_Button", "Approve"),
      # rintrojs::introjsUI(),
      
      # rintrojs::introBox(
      
        shinyWidgets::materialSwitch(inputId = "test_Button",
                                     label = "Slide to Approve",
                                     status = "info"
                                     ),
        
        # data.step = 1,
        # data.intro = "This is a slider",
        # data.hint = "You have to Slide to Approve"
        # ),
      
      # shinyWidgets::prettyCheckbox(
      #   inputId = "test_Button", label = "Approve", icon = icon("check")
      # ),
      
      p("Click the button to approve using data below"),
      
      tags$br(),
      tags$br(),
      
      tags$h3("Test (Example) Data"),
      reactable::reactableOutput("testdata_tab")
      
      
    )
})
