library(knotR)
filename <- "8_15.svg"
a <- reader(filename)
#knotplot2(a,node=T)

Mver <- matrix(c(
    5,19,
    4,20,
    18,6,
    7,17,
    11,13,
    10,14,
    3,1,
    8,16,
    9,15
),ncol=2,byrow=TRUE)

sym815 <- symmetry_object(a,Mver=Mver,xver=c(2,12))
a <- symmetrize(a,sym815)
#knotplot2(a,node=T)
#knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=0)


ou815 <- matrix(c(
    19,6,
    14,1,
    2,16,
    9,3,
    4,11,
    7,18,
    12,8,
    17,13
),ncol=2,byrow=TRUE)

#knotplot(a,ou815)


jj <-
  knotoptim(filename,
            symobj = sym815,
            ou   = ou815,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=10000), useNLM=FALSE
)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

