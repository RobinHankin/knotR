library(knotR)

filename <- "longthin.svg"
a <- reader(filename)

MverLT <- 
    matrix(
        c(
            11,09,
            22,24,
            21,25,
            20,26,
            01,19,
            18,02,
            03,17,
            16,04,
            05,15,
            14,06,
            07,13,
            12,08
        ), byrow=TRUE,ncol=2)

symLT <- symmetry_object(a,Mver=MverLT,celtic=FALSE,xver=c(10,23))
a <- symmetrize(a,symLT)

ouLT <- matrix(  # alternating
    c(
        01,20,
        19,02,
        03,18,
        17,04,
        05,16,
        15,06,
        07,14,
        13,08,
        09,24,
        23,12
    ) , byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj=symLT,
                ou   = ouLT,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

