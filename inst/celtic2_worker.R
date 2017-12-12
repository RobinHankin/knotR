library(knotR)
a <- reader("celtic2.svg")


Mver <- matrix(c(
    17,04,
    18,05,
    16,03,
    09,22,
    08,21,
    23,10,
    15,02,
    19,06,
    01,14,
    24,11,
    25,12,
    26,13,
    07,20
    ),ncol=2,byrow=TRUE)

xhor <- c(8,21)

Mhor <- matrix(c(
    17,25,
    18,24,
    16,26,
    09,07,
    23,19,
    15,01,
    22,20,
    02,14,
    10,6,
    03,13,
    04,12,
    05,11
 ),ncol=2,byrow=TRUE)


ou <- matrix(c(
    1,20,
    15,2,
    3,10,
    22,3,
    6,22,
    11,6,
    7,14,
    20,7,
    8,1,
    24,8,
    9,19,
    16,9,
    10,23,
    21,11,
    14,21,
    23,16,
    19,24
    ),ncol=2,byrow=TRUE)




jj <- 
knotoptim("celtic2.svg",
          Mver=Mver,Mhor=Mhor,xhor=xhor, ou=ou,
                    celtic=TRUE, mcdonalds=TRUE,
          print.level=2,iterlim=1000,
          weights = c(1,0.1,1,1,1,1,1,1),
          prob=0)



