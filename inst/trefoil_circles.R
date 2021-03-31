## This R script plots (a projection of) a trefoil knot assuming that
## the strand is an elastica.  The constraints are: (1), strands cross
## at right angles; the strands exert a couple but no force on one
## another; (2), mirror symmetry about the vertical; (3), threefold
## rotational symmetry.  Constraint #1 implies that the strands are
## arcs of a circle.

## 

## Elementary trigonometry then shows that the radii of the inner and
## outer loops are cosec(pi/12) and sec(pi/12) = sqrt(6)+sqrt(2) and
## sqrt(6)-sqrt(2) respectively.

`arc` <- function(x,y,r,theta1,theta2,rot=0,center=FALSE, ...){
  n <- 100
  jj <- matrix(c(cos(rot),sin(rot),-sin(rot),cos(rot)),2,2) %*% c(x,y)
  x <- jj[1]
  y <- jj[2] 
  if(center){ points(x,y, ...) } 
  theta <- seq(from=theta1-rot,to=theta2-rot,len=n)
  points(x+r*sin(theta),y+r*cos(theta),type='l',...)
}

`f` <- function(angle,...){
  arc(x=0, y=-2-2/sqrt(3), theta1 =    -pi/12, theta2 =   pi/12, r=sqrt(6)+sqrt(2), rot=angle,...)
  arc(x=0, y=+2-2/sqrt(3), theta1 =  -7*pi/12, theta2 = 7*pi/12, r=sqrt(6)-sqrt(2), rot=angle,...)
}


par(pty='s')
u <- 1.9
plot(NA,type='n',asp=1,xlim=c(-u,u),ylim=c(-u,u),axes=FALSE,xlab='',ylab='')

f(0*pi/3,lwd=5)
f(2*pi/3,lwd=5)
f(4*pi/3,lwd=5)
