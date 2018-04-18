library(knotR) 
filename <- "trefoil_of_trefoils.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mrot <- matrix(c(
    04,24,14,
    30,20,10,
    03,23,13,
    01,21,11,
    29,19,09,
    05,25,15,
    02,22,12,
    28,18,08,
    06,26,16,
    17,07,27
),ncol=3,byrow=TRUE)

Mver <- matrix(c(
    04,30,
    03,01,
    29,05,
    28,06
),ncol=2,byrow=TRUE)

symtt <- symmetry_object(a, xver=c(2,17), Mrot=Mrot,Mver=Mver)
a <- symmetrize(a,symtt)

#knotplot2(a,text=T,width=F,lwd=1,rain=T)
#stop()

outt <- matrix(c(
    02,06,
    29,03,
    05,30,
    07,18,
    27,08,
    09,13,
    15,10,
    12,16,
    17,28,
    19,23,
    25,20,
    22,26
),ncol=2,byrow=TRUE)


knotplot(a,outt)


# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = symtt,
                ou   = outt,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

