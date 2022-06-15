## This R batch file creates "knots_to_8crossings.pdf" and
## "compare_crossing_angles.pdf" for use by jma_knot.tex

filename1 <- "knots_to_8crossings.pdf"
filename2 <- "compare_crossing_angles.pdf"
filename3 <- "two_trefoil_knots.pdf"

do1 <- TRUE  # change to FALSE to save time
do2 <- TRUE
do3 <- TRUE

library("knotR")

if(do1){
a <-
  list(
      unknot, k3_1,  k4_1,  k5_1,  k5_2,  k6_1 ,
      k6_2  , k6_3,  k7_1,  k7_2,  k7_3,  k7_4 ,
      k7_5  , k7_6,  k7_7,  k8_1,  k8_2,  k8_3 ,
      k8_4  , k8_5,  k8_6,  k8_7,  k8_8,  k8_9 ,
      k8_10 , k8_11, k8_12, k8_13, k8_14, k8_15,
      k8_16 , k8_17, k8_18, k8_19, k8_20, k8_21
  )

leg <- list(
    expression(0),
    expression(3[1]),
    expression(4[1]),
    expression(5[1]),
    expression(5[2]),
    expression(6[1]),
    expression(6[2]),
    expression(6[3]),
    expression(7[1]),
    expression(7[2]),
    expression(7[3]),
    expression(7[4]),
    expression(7[5]),
    expression(7[6]),
    expression(7[7]),
    expression(8[1]),
    expression(8[2]),
    expression(8[3]),
    expression(8[4]),
    expression(8[5]),
    expression(8[6]),
    expression(8[7]),
    expression(8[8]),
    expression(8[9]),
    expression(8[10]),
    expression(8[11]),
    expression(8[12]),
    expression(8[13]),
    expression(8[14]),
    expression(8[15]),
    expression(8[16]),
    expression(8[17]),
    expression(8[18]),
    expression(8[19]),
    expression(8[20]),
    expression(8[21])
)
    
`knotplot_bespoke` <- function(x, ou, gapwidth=1, n=100, lwd=8, add=FALSE, ext=0.2, ...){
    if(inherits(x,'knot')){
      ou <- x$overunderobj
      x <- as.minobj(x)
    }
    stopifnot(is.sensible(ou,x))
    a <- as.inkscape(x)
    if(!add){
      plot(a,type='n',asp=1, axes=FALSE, xlab='', ylab='', ...)
    }

    b <- as.controlpoints(a)

    xy_thin  <- matrix(0,0,2)
    xy_thick <- matrix(0,0,2)
    for(i in seq_along(b)){  # loop over all Bezier segments
      tee <- seq(from=0, to=1, len=n)  
      overs <- ou[ou[,2]==i,1]  # strands that pass *over* strand i  (NB: might be empty!)
      for(j in overs){  # loop over strands j that pass over strand i; i is under, j is over
        jj <- bezier_intersect(b[[i]],b[[j]],'para') # jj: c(ess,tee)
        crosspoint <- jj[2]  # crosspoint parameter for the OVERstrand
        xy_thick <- rbind(xy_thick,bezier(b[[j]],tee=seq(from=crosspoint-ext,to=crosspoint+ext, length=n)),NA)
      }
      xy_thin <- rbind(xy_thin, bezier(b[[i]],tee=tee))
    } # 'i' loop closes

    points(xy_thin, type='l',lwd=lwd,              lend=1, ljoin=1,              ...)
    points(xy_thick,type='l',lwd=lwd*(1+gapwidth*0.5), lend=1, ljoin=1, col="white", ...)
    points(xy_thick,type='l',lwd=lwd,              lend=1, ljoin=1,              ...)

    return(invisible(xy_thin))
}


b <- lapply(a,overunder)

pdf(file=filename1,width=40,height=40)
par(pty='m')
plot(1:10,xlim=c(0,10000),ylim=c(0,10000),asp=1,type='n',axes=FALSE,xlab='',ylab='')


xs <- 1600  # spacing between knots (x)
ys <- 1600  # spacing between knots (y)

xstart <- -300 # offset for whole diagram (x)
ystart <- +700 # offset for whole diagram (y)

xtext <- -350
ytext <- 450

for(i in 1:6){
    for(j in 1:6){
        n <- (i-1)*6 + j
        xoff <-    j * xs + xstart
        yoff <- (6-i)* ys + ystart
        k <- as.inkscape(a[[n]])
        k[,2] <- k[,2] - mean(k[,2])
        k <- sweep(k,2,c(xoff,yoff),"+")
        print(n)
        if(n==18){# k8_3
            knotplot_bespoke(k,b[[n]],add=TRUE,lwd=7,ext=0.3,gap=3)
        } else {
            knotplot_bespoke(k,b[[n]],add=TRUE,lwd=7,gap=3)
        }
        text(xoff+xtext,yoff+ytext,leg[[n]],
             cex=3)
    }
}

dev.off()
} # if(do1) closes

# Now create "compare_crossing_angles.pdf"



if(do2){
a <-
  list(
      k8_3 , k8_3_90deg_crossing,
      k8_5 , k8_5_90deg_crossing,
      k8_6 , k8_6_90deg_crossing,
      k8_11, k8_11_90deg_crossing
  )

leg <- list(  # legend
    expression(8[ 3]), expression(8[3]),
    expression(8[ 5]), expression(8[5]),
    expression(8[ 6]), expression(8[6]),
    expression(8[11]), expression(8[11])
)
    

b <- lapply(a,overunder)

pdf(file=filename2,width=6,height=4)
par(pty='m',
oma = c(0, 0, 0, 0), # two rows of text at the outer left and bottom margin
mar = c(0, 0, 0, 0), # space for one row of text at ticks and to separate plots
mgp = c(0, 0, 0))
plot(NA,xlim=c(400,2600),ylim=c(6000,7500),asp=1,type='n',axes=FALSE,xlab='',ylab='')

xs <- 900  # spacing between knots (x)
ys <- 1200  # spacing between knots (y)

xstart <- +100 # offset for whole diagram (x)
ystart <- +700 # offset for whole diagram (y)

xtext <- -350
ytext <- 450

for(i in 1:1){
    for(j in 1:2){
        n <- (i-1)*2 + j
        xoff <-    j * xs + xstart
        yoff <- (6-i)* ys + ystart
        k <- as.inkscape(a[[n]])
        k[,2] <- k[,2] - mean(k[,2])
        k <- sweep(k,2,c(xoff,yoff),"+")
        print(n)
        knotplot(k,b[[n]],add=TRUE,lwd=2.5,gap=3)
        if(FALSE){text(xoff+xtext,yoff+ytext,leg[[n]], cex=3)}
    }
}

dev.off()
}

if(do3){
    a <- list(k3_1)
    leg <- list( expression(3[1]))  # legend
    b <- lapply(a,overunder)

    pdf(file=filename3,width=6,height=4)
    par(pty='m',
        oma = c(0, 0, 0, 0), # two rows of text at the outer left and bottom margin
        mar = c(0, 0, 0, 0), # space for one row of text at ticks and to separate plots
        mgp = c(0, 0, 0))
    plot(NA,xlim=c(400,2600),ylim=c(6000,7500),asp=1,type='n',axes=FALSE,xlab='',ylab='')
    
    xs <- 900  # spacing between knots (x)
    ys <- 1200  # spacing between knots (y)
    
    xstart <- +100 # offset for whole diagram (x)
    ystart <- +700 # offset for whole diagram (y)
    
    xtext <- -350
    ytext <- 450
    
    i <- 1
    j <- 1
    
    n <- (i-1)*2 + j
    xoff <-    j * xs + xstart
    yoff <- (6-i)* ys + ystart
    k <- as.inkscape(a[[n]])
    k[,2] <- k[,2] - mean(k[,2])
    k <- sweep(k,2,c(xoff,yoff),"+")
    print(n)
    knotplot(k,b[[n]],add=TRUE,lwd=2.5,gap=3)

    `arc` <- function(x,y,r,theta1,theta2,rot=0,center=FALSE, ...){
        n <- 100
        jj <- matrix(c(cos(rot),sin(rot),-sin(rot),cos(rot)),2,2) %*% c(x,y)
        x <- jj[1]
        y <- jj[2] 
        if(center){ points(x,y, ...) } 
        theta <- seq(from=theta1-rot,to=theta2-rot,len=n)
        cbind(x+r*sin(theta),y+r*cos(theta))
    }
   
small <- 0.05
    
    `f` <- function(angle,o,...){
        if(o==1){
            arc(x=0, y=-2-2/sqrt(3), theta1 =   0, theta2 =   pi/12, r=sqrt(6)+sqrt(2), rot=angle)
        } else if(o==2){
            arc(x=0, y=+2-2/sqrt(3), theta1 =  0, theta2 = 7*pi/12, r=sqrt(6)-sqrt(2), rot=angle)
        } else if(o==3){
            arc(x=0, y=-2-2/sqrt(3), theta1 = pi/12-small, theta2 =   pi/12+small, r=sqrt(6)+sqrt(2), rot=angle)
        } else if(o==4){
            arc(x=0, y=-2-2/sqrt(3), theta1 =    -pi/12, theta2 =   0, r=sqrt(6)+sqrt(2), rot=angle)
        } else if(o==5){
            arc(x=0, y=+2-2/sqrt(3), theta1 =  -7*pi/12, theta2 = 0, r=sqrt(6)-sqrt(2), rot=angle)
        } else {
            stop()
        }
    }
    x0 <- 2170
    y0 <- 6720
    scale <- 300
    for(angle in c(0,2,4)*pi/3){
        points(sweep(scale*f(angle,o=1),2,c(x0,y0),"+"),type="l",lwd=2.5,col="red")
        points(sweep(scale*f(angle,o=2),2,c(x0,y0),"+"),type="l",lwd=2.5,col="orange")
        points(sweep(scale*f(angle,o=3),2,c(x0,y0),"+"),type="l",lwd=2.5*4,col="yellow")
        points(sweep(scale*f(angle,o=4),2,c(x0,y0),"+"),type="l",lwd=2.5,col="green")
        points(sweep(scale*f(angle,o=5),2,c(x0,y0),"+"),type="l",lwd=2.5,col="blue")
    }
    
    dev.off()

    
}
