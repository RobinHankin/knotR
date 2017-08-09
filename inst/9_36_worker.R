library(knotR)

filename <- "9_36.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

#knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)


ou936 <- matrix(c(  # alternating  
    1,26,
    24,2,
    4,12,
    15,5,
    8,16,
    20,9,
    11,23,
    18,29,
    27,19
), byrow=TRUE,ncol=2)

#knotplot(a,ou936)


sym936 <- symmetry_object(a,xver=9)
a <- symmetrize(a,sym936)
##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rain=TRUE)
##knotplot(a,ou936)


jj <- knotoptim(filename,
                symobj=sym936,
                ou   = ou936,
                prob=0,
                iterlim=10000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
