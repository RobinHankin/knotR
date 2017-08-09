library(knotR)
filename <- "8_7.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

sym87 <- symmetry_object(a,Mver=NULL,xver=8)

ou87 <- matrix(c(
    23,05,
    15,22,
    21,11,
    10,19,
    18,07,
    06,16,
    04,14,
    13,02
),ncol=2,byrow=TRUE)

#knotplot2(a,text=TRUE,lwd=1,circ=FALSE)
#knotplot(symmetrize(a,sym87),ou87)

jj <-
  knotoptim(filename,
            symobj = sym87,
            ou   = ou87,
            prob = 0,
            iterlim=10000,print.level=2,hessian=FALSE
#            control=list(trace=100,maxit=2000), # these arguments for optim()
#            useNLM=FALSE
            )


write_svg(jj, filename, safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

