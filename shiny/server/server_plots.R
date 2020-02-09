# 4 Correlation -----


output$scatter_plot <- renderPlot({
  ggplot2::ggplot(
    read_data(),
    aes_string(
      x = input$x_variable,
      y = input$y_variable,
      color = input$color_variable
      
    )
  ) +  
    geom_point()
  
})





output$scatter_plot_highcharter <- highcharter::renderHighchart({
  
  mydata <- read_data()
  x <- input$x_variable
  y <- input$y_variable
  group <- input$color_variable
  
  highcharter::hchart(mydata, 
                      "scatter",
    highcharter::hcaes(x = x,
                            y = y,
                            group = group
                            )
                      )
})


  
