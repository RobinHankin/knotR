library(knotR)
filename <- "8_13.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

sym813 <- symmetry_object(a,Mver=NULL,xver=26)
a <- symmetrize(a,sym813)

#knotplot2(a,node=T)
#knotplot2(a,node=F,lwd=1,circ=F,text=T,rainbow=T)

ou813 <- matrix(c(
    26,15,
    16,02,
    10,19,
    20,07,
    06,23,
    24,11,
    03,25,
    12,04
),ncol=2,byrow=TRUE)

#knotplot(a,ou813)


jj <-
  knotoptim(filename,
            symobj = sym813,
            ou   = ou813,
            prob = 0,
            iterlim=1000, print.level=2
#           control=list(trace=100,maxit=5000), useNLM=FALSE
)

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

