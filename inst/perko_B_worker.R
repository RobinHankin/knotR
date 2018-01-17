library(knotR)
filename <- "perko_B.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

sym_perko_B <- symmetry_object(a, xver=28 )
a <- symmetrize(a,sym_perko_B)
#knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rainbow=TRUE)


ou_perko_B <- matrix(c(
    14,28,	
    27,11,
    06,25,
    24,17,
    08,23,
    22,09,
    02,21,
    18,04,
    16,07,
    10,15
), byrow=TRUE,ncol=2)

#knotplot(a,ou_perko_B)



jj <- knotoptim(filename,
                symobj = sym_perko_B,
                ou   = ou_perko_B,
                prob = 0,
#                iterlim=1000, print.level=2
                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
