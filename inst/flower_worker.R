library(knotR)
filename <- "flower.svg"
a <- reader(filename)

Mrot <- matrix(c(
    29,01,08,15,22,
    28,35,07,14,21,
    20,27,34,06,13,
    02,09,16,23,30,
    31,03,10,17,24,
    26,33,05,12,19,
    25,32,04,11,18
    ),byrow=TRUE,ncol=5)

Mver <- matrix(c(
    29,28,
    20,02,
    30,27,
    31,26,
    19,03,
    25,32
),ncol=2,byrow=TRUE)

symflower <-
    symmetry_object(
        x    = a,
        Mver = Mver,
       Mrot = Mrot,
        xver = 11,
        mcdonalds=FALSE
        )

as <- symmetrize(a,symflower)

#knotplot2(as,node=T,seg=T,width=T)
knotplot2(as,node=F,lwd=1,width=F,text=T)

ouflower  <-
    matrix(c(
        05, 11,  #1
        07, 16,  #2
        17, 06,  #3
        12, 18,  #4
        14, 23,  #5
        24, 13,  #6
        19, 25,  #7
        03, 27,  #8
        28, 02,  #9
        21, 30,  #10
        31, 20,  #11
        26, 32,  #12
        33, 04,  #13
        10, 34,  #14
        35, 09   #15

        ),byrow=TRUE,ncol=2)

knotplot(as,ouflower,gap=10)

jj <- knotoptim(filename,
                symobj = symflower,
                weights = c(1,0.1,1,1,1,1,1,1,1),
                ou   = ouflower,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

