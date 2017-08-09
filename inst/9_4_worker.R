library(knotR)
filename <- "9_4.svg"
a <- reader(filename)


Mver <- matrix(c(
    12,24,
    01,13,
    14,02,
    11,23,
    03,15,
    16,04,
    17,05,
    10,22,
    18,06,
    19,07,
    09,21,
    08,20
),ncol=2,byrow=TRUE)


sym94 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        mcdonalds=TRUE
    )


a <- symmetrize(a,sym94)
ou94  <-
    matrix(c(
        13,01,
        02,14,
        15,03,
        04,16,
        23,05,
        07,22,
        20,08,
        10,19,
        17,11
    ),byrow=TRUE,ncol=2)


#as <- symmetrize(a,sym94)
#knotplot2(as,text=T,lwd=0,circ=F)
#knotplot(as,ou94)
#stop()

jj <- knotoptim(filename,
                symobj = sym94,
                ou   = ou94,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

