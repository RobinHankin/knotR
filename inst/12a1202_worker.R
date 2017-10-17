library(knotR)

filename <- "12a1202.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver12 <- matrix(c(
    32,02,
    33,01,
    34,40,
    39,35,
    26,08,
    38,36,
    27,07,
    16,18,
    29,05,
    24,10,
    31,03,
    23,11,
    30,04,
    25,09,
    28,06,
    15,19,
    22,12,
    21,13,
    20,14
), byrow=TRUE,ncol=2)

Mhor12 <- matrix(c(
    32,22,
    33,21,
    34,20,
    23,31,
    30,24,
    25,29,
    38,16,
    26,28,
    39,15,
    37,17,
    08,06,
    35,19,
    40,14,
    01,13,
    02,12,
    36,18,
    09,05,
    04,10,
    11,03
),byrow=TRUE,ncol=2)

sym12 <-
  symmetry_object(
      a,
      Mver=Mver12,
      Mhor=Mhor12,
      xhor=c(2,7),
      xver=c(17,37),
      mcdonalds=FALSE,celtic=TRUE
  )
a <- symmetrize(a,sym12)

#knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)
#knotplot2(a,node=TRUE)


ou12 <- matrix(c(  # nonalternating  
    40,35,
    03,12,
    11,04,
    05,10,
    19,06,
    07,18,
    37,08,
    09,36,
    15,20,
    16,29,
    28,17,
    32,23,
    24,31,
    30,25,
    26,39,
    38,27
), byrow=TRUE,ncol=2)


#knotplot(a,ou12,gap=7,lwd=1)


jj <- knotoptim(filename,
                symobj=sym12,
                ou   = ou12,
                prob=0,
#                iterlim=1000,print.level=2
               control=list(trace=100,maxit=2000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
