library(knotR)
filename <- "12n838.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    37,01,
    24,14,
    23,15,
    22,16,
    36,02,
    35,03,
    13,25,
    12,26,
    27,11,
    28,10,
    34,04,
    05,33,
    29,09,
    30,08,
    21,17,
    32,06,
    31,07,
    20,18
),ncol=2,byrow=TRUE)

sym828 <- symmetry_object(a,Mver=Mver,xver=c(19,38))
a <- symmetrize(a,sym828)
#knotplot2(a,node=TRUE)


knotplot2(a,text=TRUE,lwd=1,circ=FALSE,rainbow=TRUE)

ou828 <- matrix(c(  # nonalternating!
    02,15,
    11,04,
    05,34,
    33,06,
    07,18,
    17,10,
    27,12,
    14,25,
    32,21,
    22,29,
    37,24,
    28,35
),ncol=2,byrow=TRUE)

##knotplot(a,ou828,gap=10)

jj <-
  knotoptim(filename,
            symobj = sym828,
            ou   = ou828,
            prob = 0,
            iterlim=1000, print.level=2,
#            control=list(trace=100,maxit=100000), useNLM=FALSE
            )

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

