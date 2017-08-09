library(knotR)
filename <- "8_20.svg"
a <- reader(filename)
#knotplot2(a,node=T)


sym820 <- symmetry_object(a,Mver=NULL,xver=20)
a <- symmetrize(a,sym820)
#knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rainbow=TRUE)

ou820 <- matrix(c(
    25,16,
    17,08,
    03,18,
    19,11,
    12,22,
    23,04,
    07,24,
    09,02
),ncol=2,byrow=TRUE)

#knotplot(a,ou820)



jj <-
  knotoptim(filename,
            symobj = sym820,
            ou   = ou820,
            prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
            )

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
