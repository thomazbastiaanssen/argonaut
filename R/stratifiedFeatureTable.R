#' Generate a stratified feature table object
#'
#' @description
#' `as.stratifiedFeatureTable()` wrangles an existing table, such as a data frame, 
#' into the stratifiedFeatureTable format. 
#'
#' @param x A table to be formatted to `stratifiedFeatureTable` format.
#' @param sep A character string to separate the terms. 

#' @export
#' @examples
#' sdf <- dummy_strat(10, 20, 10)
#' 
#' sft <- as.stratifiedFeatureTable(sdf)
as.stratifiedFeatureTable <- function(x, sep = "\\|") {
  
  dimlist <- list(
    samples  = colnames(x),
    features = sort(unique(sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x)))),
    subtypes = sort(unique(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x))))
  )
  
  all_comb <- paste(
    rep(unique(dimlist$subtypes), each = length(dimlist$features)), 
    rep(unique(dimlist$features), length(dimlist$subtypes)), 
    sep  = gsub(pattern = "\\\\",   replacement = "", sep)
  )  
  
  #Fill gaps with NAs
  x = merge(x = x, y = data.frame(row.names = all_comb), by.x = 0, by.y = 0, all.y = T)[,-1]
  
  row.names(x) <- all_comb
  
  #Reorganize input data to ensure reasonable indexing
  ar <- array(
    data = t(x), 
    dim  = sapply(FUN = length, dimlist), 
    dimnames = dimlist
              )
  
  #Return stratifiedFeatureTable
  new("stratifiedFeatureTable", ar)
}

