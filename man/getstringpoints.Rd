\name{getstringpoints}
\alias{getstringpoints}
\title{
Returns the coordinates of a knot's path
}
\description{
Returns the coordinates of a knot's path
}
\usage{
getstringpoints(b, give_strand = FALSE, n = 100)
}
\arguments{
  \item{b}{Knot path, object coerced to \code{controlpoints} form}
  \item{give_strand}{Boolean, with default \code{FALSE} meaning to
    return a two-column matrix with rows corresponding to coordinates
    of the strands, and \code{TRUE} meaning to return a matrix with
    an additional column indicating the strand number}
  \item{n}{The number of points to use when constructing the Bezier curve}
}
\value{
Returns either a two- or  three- column matrix
}
\note{
  Function \code{knotplot()} returns the points of the string too, but
  with \code{NA} for understrands.
}
\author{
Robin K. S. Hankin
}
\seealso{\code{\link{knotplot}}}
  
\examples{
plot(getstringpoints(k4_1),asp=1)

a <- getstringpoints(k11a179,TRUE)
plot(a,asp=1,col=rainbow(24)[a[,3]])
 
d <- 1200
plot(rbind(
    sweep(getstringpoints(k7_1),2,c(0,0)),
    sweep(getstringpoints(k7_2),2,c(0,d)),
    sweep(getstringpoints(k7_3),2,c(d,0)),
    sweep(getstringpoints(k7_4),2,c(d,d))
),asp=1,xlab='',ylab='')

}
