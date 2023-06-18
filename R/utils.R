#' Make dummy stratified data.
#' @description Make normal dummy stratified feature data.
#' @param nsubtypes An integer. How many subtypes
#' @param nfeatures An integer. How many features
#' @param nsamples An integer. How many samples
#' @param type A character vector. One ofc("seq", "by_subtype"). 
#' @param p_missing A proportion (0-1). Indicates the number of feature-subtype pairs should be dropped. 
#' @return A formatted data.frame.
#' @export
#'
dummy_strat <- function(nsubtypes, nfeatures, nsamples, type = "seq", p_missing = 0.2){
  stopifnot("type must be `seq` or `by_subtype`." = type %in% c("seq", "by_subtype"))
  stopifnot("The argument `p_missing` is a proportion and should be between 0-1." = p_missing >= 0 & p_missing <= 1)
  
  if(type == "seq"){
    values =  matrix(data = 1:prod(nsubtypes, nfeatures, nsamples), ncol = nsamples)
  }
  if(type == "by_subtype"){
    basesubtype  = sample(1:1000, size = nsubtypes)
    subtypetable = floor(replicate(n = nsamples, expr = abs(rnorm(n = nsubtypes, mean = 1))) * basesubtype)
    values       = subtypetable[rep(1:nsubtypes, each = nfeatures),]
    values       = values * c(replicate(n = nsubtypes, sample(c(1:6), size = nfeatures, replace = T), simplify = T))
  }
  
  data.frame(row.names = paste0(
    rep(paste0("subtype_", formatC(1:nsubtypes, digits = nchar(nsubtypes), format = "d", flag = "0")), each = nfeatures), 
    rep(paste0("|feature_", formatC(1:nfeatures, digits = nchar(nfeatures), format = "d", flag = "0")))),  
    
    values

  )[sort(sample(1:(nsubtypes*nfeatures), size = floor((nsubtypes*nfeatures) * c(1-p_missing)))),]
  
}