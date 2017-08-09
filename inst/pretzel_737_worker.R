library(knotR)
filename <- "pretzel_7_3_7.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      31,06,
      01,26,
      02,27,
      30,05,
      29,04,
      03,28,
      50,25,
      49,24,
      48,23,
      47,22,
      46,21,
      32,07,
      33,08,
      12,37,
      11,36,
      34,09,
      35,10,
      13,38,
      14,39,
      45,20,
      15,40,
      16,41,
      44,19,
      43,18,
      17,42
  ),ncol=2,byrow=TRUE)

Mhor <-
  matrix(c(
      12,34,
      11,35,
      36,10,
      37,09,
      08,38,
      07,39,
      06,40,
      26,20,
      27,19,
      05,41,
      04,42,
      28,18,
      29,17,
      03,43,
      02,44,
      30,16,
      31,15,
      01,45,
      50,46,
      49,47,
      33,13,
      32,14,
      25,21,
      24,22
  ),ncol=2,byrow=TRUE)


p737 <- symmetry_object(a,
                        Mver=Mver, Mhor=Mhor, xver=NULL,xhor=c(23,48),
                        mcdonalds=T,celtic=TRUE)
a <- symmetrize(a,p737)
#knotplot2(a,node=FALSE,circ=0,lwd=1,text=TRUE,rainbow=TRUE)


jj <- matrix(c(   # third column identifies which twist.

    01,32,  1,
    31,02,  1,
    03,30,  1,
    29,04,  1,
    05,28,  1,
    27,06,  1,
    07,26,  1,
    
    34,13,  2,
    11,36,  2,
    38,09,  2,
    
    15,46,  3,
    45,16,  3,
    17,44,  3,
    43,18,  3,
    19,42,  3,
    41,20,  3,
    21,40,  3
),ncol=3,byrow=TRUE)


## we will make the middle twist (number 2) go the other way:
ou737 <- jj[,1:2]
swap <- jj[,3] == 2
ou737[swap,] <- ou737[swap,2:1]



jj <- knotoptim(filename,
                symobj = p737,
                ou = ou737, prob=0,
                iterlim=2000, print.level=2
 #               control=list(trace=100,maxit=1000), useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
