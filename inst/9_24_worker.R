library(knotR)
filename <- "9_24.svg"

a <- reader(filename)
#knotplot2(a,node=TRUE)

sym924 <-
    symmetry_object(
        x    = a,
        xver = 30,
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym924)
#knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)

ou924  <-
    matrix(c(
    05,29,
    28,11,
    09,27,
    26,19,
    17,25,
    24,15,
    02,21,
    20,04,
    12,08
),byrow=TRUE,ncol=2)


#knotplot(a,ou924)

jj <- knotoptim(filename,
                symobj  = sym924,
                ou      = ou924,
                prob    = 0,
                iterlim= 1000, print.level=2
#               control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
