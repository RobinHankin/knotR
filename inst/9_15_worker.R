library(knotR)
filename <- "9_15.svg"

a <- reader(filename)
Mver <- matrix(c(
    24,02,
    12,14,
    11,15,
    23,03,
    04,22,
    21,05,
    06,20,
    07,19,
    10,16,
    17,09,
    08,18
),ncol=2,byrow=TRUE)

sym915 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = c(1,13),
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym915)

ou915  <-
  matrix(c(
      03,14,
      23,04,
      05,22,
      21,06,
      07,11,
      18,09,
      10,17,
      13,24,
      16,20
        ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym915,
                ou      = ou915,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

