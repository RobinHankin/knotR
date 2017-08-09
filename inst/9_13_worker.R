library(knotR)
filename <- "9_13.svg"
a <- reader(filename)
Mver <- matrix(c(
    19,10,
    09,18
),ncol=2,byrow=TRUE)


sym913 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = 22,
        mcdonalds=TRUE
        )
    
a <- symmetrize(a,sym913)

ou913  <-
  matrix(c(
      15,01,
      02,13,
      12,04,
      05,16,
      22,05,
      19,10,
      09,18,
      17,08,
      07,21
  ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = sym913,
                ou      = ou913,
                prob    = 0,
#                iterlim = 1000,print.level=2
                control=list(trace=100,maxit=1000), # these arguments for optim()
                useNLM=FALSE
                )



write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
