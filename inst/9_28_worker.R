library(knotR)
filename <- "9_28.svg"
a <- reader(filename)
#knotplot2(a,node=T)
#stop()

Mver928 <- matrix(c(
    05,16,
    06,17,
    12,01,
    13,02,
    11,22,
    15,04,
    07,18,
    14,03,
    21,10,
    08,19,
    09,20
    ),ncol=2,byrow=TRUE)


sym928 <-
    symmetry_object(
        x    = a,
        xver = NULL,
        Mver = Mver928,
        mcdonalds=TRUE
    )


a <- symmetrize(a,sym928)
#knotplot2(a,seg=F,text=T,node=T,circ=0,lwd=1,rainbow=TRUE)
#stop()


ou928  <-
    matrix(c(
        18,01,
        03,19,
        22,04,
        05,16,
        12,07,
        08,14,
        21,10,
        11,22,
        15,11
    ),byrow=TRUE,ncol=2)

#knotplot(a,ou928)
#stop()

jj <- knotoptim(filename,
                symobj  = sym928,
                ou      = ou928,
                prob    = 0,
                iterlim = 9000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

