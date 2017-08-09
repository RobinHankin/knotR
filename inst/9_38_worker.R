library(knotR)

filename <- "9_38.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
#knotplot2(a,lwd=1,rainbow=TRUE,circ=FALSE,text=TRUE)

ou938 <- matrix(c(  # alternating  
    18,02,
    03,20,
    13,05,
    06,12,
    21,07,
    08,17,
    16,10,
    11,22,
    23,15
), byrow=TRUE,ncol=2)

#knotplot(a,ou938,gap=4)


sym938 <- symmetry_object(a,xver=c(16,24))
a <- symmetrize(a,sym938)
##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rain=TRUE)
##knotplot(a,ou936)


jj <- knotoptim(filename,
                symobj=sym938,
                ou   = ou938,
                prob=0,
#                iterlim=10000, print.level=2
                control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
