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
apply_by <- function(X, MARGIN, FUN, na.exclude = TRUE, ..., simplify = TRUE){
  stopifnot( "MARGIN must be exactly 1, 2 or 3." = sum(MARGIN %in% 1:3) == 1)
  
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
