library(knotR)
filename <- "k12a_0614.svg"
a <- reader(filename)

xver  <- c(10,23)

ouk12 <-
  matrix(c(
      15,1,  
      2,14,
      21,3,
      4,10,
      19,5,
      6,18,
      10,7,
      8,22,
      23,9,
      11,20,
      17,12,
      13,16
  ),byrow=TRUE,ncol=2)


symk11 <- symmetry_object(a, Mver=NULL, xver=xver)
a  <- symmetrize(as.minobj(a),symk11)

knotplot(a,ouk12)
stop()

jj <- knotoptim(filename,
                symobj = symk11,
                ou   = ouk11,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

