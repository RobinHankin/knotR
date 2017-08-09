library(knotR)
filename <- "k11n157.svg"
a <- reader(filename)

knotplot2(a,text=T,lwd=1,width=0)

Mver <-
  matrix(c(
      12,22,
      21,13,
      05,07,
      11,01,
      20,14,
      15,19,
      10,02,
      04,08,
      16,18,
      03,09
  ),ncol=2,byrow=TRUE)

xver  <- c(6,17)

ouk11n <-
  matrix(c(
      01,08,
      02,19,
      10,03,
      04,17,
      05,12,
      21,06,
      07,14,
      18,09,
      16,11,
      15,20,
      13,22
  ),byrow=TRUE,ncol=2)



symk11n <- symmetry_object(a, Mver=Mver, xver=xver)
a  <- symmetrize(as.minobj(a),symk11n)

jj <- knotoptim(filename,
                symobj = symk11n,
                ou   = ouk11n,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

