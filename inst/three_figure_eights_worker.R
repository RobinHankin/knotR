library(knotR) 
filename <- "three_figure_eights.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mrot <- matrix(c(
    23,12,1,
    22,11,33,
    15,4,26,
    16,5,27,
    14,3,25,
    21,10,32,
    20,9,31,
    19,8,30,
    13,2,24,
    17,6,28,
    18,7,29
    ),ncol=3,byrow=TRUE)
sym38 <- symmetry_object(a, xver=24, Mrot=Mrot)
a <- symmetrize(a,sym38)
#knotplot2(a,node=T)
#knotplot2(a,node=F,lwd=1,text=T,rainbow=T,circ=F)

ou38 <- matrix(c(
    22,15,
    17,21,
    19,13,
    14,17,

    11,4,
    6,10,
    8,2,
    3,6,

    33,26,
    28,32,
    30,24,
    25,28


),ncol=2,byrow=TRUE)

#knotplot(a,ou38)
#stop()


# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = sym38,
                ou   = ou38,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

