library(knotR)
filename <- "6_2.svg"

Mver <- 
  matrix(c(
      01,07,
      15,08,
      06,02,
      14,09,
      10,13,
      05,03,
      11,12
  ),ncol=2,byrow=TRUE)
     
ou62 <- matrix(c(
    07,02,
    03,09,
    10,14,
    05,11,
    13,04,
    15,06
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                Mver = Mver,
                xver = 4,
                ou   = ou62,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

