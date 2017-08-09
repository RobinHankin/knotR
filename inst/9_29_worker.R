library(knotR)


filename <- "9_29.svg"
a <- reader(filename)

Mrot929 <- 
    matrix(c(
        01,18,
        25,20,
        08,11,
        07,12,
        16,03,
        15,04,
        14,05,
        09,10,
        22,23,
        21,24,
        26,19,
        17,02,
        06,13
    ),ncol=2,byrow=TRUE)
                  
sym929 <-
    symmetry_object(a,Mrot=Mrot929,Mver=NULL, xver=26,center_crossing=TRUE)
a <- symmetrize(a,sym929)
#knotplot2(a,node=T,circ=33,seg=FALSE)
#knotplot2(a,node=F,circ=0,lwd=1,text=T)

ou929 <-
    matrix(
        c(
            02,21,
            13,03,
            04,11,
            24,06,
            07,17,
            16,09,
            10,23,
            22,14,
            18,25
            
 ),byrow=TRUE,ncol=2)
#knotplot(a,ou929)


jj <- knotoptim(filename,
                symobj = sym929,
                ou   = ou929,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

