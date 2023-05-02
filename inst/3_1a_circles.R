## This R script is a bit like trefoil_circles.R.  It plots (a
## projection of) k_3a assuming that the strand is an elastica.  The
## constraints are: (1), strands cross at right angles; the strands
## exert a couple but no force on one another; (2), mirror symmetry
## about the vertical.  Constraint #1 implies that the strands are
## arcs of a circle, or straight lines.

## NB this file produces k3_1a_circles.pdf, which is not production
## quality!  It needs to be tidied up in inkscape before anyone sees
## it.


`circ` <- function(x,y,r,start=0,finish=2*pi, ...){
  theta <- seq(from=start,to=finish,len=100)
  points(x+r*cos(theta),y+r*sin(theta),type="l",lwd=11, ...)
}

pdf(file="k3_1a_circles.pdf")
par(pty='s')
plot(NA,xlim=c(-5,5),ylim=c(-5,5),asp=1,axes=FALSE,xlab="",ylab="")

circ(+1,+1,sqrt(2),3*pi/4,5*pi/4)
circ(-1,+1,sqrt(2),-pi/4,pi/4)
circ(+1,-1,sqrt(2),3*pi/4,5*pi/4)
circ(-1,-1,sqrt(2),-pi/4,pi/4)

circ(-2,0,2*sqrt(2),7*pi/4,pi/4)
circ(+2,0,2*sqrt(2),5*pi/4,11*pi/4)

dev.off()
