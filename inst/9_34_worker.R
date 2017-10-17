library(knotR)
filename <- "9_34.svg"
a <- reader(filename)
##knotplot2(a,node=T)


Mver934 <-
  matrix(c(
      10,08,
      20,32,
      19,33,
      18,34,
      17,01,
      11,07,
      12,06,
      31,21,
      13,05,
      30,22,
      29,23,
      28,24,
      04,14,
      03,15,
      16,02,
      27,25
  ),byrow=TRUE,ncol=2)


sym934 <-
    symmetry_object(
        x    = a,
        Mver = Mver934,
        xver = c(9,26),
        mcdonalds=FALSE
        )
    
a <- symmetrize(a,sym934)
##knotplot2(a,circ=0,node=F,text=T,lwd=1,seg=F,rainbow=TRUE)


ou934  <-
  matrix(c(
      02,25,
      16,03,
      05,14,
      22,06,
      08,33,
      20,11,
      13,31,
      28,17,
      32,21
  ),byrow=TRUE,ncol=2)

knotplot(a,ou934)


#knotplot(a,ou934)

jj <- knotoptim(filename,
                symobj  = sym934,
                ou      = ou934,
                prob    = 0,
                iterlim = 1000, print.level=2
#                control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
