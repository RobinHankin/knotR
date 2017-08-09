library(knotR)
filename <- "k11n22.svg"
a <- reader(filename)

#knotplot2(a,node=TRUE,lwd=1,width=0)

Mver <-
  matrix(c(
      19,1,
      20,28,
      21,27,
      13,7,
      26,22,
      18,2,
      14,6,
      15,5,
      17,3,
      25,23,
      16,4,
      11,9
  ),ncol=2,byrow=TRUE)

xver  <- c(10,24)
symk11n <- symmetry_object(a, Mver=Mver, xver=xver)
a  <- symmetrize(as.minobj(a),symk11n)
#knotplot2(a)
#knotplot2(a,lwd=1,text=TRUE,circ=FALSE)

ouk11n <-
  matrix(c(
      22,27,
      3,23,
      24,4,
      25,17,
      18,26,
      2,7,
      8,3,
      5,9,
      12,16,
      18,13,
      14,19
  ),byrow=TRUE,ncol=2)

knotplot(a,ouk11n)


jj <- knotoptim(filename,
                symobj = symk11n,
                ou   = ouk11n,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

