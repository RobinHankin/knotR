library(knotR)

filename <- "4_1a.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    23,01,
    08,16,
    07,17,
    22,02,
    15,09,
    06,18,
    05,19,
    14,10,
    21,03,
    04,20,
    13,11
),ncol=2,byrow=TRUE)

Mhor <- matrix(c(
    07,05,
    22,14,
    23,13,
    08,04,
    15,21,
    16,20,
    09,03,
    02,10,
    01,11,
    17,19
),ncol=2,byrow=TRUE)

sym41 <- symmetry_object(a,Mver=Mver,Mhor=Mhor,xver=c(12,24),xhor=c(6,18),reefknot=T)
a <- symmetrize(a,sym41)
#knotplot2(a,node=T,seg=T,lwd=1)
#knotplot2(a,text=TRUE,lwd=1,rainbow=TRUE,circ=FALSE)

ou41 <-
    matrix(c(
        02,17,
        03,10,
        04,21,
        14,05,
        23,08,
        16,09,
        11,20,
        15,22
),ncol=2,byrow=TRUE)

#knotplot(a,ou41)


jj <- knotoptim(filename,
                symobj = sym41,
                ou   = ou41,
                prob=0,
#                iterlim=1000, print.level=2
                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

