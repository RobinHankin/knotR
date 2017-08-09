library(knotR)
filename <- "unknot.svg"
jj <- knotoptim(filename,
                Mver = matrix(c(2,4,1,5), byrow=TRUE,ncol=2),
                xver = 3,
                Mrot = cbind(3,4,5,1,2),
                ou   = NULL,
                prob=0,
                iterlim=100,print.level=2
                )


write_svg(jj,filename)
stop() 
