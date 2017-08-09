library(knotR)
filename <- "reefknot.svg"
a <- reader(filename)


Mhor <- matrix(c(
    17,1,
    16,2,
    18,32,
    15,3,
    19,31,
    24,26,
    23,27,
    14,4,
    22,28,
    13,5,
    22,28,
    12,6,
    21,29,
    11,7,
    20,30,
    10,8,
    19,31,
    18,32
    ),ncol=2,byrow=TRUE)

Mver <- matrix(c(
    16,18,
    23,11,
    22,12,
    24,10,
    15,19,
    3,31,
    14,20,
    13,21,
    3,31,
    25,9,
    4,30,
    5,29,
    26,8,
    27,7,
    28,6,
    2,32
 ),ncol=2,byrow=TRUE)

xver <- c(1,17)
xhor <- c(25,9)

symobjreef <- symmetry_object(a, Mver=Mver,Mhor=Mhor,xver=xver, xhor=xhor,reefknot=TRUE)
a <- symmetrize(a,symobjreef)

oureef <- matrix(c(
    20, 10,
    13, 22,
    25, 15,
    26, 04,
    06, 29,
    31, 09
),ncol=2,byrow=TRUE)


jj <- knotoptim(filename,
                symobj = symobjreef,
                ou   = oureef,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

