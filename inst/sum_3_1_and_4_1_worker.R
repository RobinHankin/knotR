library(knotR) 
filename <- "sum_3_1_and_4_1.svg"
a <- reader(filename)

sym34 <- symmetry_object(a, xver=18)
a <- symmetrize(a,sym34)

ou34 <- matrix(c(
    01,07,
    06,02,
    10,03,
    05,09,
    15,11,
    12,17,
    18,14
),ncol=2,byrow=TRUE)

knotplot(a,ou34)


jj <- knotoptim(filename,
                symobj = sym34,
                ou   = ou34,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

