\name{bezier}
\alias{bezier}
\alias{bezier_deriv}
\alias{bezier_deriv2}
\alias{bezier_length}
\alias{bezier_radius}
\alias{bezier_curvature}
\alias{myseg}
\title{
Various functionality for Bezier curves
}
\description{
Various functionality for Bezier curves including derivatives and radius
of curvature.
}
\usage{
bezier(P, tee, n=100)
bezier_deriv(P, tee, n=100)
bezier_deriv2(P, tee, n=100)
bezier_radius(P, tee, n=100)
bezier_curvature(P,tee,n=100)
myseg(P, ...)
}
\arguments{
  \item{P}{Control points in the form of a 4 by 2 matrix with rows
    corresponding to \eqn{P_0} to \eqn{P_3}}
  \item{tee}{Parametric variable \eqn{t}}
  \item{n}{Integer specifying number of points between 0 and 1 to use.
    Default value of 100 looks OK}
  \item{...}{Further arguments passed by \code{myseg()} to \code{points()}}
}
\details{
  \itemize{
    \item Function \code{bezier()} returns a two column matrix with rows
    corresponding to the positions of the specified Bezier curve.
    \item Functions \code{bezier_deriv()} and \code{bezier_deriv2()}
    give the first and second derivatives respectively.
    \item Function \code{bezier_radius()} gives the radius of curvature.
    \item Functions \code{bezier_length()} and
    \code{bezier_bending_energy()} use numerical quadrature to give the
    arc length and bending energy (\eqn{\int R^{-1}ds}{S ds/R}).
    }
}
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{bezier_angle}}
}
\examples{


P <- matrix(c(0, 1, 2, 2, 2, 0, 3, 2),4,2)
xy <- bezier(P,n=100)
dx <- bezier_deriv(P,n=100)

plot(xy,asp=1)
myseg(P)

plot(xy,asp=1,cex=sqrt(rowSums(dx^2))/3.2)

plot(xy,asp=1)
segments(xy[,1],xy[,2],(xy+dx/200)[,1],(xy+dx/200)[,2])


plot(xy, asp=1,cex=bezier_radius(P,n=100)/2)

lapply(as.controlpoints(k8_9),bezier_radius)
lapply(as.controlpoints(k8_9),bezier_arclength)

}
