library(knotR)

filename <- "9_32.svg"
a <- reader(filename)
#knotplot2(a,node=T)


ou932 <- matrix(c(  # alternating  
    02,25,
    23,04,	
    05,32,
    17,07,
    09,29,
    20,10,
    12,22,
    28,14,
    30,18
), byrow=TRUE,ncol=2)
#knotplot2(a,text=TRUE,lwd=1,rain=TRUE,circ=FALSE)
#knotplot(a,ou932)

sym932 <- symmetry_object(a,Mver=NULL,xver=c(27))
#knotplot2(symmetrize(a,sym932))

jj <- knotoptim(filename,
                symobj=sym932,
                ou   = ou932,
                prob=0,
                iterlim=10000,print.level=2
#                control=list(trace=100,maxit=10000), # these arguments for optim()
#                useNLM=FALSE

                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
