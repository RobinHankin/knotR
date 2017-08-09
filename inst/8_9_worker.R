library(knotR)
filename <- "8_9.svg"
a <- reader(filename)

sym89 <- symmetry_object(a,xver=7)

a <- symmetrize(a,sym89)
#knotplot2(a,node=T,circ=333)
#knotplot2(a,node=FALSE,lwd=1,text=TRUE,circ=FALSE,rainbow=TRUE)



ou89 <- matrix(c(
    17,06,
    05,15,
    14,03,
    02,18,
    09,01,
    23,11,
    10,21,
    19,09
),ncol=2,byrow=TRUE)

#knotplot(a,ou89)

jj <-
  knotoptim(filename,
            symobj = sym89,
            ou     = ou89,
            prob   = 0,
                iterlim=1000, print.level=2)
#                control=list(trace=2,maxit=10000), # these arguments for optim()
#                useNLM=FALSE
)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

