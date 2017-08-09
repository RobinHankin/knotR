library(knotR)
filename <- "7_2.svg"
a <- reader(filename)
#knotplot2(a,node=T)

Mver <- matrix(c(
    13,02,
    12,01,
    11,22,
    03,14,
    04,15,
    05,16,
    10,21,
    06,17,
    09,20,
    18,07,
    08,19
    ),ncol=2,byrow=TRUE)

sym72 <- symmetry_object(x=a, Mver = Mver, mcdonalds=TRUE)
a <- symmetrize(a,sym72)
#knotplot2(a,node=T)
#knotplot2(a,node=F,lwd=1,text=T)


ou72 <- 
    matrix(c(
        15,22,
        21,17,
        18,07,
        08,19,
        03,14,
        11,04,
        06,10
        ),byrow=TRUE,ncol=2)

#knotplot(a,ou72)



jj <- knotoptim(filename,
                symobj = sym72,
                ou   = ou72,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

