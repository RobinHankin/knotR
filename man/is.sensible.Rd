\name{is.sensible}
\alias{is.sensible}
\title{
Check to see whether an overunderobject is sensible
}
\description{
Check to see whether an overunderobject is compatible with a particular
knot path
}
\usage{
is.sensible(overunderobj, knot)
}
\arguments{
  \item{overunderobj}{
    A two-column matrix specifying the overs and unders
}
  \item{knot}{
A knot object, coerced to \code{controlpoints} form
}
}
\value{
Returns \code{TRUE} or \code{FALSE}
}
\author{
Robin K. S. Hankin
}
\seealso{\code{\link{overunder}}}
\examples{
is.sensible(overunder(k5_1),k5_1)

}
