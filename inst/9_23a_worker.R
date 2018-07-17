library(knotR)

filename <- "9_23a.svg"
a <- reader(filename)

Mver923 <- 
    matrix(
        c(
            29,01,
            24,06,
            23,07,
            25,05,
            11,19,
            12,18,
            28,02,
            10,20,
            26,04,
            27,03,
            13,17,
            08,22,
            09,21,
            14,16
        ), byrow=TRUE,ncol=2)

xver923 <- c(15,30)
Mhor923 <- matrix(c(
    25,10,
    24,09,
    11,26,
    12,27,
    28,13,
    29,14,
    23,08,
    30,15,
    01,16,
    07,22,
    02,17,
    06,21,
    18,03,
    19,04,
    05,20



    ),byrow=TRUE,ncol=2)


sym923 <-
    symmetry_object(a,Mver=Mver923,xver=xver923,Mhor=Mhor923)
a <- symmetrize(a,sym923)
##knotplot2(a,node=TRUE,circ=FALSE)

##knotplot2(a,lwd=1,text=TRUE,circ=FALSE)


ou923 <- matrix(  # alternating
    c(
        07,02,
        03,18,
        20,05,
        23,08,
        09,14,
        26,11,
        13,28,
        29,24,
        17,22
    ) , byrow=TRUE,ncol=2)

##knotplot(a,ou923)

jj <- knotoptim(filename,
                symobj=sym923,
                ou   = ou923,
                prob=0,
                iterlim=100,print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


