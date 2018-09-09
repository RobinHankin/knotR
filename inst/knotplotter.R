# produces knot_table.pdf.


# Compare allknotplotter.R, which plots  every knot in the package.


library(knotR)
timesave <- FALSE

if( !exists("o")){
  plot(NULL,xlim=c(-4000,4000),ylim=c(2000,2000),asp=1)

  o <- list(
      l000 = knotplot(unknot,add=TRUE,gap=40),
      l3_1 = knotplot(k3_1,add=TRUE,gap=40),
      l4_1 = knotplot(k4_1,add=TRUE,gap=40),
      l5_1 = knotplot(k5_1,add=TRUE,gap=40),
      l5_2 = knotplot(k5_2,add=TRUE,gap=40),
      l6_1 = knotplot(k6_1,add=TRUE,gap=40),
      l6_2 = knotplot(k6_2,add=TRUE,gap=40),
      l6_3 = knotplot(k6_3,add=TRUE,gap=40),
      l7_1 = knotplot(k7_1,add=TRUE,gap=40),
      l7_2 = knotplot(k7_2,add=TRUE,gap=40),
      l7_3 = knotplot(k7_3,add=TRUE,gap=40),
      l7_4 = knotplot(k7_4,add=TRUE,gap=40),
      l7_5 = knotplot(k7_5,add=TRUE,gap=40),
      l7_6 = knotplot(k7_6,add=TRUE,gap=40),
      l7_7 = knotplot(k7_7,add=TRUE,gap=40)
  )
}


pdf(file="knot_table.pdf",height=5,width=8)

par("xpd"=NA)
plot(NULL,xlim=c(-000,11000),ylim=c(-8000,000),asp=1,pty='m',axes=FALSE,xlab='',ylab='')

knames <- c(" unknot", "k3_1", "k4_1", "k5_1", "k5_2", "k6_1", "k6_2", "k6_3", "k7_1", "k7_2", "k7_3", "k7_4", "k7_5", "k7_6", "k7_7")
crossing <- c(0,3,4,5,5,6,6,6,7,7,7,7,7,7,7)
subscript <- c(0,1,1,1,2,1,2,3,1,2,3,4,5,6,7)

ox <- c(0,700,0,0,0,700,0,0,0,0,0,0,700,0,0)
oy <- c(0,1300,1300,1300,1300,1300,1300,1300,1300,1300,1300,1300,1300,1300,1300)

xd <- 3900
yd <- 3900

startx <- -6000
starty <- 3500


size_exp <- 2.2

for(i in 1:5){
  for(j in 1:3){
#    n <- j + (i-1)*3  # by columns
    n <- i + (j-1)*5   #  by rows
    jj <- o[[n]]*size_exp
    offset <- c(xd*i,-yd*j) + c(startx,starty)
    jj <- sweep(jj,2,offset,"+")
    points(jj,type='l',lend=1,lwd=2)
    if(n==1){
      text(offset[1]+ox[n],offset[2]+oy[n],"unknot")
    } else {
      text(offset[1]+ox[n],offset[2]+oy[n],substitute(x1[x2], list(x1=crossing[n],x2=subscript[n])))

      }
  }
}



dev.off()
