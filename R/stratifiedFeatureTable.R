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
    features = unique(sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x))),
    samples  = colnames(x),
    subtypes = unique(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x)))
  )
  
  
  #Make container
  ar = array(dim  = sapply(FUN = length, dimlist), 
             dimnames = dimlist
  )
  
  
  
  subtype_end   = cumsum(table(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x))))
  subtype_begin = c(0, subtype_end[-dim(ar)[3]])+1
  
  feature_ind   = list()
  
  #This loop may be cleaned up
  for(st in 1:dim(ar)[3]){
    feature_ind[[st]] = which(unique(sub(pattern = paste0(".*", sep), 
                                              replacement = "", 
                                              x = row.names(x))) %in% 
                                sub(pattern = paste0(".*", sep), 
                                         replacement = "", 
                                         row.names(x[subtype_begin[st]:subtype_end[st],])))
  }
  
  #print("Starting for loop")
  for(st in 1:dim(ar)[3]){
    
    ar[feature_ind[[st]],rep(T, dim(ar)[2]),st] <- x[subtype_begin[st]:subtype_end[st],, drop = FALSE]
    #print(paste("finished round", st))
  }
  
  #Return stratifiedFeatureTable
  new("stratifiedFeatureTable", ar)
}


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
as.stratifiedFeatureTable2 <- function(x, sep = "\\|") {
  
  x = as.matrix(x)[order(row.names(x)),]
  
  dimlist <- list(
    features = unique(sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x))),
    samples  = colnames(x),
    subtypes = unique(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x)))
  )
  
  
  #Make container
  ar = array(dim  = sapply(FUN = length, dimlist), 
             dimnames = dimlist
  )
  
  
  
  subtype_end   = cumsum(table(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x))))
  subtype_begin = c(0, subtype_end[-dim(ar)[3]])+1
  
  feature_ind   = split(
    x = as.integer(factor(sub(pattern = paste0(".*", sep), replacement = "", x = row.names(x)))), 
    f = cumsum(!duplicated(sub(pattern = paste0(sep, ".*"), replacement = "", x = row.names(x))))
    )
  
    for(st in 1:dim(ar)[3]){
    
    ar[feature_ind[[st]],rep(T, dim(ar)[2]),st] <- x[subtype_begin[st]:subtype_end[st],, drop = FALSE]
    #print(paste("finished round", st))
  }
  
  #Return stratifiedFeatureTable
  new("stratifiedFeatureTable", ar)
}


#' @rdname as.stratifiedFeatureTable
#' @export
as.sft <- as.stratifiedFeatureTable
