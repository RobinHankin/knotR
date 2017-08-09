library(knotR)

filename <- "6_1.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <-   matrix(c(
     6,4,
     14,16,
     7,3,
     13,17,
     12,18,
     8,2,
     9,1,
     19,11,
     20,10
),ncol=2,byrow=TRUE)

sym61 <- symmetry_object(
   x    = a,
   Mver = Mver,
   xver = c(5,15)
   )

a <- symmetrize(a,sym61)
#knotplot2(a,text=TRUE,lwd=0,circ=FALSE)


ou61 <- matrix(c(
     16,4,
     3,18,
     10,1,
     19,12,
     7,15,
     13,8
),byrow=TRUE,ncol=2)

#knotplot(a,ou61)

jj <- knotoptim(filename,
                symobj = sym61,
                ou     = ou61,
                prob   = 0,
                 iterlim=1000,print.level=2         # these arguments for nlm()
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
                )
write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
		