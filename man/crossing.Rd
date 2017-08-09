\name{crossing}
\alias{crossing}
\alias{crossing_points}
\alias{crossing_matrix}
\alias{crossing_points}
\alias{crossing_strands}
\title{
Crossing Metrics for knots
}
\description{
Various descriptions for the crossing points of a knot
}
\usage{
crossing_points(b, give_all = TRUE)
crossing_matrix(b)
crossing_strands(b)
}
\arguments{
  \item{b}{A list of Bezier control parameters, typically given by
    \code{getcontrolpoints()}}
  \item{give_all}{In function \code{crossing_points()}, Boolean,
    with \code{TRUE} meaning to give details of the strands that cross
    and default \code{FALSE} meaning to give just the coordinates of the
    crossing points}
}
\author{
Robin K. S. Hankin
}
\seealso{\code{\link{as.controlpoints}},\code{\link{bezier}}}
\examples{

crossing_points(k7_2,give_all=TRUE)

}
