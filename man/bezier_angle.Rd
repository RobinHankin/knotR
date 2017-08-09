\name{bezier_angle}
\alias{bezier_angle}
\alias{bezier_intersect}
\title{
Intersection of two Bezier curves
}
\description{
Description of the intersection of two Bezier curves including position
and angle of the point of intersection.
}
\usage{
bezier_angle(P1, P2)
bezier_intersect(P1,P2, type='pos', ...)
}
\arguments{
  \item{P1,P2}{Control points for two Bezier curves as per
    \code{bezier()}}
  \item{type}{In function \code{bezier_intersect()}, string argument
    governing what exactly is to be returned; see details.}
  \item{...}{In function \code{bezier_intersect()}, further arguments
    passed to \code{constOptim()}}
}
\details{

  Function \code{bezier_intersect()} uses \code{constOptim()} to find
  the point of closest approach.

  Function \code{bezier_angle()} returns the square of the cosine of the
  intersection angle (so strands crossing at right angles return zero).
  If the strands do not intersect, then return 1.  This is needed
  because sometimes, strands which intersect are perturbed by the
  optimization routine so that they are disjoint.

  
  
}
\note{
  If the curves intersect in more than one point, the behaviour of these
  routines is not defined.
}
\author{
Robin K. S. Hankin
}
\seealso{\code{\link{bezier}}}
\examples{



P1 <- matrix(c(1, 3, 6, 4, 7, 3, 2, 2),ncol=2)
P2 <- matrix(c(4, 5, 5, 3, 7, 2, 5, 1),ncol=2)

x1 <- bezier(P1,n=100)
x2 <- bezier(P2,n=100)

plot(x1,asp=1,xlim=c(0,8),ylim=c(0,8))
points(x2)

myseg(P1)
myseg(P2)

jj <- bezier_intersect(P1,P2)
points(x=jj[1],y=jj[2],pch=16,cex=3,col='blue')

# looks close to orthogonal, actually 82 degrees:
acos(sqrt(bezier_angle(P1,P2)))*180/pi 


}