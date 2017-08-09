library(knotR)
filename <- "8_12.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

sym812 <- symmetry_object(a,Mver=NULL,xver=5)
a <- symmetrize(a,sym812)
#knotplot2(a,node=TRUE)
#knotplot2(a,text=TRUE,lwd=1,circ=FALSE,rainbow=TRUE)

ou812 <- matrix(c(
    18,2,
    3,16,
    13,5,
    6,10,
    22,8,
    9,21,
    20,14,
    15,19
),ncol=2,byrow=TRUE)

#knotplot(a,ou812)


jj <-
  knotoptim(filename,
            symobj = sym812,
            ou   = ou812,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
            ## control=list(trace=100,maxit=1000), # these arguments for optim()
            ## useNLM=FALSE
 )

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

