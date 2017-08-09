library(knotR)
filename <- "pretzel_p3_p5_p7_m3_m5.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      58,28,
      24,54,
      56,26,
      23,53,
      57,27,
      25,55,
      59,29,
      60,30,
      22,52,
      50,20,
      21,51,
      49,19,
      48,18,
      12,42,
      46,16,
      14,44,
      47,17,
      13,43,
      45,15,
      11,41,
      10,40,
      36,06,
      08,38,
      09,39,
      37,07,
      35,05,
      34,04,
      02,32,
      01,31,
      33,03
  ),ncol=2,byrow=TRUE)

p35735  <- symmetry_object(a, Mver=Mver, xver=NULL,mcdonalds=T)
a <- symmetrize(a,p35735)
knotplot2(a,circ=F,lwd=1,text=T,rainbow=T,seg=T)


jj <- matrix(c(  # NB nonalternating!
    58,24,    1,
    25,57,    1,
    56,26,    1,
    27,55,    1,
    54,28,    1,

    22,50,    2,
    51,21,    2,
    20,52,    2,

    48,12,    3,
    13,47,    3,
    46,14,    3,
    15,45,    3,
    44,16,    3,
    17,43,    3,
    42,18,    3,
    
    10,36,    4,
    37,09,    4,
    08,38,    4,
    39,07,    4,
    06,40,    4,

    34,02,    5,
    03,33,    5,
    32,04,    5
),byrow=TRUE,ncol=3)


# twists number 4 and 5 are negative:
swap <- jj[,3] %in% c(4,5)
jj[swap,1:2] <- jj[swap,2:1]

ou35735 <- jj[,1:2]


knotplot(a,ou35735,gap=10)

jj <- knotoptim(filename,
                symobj = p35735,
                ou = ou35735,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

