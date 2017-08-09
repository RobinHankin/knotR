library(knotR)


filename <- "9_40.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver940 <- matrix(c(
    11,22,
    12,01,
    21,10,
    05,16,
    04,15,
    20,09,
    13,02,
    14,03,
    06,17,
    19,08,
    07,18
    ),byrow=TRUE,ncol=2)


Mhor940 <- matrix(c(
    12,06,
    05,13,
    11,07,
    04,14,
    21,19,
    22,18,
    01,17,
    10,08,
    15,03,
    16,02
    ),byrow=TRUE,ncol=2)


sym940 <-
    symmetry_object(a,Mver=Mver940,Mhor=Mhor940,xhor=c(9,20),
                    mcdonalds=TRUE,celtic=TRUE)

a <- symmetrize(a,sym940)
##knotplot2(a,node=TRUE)
##knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)


ou940 <- matrix(
    c(
        17,02,
        03,09,
        15,04,
        05,21,
        13,06,
        08,19,
        10,16,
        22,11,
        20,14
    ),byrow=TRUE,ncol=2)

#knotplot(a,ou940)

jj <- knotoptim(filename,
                symobj = sym940,
                ou   = ou940,
                prob = 0,
                iterlim=10000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

