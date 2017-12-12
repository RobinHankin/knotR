library(knotR)
filename <- "9_8.svg"
a <- reader(filename)

Mver <- matrix(c(
    NA,NA
),ncol=2,byrow=TRUE)

sym98 <-
    symmetry_object(
        x    = a,
        xver = 8,
        Mver = NULL
    )


a <- symmetrize(a,sym98)


ou98  <-
    matrix(c(
        24,10,
        22,02,
        03,20,
        19,05,
        06,17,
        13,07,
        08,15,
        11,23,
        16,12
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym98,
                ou      = ou98,
                prob    = 0,
                iterlim = 1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
