library(knotR)
filename <- "ochiai.svg"
ou   <-
    matrix(c(
        07,01,
        01,20,
        02,09,
        22,03,
        16,04,
        05,18,
        25,06,
        08,21,
        10,14,
        19,11,
        13,20,
        15,23,
        24,19
    ),ncol=2,byrow=TRUE)

jj <- knotoptim(filename,
                xver = 6,
                ou = ou,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


