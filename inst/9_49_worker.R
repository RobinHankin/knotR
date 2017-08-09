library(knotR)

filename <- "9_49.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)



Mver949 <- matrix(c(
    27,1,
    11,17,
    12,16,
    10,18,
    26,2,
    19,9,
    20,8,
    13,15,
    7,21,
    25,3,
    24,4,
    6,22,
    5,23
), byrow=TRUE,ncol=2)



sym949 <-
  symmetry_object(
      a,
      Mver=Mver949,
      xver=c(14,28),
  )

a <- symmetrize(a,sym949)
#knotplot2(a)

##knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)


ou949 <- matrix(c(# nonalternating  
    18,2,
    3,16,
    5,24,
    14,7,
    21,8,
    10,19,
    27,11,
    13,26,
    22,15
), byrow=TRUE,ncol=2)


##knotplot(a,ou949)



jj <- knotoptim(filename,
                symobj=sym949,
                ou   = ou949,
                prob=0,
#                iterlim=100000,print.level=2
               control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
