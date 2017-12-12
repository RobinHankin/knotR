library(knotR)

filename <- "9_46.svg"
a <- reader(filename)


Mver946 <- matrix(c(
    17,34,
    18,01,
    33,16,
    32,15,
    31,14,
    30,13,
    29,12,
    19,02,
    07,24,
    06,23,
    20,03,
    05,22,
    21,04,
    28,11,
    27,10,
    08,25,
    09,26
), byrow=TRUE,ncol=2)

Mhor946 <- matrix(c(
    31,29,
    18,08,
    17,09,
    19,07,
    32,28,
    33,27,
    34,26,
    16,10,
    15,11,
    06,20,
    05,21,
    22,04,
    23,03,
    02,24,
    14,12,
    01,25
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
    02,15,
    24,03,
    05,22,
    20,07,
    29,08,
    10,27,
    25,12,
    32,19
), byrow=TRUE,ncol=2)


#knotplot(a,ou946)

jj <- knotoptim(filename,
                symobj=sym946,
                ou   = ou946,
                prob = 0,
                iterlim=1000, print.level=2
#               control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
