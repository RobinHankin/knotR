## This shows how to impose reflectional symmetry on
## k3_1, the trefoil knot.
library(knotR)
filename <- "3_1.svg"
a <- reader(filename)

Mver <- matrix(c(
    12,14,
    02,06,
    01,07,
    18,08,
    11,15,
    10,16,
    09,17
),ncol=2,byrow=TRUE)

Mrot <- matrix(c(
    12,06,18,
    13,07,01,
    14,08,02,
    03,15,09,
    04,16,10,
    05,17,11
    ),ncol=3,byrow=TRUE)


sym31 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = c(4,13),
        Mrot = Mrot,
        )

a <- symmetrize(a,sym31)

ou31  <-
    matrix(c(
        15,6,
        9,18,
        3,12
        ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj = sym31,
                ou   = ou31,
                prob=0,
                iterlim=100,print.level=2
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
save(jj,file=sub('.svg','.S',filename))

