library(knotR)


filename <- "6_3.svg"
a <- reader(filename)

sym63 <- symmetry_object(a,xver=13)

a <- symmetrize(a,sym63)

ou63 <- matrix(c(
    10,17,
    01,12,
    08,03,
    04,14,
    15,05,
    13,09
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                xver = 13,
                ou   = ou63,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

