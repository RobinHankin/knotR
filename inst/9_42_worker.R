library(knotR)

filename <- "9_42.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
#knotplot2(a,lwd=1,rainbow=TRUE,circ=FALSE,text=TRUE)

ou942 <- matrix(c(  # nonalternating
    2,12,
    10,3,
    21,4,
    6,23,
    7,15,
    14,9,
    17,24,
    26,18,
    20,27
), byrow=TRUE,ncol=2)

#knotplot(a,ou942,gap=10)


sym942 <- symmetry_object(a,xver=28)
a <- symmetrize(a,sym942)
##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rain=TRUE)
##knotplot(a,ou942)


jj <- knotoptim(filename,
                symobj=sym942,
                ou   = ou942,
                prob=0,
#                iterlim=10000, print.level=2
                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
