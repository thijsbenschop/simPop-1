% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getBreaks.R
\name{getBreaks}
\alias{getBreaks}
\title{Compute break points for categorizing (semi-)continuous variables}
\usage{
getBreaks(x, weights = NULL, zeros = TRUE, lower = NULL, upper = NULL,
  equidist = TRUE, probs = NULL, strata = NULL)
}
\arguments{
\item{x}{a numeric vector to be categorized.}

\item{weights}{an optional numeric vector containing sample weights.}

\item{zeros}{a logical indicating whether \code{x} is semi-continuous, i.e.,
contains a considerable amount of zeros. See \dQuote{Details} on how this
affects the behavior of the function.}

\item{lower, upper}{optional numeric values specifying lower and upper bounds
other than minimum and maximum of \code{x}, respectively.}

\item{equidist}{a logical indicating whether the (positive) break points
should be equidistant or whether there should be refinements in the lower
and upper tail (see \dQuote{Details}).}

\item{probs}{a numeric vector of probabilities with values in \eqn{[0, 1]}
giving quantiles to be used as (positive) break points.  If supplied, this
is preferred over \code{equidist}.}

\item{strata}{an optional vector specifying a strata variable (e.g household ids).
if specified, the mean of \code{x} (and also of \code{weights} if specified) is
computed within each strata before calculating the breaks.}
}
\value{
A numeric vector of break points.
}
\description{
Compute break points for categorizing continuous or semi-continuous
variables using (weighted) quantiles.  This is a utility function that is
useful for writing custom wrapper functions such as \code{\link{simEUSILC}}.
}
\details{
If \code{equidist} is \code{TRUE}, the behavior is as follows.  If
\code{zeros} is \code{TRUE} as well, the 0\%, 10\%, \dots{}, 90\% quantiles
of the negative values and the 10\%, 20\%, \dots{}, 100\% of the positive
values are computed.  These quantiles are then used as break points together
with 0.  If \code{zeros} is not \code{TRUE}, on the other hand, the 0\%,
10\%, \dots{}, 100\% quantiles of all values are used.

If \code{equidist} is not \code{TRUE}, the behavior is as follows.  If
\code{zeros} is not \code{TRUE}, the 1\%, 5\%, 10\%, 20\%, 40\%, 60\%, 80\%,
90\%, 95\% and 99\% quantiles of all values are used for the inner part of
the data (instead of the equidistant 10\%, \dots{}, 90\% quantiles).  If
\code{zeros} is \code{TRUE}, these quantiles are only used for the positive
values while the quantiles of the negative values remain equidistant.

Note that duplicated values among the quantiles are discarded and that the
minimum and maximum are replaced with \code{lower} and \code{upper},
respectively, if these are specified.

The (weighted) quantiles are computed with the function
\code{\link{quantileWt}}.
}
\examples{

data(eusilcS)

# semi-continuous variable, positive break points equidistant
getBreaks(eusilcS$netIncome, weights=eusilcS$rb050)

# semi-continuous variable, positive break points not equidistant
getBreaks(eusilcS$netIncome, weights=eusilcS$rb050,
    equidist = FALSE)

}
\seealso{
\code{\link{getCat}}, \code{\link{quantileWt}}
}
\author{
Andreas Alfons and Bernhard Meindl
}
\keyword{manip}
