library(knotR)
filename <- "fiveloops.svg"
a <- reader(filename)

Mrot <- matrix(c(
    16,20,04,08,12,
    17,01,05,09,13,
    15,19,03,07,11,
    06,10,14,18,02
    ),byrow=TRUE,ncol=5)

Mver <- matrix(c(
    17,15,
    11,01,
    12,20,
    13,19,
    14,18,
    10,02,
    07,05,
    08,04,
    09,03
),ncol=2,byrow=TRUE)

symfive <-
    symmetry_object(
        x    = a,
        Mver = Mver,
       Mrot = Mrot,
        xver = c(6,16),
        mcdonalds=FALSE
        )

as <- symmetrize(a,symfive)

#knotplot2(as,node=T,seg=T,width=F)
#knotplot2(as,node=F,lwd=1,width=F,text=T)

oufive  <-
    matrix(c(
        19,02,
        03,06,
        07,10,
        11,14,
        15,18
        ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj = symfive,
                ou   = oufive,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

