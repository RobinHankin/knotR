library(knotR)
filename <- "9_22.svg"
a <- reader(filename)


Mver <- matrix(c(
NA,NA
),ncol=2,byrow=TRUE)


sym922 <-
    symmetry_object(
        x    = a,
        Mver = NULL,
        xver = 11
    )


a <- symmetrize(a,sym922)

ou922  <-
    matrix(c(
        01,18,
        16,03,
        05,24,
        10,06,
        07,27,
        26,09,
        19,11,
        13,21,
        23,15
    ),byrow=TRUE,ncol=2)

#knotplot2(a,text=T,lwd=1,width=F)

jj <- knotoptim(filename,
                symobj = sym922,
                ou   = ou922,
                prob=0,
                iterlim=9000,print.level=2
#                control=list(trace=100,maxit=1000), useNLM=FALSE

                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
