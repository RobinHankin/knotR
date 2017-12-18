library(knotR)
filename <- "8_3.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
#stop()
Mver <- matrix(c(
     10,24,
     23,11,
     9,1,
     8,2,
     12,22,
     21,13,
     14,20,
     15,19,
     7,3,
     16,18,
     6,4
),ncol=2,byrow=TRUE)

sym83 <- symmetry_object(a,Mver=Mver,xver=c(5,17))
a <- symmetrize(a,sym83)
#knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rainbow=TRUE)


ou83 <- matrix(c(
     11,24,
     23,12,
     13,22,
     21,14,
     3,20,
     18,4,
     7,17,
     15,8
),ncol=2,byrow=TRUE)

#knotplot(a,ou83)


jj <-
  knotoptim(filename,
            symobj = sym83,
            ou   = ou83,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

