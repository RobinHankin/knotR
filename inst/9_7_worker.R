library(knotR)
filename <- "9_7.svg"
a <- reader(filename)

Mver <- matrix(c(
    11,12,
    22,01,
    10,13,
    14,09,
    08,15,
    16,07,
    21,02,
    06,17,
    20,03,
    05,18,
    04,19
),ncol=2,byrow=TRUE)


sym97 <-
    symmetry_object(
        x    = a,
        xver = 23,
        Mver = Mver
    )


a <- symmetrize(a,sym97)

ou97  <-
    matrix(c(
        01,13,
        18,03,
        04,20,
        21,06,
        07,17,
        16,08,
        09,15,
        14,10,
        11,23
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym97,
                ou      = ou97,
                prob    = 0,
                iterlim = 1000, print.level=2
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
