library(knotR)
filename <- "satellite.svg"
a <- reader(filename)
#knotplot2(a,lwd=1,text=T,width=F,rainbow=T,seg=T)

ousat <- 
    matrix(c(
        02,23,
        02,40,
        39,04,
        24,05,
        31,06,
        07,30,
        24,08,
        38,09,
        12,41,
        12,22,
        32,15,
        29,15,
        16,27,
        17,35,
        46,26,
        29,47,
        32,48,
        45,36
        ),byrow=TRUE,ncol=2)
symsat <- symmetry_object(x=a, xver=19)


jj <- knotoptim(filename,
                symobj = symsat,
                ou   = ousat,
                prob = 0,
#           iterlim=1000,print.level=2,         # these arguments for nlm()
                control=list(trace=9000,maxit=10000), # these arguments for optim()
                useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


