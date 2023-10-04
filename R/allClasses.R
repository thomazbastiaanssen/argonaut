#' An S4 class stratifiedFeatureTable. 
#'
#' @description This is a specialized S4 class to represent stratified feature data.
#' @exportClass  stratifiedFeatureTable
setClass("stratifiedFeatureTable",
        contains = "array"
)

#' Make sure a stratifiedFeatureTable object is suitably shaped. 
#'
#' @description Make a stratifiedFeatureTable, a specialized S4 class to represent stratified feature data.
#' @return A stratifiedFeatureTable object.
setValidity("stratifiedFeatureTable", function(object) {
  if (!identical(names(dimnames(object)), c("samples","features","subtypes"))) {
    'dimnames must be exactly c("samples","features","subtypes").' 
  } else {
    TRUE
  }
})

#' Make a suitably shaped array into a stratifiedFeatureTable. 
#'
#' @description Make a stratifiedFeatureTable, a specialized S4 class to represent stratified feature data.
#' @param x Asuitably shaped array to be changed to `stratifiedFeatureTable` format.
#' @return A stratifiedFeatureTable object.
#' @importFrom methods new
#' @export
stratifiedFeatureTable <- function(x){
  new("stratifiedFeatureTable", x)
}

#' @rdname stratifiedFeatureTable
#' @export
sft <- stratifiedFeatureTable
