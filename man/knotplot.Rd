\name{knotplot}
\alias{knotplot}
\alias{knotplot2}
\title{
Plotting of knots
}
\description{
Routines to plot projections of knots with a wide range of user-settable options
}
\usage{
knotplot(x, ou, gap=20, n=100, lwd=8, setup=TRUE, ...)
knotplot2(x, rainbow=FALSE, seg=FALSE, text=FALSE, cross=FALSE, ink=FALSE,
                node=FALSE, width=TRUE, all=FALSE, n=100, circ=1000,
                lwd=8, setup=TRUE,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Description of a knot, coerced to a \code{controlpoints}
    object and a \code{minobj} object}
  \item{rainbow,seg,text,cross,ink,node,all,width,circ}{Variables
    controlling sundry \code{knotplot()} features; see details}
  \item{ou,gap}{Variables controlling sundry \code{knotplot2()}
    features; see details}
  \item{n}{Number of points on each Bezier curve}
  \item{lwd}{Width of line to use}
  \item{setup}{Boolean, with default \code{TRUE} meaning to set up a new
    plot, and \code{FALSE} meaning to just add points and lines to an
    existing plot}
  \item{\dots}{Further arguments, passed to \code{plot()} and \code{points()}
}
}
\details{
  Function \code{knotplot()} is useful for production-quality plotting
  of knots with crossings indicated; \code{knotplot2()} is more useful
  for development.

  For \code{knotplot2()}:
  \itemize{
    \item \code{rainbow}; use rainbow colouring for the segments
    \item \code{seg}; plot the Bezier nodes and handles.  The positions
    of the nodes and handles are obtained from an object of class
    \code{controlpoints}.
    \item \code{text}; include the segment number on the segment
    \item \code{cross}; label the crossings
    \item \code{ink}; label the nodes with their inkscape numbering
    \item \code{width}; show the bending strain energy
  }

  For \code{knotplot()}:
  \itemize{
    \item \code{overunderobj}; A two-column matrix indicating the sense
  of the crossing.  Each row corresponds to a crossing; the first entry
  is the segment number of the overstrand, and the second is the
  understrand
  \item \code{gap}; the width of the gap
  \item \code{arclength} Gap width measured by arc length or Euclidean
  distance
  }
}
\author{
Robin K. S. Hankin
}

\examples{

knotplot(k5_1)

knotplot2(k6_1,text=TRUE,seg=TRUE,lwd=1)

}
