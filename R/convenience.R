#' Apply by dimension.
#' @description A method to apply a function by dimension for stratified feature tables. Wraps around apply.  
#' @param X A stratified feature table object. Preferrably of the stratifiedFeatureTable class.   
#' @param MARGIN An single integer indicating which dimension to apply a given function on. 1 indicates by sample, 2 by feature and 3 by subtype. 
#' @param FUN The function to be applied; See `?apply`. 
#' @param na.exclude A boolean. Recommended to keep at TRUE.
#' @param ... Optional arguments to FUN.
#' @param simplify A logical indicating whether results should be simplified if possible.
#' @return See `?apply`.
#' @export
#' 
#'
apply_by <- function(X, MARGIN, FUN, na.exclude = TRUE, ..., simplify = TRUE){
  if(is.numeric(MARGIN))
  {stopifnot( "If MARGIN is numeric, it must be exactly 1, 2 or 3." = sum(MARGIN %in% 1:3) == 1)}
  if(is.character(MARGIN))
  {stopifnot( "If MARGIN is a character string, it must be exactly the name of the dimension to apply over." = sum(MARGIN %in% names(dimnames(X))) == 1)
    MARGIN = which(MARGIN == names(dimnames(X)))}

  #Exclude NAs per iteration
  if(na.exclude){
    return(apply(X = X, 
                 MARGIN = setdiff(x = 1:3, y = MARGIN), 
                 FUN = function(x){do.call(what = FUN, args = list(na.exclude(x), ...))}, 
           simplify = simplify)
    )
  }
  
  return(apply(X = X, 
               MARGIN = setdiff(x = 1:3, y = MARGIN), 
               FUN = FUN, 
               ... = ..., 
               simplify = simplify)
         )
}


#' Extract all subtypes of a feature.
#' @description Extract a matrix from a stratified feature table 
#' @param x A stratified feature table object. Preferably of the stratifiedFeatureTable class.   
#' @param f Character or integer. Name or index of feature to extract. 
#' @return A matrix with samples as rows and feature subtypes as columns
#' @export
#' 
#'
getFeature <- function(x, f){
  x[,f,][, !is.na(colSums(x[,f,]))]
}
