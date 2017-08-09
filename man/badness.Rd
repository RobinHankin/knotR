\name{badness}
\alias{badness}
\alias{curvature_switching_badness}
\alias{curvature_consecutive_segment_switching_badness}
\alias{midpoint_badness}
\alias{node_crossing_badness}
\alias{total_string_length}
\alias{total_bending_energy}
\alias{total_crossing_potential_energy}
\alias{total_crossing_angles}
\alias{always_left_badness}
\alias{metrics}
\alias{non_crossing_strand_close_approach_badness}
\title{Badness of knots}
\description{Various functions that calculate different aspects of
  the badness of a knot, generally with low values representing
  pleasing visual representations}
\usage{
badness(b, cpb, weights, prob=0, give=FALSE)
curvature_switching_badness(b)
curvature_consecutive_segment_switching_badness(b, ...)
midpoint_badness(b,cpb)
node_crossing_badness(b,cpb)
total_string_length(b)
total_bending_energy(b,power=2)
total_crossing_potential_energy(b,cpb)
metrics(b,cpb)
always_left_badness(b)
non_crossing_strand_close_approach_badness(b,cpb)
}
\arguments{
  \item{b}{A description of a knot, coerced to a \code{controlpoints}
    object}
  \item{cpb}{Optional argument containing information on crossing
    points; expensive to calculate, so providing this makes the code run
    faster}
  \item{prob}{In function \code{badness()}, the probability of plotting
    a knotplot.  Nonzero values are useful when optimizing a knot, to
    keep tabs on the process}
  \item{give}{In function \code{badness()}, Boolean with default
    \code{FALSE} meaning to return the sum of the badnesses, and
    \code{TRUE} meaning to return them separately}
  \item{power}{Function \code{total_bending_energy()} returns the arc
    integral of \eqn{R^{-p}}{1/R^p}; defaults to 2}
  \item{weights}{A vector of weights specifying the relative importance
    of the various badness measures}
  \item{...}{In function
    \code{curvature_consecutive_segment_switching_badness()}, extra
    arguments passed to \code{integrate()}}
}
\details{

Various functions that calculate different aspects of the badness of a
knot, generally with low values representing pleasing visual
representations:

\itemize{

  \item Function \code{badness()} returns the sum of the eight
  individual badnesses.

  \item Function \code{curvature_switching_badness()} provides a penalty
  for segments with curvatures that switch sign.  The magnitude of the
  penalty is zero if the curvature is of one sign, otherwise
  proportional to the square of the minimum of the maximum value of the
  absolute value of the positive and negative curvatures.  The source
  code is easier to look at, honest.

  \item Function
  \code{curvature_consecutive_segment_switching_badness()} penalizes
  knots with consecutive segments that switch curvature from positive to
  negative.

  \item Function \code{midpoint_badness()} penalizes knots with crossing
  points far from the midpoint of segments.

  \item Function \code{node_crossing_badness()} penalizes knots with
  nodes too close together (compare function
  \code{total_crossing_potential_energy()}).

  \item Function \code{total_string_length()} returns \eqn{\ell}{l}, the
  total string length.  The badness is proportional to
  \eqn{(\ell-5000)^2}{(l-5000)^2}.  A length of 5000 corresponds to
  knots that look about right on a sheet of A4 paper.

  \item Function \code{total_bending_energy()} gives the total bending
  energy, effectively the arc integral of the reciprocal of the square
  of the radius of curvature.

  \item Function \code{total_crossing_potential_energy()} gives the
  potential energy of the nodes, under an inverse square force law.

  \item Function \code{always_left_badness()} penalizes knots that are
  \emph{supposed} to curve to the left all the time (eg knot
  \eqn{8_{18}}{8_18}).  The penalty is proportional to the greatest
  rightward curvature  over the whole knot.

  \item Function \code{metrics()} gives all these.

  }


}
\value{
Returns a scalar badness
}
\author{
Robin K. S. Hankin
}
\examples{


# use the k_infinity knot for speed:

system.time(badness(k_infinity))

cc <- crossing_points(k_infinity)

system.time(badness(k_infinity,cc))


metrics(k_infinity,cc)
}

