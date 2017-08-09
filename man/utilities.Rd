\name{utilities}
\alias{utilities}
\alias{controlpoints}
\alias{inkscape}
\alias{minobj}
\alias{knotvec}
\alias{make_minobj_from_ink}
\alias{make_minobj_from_vector}
\alias{make_ink_from_minobj}
\alias{make_controlpoints_from_ink}
\alias{make_inkscape_from_controlpoints}
\alias{make_minobj_from_knot}
\alias{make_knotvec_from_minobj}
\title{Various utilities for knots}
\description{
Various utilities for knots including reading files and creating objects
}
\usage{
controlpoints(x)
inkscape(x)
minobj(x)
knotvec(x)
make_controlpoints_from_ink(a)
make_minobj_from_ink(a)
make_minobj_from_vector(vec)
make_ink_from_minobj(x)
make_inkscape_from_controlpoints(b)
make_minobj_from_knot(k)
make_knotvec_from_minobj(x)
}
\arguments{
  \item{x}{Suitable object for coercion; see details}
  \item{a}{An \code{inkscape} object: a two column matrix with rows
    representing the positions of nodes and control points}
  \item{b}{A controlpoints object}
  \item{k}{An object of class knot}
  \item{vec}{A vector of reals}
}
\details{

  Functions \code{inkscape()}, \code{minobj()}, and \code{knotvec()} are
  low-level functions; these are the only places that objects have their
  classes assigned directly.  These functions are not user-friendly and
  require very specific types of object; they perform some checks but
  are not really intended for the user.  Functions \code{as.foo()} are
  much more user-friendly, and are documented at \code{as.Rd}.

  Functions \code{make_foo_from_bar()} coerce \code{bar} objects into
  \code{foo} objects.  Functions that involve symmetry are documented at
  \code{symmetry.Rd}.

  Objects of class \strong{\code{inkscape}} are in the form of a two-column
  matrix, with rows corresponding to 2D positions.  The rows correspond
  to the \eqn{(x,y)} coordinates of points as held in the inkscape file.

  There is quite a lot of redundancy in an inkscape object:

  \itemize{
    \item The first row of an inkscape object is equal to the last row
    (this follows from the fact that the path is closed).

    \item If \eqn{n=0} modulo 3, then
    \code{a[n+2,]-a[n+1,]==a[n+1,]-a[n]}, corresponding to the fact that
    the handles are symmetric in inkscape.  This is visualised best by
    \code{knotplot2(k4_1,ink=TRUE,seg=TRUE)}
  }

  Look at functions \code{make_inkscape_from_minobj()} and
  \code{make_minobj_from_ink()} to see this from a symbolic
  perspective.  The vignette also gives some details.
  
  The \strong{\code{minobj}} class is a \sQuote{MINimal OBJect}; there
  is no redundancy.  Objects of class \strong{\code{minobj}} are a list
  of two elements: \code{$node} and \code{$handle_A}.  Each element has
  rows corresponding to 2D positions, the same as \code{inkscape}
  objects.  Element \code{$node} shows the positions of the nodes, and
  element \code{$handle_A} shows the positions of (one of) the handles;
  the other handle is symmetrically positioned with respect to its node.
  Use \code{knotplot2(k4_1,node=TRUE,seg=TRUE)} to see the meaning
  of the entries; the nodes are indicated by a square and the handles by
  circles.

  An object of class \code{controlpoints} is a list of matrices of size
  4-by-2.  For each matrix, the four rows correspond to the points in
  2D Cartesian space needed to specify a Bezier curve; further details
  and examples are given in \code{bezier.Rd}.
  
  The \strong{\code{knotvec}} class is a named vector of independent
  reals suitable for use with optimization routines.

  None of the functions here deal with symmetry relations.  This is
  documented at \code{symmetry.Rd}.
  
}
  
\author{
  Robin K. S. Hankin
}
\seealso{\code{\link{knotplot}},\code{\link{symmetrize}},\code{\link{bezier}}}
\examples{
\dontrun{
a <- reader("6_3.svg")  # 'a' is an inkscape object.
knotplot(a)


}
}
