library(knotR)

filename <- "9_39.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


Mver939 <- matrix(c(
    23,01,
    09,15,
    10,14,
    08,16,
    22,02,
    17,07,
    11,13,
    18,06,
    21,03,
    05,19,
    20,04
), byrow=TRUE,ncol=2)

sym939 <- symmetry_object(a,Mver=Mver939,xver=c(12,24))

a <- symmetrize(a,sym939)
#knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rainbow=TRUE)

ou939 <- matrix(c(  # alternating  
    16,02,
    03,14,
    20,05,
    06,19,
    13,07,
    08,17,
    23,09,
    11,22,
    18,12
), byrow=TRUE,ncol=2)

#knotplot(a,ou939)


jj <- knotoptim(filename,
                symobj=sym939,
                ou   = ou939,
                prob=0,
#                iterlim=10000, print.level=2
                control=list(trace=100,maxit=10), #these arguments for optim()
               useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
