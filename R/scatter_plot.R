#' @export
scatter_plot <- function(df, x, y, colour_tag = 'Line'){
  df <- data.table(df)
  col_tags <- df[[colour_tag]] %>% unique()
  
  p <- plot_ly(type = 'scatter', mode = 'markers')
  if(colour_tag == 'None'){
    p <- p %>% add_trace(x = df[[x]], y = df[[y]], name = 'All')
  }else{
    for(i in seq_along(col_tags)){
      this_tag <- col_tags[[i]]
      df_small <- df[get(colour_tag) == this_tag]
      p <- p %>% add_trace(x = df_small[[x]], y = df_small[[y]], name = this_tag, text = paste0('Excess', df_small$Excess))
    }
  }
  
  p <- p %>% layout(xaxis = list(title = x), yaxis = list(title = y))


  return(p)
}
