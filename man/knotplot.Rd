\name{knotplot}
\alias{knotplot}
\alias{knotplot_old}
\alias{knotplot2}
\title{
Plotting of knots
}
\description{
Routines to plot projections of knots with a wide range of user-settable options
}
\usage{
knotplot(x, ou, gapwidth=1, n=100, lwd=8, add=FALSE, ...)
knotplot_old(x, ou, gap=20, n=100, lwd=8, add=FALSE, ...)
knotplot2(x, rainbow=FALSE, seg=FALSE, text=FALSE, cross=FALSE, ink=FALSE,
                node=FALSE, width=TRUE, all=FALSE, n=100, circ=1000,
                lwd=8, add=FALSE, ...)
}
\arguments{
  \item{x}{Description of a knot, coerced to a \code{controlpoints}
    object and a \code{minobj} object}
  \item{rainbow,seg,text,cross,ink,node,all,width,circ}{Variables
    controlling sundry \code{knotplot2()} features; see details}
  \item{ou}{An overunder object, useful if overunder information not
    included in argument \code{x}}
  \item{gap,gapwidth}{Variables controlling visual representation of
    strand crossings; see details}
  \item{n}{Number of points on each Bezier curve}
  \item{lwd}{Width of line to use}
  \item{add}{Boolean, with default \code{FALSE} meaning to set up a new
    plot, and \code{TRUE} meaning to just add points and lines to an
    existing plot}
  \item{\dots}{Further arguments, passed to \code{plot()} and \code{points()}
  }
}
\details{

  Function \code{knotplot()} is useful for production-quality plotting
  of knots with crossings indicated by the understrand having a gap;
  function \code{knotplot2()} is more useful for development.  Function
  \code{knotplot_old()} is included for backward compatibility and is
  possibly more robust than \code{knotplot()}.

  Function \code{knotplot()} works by setting a suitable length of the
  understrand to \code{NA} which results in it not being plotted.

  For \code{knotplot()}:
  \itemize{
    \item \code{overunderobj}; A two-column matrix indicating the sense
    of the crossing.  Each row corresponds to a crossing; the first entry
    is the segment number of the overstrand, and the second is the
    understrand
    \item \code{gapwidth}; the width of the gap, measured in units of
    width of the string
  }
  
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

  The \code{gap} argument of \code{knotplot_old()} is a the same as the
  \code{gapwidth} argument of \code{knotplot()} but \code{gap} is
  measured in the same units as the \code{plot()}.


}
\author{
Robin K. S. Hankin
}

\examples{

knotplot(k5_1)

knotplot2(k6_1,text=TRUE,seg=TRUE,lwd=1)

}
