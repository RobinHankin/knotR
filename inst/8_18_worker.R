library(knotR)


filename <- "8_18.svg"
a <- reader(filename)
Mrot818 <-
    matrix(c(
        17,23,05,11,
        16,22,04,10,
        18,24,06,12,
        01,07,13,19,
        09,15,21,03,
        02,08,14,20
    ),ncol=4,byrow=TRUE)


Mver818 <- matrix(c(
    18,16,
    09,01,
    02,08
    ),byrow=TRUE,ncol=2)
                  
sym818 <-
    symmetry_object(a,Mrot=Mrot818,Mver=Mver818,xver=c(5,17),xhor=c(11,23))
a <- symmetrize(a,sym818)

ou818 <-
    matrix(
        c(
            16,01,
            02,09,
            20,03,
            04,13,
            22,07,
            08,15,
            10,19,
            14,21
 ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj = sym818,
                ou   = ou818,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

