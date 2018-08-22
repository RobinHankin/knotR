library(knotR)

filename <- "9_47.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver947 <- matrix(c(
    27,01,

    07,21,
    06,22,
    05,23,

    08,20,
    
    19,09,
    18,10,

    11,17,

    26,02,
    12,16,

    25,03,
    04,24,
    13,15
    
), byrow=TRUE,ncol=2)

sym947 <-
  symmetry_object(
      a,
      Mver=Mver947,
      xver=c(14,28),
  )


a <- symmetrize(a,sym947)
##knotplot2(a)
#knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)


ou947 <- matrix(c(  # nonalternating  
    2,21,
    17,3,
    4,25,
    13,5,
    8,27,
    9,20,
    18,11,
    26,12,
    24,16
), byrow=TRUE,ncol=2)


##knotplot(a,ou947)

jj <- knotoptim(filename,
                symobj=sym947,
                ou   = ou947,
                prob=0,
                iterlim=1000, print.level=2
#               control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
