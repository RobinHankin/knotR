library(knotR)
filename <- "10_75.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      12,20,
      19,13,
      09,03,
      18,14,
      10,02,
      11,01,
      17,15,
      08,04,
      05,07
  ),ncol=2,byrow=TRUE)

xver <- c(6,16)

ou1075 <- matrix(c(
    1,4,
    15,2,
    3,14,
    5,8,
    17,6,
    7,16,
    9,12,
    19,10,
    11,18,
    13,20
),byrow=TRUE,ncol=2)


sym1075 <- symmetry_object(a, Mver=Mver, xver=xver)
ar <- symmetrize(as.minobj(a),sym1075)
knotplot(ar,ou1075,gap=4)

jj <- knotoptim(filename,
                symobj = sym1075,
                ou = ou1075, 
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

