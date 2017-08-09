library(knotR)
filename <- "8_11.svg"
a <- reader(filename)
sym811 <- symmetry_object(a,Mver=NULL,xver=4)
a <- symmetrize(a,sym811)
#knotplot2(a,node=T)
#knotplot2(a,lwd=1,text=T,circ=F,rainbow=T)


ou811 <- matrix(c(
    22,09,
    10,21,
    20,11,
    07,19,
    17,06,
    12,16,
    15,02,
    03,13
),ncol=2,byrow=TRUE)


#knotplot(a,ou811)


jj <-
  knotoptim(filename,
            symobj = sym811,
            ou   = ou811,
            prob = 0,
            iterlim=3000,print.level=2,hessian=FALSE
#            control=list(trace=100,maxit=1000), # these arguments for optim()
#            useNLM=FALSE
            )


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

