library(knotR)

filename <- "9_43.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
#knotplot2(a,lwd=1,rainbow=TRUE,circ=FALSE,text=TRUE)


ou943 <- matrix(c(  # nonalternating
    1,14,
    17,2,
    10,3,
    4,9,
    5,18,
    20,6,
    13,19,
    8,12,
    14,5
), byrow=TRUE,ncol=2)




sym943 <- symmetry_object(a,xver=20)
a <- symmetrize(a,sym943)


##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rain=TRUE)
##knotplot(a,ou942)

jj <- knotoptim(filename,
                symobj=sym943,
                ou   = ou943,
                prob=0,
                iterlim=100000, print.level=2,
                control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
