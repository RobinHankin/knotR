library(knotR)
filename <- "k11n157_morenodes.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      15,27,
      14,28,
      26,16,
      6,8,
      5,9,
      25,17,
      13,1,
      18,24,
      4,10,
      19,23,
      12,2,
      3,11,
      20,22
  ),ncol=2,byrow=TRUE)

xver  <- c(7,21)

ouk11n <-
  matrix(c(
      1,9,
      2,24,
      12,3,
      4,20,
      6,14,
      26,7,
      8,17,
      23,11,
      19,13,
      16,27,
      18,25
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

