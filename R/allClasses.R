#' An S4 class stratifiedFeatureTable. 
#'
#' @description This is a specialized S4 class to represent stratified feature data.
#' @exportClass  stratifiedFeatureTable
setClass("stratifiedFeatureTable",
        contains = "array"
)