library(knotR)
filename <- "8_14.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

sym814 <- symmetry_object(a,Mver=NULL,xver=23)
a <- symmetrize(a,sym814)
#knotplot2(a,text=T,lwd=1,rain=T,circ=F)


ou814 <- matrix(c(
    19,25,
    26,5,
    10,27,
    28,12,
    22,2,
    4,20,
    6,16,
    15,9
),ncol=2,byrow=TRUE)

#knotplot(a,ou814)

jj <-
  knotoptim(filename,
            symobj = sym814,
            ou   = ou814,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=10000), useNLM=FALSE
)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

