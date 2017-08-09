library(knotR)
filename <- "9_14.svg"
a <- reader(filename)



sym914 <-
    symmetry_object(
        x    = a,
        Mver = NULL,
        xver = 23
        )
    
a <- symmetrize(a,sym914)


ou914  <-
  matrix(c(
      17,1,
      2,15,
      14,4,
      5,12,
      11,18,
      23,10,
      8,19,
      21,7,
      19,22
  ),byrow=TRUE,ncol=2)

knotplot(a,ou914)


jj <- knotoptim(filename,
                symobj  = sym914,
                ou      = ou914,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

