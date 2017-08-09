library(knotR)
filename <- "8_21.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

sym821 <- symmetry_object(a,Mver=NULL,xver=4)
a <- symmetrize(a,sym821)
#knotplot2(a)
#knotplot2(a,text=TRUE,lwd=1,circ=FALSE)


ou821 <- matrix(c(
      09,02,
      03,12,
      15,06,
      07,23,
      18,08,
      13,19,
      22,14,
      23,18
),ncol=2,byrow=TRUE)
#knotplot(a,ou821)

jj <-
  knotoptim(filename,
            symobj = sym821,
            ou   = ou821,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )





write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

