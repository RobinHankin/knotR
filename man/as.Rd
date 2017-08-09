\name{as}
\alias{as}
\alias{as.knotvec}
\alias{as.minobj}
\alias{as.controlpoints}
\alias{as.inkscape}
\alias{as.minsymvec}
\title{
Conversions between various forms of a knot
}
\description{
Conversions between various forms of a knot.
}
\usage{
as.knotvec(x)
as.minobj(x)
as.inkscape(x)
as.controlpoints(x)
as.minsymvec(x,symobj)
}
\arguments{
  \item{x}{Object to be converted}
  \item{symobj}{A symmetry object}
}
\details{
The \code{as.foo()} functions are meant to be user-friendly; they use
low-level functions like \code{make_knotvec_from_minobj()} (all of
which are documented at \code{utilities.Rd}), which are a bit messy.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{utilities}}}
\examples{
as.minobj(k6_2)

x <- reader(system.file("6_3.svg",package="knotR"))  # x is class inkscape

as.minsymvec(x,symmetry_object(k6_3)) # as.minsymvec() needs a symmetry object

as.controlpoints(x)

as.knotvec(x)


}
