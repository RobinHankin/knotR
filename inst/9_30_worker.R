library(knotR)
rm(list=ls())


filename <- "9_30.svg"
a <- reader(filename)
#knotplot2(a,node=T)

                  
sym930 <-
    symmetry_object(a,Mrot=NULL,Mver=NULL, xver=c(27,8),center_crossing=TRUE)
a <- symmetrize(a,sym930)

#knotplot2(a,node=T,circ=33,seg=TRUE)
#knotplot2(a,node=F,circ=0,lwd=1,text=T,rainbow=TRUE)

ou930 <-
    matrix(
        c(
            09,02,
            03,25,
            14,04,
            06,16,
            26,08,
            21,11,
            12,19,
            24,13,
            18,23
 ),byrow=TRUE,ncol=2)
#knotplot(a,ou930)

jj <- knotoptim(filename,
                symobj = sym930,
                ou   = ou930,
                prob=0,
                iterlim=1000,print.level=2
#                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
