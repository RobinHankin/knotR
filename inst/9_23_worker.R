library(knotR)

filename <- "9_23.svg"
a <- reader(filename)


Mver923 <- 
    matrix(
        c(
            26,01,
            09,18,
            10,17,
            11,16,
            25,02,
            08,19,
            07,20,
            24,03,
            06,21,
            12,15,
            04,23,
            05,22,
            13,14
        ), byrow=TRUE,ncol=2)

sym923 <-
    symmetry_object(a,Mver=Mver923,celtic=FALSE,xver=27)
a <- symmetrize(a,sym923)


ou923 <- matrix(  # alternating
    c(
        02,18,
        20,03,
        04,24,
        13,05,
        07,12,
        25,08,
        10,26,
        23,15,
        16,21
    ) , byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj=sym923,
                ou   = ou923,
                prob=0,
                iterlim=1000,print.level=2
#                control=list(trace=100,maxit=1000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


