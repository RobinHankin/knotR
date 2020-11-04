filename <- "knots_to_8crossings.pdf"
library(knotR)

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
    

b <- lapply(a,overunder)

pdf(file=filename,width=40,height=40)
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
        knotplot(k,b[[n]],add=TRUE,lwd=7,gap=3)
        text(xoff+xtext,yoff+ytext,leg[[n]],
             cex=3)
    }
}

dev.off()
