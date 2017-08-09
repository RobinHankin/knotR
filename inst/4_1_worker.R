library(knotR)

filename <- "4_1.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)
Mver <- matrix(c(
    2,4,
    11,9,
    1,5,
    6,14,
    7,13,
    12,8
),ncol=2,byrow=TRUE)

sym41 <- symmetry_object(a,Mver=Mver,xver=c(3,10))
a <- symmetrize(a,sym41)
#knotplot2(a)
#knotplot2(a,text=TRUE,lwd=1,rainbow=TRUE,circ=FALSE)
ou41 <-
    matrix(c(
        5,10,
        8,13,
        1,6,
        11,2
),ncol=2,byrow=TRUE)

#knotplot(a,ou41)

jj <- knotoptim(filename,
                symobj = sym41,
                ou   = ou41,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

