output$trial1 <- renderPlot({
  
  m <- highlight_key(mpg)
  p <- ggplot2::ggplot(m, aes(displ, hwy)) + geom_point()
  gg <- highlight(ggplotly(p), "plotly_selected")
  crosstalk::bscols(gg, DT::datatable(m))
  
  
})
