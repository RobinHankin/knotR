pdf(file="overundergraphicalimplementation.pdf",height=7,width=7)
x <- seq(from=-0.8,to=0.8,len=100)
xx <- x[abs(x)<0.15]
plot(NA,type="l",axes=FALSE,xlim=c(-1,1),ylim=c(-1.1,1.1),asp=1,xlab="",ylab="")

points(x*0,x/2+0.4,type="l",lwd=16)
points(x*0-0.5,x/2+0.65,type="l",lwd=16)
points(xx,xx^2+0.4,lwd=32,type="l",col='red')
xx1 <- xx-0.5
points(xx1,xx1^2+0.4,lwd=32,type="l",col='red')
points(x,x^2+0.4,type="l",lwd=16)
points(xx*0 + 0.5, xx1^2+0.4,type="l",lwd=32,col='red')
points(x*0+0.5,x/2+0.65,type="l",lwd=16)

points(x,x^2-0.7,type="l",lwd=16)
points(x*0,x/2-0.7,type="l",lwd=16)
points(x*0-0.5,x/2-0.45,type="l",lwd=16)
points(xx,xx^2-0.7,lwd=32,type="l",col='white')
xx1 <- xx-0.5
points(xx1,xx1^2-0.7,lwd=32,type="l",col='white')
points(x,x^2-0.7,type="l",lwd=16)
points(xx*0 + 0.5, xx1^2-0.7,type="l",lwd=32,col='white')
points(x*0+0.5,x/2-0.45,type="l",lwd=16)
dev.off()
