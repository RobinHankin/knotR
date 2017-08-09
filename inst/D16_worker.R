library(knotR) 
filename <- "D16.svg"
a <- knotR::reader(filename)

Mrot <- matrix(c(
    40,15,30,05,20,35,10,25,
    26,01,16,31,06,21,36,11,
    13,28,03,18,33,08,23,38,
    14,29,04,19,34,09,24,39,
    27,02,17,32,07,22,37,12
),byrow=TRUE,ncol=8)

Mver <- matrix(c(
    26,14,
    39,01,
    13,27,
    12,28
    ),ncol=2,byrow=TRUE)

#knotplot2(a,node=T)

sym16 <- symmetry_object(a, xver=40, Mrot=Mrot, Mver=Mver)
a <- symmetrize(a,sym16)
knotplot2(a,node=F,width=F,text=T,lwd=1,rain=T,seg=T)
ou16 <- matrix(c(
    01,15,
    29,02,
    04,17,
    31,05,
    06,20,
    34,07,
    09,22,
    10,36,
    25,11,
    12,39,
    14,27,
    16,30,
    19,32,
    21,35,
    24,37,
    26,40
),ncol=2,byrow=TRUE)

# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = sym16,
                ou   = ou16,
                prob=0,
#               iterlim=100, print.level=2
               control=list(trace=100,maxit=20000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
