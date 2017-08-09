library(knotR)
filename <- "9_3.svg"
a <- reader(filename)


Mver <- matrix(c(
    10,25,
    24,11,
    12,23,
    9,1,
    22,13,
    21,14,
    8,2,
    20,15,
    19,16,
    7,3,
    6,4,
    18,17
),ncol=2,byrow=TRUE)


sym93 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = 5
    )



ou93  <-
    matrix(c(
        2,14,
        16,3,
        5,17,
        19,6,
        8,20,
        22,9,
        11,25,
        24,12,
        13,23
        ),byrow=TRUE,ncol=2)

#as <- symmetrize(a,sym93)
#knotplot2(as,text=T,lwd=0,circ=F)
#knotplot(as,ou93)
#stop()

jj <- knotoptim(filename,
                symobj = sym93,
                ou   = ou93,
                prob=0,
                iterlim=9000,print.level=2
                # control=list(trace=100,maxit=1000), # these arguments for optim()
                # useNLM=FALSE
                )


write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
