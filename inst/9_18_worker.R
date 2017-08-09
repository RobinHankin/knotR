library(knotR)
filename <- "9_18.svg"

a <- reader(filename)
         
Mver <- matrix(c(
    29,01,
    06,04,
    25,23,
    26,22,
    12,14
),ncol=2,byrow=TRUE)

sym918 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = c(5,24,30),
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym918)


ou918  <-
  matrix(c(
      18,02,
      03,20,
      23,05,
      06,26,
      29,09,
      11,28,
      27,13,
      14,22,
      21,16
        ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym918,
                ou      = ou918,
                prob    = 0,
                iterlim = 9000, print.level=2
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
                
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
