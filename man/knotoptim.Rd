\name{knotoptim}
\alias{knotoptim}
\title{
Optimization of knot appearance
}
\description{
Optimization of knot appearance using user-definable objective functions
}
\usage{
knotoptim(svg, weights=1, symobj=NULL,
  Mver = NULL, xver = NULL, Mhor = NULL, xhor = NULL, Mrot = NULL,
  mcdonalds = FALSE, celtic = FALSE, ou, prob = 0, useNLM=TRUE, ...)
}
\arguments{
  \item{svg}{Name of an svg file to read}
  \item{Mver,xver,Mhor,xhor,Mrot,mcdonalds,celtic}{Arguments passed to
    \code{symmetry_object()}, specifying the symmetry of the knot}
  \item{symobj}{A symmetry object}
  \item{ou}{An overunder object}
  \item{prob}{The probability of plotting a knotplot; this is slow so
    don't make this too big}
  \item{weights}{A vector of weights, defaulting to all ones, passed to
    \code{badness()}}
  \item{useNLM}{Boolean, with default \code{TRUE} meaning to use
    \code{nlm()} and \code{FALSE} meaning to use \code{optim()}}
  \item{\dots}{Further arguments passed to \code{nlm()}}
}
\details{
Function \code{knotoptim()} is a generic optimization routine that
starts from an svg file and minimizes the knot's badness.
}
\value{Returns a knot object}
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{symmetry_object}}, \code{\link{badness}}
}
\examples{

\dontrun{    #takes too long
knotoptim(
      svg = system.file("4_1_first_draft.svg",package="knotR"),
     Mver = rbind(c(2,3),c(9,7),c(10,6),c(1,4),c(5,11)),
     xver = 8,   # node on vertical axis
     ou   = rbind( c(1,5), c(9,2), c(4,8),c(6,11)),
     prob = 0.1,
  iterlim = 100, print.level=2)
}
}
 
