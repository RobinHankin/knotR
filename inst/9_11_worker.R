library(knotR)
filename <- "9_11.svg"
a <- reader(filename)


sym911 <-
    symmetry_object(
        x    = a,
        Mver = NULL,
        xver = 14
        )
    
a <- symmetrize(a,sym911)


ou911  <- matrix(c(
    01, 21,
    19, 02,
    04, 12,
    14, 05,
    07, 15,
    17, 08,
    10, 23,
    22, 11,
    12, 18
),byrow=TRUE,ncol=2)



jj <- knotoptim(filename,
                symobj  = sym911,
                ou      = ou911,
                prob    = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE# these arguments for optim()
                )



write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
