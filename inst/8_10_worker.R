library(knotR)
filename <- "8_10.svg"
a <- reader(filename)
#knotplot2(a,node=T)

sym810 <- symmetry_object(a,Mver=NULL,xver=c(9,16,23))
a <- symmetrize(a,sym810)
#knotplot2(a,lwd=1,text=T,rain=T)

           


ou810 <- matrix(c(
    22,08,
    06,21,
    19,05,
    14,19,
    18,10,
    09,15,
    03,13,
    11,02
),ncol=2,byrow=TRUE)

#knotplot(a,ou810)


jj <-
  knotoptim(filename,
            symobj = sym810,
            ou   = ou810,
            prob = 0,
            iterlim = 1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

