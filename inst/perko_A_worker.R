library(knotR)
filename <- "perko_A.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


Mver <- matrix(c(
    23,25,
    12,08,
    13,07,
    14,06,
    22,26,
    21,27,
    28,20,
    11,09,
    01,19,
    02,18,
    03,17,
    15,05,
    04,16
    ),byrow=TRUE, ncol=2)

ou_perko_A <-
  matrix(c(
    26,08,
    09,27,
    21,28,
    01,11,
    15,02,
    05,16,
    19,06,
    10,20,
    12,22,
    23,13
    ),byrow=TRUE, ncol=2)



sym_perko_A <- symmetry_object(a,
                               Mver=Mver,
                               xver=c(10,24)
                               )

a <- symmetrize(a,sym_perko_A)
#knotplot2(a,lwd=1,text=1,circ=F,rainbow=TRUE)
#knotplot(a,ou_perko_A)
#stop()




jj <- knotoptim(filename,
                symobj = sym_perko_A,
                ou   = ou_perko_A,
                prob = 0,
#                iterlim=1000, print.level=0
                control=list(trace=100,maxit=10000), # these arguments for optim()
                useNLM=FALSE

                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.R',filename))
