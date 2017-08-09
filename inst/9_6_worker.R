library(knotR)
filename <- "9_6.svg"
a <- reader(filename)
#knotplot2(a)
#knotplot2(a,node=T,circ=F)


Mver <- matrix(c(
    12,14,
    25,1,
    11,15,
    16,10,
    24,2,
    9,17,
    8,18,
    23,3,
    7,19,
    6,20,
    22,4,
    21,5
),ncol=2,byrow=TRUE)


sym96 <-
    symmetry_object(
        x    = a,
        xver = c(13,26),
        Mver = Mver
    )


a <- symmetrize(a,sym96)
#knotplot2(a,circ=T,s)
#knotplot2(a,text=T,lwd=1,rainbow=T,circ=F)

ou96  <-
    matrix(c(
        01,15,
        18,03,
        04,20,
        21,06,
        07,23,
        24,09,
        10,17,
        16,11,
        12,26
    ),byrow=TRUE,ncol=2)
#knotplot(a,ou96)
#stop()
jj <- knotoptim(filename,
                symobj  = sym96,
                ou      = ou96,
                prob    = 0,
                iterlim = 9000, print.level=2
#                control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
