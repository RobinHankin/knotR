library(knotR)
filename <- "k11a179.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <-
  matrix(c(
  3,25,
  2,26,
  15,13,
  4,24,
  1,27,
  16,12,
  5,23,
  6,22,
  7,21,
  17,11,
  8,20,
  18,10,
  19,9
  ),ncol=2,byrow=TRUE)

symk11 <- symmetry_object(a,Mver=Mver,xver=c(14,28))
a <- symmetrize(a,symk11)
#knotplot2(a,text=TRUE,lwd=1,circ=FALSE,node=TRUE)



ouk11 <-
  matrix(c(
  25,14,
  13,27,
  23,12,
  11,21,
  20,9,
  8,18,
  17,6,
  2,16,
  15,4,
  28,24,
  5,1
  ),byrow=TRUE,ncol=2)
#knotplot(a,ouk11)



jj <- knotoptim(filename,
                symobj = symk11,
                ou   = ouk11,
                prob=0,
                iterlim=3000, print.level=2
#                control=list(trace=100,maxit=10000), # these arguments for optim()
#                useNLM=FALSE
                )



write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


