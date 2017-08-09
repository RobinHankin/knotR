library(knotR)
filename <- "9_41.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


Mver <- matrix(c(
    23,1,
    9,15,
    8,16,
    22,2,
    10,14,
    17,7,
    11,13,
    6,18,
    21,3,
    5,19,
    20,4
),ncol=2,byrow=TRUE)


sym941 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = c(12,24)
    )
a <- symmetrize(a,sym941)
#knotplot2(a,text=TRUE,lwd=1,circ=FALSE)


ou941  <-
    matrix(c(
        2,16,
        14,3,
        5,20,
        12,6,
        7,18,
        17,8,
        9,23,
        22,11,
        19,13
        ),byrow=TRUE,ncol=2)

as <- symmetrize(a,sym941)
#knotplot2(as,text=T,lwd=0,circ=F)
#knotplot(as,ou941)


jj <- knotoptim(filename,
                symobj = sym941,
                ou   = ou941,
                prob=0,
                iterlim=9000,print.level=2
#               control=list(trace=100,maxit=1000), useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
