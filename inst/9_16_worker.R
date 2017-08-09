library(knotR)
filename <- "9_16.svg"



a <- reader(filename)

Mver <- matrix(c(
    11,22,
    12,01,
    19,08,
    14,03,
    21,10,
    13,02,
    20,09,
    15,04,
    18,07,
    05,16,
    17,06
),ncol=2,byrow=TRUE)

sym916 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = NULL,
        mcdonalds=TRUE
    )

a <- symmetrize(a,sym916)

ou916  <-
  matrix(c(
      22,11,
      08,02,
      03,09,
      10,04,
      05,16,
      17,06,
      13,19,
      20,14,
      15,21
        ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = sym916,
                ou      = ou916,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

