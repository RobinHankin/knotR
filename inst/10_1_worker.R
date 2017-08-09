library(knotR)
filename <- "10_1.svg"
a <- reader(filename)

Mver <- matrix(c(
    13,31,
    12,01,
    30,14,
    29,15,
    17,27,
    18,26,
    16,28,
    11,02,
    10,03,
    09,04,
    19,25,
    08,05,
    20,24,
    21,23,
    07,06),
    ncol=2,byrow=TRUE)
    

sym101 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = 22
        )
a <- symmetrize(a,sym101)

ou101  <-
  matrix(c(
      02,28,
      26,03,
      05,25,
      23,06,
      08,22,
      20,09,
      11,19,
      17,12,
      14,31,
      29,16
  ),byrow=TRUE,ncol=2)

knotplot(a,ou101)



jj <- knotoptim(filename,
                symobj  = sym101,
                ou      = ou101,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

