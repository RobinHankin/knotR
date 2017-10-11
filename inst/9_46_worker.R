library(knotR)

filename <- "9_46.svg"
a <- reader(filename)


Mver946 <- matrix(c(
    17,34,
    18,1,
    33,16,
    32,15,
    31,14,
    30,13,
    29,12,
    19,2,
    7,24,
    6,23,
    20,3,
    5,22,
    21,4,
    28,11,
    27,10,
    8,25,
    9,26
), byrow=TRUE,ncol=2)

Mhor946 <- matrix(c(
    31,29,
    18,8,
    17,9,
    19,7,
    32,28,
    33,27,
    34,26,
    16,10,
    15,11,
    6,20,
    5,21,
    22,4,
    23,3,
    2,24,
    14,12,
    1,25
    ),byrow=TRUE,ncol=2)

sym946 <-
  symmetry_object(
      a,
      Mver=Mver946,
      Mhor=Mhor946,
      xhor=c(30,13),
      mcdonalds=TRUE,celtic=TRUE
  )
a <- symmetrize(a,sym946)

#knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)
knotplot2(a,node=TRUE)


ou946 <- matrix(c(  # nonalternating  
    17,34,
    2,15,
    24,3,
    5,22,
    20,7,
    29,8,
    10,27,
    25,12,
    32,19
), byrow=TRUE,ncol=2)


#knotplot(a,ou946)

jj <- knotoptim(filename,
                symobj=sym946,
                ou   = ou946,
                prob=0.1,
                iterlim=10,print.level=2
#               control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
