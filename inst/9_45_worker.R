library(knotR)

filename <- "9_45.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
#knotplot2(a,lwd=1,rainbow=TRUE,circ=FALSE,text=TRUE)


ou945 <- matrix(c(  # nonalternating
    9,2,
    3,11,
    12,5,
    21,6,
    8,19,
    14,22,
    18,15,
    16,25,
    24,17
), byrow=TRUE,ncol=2)


sym945 <- symmetry_object(a,xver=25)
a <- symmetrize(a,sym945)

##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rain=TRUE)
#knotplot(a,ou945)
#stop()
jj <- knotoptim(filename,
                symobj=sym945,
                ou   = ou945,
                prob=0,
                iterlim=10000, print.level=2
#                control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
