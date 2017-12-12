library(knotR)
filename <- "9_21.svg"

a <- reader(filename)

sym921 <-
    symmetry_object(
        x    = a,
        xver = 29,
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym921)


ou921  <-
    matrix(c(
        02,12,
        23,04,
        05,19,
        17,06,
        09,28,
        26,10,
        11,24,
        14,22,
        20,15
        ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym921,
                ou      = ou921,
                prob    = 0,
                iterlim= 9000, print.level=2
#               control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
