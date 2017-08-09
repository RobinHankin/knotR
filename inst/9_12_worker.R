library(knotR)
filename <- "9_12.svg"
a <- reader(filename)

Mver <- matrix(c(
    19,07,
    06,20,
    21,05,
    22,04
),ncol=2,byrow=TRUE)


sym912 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = 26
        )
    
a <- symmetrize(a,sym912)

ou912  <-
  matrix(c(
      11,02,
      03,13,
      21,06,
      07,20,
      19,08,
      09,18,
      14,10,
      25,15,
      17,24
  ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = sym912,
                ou      = ou912,
                prob    = 0,
                iterlim = 9000, print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
