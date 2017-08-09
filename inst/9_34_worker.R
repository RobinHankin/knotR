library(knotR)
filename <- "9_34.svg"
a <- reader(filename)


Mver934 <-
  matrix(c(
      09,07,
      18,27,
      17,28,
      16,29,
      15,01,
      10,06,
      26,19,
      11,05,
      25,20,
      24,21,
      04,12,
      03,13,
      14,02,
      23,22
  ),byrow=TRUE,ncol=2)


sym934 <-
    symmetry_object(
        x    = a,
        Mver = Mver934,
        xver = 8,
        mcdonalds=FALSE
        )
    
a <- symmetrize(a,sym934)
#knotplot2(a,circ=0,node=F,text=T,lwd=1,seg=F,rainbow=TRUE)


ou934  <-
  matrix(c(
      02,22,
      14,03,
      05,12,
      20,06,
      07,28,
      18,10,
      11,26,
      24,15,
      27,19
  ),byrow=TRUE,ncol=2)



#knotplot(a,ou934)

jj <- knotoptim(filename,
                symobj  = sym934,
                ou      = ou934,
                prob    = 0,
                iterlim = 1000, print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
