library(knotR)

filename <- "celtic3.svg"
a <- reader(filename)



Mverc3 <- matrix(c(  
35,1,
5,31,
4,32,
3,33,
2,34,
6,30,
29,7,
26,10,
27,9,
28,8,
25,11,
15,21,
14,22,
13,23,
12,24,
16,20,
19,17
), byrow=TRUE,ncol=2)


Mhorc3 <- matrix(c(
36,18,
26,28,
4,14,
5,13,
3,15,
35,19,
2,16,
6,12,
29,25,
1,17,
34,20,
30,24,
7,11,
31,23,
33,21,
32,22,
10,8
),byrow=TRUE,ncol=2)

#knotplot2(a,text=T,lwd=1,rain=T,circ=F)
#knotplot2(a,circ=F,text=T,lwd=1)

ouc3 <- matrix(c(
2,35,
6,3,
30,7,
8,11,
12,25,
16,13,
20,17,
24,21,
26,29,
34,31

),ncol=2,byrow=TRUE)

symc3 <- symmetry_object(a,Mver=Mverc3,Mhor=Mhorc3,xver=c(18,36),celtic=T,xhor=c(9,27))
a <- symmetrize(a,symc3)
#knotplot2(a,node=T)
#knotplot2(symmetrize(a,symc3))
#knotplot(a,ouc3,gap=10)

jj <- knotoptim(filename,
                symobj=symc3,
                ou   = ouc3,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

