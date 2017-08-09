library(knotR)

filename <- "9_31.svg"
a <- reader(filename)

ou931 <- matrix(c(  # alternating  
    14,01,
    02,16,
    12,04,
    05,18,
    10,06,
    07,21,
    22,09,
    19,11,
    17,13
), byrow=TRUE,ncol=2)

Mver931 <- matrix(c(
    07,15,
    08,14,
    21,01,
    20,02,
    06,16,
    09,13,
    05,17,
    10,12,
    18,04,
    19,03
), byrow=TRUE,ncol=2)

sym931 <- symmetry_object(a,Mver=Mver931,xver=c(11,22))
#knotplot2(symmetrize(a,sym931))

jj <- knotoptim(filename,
                symobj=sym931,
                ou   = ou931,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

