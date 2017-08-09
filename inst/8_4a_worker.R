library(knotR)
filename <- "8_4_alternative.svg"
a <- reader(filename)

Mver <- matrix(c(
    15,12,
    16,11,
    26,01,
    25,02,
    24,03,
    14,13,
    17,10,
    23,04,
    09,18,
    08,19,
    22,05,
    07,20,
    06,21
),ncol=2,byrow=TRUE)

sym84 <- symmetry_object(a,Mver=Mver,xver=27)
a <-symmetrize(a,sym84)
#knotplot2(symmetrize(a,sym84),node=FALSE,text=T,lwd=0.1,circ=F)

ou84 <- matrix(c(
    13,02,
    03,11,
    19,05,
    06,22,
    23,09,
    17,25,
    26,15,
    10,18
),ncol=2,byrow=TRUE)

#knotplot(a,ou84)

jj <-
  knotoptim(filename,
            symobj = sym84,
            ou     = ou84,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

