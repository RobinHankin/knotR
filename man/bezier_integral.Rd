\name{bezier_integrals}
\alias{bezier_integrals}
\alias{bezier_integral}
\alias{bezier_arclength}
\alias{bezier_bending_energy}
\alias{bezier_total_curvature}
\title{
Arcwise integrals over Bezier curves
}
\description{
  Various integrals over Bezier curves such as total arc length and
  bending energy
}
\usage{
bezier_arclength(P, t1=0,t2=1,give=FALSE,...)
bezier_bending_energy(P, t1=0,t2=1, give=FALSE, power=2, ...)
}
\arguments{
  \item{P}{Control points in the form of a 4 by 2 matrix with rows
    corresponding to \eqn{P_0} to \eqn{P_3}}
  \item{give}{Boolean, with \code{TRUE} meaning to return more
    information and default \code{FALSE} meaning to return just the
    value of the integration as estimated by the numerical routine}
  \item{power}{Function \code{bezier_bending_energy()} returns
    bending energy is \eqn{\int_S\frac{ds}{R^\mathrm{power}}}{int
	ds/R^power}, where \eqn{R=R(s)} is the radius of curvature.
      If \eqn{\mathrm{power}=2} this corresponds to the Eulerian
      bending energy of a flexible beam}
  \item{t1,t2}{In function \code{bezier_arclength()}, the values of
    \code{t} to start and end the integration at}
  \item{...}{Further arguments passed to \code{integrate()}}
}
\details{

  These functions use numerical integration, specifically
  \code{integrate()}, between two specified points on a Bezier curve.
  
  \enumerate{
    \item Function \code{bezier_bending_energy()} gives the 
    and bending energy (\eqn{\int R^{-1}ds}{S ds/R}).
    \item Function \code{bezier_arclength()} gives the arc length.
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

bezier_arclength(P)

}
