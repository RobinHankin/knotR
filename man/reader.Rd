\name{reader}
\alias{reader}
\alias{write_svg}
\alias{svg}
\title{Reading and writing svg files}
\description{
  Various utilities for reading and creating svg files for use with inkscape
}
\usage{
reader(filename)
write_svg(k, oldfile, safe=TRUE,
    regex1 ='sodipodi:docname=',
    regex2=' *d *= *" *M.*C.*[zZ] *"')
}
\arguments{
  \item{filename}{Name of a file to be read by \code{reader()}; usually
    an inkscape \code{.svg} file}
  \item{safe}{Boolean, with default \code{TRUE} meaning to save file
    \dQuote{\code{foo.svg}} as \dQuote{\code{foo_smooth.svg}}
    and \code{FALSE} meaning to overwrite \code{foo.svg}.}    
  \item{k, oldfile, regex1, regex2}{Various arguments sent to
    \code{write_svg()}; see the source code for details.
    Argument \code{k} is a knot, \code{oldfile} an \code{.svg} file for
    reference.}
}
\details{
  Function \code{reader()} is the way to get started with a new
  knot. This takes a filename which is an \code{.svg} file created with
  inkscape.  Instructions for creating a suitable inkscape file are
  given in \code{knotR-package.Rd}.
}

\note{

  Inkscape's default is to use a mixture of absolute and relative
  coordinates.  Function \code{reader()} assumes that the \code{.svg}
  file uses only absolute coordinates.

  To ensure that only absolute coordinates are used, open the
  \sQuote{SVG output} menu in \sQuote{inkscape preferences} and uncheck
  the \dQuote{Allow relative coordinates} option.

  The format of \code{.svg} file is described in the W3C recommendation
  (2011) for Scalable Vector Graphics (SVG) 1.1, second edition.
  
  }
  
\author{Robin K. S. Hankin}
\seealso{\code{\link{utilities}},\code{\link{knotR-package}}}
\examples{
\dontrun{
a <- reader("6_3.svg")
b <- getcontrolpoints(a)
knotplot(a)

}
}
