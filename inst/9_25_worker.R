library(knotR)
filename <- "9_25.svg"

a <- reader(filename)

Mver925 <- matrix(c(
    10,18,
    17,11,
    12,16,
    13,15,
    06,04,
    07,03,
    08,02
    ),ncol=2,byrow=TRUE)

sym925 <-
    symmetry_object(
        x    = a,
        xver = c(5,14),
        Mver = Mver925,
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym925)

ou925  <-
    matrix(c(
        20,  1,
        2,  22,
        16,  5,
        6,  13,
        27,  9,
        10, 25,
        18, 11,
        12, 17,        
        24, 19
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym925,
                ou      = ou925,
                prob    = 0,
                iterlim = 1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

