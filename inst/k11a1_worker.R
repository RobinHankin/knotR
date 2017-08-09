library(knotR)
filename <- "k11a1.svg"
a <- reader(filename)

sym11 <- symmetry_object(a,xver=4)
a <- symmetrize(a,sym11)

ou11 <- matrix(c(
    2,  23,
    25,  3,
    4,  29,
    12,  5,
    6,  17,
    15,  7,
    9,  31,
    30, 11,
    18, 13,
    28, 20,
    21, 26
),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj = sym11,
                ou = ou11, prob=0,
#                iterlim=10000, print.level=2
                control=list(trace=100,maxit=1000), # these arguments for optim()
                useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))



