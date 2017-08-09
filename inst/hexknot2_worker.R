library(knotR)
filename <- "hexknot2.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

jj <- matrix(1:60,10)

symhex <- symmetry_object(a, Mrot=jj)
a <- symmetrize(a,symhex)
#knotplot2(a,node=T)

#knotplot2(a,lwd=0,circ=F,text=TRUE,rainbow=T,seg=T,xlim=c(-1000,10000))

ouhex <- matrix(c(
  8, 1,
 14, 3,
 2, 16,
 18,11,
 24,13,
 12,26,
 28,21,
 34,23,
 22,36,
 38,31,
 44,33,
 32,46,
 48,41,
 52, 6,
 4, 53,
 54,43,
 42,56,
 58,51
),ncol=2,byrow=TRUE)

#knotplot(a,ouhex,gap=10)



# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = symhex,
                ou   = ouhex,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
