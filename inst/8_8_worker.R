library(knotR)
filename <- "8_8.svg"
a <- reader(filename)

sym88 <- symmetry_object(a,Mver=NULL,xver=12)
a <- symmetrize(a,sym88)
#knotplot2(a,node=T)
#knotplot2(a,lwd=1,text=T,circ=F)
ou88 <- matrix(c(
    08,02,
    03,06,
    13,05,
    06,14,
    20,09,
    10,16,
    18,11,
    15,19
),ncol=2,byrow=TRUE)
#knotplot(a,ou88)

jj <-
  knotoptim(filename,
            symobj = sym88,
            ou   = ou88,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

