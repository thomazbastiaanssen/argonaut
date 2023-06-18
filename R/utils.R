#' Make dummy stratified data.
#' @description Make normal dummy stratified feature data.
#' @param nmicrobes An integer. How many microbes
#' @param ngenes An integer. How many genes
#' @param nsamples An integer. How many samples
#' @return A formatted data.frame.
#' @export
#'
dummy_strat <- function(nmicrobes, ngenes, nsamples){

data.frame(row.names = paste0(
  rep(paste0("microbe_", 1:nmicrobes), each = ngenes), 
  rep(paste0("|function_", 1:ngenes))),  
  
  matrix(data =  1:prod(nmicrobes, ngenes, nsamples), ncol = nsamples)
  #replicate(rnorm(n = 10), n = nsamples)
  
  )

}
