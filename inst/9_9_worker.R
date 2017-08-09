library(knotR)
filename <- "9_9.svg"
a <- reader(filename)


Mver <- matrix(c(
    14,23,
    13,01,
    22,15,
    12,02,
    03,11,
    21,16,
    10,04,
    09,05,
    20,17,
    08,06,
    19,18
),ncol=2,byrow=TRUE)

sym99 <-
    symmetry_object(
        x    = a,
        xver = 7,
        Mver = Mver
    )

a <- symmetrize(a,sym99)

ou99  <-
    matrix(c(
        16,02,
        03,12,
        11,04,
        05,17,
        18,07,
        08,20,
        21,10,
        13,22,
        23,15
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym99,
                ou      = ou99,
                prob    = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

