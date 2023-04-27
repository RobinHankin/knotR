## This R script is a bit like trefoil_circles.R.  It plots (a
## projection of) 8_18 assuming that the strand is an elastica.  The
## constraints are: (1), strands cross at right angles; the strands
## exert a couple but no force on one another; (2), mirror symmetry
## about the vertical; (3), FOURfold rotational symmetry.  Constraint
## #1 implies that the strands are arcs of a circle, or straight
## lines.

## NB this file produces 8_18_circles.pdf, which is not production
## quality!  It needs to be tidied up in inkscape before anyone sees
## it.


circ <- function(x,y,r,start=0,finish=2*pi, ...){
  theta <- seq(from=start,to=finish,len=100)
  points(x+r*cos(theta),y+r*sin(theta),type="l",lwd=11, ...)
}

pdf(file="8_18_circles.pdf")
par(pty='s')
plot(NA,xlim=c(-4,4),ylim=c(-4,4),asp=1,axes=FALSE,xlab="",ylab="")
segments(x0=c(-1,1,1,-1),y0=c(1,1,-1,-1),x1=c(1,1,-1,-1),y1=c(1,-1,-1,1),lwd=11)

x  <- 1+sqrt(2)
r1 <- 2+sqrt(2)
r2 <- 1+sqrt(2)


circ(+1,-x,r1,pi/2,pi/4)
circ(-1,-x,r1,pi/2,3*pi/4)
circ(+1,+x,r1,-pi/2,-pi/4)
circ(-1,+x,r1,-pi/2,-3*pi/4)

circ(-x,1,r1,0,pi/4)
circ(-x,-1,r1,0,-pi/4)
circ(+x, 1,r1,3*pi/4,pi)
circ(+x,-1,r1,-3*pi/4,-pi)

circ(1+sqrt(2)/2,1+sqrt(2)/2,r2,-pi/4,3*pi/4)
circ(1+sqrt(2)/2,-(1+sqrt(2)/2),r2,-3*pi/4,pi/4)
circ(-(1+sqrt(2)/2),1+sqrt(2)/2,r2,pi/4,5*pi/4)
circ(-(1+sqrt(2)/2),-(1+sqrt(2)/2),r2,3*pi/4,7*pi/4)


dev.off()
