library(knotR)
filename <- "5_2.svg"
a <- reader(filename)

Mver <-  matrix(c(
    02,04,
    10,12,
    01,05,
    06,16,
    15,07,
    09,13,
    08,14
),ncol=2,byrow=TRUE)


sym52 <- symmetry_object(
    x    = a,
    Mver = Mver,
    xver = c(3,11)
    )

a <- symmetrize(a,sym52)

ou52 <-
  matrix(c(
      12,05,
      08,15,
      16,07,
      06,01,
      02,11
      ), ncol=2,byrow=TRUE)

jj <- knotoptim(filename,
                Mver = Mver,
                xver = c(3,11),
                ou   = ou52,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

