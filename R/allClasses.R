#' An S4 class stratifiedFeatureTable. 
#'
#' @description This is a specialized S4 class to represent stratified feature data.
#' @exportClass  stratifiedFeatureTable
#' 
setClass("stratifiedFeatureTable",
        contains = "array"
)

setValidity("stratifiedFeatureTable", function(object) {
  if (!identical(names(dimnames(object)), c("samples","features","subtypes"))) {
    'dimnames must be exactly c("samples","features","subtypes").' 
  } else {
    TRUE
  }
})


