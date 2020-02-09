## Some helper functions to simplify our app
## from this tutorial https://laderast.github.io/gradual_shiny/app-3-adding-tooltips-with-plotly.html
#' Return the numeric categorical variables 
#'
#' @param df 
#' 
#' @return
#' @export
#' 
get_numeric_variables <- function(df){
  varClass <- sapply(df, class)
  
  numericVars <- names(varClass[varClass %in% c("numeric", "integer")])
  return(numericVars)
}
