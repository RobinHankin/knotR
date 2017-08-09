library(knotR)

filename <- "9_37.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


ou937 <- matrix(c(  # alternating  
    18,02,
    03,16,
    24,05,
    07,22,
    20,09,
    15,19,
    10,14,
    13,26,
    27,11
), byrow=TRUE,ncol=2)

Mver937 <- matrix(c(
    11,17,
    27,01,
    12,16,
    26,02,
    10,18,
    13,15,
    09,19,
    20,08,
    21,07,
    06,22,
    05,23,
    25,03,
    24,04
), byrow=TRUE,ncol=2)


sym937 <- symmetry_object(a,Mver=Mver937,xver=c(14,28))
a <- symmetrize(a,sym937)
## knotplot2(a)
## knotplot2(a,text=TRUE,lwd=0,circ=FALSE,rainbow=TRUE)
##knotplot(a,ou937)

jj <- knotoptim(filename,
                symobj=sym937,
                ou   = ou937,
                prob=0,
#                iterlim=50000, print.level=2
                control=list(trace=100,maxit=100000), #these arguments for optim()
               useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
