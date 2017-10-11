\name{head.inkscape}
\alias{head.inkscape}
\alias{tail.inkscape}
\title{
Head and tail methods for inkscape objects
}
\description{
Head and tail methods for inkscape objects
}
\usage{
\method{head}{inkscape}(x, ...)
\method{tail}{inkscape}(x, ...)
}
\arguments{
  \item{x}{Primary argument, an inkscape object}
  \item{\dots}{Further arguments, passed to \code{head()} or \code{tail()}}
}
\author{Robin K. S. Hankin}
\examples{
a <- reader(system.file("7_1.svg",package="knotR"))
head(a)
tail(a)

head(as.inkscape(k8_2))
}
