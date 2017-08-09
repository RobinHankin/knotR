library(knotR)
filename <- "T20.svg"

a <- reader(filename)
symT20 <-
    symmetry_object(
        x    = a,
        xver = c(32,28),
        mcdonalds=FALSE
    )




ouT20  <-
    matrix(c(
        01, 06,
        07, 02,
        03, 17,
        05, 08,
        18, 04,
        20, 10,
        11, 21,
        22, 12,
        26, 14,
        15, 27
        ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = symT20,
                ou      = ouT20,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

