library(knotR)
filename <- "10_61.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <-
  matrix(c(
      16,28,
      15,1,
      27,17,
      26,18,
      25,19,
      14,2,
      4,12,
      5,11,
      13,3,
      6,10,
      24,20,
      7,9,
      23,21
  ),ncol=2,byrow=TRUE)

xver <- c(8,22)

sym1061 <- symmetry_object(a, Mver=Mver, xver=xver)
a <- symmetrize(a,sym1061)
#knotplot2(a,lwd=1,circ=FALSE,text=TRUE,rainbow=TRUE)



ou1061 <- matrix(c(
    17,28,
    2,18,
    20,11,
    9,21,
    24,8,
    6,25,
    27,15,
    12,3,
    4,13,
    14,5
),byrow=TRUE,ncol=2)
#knotplot(a,ou1061)

jj <- knotoptim(filename,
                symobj = sym1061,
                ou = ou1061, prob=0,
                iterlim=1000, print.level=2 )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


