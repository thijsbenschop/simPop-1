% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/numericalWeighting.R, R/RcppExports.R
\name{computeFrac}
\alias{computeFrac}
\alias{numericalWeighting}
\alias{computeLinear}
\title{Numerical weighting functions}
\usage{
computeFrac(curValue, target, x, w)

computeLinear(curValue, target, x, w, boundLinear = 10)
}
\arguments{
\item{curValue}{Current summed up value. Same as \code{sum(x*w)}}

\item{target}{Target value. An element of \code{conP} in \link{ipu2}}

\item{x}{Vector of numeric values to be calibrated against}

\item{w}{Vector of weights}

\item{boundLinear}{The output \code{f} will satisfy \code{1/boundLinear <= f <= boundLinear}. See \code{bound} in \link{ipu2}}
}
\value{
A weight multiplier \code{f}
}
\description{
Customize weight-updating within factor levels in case of numerical calibration. The
functions described here serve as inputs for \link{ipu2}.
}
\details{
\code{computeFrac} provides the "standard" IPU updating scheme given as

\deqn{f = target/curValue}

which means that each weight inside the level will be multtiplied by the same factor when
doing the actual update step (\code{w := f*w}). \code{computeLinear} on the other hand
calculates \code{f} as

\ifelse{html}{
  \out{<center> f<sub>i</sub> = a  &middot; x<sub>i</sub> + b </center>}
}{\deqn{f_i = ax_i+b}}

where \code{a} and \code{b} are chosen, so f satisfies the following two equations.

\ifelse{html}{
  \out{<center>&sum; f<sub>i</sub> w<sub>i</sub> x<sub>i</sub> = target</center>}
}{\deqn{\sum f_i * w_i * x_i = target}}
\ifelse{html}{
  \out{<center>&sum; f<sub>i</sub> w<sub>i</sub> = &sum; w<sub>i</sub></center>}
}{\deqn{\sum f_i * w_i = \sum w_i}}
}
