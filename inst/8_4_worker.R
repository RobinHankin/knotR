library(knotR)
filename <- "8_4.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE,seg=T)
#stop()
sym84 <- symmetry_object(a,xver=6)
a <- symmetrize(a,sym84)
#knotplot2(a,text=T,lwd=0.1,circ=F,rainbow=T)
#stop()

ou84 <- matrix(c(
2,15,
17,4,
6,19,
29,7,
9,27,
25,11,
13,23,
30,20
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym84,
            ou   = ou84,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#            control=list(trace=100,maxit=10000),useNLM=FALSE
            )

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

