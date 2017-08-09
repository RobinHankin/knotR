library(knotR)

filename <- "9_44.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
#knotplot2(a,lwd=1,rainbow=TRUE,circ=FALSE,text=TRUE)


ou944 <- matrix(c(  # nonalternating
    8,2,
    20,10,
    11,17,
    16,21,
    3,15,
    22,14,
    13,5,
    23,7,
    4,21
), byrow=TRUE,ncol=2)


sym944 <- symmetry_object(a,xver=18)
a <- symmetrize(a,sym944)

##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rain=TRUE)
##knotplot(a,ou944)

jj <- knotoptim(filename,
                symobj=sym944,
                ou   = ou944,
                prob=0,
#                iterlim=10000, print.level=2
                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
