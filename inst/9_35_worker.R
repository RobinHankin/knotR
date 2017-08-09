library(knotR)

filename <- "9_35.svg"
a <- reader(filename)

ou935 <- matrix(c(  # alternating  
    01,16,
    14,02,
    04,13,
    11,20,
    22,10,
    08,23,
    17,07,
    06,18,
    19,05
), byrow=TRUE,ncol=2)

Mver935 <- matrix(c(
    23,24,
    08,15,
    09,14,
    22,01,
    07,16,
    17,06
), byrow=TRUE,ncol=2)

Mhor935 <- matrix(c(
    23,11,
    07,19,
    17,05,
    08,20,
    22,10,
    09,21,
    24,12,
    16,04,
    06,18,
    15,03,
    01,13,
    14,02
), byrow=TRUE,ncol=2)

sym935 <- symmetry_object(a,Mver=Mver935,Mhor=Mhor935)



jj <- knotoptim(filename,
                symobj=sym935,
                ou   = ou935,
                prob=0,
                iterlim=10000, print.level=2
#                control=list(trace=100,maxit=1000), #these arguments for optim()
#               useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
