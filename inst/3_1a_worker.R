library(knotR)
filename <- "3_1_alternative.svg"
a <- reader(filename)

Mver  <- matrix(c(
    05,10,
    04,09,
    01,06,
    07,02,
    03,08
    ),byrow=TRUE,ncol=2)


ou31a <-
    matrix(c(
        01,06,
        07,02,
        03,08
        ),byrow=TRUE,ncol=2)

sym31a <- symmetry_object(a, Mver=Mver,mcdonalds=TRUE)

jj <- knotoptim(filename,
                symobj = sym31a,
                ou   = ou31a,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

