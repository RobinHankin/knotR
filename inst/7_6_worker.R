library(knotR)
filename <- "7_6.svg"
a <- reader(filename)
sym76 <- symmetry_object(a,xver=2)      # no real symmetry, but force
                                        # node 2 to be on the
                                        # centreline


ou76 <- matrix(c(
    12,01,
    02,11,
    07,03,
    04,15,
    16,06,
    14,08,
    10,13
    ),byrow=TRUE,ncol=2)

## Function symmetrize_LR() creates a symmetrized knot:
k76 <- symmetrize(as.minobj(a), sym76)



jj <- knotoptim(filename,
                symobj = sym76,
                ou   = ou76,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

