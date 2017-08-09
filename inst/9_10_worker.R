library(knotR)
filename <- "9_10.svg"
a <- reader(filename)

Mver <- matrix(c(
    12,24,
    13,01,
    23,11,
    22,10,
    14,02,
    03,15,
    16,04,
    21,09,
    05,17,
    06,18,
    20,08,
    07,19
),ncol=2,byrow=TRUE)



sym910 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = NULL,
        mcdonalds=TRUE
    )
a <- symmetrize(a,sym910)

ou910  <-
  matrix(c(
      12,24,
      02,11,
      09,18,
      20,08,
      06,21,
      17,05,
      04,16,
      15,03,
      23,14
        ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = sym910,
                ou      = ou910,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

