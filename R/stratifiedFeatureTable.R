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
  
  x = as.matrix(x)[order(row.names(x)),]
  
  dimlist <- list(
    samples  = colnames(x),
    features = sort(unique(sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x)))),
    subtypes = unique(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x)))
  )
  
  
  #Make container
  ar = array(dim  = sapply(FUN = length, dimlist), 
             dimnames = dimlist
  )

  #Where in the array to put
ar_ind = split(
  x = as.integer(factor(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x)))),
  f = sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x))
  )

#Where in the matrix to take from
x_ind = split(
  x = 1:nrow(x),
  f = sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x))
)

#put it there 
for(ft in 1:dim(ar)[2]){
  ar[,ft,ar_ind[[ft]]] <- x[x_ind[[ft]],, drop = FALSE]
  #print(paste("finished round", st))
}
  
  #Return stratifiedFeatureTable
  new("stratifiedFeatureTable", ar)
}


#' @rdname as.stratifiedFeatureTable
#' @export
as.sft <- as.stratifiedFeatureTable
