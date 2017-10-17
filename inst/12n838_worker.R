library(knotR)
filename <- "12n838.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    35,01,
    23,13,
    22,14,
    12,24,
    11,25,
    34,02,
    26,10,
    21,15,
    27,09,
    33,03,
    28,08,
    20,16,
    32,04,
    29,07,
    30,06,
    31,05,
    19,17
),ncol=2,byrow=TRUE)


sym828 <- symmetry_object(a,Mver=Mver,xver=c(18,36))
a <- symmetrize(a,sym828)
#knotplot2(a,node=TRUE)


#knotplot2(a,text=TRUE,lwd=1,circ=FALSE,rainbow=TRUE)


ou828 <- matrix(c(  # nonalternating!
    02,14,
    10,03,
    04,33,
    32,05,
    06,17,
    16,09,
    26,11,
    31,20,
    21,28,
    35,23,
    13,24,
    27,34
),ncol=2,byrow=TRUE)

#knotplot(a,ou828,gap=10)

jj <-
  knotoptim(filename,
            symobj = sym828,
            ou   = ou828,
            prob = 0,
            ##            iterlim=1000, print.level=2,
            control=list(trace=100,maxit=100000), useNLM=FALSE
            )


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

