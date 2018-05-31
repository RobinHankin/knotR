rm(list=ls())
library(knotR) 
filename <- "hexknot.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


## This knot is a very challenging knot to get right.  We need to
## impose sixfold rotational symmetry, and also reflectional symmetry.

## To do this we choose nodes 1,24,8,9,15,16 as the independent ones.
## The idea is to choose nodes in the segment from 11 oclock to
## midday; but note the odd choice of 24.  We choose 24 because node 4
## has a peculiar requirement, namely that it is (a) on the line 11
## o'clock line, and (b) the handle has to be at the 2 o'clock
## direction.  And there is no functionality to do this.  So we choose
## node 24 as the independent one.

jj  <-
  matrix(c(
      01,11,21,31,41,51,
      24,34,44,54,04,14,
      08,18,28,38,48,58,
      09,19,29,39,49,59,
      15,25,35,45,55,05,
      16,26,36,46,56,06,


      02,12,22,32,42,      52,

      03,13,23,33,43,      53,
      10,20,30,40,50,60,
      17,27,37,47,57,07
  ),ncol=6,byrow=TRUE)


Mver <- matrix(c( # everything except c(9,39), which are on the vertical axis, xver
    1,17,
#    4,14,
    8,10,
    15,3,
    16,2
                                        
#
#    5,13,
#    6,12,
#    7,11,
#
#   60,18,
#    59,19,
#    58,20,
#    57,21,
#    56,22,
#    55,23,
#    54,24,
#    25,53,
#    26,52
#    51,27,
#    50,28,
#    49,29,
#    48,30,
#    47,31,
#    32,46,
#    33,45,
#    44,34,
#    43,35,
#    42,36,
#    41,37,
#    40,38
    ),ncol=2,byrow=TRUE)


#Mhor <-matrix(c( # everything except c(24,54), which are on the horizontal axis, xhor
#    8,40
#    1,47,
#    60,48,
#    7,41,
#    59,49,
#    58,50,
#    51,57,
#    6,42,
#    52,56,
#    5,43,
#    53,55,
#    4,44,
#    15,33,
#    16,32,
#    10,38,
#    17,31,
#    2,46,
#    3,45,
#    14,34,
#    25,23,
#    26,22,
#    12,36,
#    13,35,
#    11,37,
#    18,30,
#    19,29,
#    20,28,
#    27,21
    
    
 #   ),ncol=2,byrow=TRUE)


symhex <- symmetry_object(a,xver=c(9),xhor=c(24),Mver=Mver,Mrot=jj,celtic=TRUE)
a <- symmetrize(a,symhex)
#knotplot2(a,node=T,seg=T,lwd=10,circ=90)
#abline(h=0,v=0)
#stop()

#knotplot2(a,lwd=1,circ=F,text=T,rainbow=T)
#stop()
ouhex <- matrix(c(
    2,17,
    15,4,
    5,54,
    52,7,
    8,1,
    18,11,
    12,27,
    25,14,
    28,21,
    22,37,
    35,24,
    38,31,
    32,47,
    45,34,
    48,41,
    42,57,
    55,44,
    58,51



),ncol=2,byrow=TRUE)

#knotplot(a,ouhex,gap=3)
#stop()


# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = symhex,
                ou   = ouhex,
                prob=0,
                iterlim=200, print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
