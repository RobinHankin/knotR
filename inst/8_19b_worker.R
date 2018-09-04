library(knotR)

filename <- "8_19b.svg"
a <- reader(filename)
Mrot819 <-
    matrix(c(
        17,23,05,11,
        16,22,04,10,
        18,24,06,12,
        01,07,13,19,
        09,15,21,03,
        02,08,14,20
    ),ncol=4,byrow=TRUE)


Mver819 <- matrix(c(
    18,16,
    09,01,
    02,08
    ),byrow=TRUE,ncol=2)
                  
sym819 <-
    symmetry_object(a,Mrot=Mrot819,Mver=Mver819,xver=c(5,17),xhor=c(11,23))
a <- symmetrize(a,sym819)

ou819 <-
    matrix(
        c(
            16,01,
            09,02,
            03,20,
            04,13,
            22,07,
            15,08,
            10,19,
            21,14
 ),byrow=TRUE,ncol=2)

#knotplot2(a,lwd=1,text=TRUE,circ=0)
#knotplot(a,ou=ou819,lwd=16,gap=2)

jj <- knotoptim(filename,
                symobj = sym819,
                ou   = ou819,
                prob = 0,
                iterlim=10, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

