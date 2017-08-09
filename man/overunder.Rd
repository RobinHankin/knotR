\name{overunder}
\alias{overunder}
\alias{overunder}
\alias{overunder<-}
\alias{mirror}
\title{
Functionality for specifying overstrands and understrands
}
\description{
Functionality for specifying overstrands and understrands
}
\usage{
overunder(x)
overunder(x) <- value
mirror(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A knot object}
  \item{value}{A two-column integer matrix with rows corresponding to
    crossings.  In each row, the first entry identifies the overstrand,
    and the second entry specifies the understrand}
}
\details{
These functions are not really needed but are here for convenience.
}
\value{All three functions return a knot object}
\author{Robin K. S. Hankin}
\seealso{\code{\link{knot}}}
\examples{

overunder(k4_1)

par(mfcol=c(1,2))
knotplot(k4_1,gap=80)
knotplot(mirror(k4_1),gap=80)


}
