library(knotR)
filename <- "k11a361.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <-
  matrix(c(
      14,28,
      15,1,
      27,13,
      26,12,
      25,11,
      16,2,
      5,19,
      17,3,
      24,10,
      6,20,
      7,21,
      9,23,
      22,8
  ),ncol=2,byrow=TRUE)

symk11 <- symmetry_object(a,Mver,mcdonalds=TRUE)
a <- symmetrize(a,symk11)
#knotplot2(a)
#knotplot2(a,lwd=1,text=TRUE,circ=FALSE)

ouk11 <-
  matrix(c(
      14,28,
      2,13,
      11,20,
      24,10,
      9,23,
      22,8,
      6,25,
      17,5,
      4,18,
      19,3,
      27,16
  ),byrow=TRUE,ncol=2)
#knotplot(a,ouk11)


a  <- symmetrize(as.minobj(a),symk11)

jj <- knotoptim(filename,
                symobj = symk11,
                ou   = ouk11,
                prob=0,
                iterlim=1000, print.level=2
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
