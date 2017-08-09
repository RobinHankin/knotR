library(knotR)
filename <- "9_20.svg"

a <- reader(filename)

sym920 <-
    symmetry_object(
        x    = a,
        xver = 27,
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym920)

ou920  <-
    matrix(c(
        01, 23,
        14, 02,
        04, 13,
        21, 05,
        08, 18,
        19, 10,
        12, 20,
        16, 26,
        24, 15
        ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = sym920,
                ou      = ou920,
                prob    = 0,
#                iterlim= 1000, print.level=2
               control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
