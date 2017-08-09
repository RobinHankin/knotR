library(knotR)
filename <- "10_47.svg"
a <- reader(filename)
#knotplot2(a,circ=200)
#knotplot2(a,circ=200,node=T)


Mver <-
  matrix(c(
      28,20,
      01,19,
      18,02,
      17,03,
      16,04,
      15,05
  ),ncol=2,byrow=TRUE)

xver <- 24

sym1047 <- symmetry_object(a, Mver=Mver, xver=xver)
#knotplot2(symmetrize(a,sym1047),seg=T)
#knotplot2(symmetrize(a,sym1047),seg=F,lwd=1,text=T,rainbow=T,circ=0)
#stop()

ou1047 <- matrix(c(
    02,19,
    21,04,
    06,22,
    10,07,
    08,14,
    14,09,
    24,11,
    13,25,
    27,15,
    17,28
),byrow=TRUE,ncol=2)

#knotplot(a,ou1047)
#stop()



jj <- knotoptim(filename,
                symobj = sym1047,
                ou = ou1047,
		prob = 0,
                iterlim=2000, print.level=2
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))



