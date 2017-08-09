library(knotR)
filename <- "9_5.svg"
a <- reader(filename)

Mver <- matrix(c(
    NA,NA
),ncol=2,byrow=TRUE)


sym95 <-
    symmetry_object(
        x    = a,
        xver = 4
    )


a <- symmetrize(a,sym95)

ou95  <-
    matrix(c(
        30,10,
        17,01,
        02,15,
        13,03,
        05,26,
        24,06,
        07,22,
        20,08,
        09,18
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj = sym95,
                ou   = ou95,
                prob=0,
#                iterlim=9000,print.level=2
                control=list(trace=100,maxit=30000), # these arguments for optim()
                useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
