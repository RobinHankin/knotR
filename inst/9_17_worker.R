library(knotR)
filename <- "9_17.svg"

a <- reader(filename)
Mver <- matrix(c(
    25,01,
    08,18,
    07,19,
    09,17,
    10,16,
    24,02,
    05,21,
    23,03,
    22,04,
    11,15,
    06,20,
    12,14
),ncol=2,byrow=TRUE)


sym917 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = c(13,26),
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym917)

ou917  <-
  matrix(c(
      02,18,
      16,03,
      04,21,
      22,05,
      06,23,
      12,07,
      09,25,
      24,11,
      20,15
        ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym917,
                ou      = ou917,
                prob    = 0,
                weights=c(1,5,1,1,1,1,1,1,1),
#                iterlim = 10000,print.level=2
                control=list(trace=100,maxit=10000), useNLM=FALSE
            )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
