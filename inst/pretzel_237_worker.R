library(knotR)
filename <- "pretzel_2_3_7.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      18,17,
      34,01,
      33,02,
      32,03,
      31,04,
      19,16,
      20,15,
      13,22,
      21,14,
      12,23,
      11,24,
      30,05,
      10,25,
      09,26,
      29,06,
      28,07,
      08,27
  ),ncol=2,byrow=TRUE)


p237 <- symmetry_object(a, Mver=Mver, xver=c(35))
a <- symmetrize(a,p237)

ou237 <- matrix(c(  # NB nonalternating!
    01,17,
    05,25,
    26,06,
    07,27,
    28,08,
    09,29,
    30,10,
    11,31,
    21,13,
    14,22,
    23,15,
    19,35
),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj = p237,
                ou = ou237, 
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

