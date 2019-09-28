
observeEvent(input$csv, {
  values$df_data <- data.table::fread(input$csv$datapath)
  
  output$plot_excess_distribution <- renderPlotly({
    tubeshiny::plot_excess_distribution(values$df_data)
  })
  
  output$plot_excess_distribution2 <- renderPlotly({
    tubeshiny::plot_excess_distribution2(values$df_data)
  })
  
  output$plot_excess_boxplot <- renderPlotly({
    tubeshiny::plot_excess_boxplot(values$df_data)
  })
  
  output$plot_excess_ts <- renderPlotly({
    tubeshiny::plot_excess_ts(values$df_data)
  })
})