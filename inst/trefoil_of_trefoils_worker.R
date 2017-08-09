library(knotR) 
filename <- "trefoil_of_trefoils.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mrot <- matrix(c(
    4,24,14,
    30,20,10,
    3,23,13,
    1,21,11,
    29,19,9,
    5,25,15,
    2,22,12,
    28,18,8,
    6,26,16,
    17,7,27
),ncol=3,byrow=TRUE)


Mver <- matrix(c(
    4,30,
    3,1,
    29,5,
    28,6
),ncol=2,byrow=TRUE)

symtt <- symmetry_object(a, xver=c(2,17), Mrot=Mrot,Mver=Mver)
a <- symmetrize(a,symtt)

#knotplot2(a,text=T,width=F,lwd=1,rain=T)
#stop()

outt <- matrix(c(
    2,6,
    29,3,
    5,30,
    7,18,
    27,8,
    9,13,
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

