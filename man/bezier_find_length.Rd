\name{bezier_find_length}
\alias{bezier_find_length}
\title{Solve for arclength}
\description{
Finds the value of the Bezier parameter \eqn{t} that corresponds to a
given arclength from the start of a Bezier curve
}
\usage{
bezier_find_length(P, len, from = 0, increasing = TRUE, give = FALSE, ...)
}
\arguments{
  \item{P}{Control points in the form of a 4 by 2 matrix with rows
    corresponding to \eqn{P_0} to \eqn{P_3}}
  \item{from}{Point from which to start measuring arc length}
  \item{len}{Arc length}
  \item{increasing}{Boolean, with default \code{TRUE} meaning to
    measure length towards the end, and\code{FALSE} meaning to measure
    in the opposite direction}
  \item{give}{Boolean, with \code{TRUE} meaning to return details from
    \code{uniroot()} and default \code{FALSE} meaning to give just the
    position on the curve}
  \item{\dots}{Further arguments passed to \code{uniroot()}}
}
\details{
  The function just uses \code{uniroot()} to find the appropriate value
  of \code{tee}.
}
\author{
Robin K. S. Hankin
}
\seealso{\code{\link{bezier_integral}}}
\examples{

P <- matrix(c(1, 3, 6, 4, 7, 3, 2, 2),ncol=2)
bezier_find_length(P,5)

}
