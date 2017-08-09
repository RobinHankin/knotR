library(knotR)

filename <- "9_33.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
#knotplot2(a,text=TRUE,lwd=1,rain=TRUE,circ=FALSE,)


ou933 <- matrix(c(  # alternating  
    06,23,
    22,15,
    10,21,
    20,28,
    30,19,
    16,08,
    14,04,
    03,11,
    27,02
), byrow=TRUE,ncol=2)


#knotplot(a,ou933)

sym933 <- symmetry_object(a,Mver=NULL,xver=31)
#knotplot2(symmetrize(a,sym933))

jj <- knotoptim(filename,
                symobj=sym933,
                ou   = ou933,
                prob=0,
                iterlim=1000,print.level=2
#                control=list(trace=100,maxit=10000), # these arguments for optim()
#                useNLM=FALSE

                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
