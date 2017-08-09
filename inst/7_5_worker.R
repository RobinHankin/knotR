library(knotR)
filename <- "7_5.svg"
a <- reader(filename)

Mver <-
    matrix(
        c(13,02,
          12,03,
          01,14,
          11,04,
          19,15,
          18,16,
          05,10,
          09,06,
          08,07
          ),
        byrow=TRUE,ncol=2)

ou75 <- matrix(c(
    01,12,
    14,02,
    04,15,
    11,05,
    06,10,
    17,07,
    09,18
    ),byrow=TRUE,ncol=2)

sym75 <- symmetry_object(a, Mver=Mver, xver=17)   # Mrot=NULL by default

jj <- knotoptim(filename,
                symobj = sym75,
                ou   = ou75,
                prob = 0,
                iterlim=100, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

