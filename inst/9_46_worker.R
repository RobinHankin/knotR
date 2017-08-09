library(knotR)

filename <- "9_46.svg"
a <- reader(filename)
##knotplot2(a,node=TRUE)


Mver946 <- matrix(c(
    13,26,
    14,1,
    25,12,
    24,11,
    15,2,
    6,19,
    5,18,
    7,20,
    16,3,
    17,4,
    23,10,
    8,21,
    9,22
), byrow=TRUE,ncol=2)

Mhor946 <- matrix(c(
    14,8,
    13,9,
    25,23,
    15,7,
    6,16,
    5,17,
    26,22,
    12,10,
    18,4,
    19,3,
    1,21,
    2,20
    ),byrow=TRUE,ncol=2)

sym946 <-
  symmetry_object(
      a,
      Mver=Mver946,
      Mhor=Mhor946,
      xhor=c(11,24),
      mcdonalds=TRUE,celtic=TRUE
  )


a <- symmetrize(a,sym946)

##knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)



ou946 <- matrix(c(  # nonalternating  
    13,26,
    2,12,
    21,11,
    10,23,
    24,8,
    25,15,
    20,3,
    5,18,
    16,7
), byrow=TRUE,ncol=2)


knotplot(a,ou946)

jj <- knotoptim(filename,
                symobj=sym946,
                ou   = ou946,
                prob=0,
#                iterlim=10000,print.level=2
               control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
