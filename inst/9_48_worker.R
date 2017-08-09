library(knotR)

filename <- "9_48.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


Mver948 <- matrix(c(
    27,1,
    11,17,
    12,16,
    10,18,
    26,2,
    19,9,
    13,15,
    25,3,
    24,4,
    20,8,
    7,21,
    6,22,
    23,5
), byrow=TRUE,ncol=2)




sym948 <-
  symmetry_object(
      a,
      Mver=Mver948,
      xver=c(14,28),
  )

a <- symmetrize(a,sym948)
##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)


ou948 <- matrix(c(  # nonalternating  
    18,2,
    3,16,
    6,23,
    21,8,
    9,15,
    10,19,
    27,11,
    13,26,
    14,20
), byrow=TRUE,ncol=2)


##knotplot(a,ou948)


jj <- knotoptim(filename,
                symobj=sym948,
                ou   = ou948,
                prob=0,
                iterlim=10000,print.level=2
#               control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
