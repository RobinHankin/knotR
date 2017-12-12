library(knotR)
filename <- "9_19.svg"

a <- reader(filename)

sym919 <-
    symmetry_object(
        x    = a,
        xver = 11,
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym919)

ou919  <-
  matrix(c(
      19,24,
      26,10,
      08,27,
      02,07,
      16,03,
      05,15,
      11,18,
      23,12,
      13,21
        ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = sym919,
                ou      = ou919,
                prob    = 0,
                iterlim=30, print.level=2
#                control=list(trace=100,maxit=70000), useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
