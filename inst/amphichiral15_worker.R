library(knotR)
filename <- "amphichiral15.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    6,41,
    5,42,
    40,7,
    4,43,
    3,1
),ncol=2,byrow=TRUE)

symamp <- symmetry_object(a,Mver=Mver,xver=2)

a <- symmetrize(a,symamp)


# knotplot2(a,node=F,lwd=1)
#knotplot2(a,lwd=1,text=T,circ=F,rainbow=TRUE)

ouamp <- matrix(c(
     1,  13,
     8,   2,
     3,  40,
     4,  21,
    22,   5,    
    37,  21,
    19,  26,
    37,  28,
    20,  35,
    41,   7,
    33,  11,
    14,  43,
    27,  34,
    30,  39,
     9,  31
),ncol=2,byrow=TRUE)

#knotplot(a,ouamp,gap=15,lwd=10)


jj <-
  knotoptim(filename,
            symobj = symamp,
            ou   = ouamp,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE

)

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

