library(knotR)
filename <- "k12n_0411.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      27,01,
      18,20,
      26,02,
      07,21,
      03,25,
      24,04,
      09,13,
      05,23,
      06,22,
      10,12
  ),ncol=2,byrow=TRUE)


sym11 <- symmetry_object(a, Mver=Mver,xver=c(11,15,19,28))

ou11 <- matrix(c(
    01,15,
    20,02,
    03,26,
    25,04,
    05,24,
    06,10,
    17,08,
    09,18,
    23,13,
    14,21,
    16,28,
    27,19
),byrow=TRUE,ncol=2)


a <- symmetrize(a,sym11)

jj <- knotoptim(filename,
                symobj = sym11,
                ou = ou11,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

