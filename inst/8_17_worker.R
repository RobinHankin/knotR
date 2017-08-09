library(knotR)
filename <- "8_17.svg"
a <- reader(filename)
Mver <- NULL
#knotplot2(a,node=T)
#stop()
sym817 <- symmetry_object(a,Mver=Mver,xver=4)
a <- symmetrize(a,sym817)
#knotplot2(a,text=T,circ=F,lwd=1,rainbow=TRUE)

ou817 <- matrix(c(
    18,10,
    12,21,
    24,15,
    16,7,
    2,17,
    22,3,
    6,23,
    8,1
),ncol=2,byrow=TRUE)
#knotplot(a,ou817)

jj <-
  knotoptim(filename,
            symobj = sym817,
            ou   = ou817,
            prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
)

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


