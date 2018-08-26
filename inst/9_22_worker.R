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
        xver = 12
    )


a <- symmetrize(a,sym922)

ou922  <-
    matrix(c(
        01,21,
        18,04,
        06,28,
        11,07,
        08,31,
        30,10,
        27,17,
        15,25,
        23,12
    ),byrow=TRUE,ncol=2)

#knotplot2(a,text=T,lwd=1,width=F)

jj <- knotoptim(filename,
                symobj = sym922,
                ou   = ou922,
                prob=0,
                iterlim=1000,print.level=2
#                control=list(trace=100,maxit=1000), useNLM=FALSE

                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
