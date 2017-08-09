library(knotR)
filename <- "8_19_alternative.svg"
a <- reader(filename)
Mver <- matrix(c(
    08,14,
    09,13,
    15,07,
    03,19,
    02,20,
    10,12,
    06,16,
    05,17,
    04,18
    ),ncol=2,byrow=TRUE)


## NB Not alternating!
ou819a <- matrix(c(  
    1,17,
    2,6,
    10,3,
    5,11,
    7,16,
    15,8,
    18,12,
    13,20
                   ),ncol=2,byrow=TRUE)

sym819a <- symmetry_object(a,Mver=Mver,xver=c(1,11))

jj <-
  knotoptim(filename,
            symobj = sym819a,
            ou   = ou819a,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

