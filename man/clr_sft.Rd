% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convenience.R
\name{clr_sft}
\alias{clr_sft}
\title{Apply by dimension.}
\usage{
clr_sft(x, dependence = TRUE)
}
\arguments{
\item{x}{A stratified feature table object to be CLR-transformed}

\item{dependence}{Placeholder. Whether feature levels are dependent on subtype levels (like with 16S-based inferential data).}
}
\value{
A clr-transformed sft
}
\description{
A method to apply a function by dimension for stratified feature tables. Wraps around apply.
}
