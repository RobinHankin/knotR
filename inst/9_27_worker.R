library(knotR)
filename <- "9_27.svg"
a <- reader(filename)
#knotplot2(a,node=T)

Mver <- matrix(c(
    19,18,
    25,29,
    08,10,
    26,28
),ncol=2,byrow=TRUE)


sym927 <-
    symmetry_object(
        x    = a,
        xver = c(9,27),
        Mver = Mver
    )


a <- symmetrize(a,sym927)
##knotplot2(a,seg=T,node=T,circ=222)
##knotplot2(a,lwd=1,text=T,rainbow=TRUE,circ=F )


ou927  <-
    matrix(c(
        12,02,
        03,15,
        23,07,
        08,21,
        26,09,
        10,29,
        17,11,
        30,18,
        20,25
    ),byrow=TRUE,ncol=2)

##knotplot(a,ou927)

jj <- knotoptim(filename,
                symobj  = sym927,
                ou      = ou927,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

