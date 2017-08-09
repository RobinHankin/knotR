library(knotR)
filename <- "k12n_0242.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      06,28,
      05,01,
      27,07,
      26,08,
      04,02,
      25,09,
      16,18,
      15,19,
      24,10,
      14,20,
      23,11,
      22,12,
      13,21
  ),ncol=2,byrow=TRUE)


sym242 <- symmetry_object(a, Mver=Mver, xver=c(3,17))

a <- symmetrize(a,sym242)

ou242 <- matrix(c(  # NB nonalternating!
    02,08,
    03,18,
    17,04,
    27,05,
    07,28,
    10,19,
    20,11,
    12,21,
    22,13,
    14,23,
    24,15,
    16,25
),byrow=TRUE,ncol=2)



jj <- knotoptim(filename,
                symobj = sym242,
                ou = ou242, 
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

