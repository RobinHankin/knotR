library(knotR)
filename <- "12n838.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    37,1,
    23,15,
    24,14,
    36,2,
    13,25,
    12,26,
    35,3,
    22,16,
    27,11,
    28,10,
    34,4,
    29,9,
    21,17,
    30,8,
    32,6,
    31,7,
    20,18
),ncol=2,byrow=TRUE)


sym828 <- symmetry_object(a,Mver=Mver,xver=c(19,38))
a <- symmetrize(a,sym828)
#knotplot2(a,node=TRUE)

#knotplot2(a,text=TRUE,lwd=1,circ=FALSE,rainbow=TRUE)



ou828 <- matrix(c(  # nonalternating!
    2,15,#
    11,4,#
    5,34,#
    33,6,#
    7,18,#
    17,10,#
    27,12,#
    14,25,#
    32,21,#
    22,29,#
    37,24,#
    28,35
),ncol=2,byrow=TRUE)

#knotplot(a,ou828,gap=10)

jj <-
  knotoptim(filename,
            symobj = sym828,
            ou   = ou828,
            prob = 0,
            iterlim=1000, print.level=2,
##          control=list(trace=100,maxit=100000), useNLM=FALSE
            )


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

