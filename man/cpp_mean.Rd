% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{cpp_mean}
\alias{cpp_mean}
\alias{geometric_mean_reference}
\alias{geometric_mean}
\alias{arithmetic_mean}
\title{Calculate mean by factors}
\usage{
geometric_mean_reference(w, classes)

geometric_mean(w, classes)

arithmetic_mean(w, classes)
}
\arguments{
\item{w}{An numeric vector. All entries should be positive.}

\item{classes}{A factor variable. Must have the same length as \code{w}.}
}
\description{
These functions calculate the arithmetic and geometric mean of the weight for each class. \code{geometric_mean} and
\code{arithmetic_mean} return a \code{numeric} vector of the same length as \code{w} which stores the averaged weight for each
observation. \code{geometric_mean_reference} returns the same value by reference, i.e. the input value \code{w} gets
overwritten by the updated weights. See examples.
}
\examples{

## create random data
nobs <- 10
classLabels <- letters[1:3]
dat = data.frame(
  weight = exp(rnorm(nobs)),
  household = factor(sample(classLabels, nobs, replace = TRUE))
)
dat

## calculate weights with geometric_mean
geom_weight <- geometric_mean(dat$weight, dat$household)
cbind(dat, geom_weight)

## calculate weights with arithmetic_mean
arith_weight <- arithmetic_mean(dat$weight, dat$household)
cbind(dat, arith_weight)

## calculate weights "by reference"
geometric_mean_reference(dat$weight, dat$household)
dat

}
