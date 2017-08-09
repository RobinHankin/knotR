library(knotR)
filename <- "8_5.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    21,01,
    12,10,
    13,09,
    20,02,
    04,18,
    19,03,
    05,17,
    14,08,
    06,16,
    07,15
),ncol=2,byrow=TRUE)

sym85 <- symmetry_object(a,Mver=Mver,xver=c(11,22))
a <- symmetrize(a,sym85)
#knotplot2(a,node=TRUE)
#knotplot2(a,lwd=1,text=T,circ=F,rainbow=T)

ou85 <- matrix(c(
    11,02,
    03,18,
    19,04,
    05,20,
    14,06,
    08,15,
    17,09,
    21,12
),ncol=2,byrow=TRUE)
#knotplot(a,ou85)

jj <-
  knotoptim(filename,
            symobj = sym85,
            ou   = ou85,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

