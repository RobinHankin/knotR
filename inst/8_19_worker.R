library(knotR)
filename <- "8_19.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    8,14,
    9,13,
    15,7,
    2,20,
    16,6,
    3,19,
    4,18,
    10,12,
    5,17
),ncol=2,byrow=TRUE)


sym819 <- symmetry_object(a,Mver=Mver,xver=c(1,11))
a <- symmetrize(a,sym819)
#knotplot2(a,node=T)
#knotplot2(a,circ=FALSE,text=TRUE,rainbow=TRUE,lwd=1)

ou819 <- matrix(c(  # NB Not alternating!
    15,8,
    13,20,
    18,12,
    5,11,
    10,3,
    1,7,
    6,17,
    2,16
),ncol=2,byrow=TRUE)

#knotplot(a,ou819)

jj <-
  knotoptim(filename,
            symobj = sym819,
            ou   = ou819,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

