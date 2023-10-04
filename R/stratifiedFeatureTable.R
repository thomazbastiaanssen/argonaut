#' Generate a stratified feature table object
#'
#' @description
#' `as.stratifiedFeatureTable()` wrangles an existing table, such as a data frame, 
#' into the stratifiedFeatureTable format. 
#'
#' @param x A table to be formatted to `stratifiedFeatureTable` format.
#' @param sep A character string to separate the terms. 
#' @importFrom methods new
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
  
  
  #Sample indices are easy:
  #ind_samples = rep(1:ncol(x), each = nrow(x))
  
  #Find the indices of the features based on their order in the dimlist
  ind_feature = as.integer(factor(sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x)), levels = dimnames(ar)[[2]]))
  
  #Find the indices of the subtypes - these are already sorted. 
  ind_subtype = rep.int(1:dim(ar)[3], rle(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x)))[[1]])
  
  #Collate 
  arr_ind <- cbind(NA, ind_feature, ind_subtype) 

  #Chunk per sample to avoid max vector size
  for(i in 1:ncol(x)){
    
    #Generate relevant index
    ind = (nrow(x) * (i -1)) + 1:nrow(x)
    
    #Update array index
    arr_ind[,1] <- i
    
    #Introduce measurements
    ar[arr_ind] <- x[ind]
  }
  #ar[cbind(ind_samples, ind_feature, ind_subtype)] <- x
  
  #Return stratifiedFeatureTable
  new("stratifiedFeatureTable", ar)
}

# as.stratifiedFeatureTable2 <- function(x, sep = "\\|") {
#   
#   x = as.matrix(x)[order(row.names(x)),]
#   
#   dimlist <- list(
#     samples  = colnames(x),
#     features = sort(unique(sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x)))),
#     subtypes = unique(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x)))
#   )
#   
#   
#   #Make container
#   ar = array(dim  = sapply(FUN = length, dimlist), 
#              dimnames = dimlist
#   )
#   
#   #Where in the array to put
#   ar_ind = split(
#     x = as.integer(factor(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x)))),
#     f = sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x))
#   )
#   
#   #Where in the matrix to take from
#   x_ind = split(
#     x = 1:nrow(x),
#     f = sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x))
#   )
#   
#   #put it there 
#   for(ft in 1:dim(ar)[2]){
#     ar[,ft,ar_ind[[ft]]] <- t(x[x_ind[[ft]],, drop = FALSE])
#     #print(paste("finished round", st))
#   }
#   
#   #Return stratifiedFeatureTable
#   new("stratifiedFeatureTable", ar)
# }


#' @rdname as.stratifiedFeatureTable
#' @export
as.sft <- as.stratifiedFeatureTable


