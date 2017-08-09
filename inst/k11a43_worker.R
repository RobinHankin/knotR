library(knotR)
filename <- "k11a43.svg"
a <- reader(filename)

Mver <- matrix(c(
    06,22,
    21,07,
    10,18,
    05,01,
    11,17,
    08,20,
    09,19,
    12,16,
    04,02,
    15,13
),ncol=2,byrow=TRUE)

sym43 <- symmetry_object(a,Mver=Mver,xver=c(3,14))

ou43 <- matrix(c(
    22,07,
    18,01,
    02,19,
    14,03,
    04,15,
    10,05,
    06,11,
    08,21,
    12,09,
    16,13,
    20,17
),ncol=2,byrow=TRUE)


jj <-
  knotoptim(filename,
            symobj = sym43,
            ou   = ou43,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE


)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

