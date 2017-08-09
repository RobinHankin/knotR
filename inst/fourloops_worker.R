library(knotR)
filename <- "fourloops.svg"
a <- reader(filename)


Mrot <- matrix(c(
    16,4,8,12,
    15,3,7,11,
    1,5,9,13,
    14,2,6,10
    ),byrow=TRUE,ncol=4)
    

    

Mver <- matrix(c(
    01,15,
    14,02
),ncol=2,byrow=TRUE)


symfour <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        Mrot = Mrot,
        xver = c(8,16),
        xhor = c(12,4),
        )

as <- symmetrize(a,symfour)

oufour  <-
    matrix(c(
        02,15,
        06,03,
        10,07,
        14,11
        ),byrow=TRUE,ncol=2)

knotplot(as,oufour,gap=10)

jj <- knotoptim(filename,
                symobj = symfour,
                ou   = oufour,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

