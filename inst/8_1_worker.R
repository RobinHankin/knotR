library(knotR)
filename <- "8_1.svg"
a <- reader(filename)
#knotplot2(a,node=T)

Mver <- matrix(c(
    10,24,
    09,01,
    23,11,
    12,22,
    13,21,
    14,20,
    08,02,
    07,03,
    06,04,
    15,19,
    16,18
),ncol=2,byrow=TRUE)

sym81 <- symmetry_object(a,Mver=Mver,xver=c(5,17))
a <- symmetrize(a,sym81)
#knotplot2(a,node=TRUE)
#knotplot2(a,text=TRUE,lwd=1,rainbow=TRUE,circ=FALSE)



ou81 <- matrix(c(
    02,22,
    20,03,
    05,19,
    16,06,
    08,15,
    13,09,
    23,12,
    11,24
),ncol=2,byrow=TRUE)

#knotplot(a,ou81)

jj <-
  knotoptim(filename,
            symobj = sym81,
            ou   = ou81,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

