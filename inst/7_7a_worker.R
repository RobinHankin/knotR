library(knotR)

filename <- "7_7a.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    1,7,
    28,8,
    27,9,
    6,2,
    21,15,
    20,16,
    19,17,
    26,10,
    25,11,
    24,12,
    5,3,
    22,14,
    23,13
    ),ncol=2,byrow=TRUE)

sym77a <- symmetry_object(a,Mver=Mver,xver=c(4,18))
a <- symmetrize(a,sym77a)
#knotplot2(a,text=T,lwd=1,circ=FALSE,rainbow=TRUE)
#stop()


ou77a <- matrix(c(
    10,15,
    4,13,
    15,3,
    22,27,
    6,22,
    24,5,
    2,7
    ),byrow=TRUE,ncol=2)

#knotplot(a,ou77a)


jj <- knotoptim(filename,
                symobj = sym77a,
                ou   = ou77a,
                prob = 0,
                iterlim=1000,print.level=2
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.R',filename))



