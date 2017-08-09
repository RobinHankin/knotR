library(knotR)
filename <- "8_2.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)



Mver <- matrix(c(
    23,1,
    13,11,
    14,10,
    22,2,
    3,21,
    4,20,
    5,19,
    15,9,
    6,18,
    16,8,
    17,7
),ncol=2,byrow=TRUE)

sym82 <- symmetry_object(a,Mver=Mver,xver=c(12,24))
a <- symmetrize(a,sym82)

#knotplot2(a,text=TRUE,lwd=1,circ=FALSE,rainbow=TRUE)



ou82 <- matrix(c(
    12,2,
    21,10,
    9,19,
    18,7,
    6,16,
    15,4,
    3,22,
    23,13
),ncol=2,byrow=TRUE)

#knotplot(a,ou82)

jj <-
  knotoptim(filename,
            symobj = sym82,
            ou   = ou82,
            prob=0,
            iterlim=1000,print.level=2,hessian=FALSE)

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

