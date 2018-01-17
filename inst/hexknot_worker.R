library(knotR) 
filename <- "hexknot.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


jj  <-
  matrix(c(
      07,16,25,34,43,52,
      08,17,26,35,44,53,
      09,18,27,36,45,54,
      01,10,19,28,37,46,
      15,24,33,42,51,06,
      12,21,30,39,48,03,
      02,11,20,29,38,47,
      22,31,40,49,04,13,
      23,32,41,50,05,14
      ),ncol=6,byrow=TRUE)


symhex <- symmetry_object(a, Mrot=jj)
a <- symmetrize(a,symhex)
#knotplot2(a,node=T)

#knotplot2(a,lwd=1,circ=F,text=T,rainbow=T)

ouhex <- matrix(c(
    01,07,
    15,02,
    03,13,
    48,04,
    06,47,
    10,16,
    24,11,
    12,22,
    19,25,
    33,20,
    21,31,
    28,34,
    42,29,
    30,40,
    37,43,
    51,38,
    39,49,
    46,52
),ncol=2,byrow=TRUE)

#knotplot(a,ouhex,gap=3)


# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = symhex,
                ou   = ouhex,
                prob=0,
#                iterlim=1000, print.level=2
                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
