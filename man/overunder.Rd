\name{overunder}
\alias{overunder}
\alias{overunder}
\alias{overunder<-}
\alias{mirror}
\alias{is.sensible}
\title{Functionality for specifying overstrands and understrands}
\description{
Functionality for specifying overstrands and understrands
}
\usage{
overunder(x)
overunder(x) <- value
mirror(x)
is.sensible(overunderobj,x)
}
\arguments{
  \item{x}{A knot object}
  \item{value,overunderobj}{A two-column integer matrix specifying the
    senses of the crossings in a knot}
}
\details{
  Function \code{overunder()} returns a two-column integer matrix with
  rows corresponding to crossing points.  The first element of each row
  corresponds to the strand number of the overstrand and the second
  element corresponds to the understrand.  

  Function \code{is.sensible()} checks to see whether the overunder
  matrix is compatible with the knot path.  For example, it checks to
  see whether each crossing has exactly one row, and that each row
  corresponds to a pair of strands that actually cross.

  Function \code{mirror()} takes a knot and returns the knot with the
  senses of each crossing reversed; it is as though the knot is
  reflected in the plane of the projection.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{knot}}}
\examples{

overunder(k4_1)

par(mfcol=c(1,2))
knotplot(k4_1,gap=80)
knotplot(mirror(k4_1),gap=80)

is.sensible(overunder(k6_1),k6_1)
}
