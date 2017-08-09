library(knotR)
filename <- "8_16.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)



Mver <- matrix(c(
    09,25,
    08,26,
    07,01,
    24,10,
    16,18,
    23,11,
    15,19,
    06,02,
    12,22,
    15,19,
    14,20,
    13,21,
    05,03
),ncol=2,byrow=TRUE)

sym816 <- symmetry_object(a,Mver=Mver,xver=c(4,17))
a <- symmetrize(a,sym816)


#knotplot2(a,lwd=1,text=T,circ=F,rainbow=TRUE)


ou816 <- matrix(c(
    25,10,
    11,18,
    23,12,
    13,06,
    07,16,
    17,24,
    19,02,
    03,22
),ncol=2,byrow=TRUE)

#knotplot(a,ou816)


jj <-
  knotoptim(filename,
            symobj = sym816,
            ou   = ou816,
            prob = 0,
                iterlim=10000, print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

