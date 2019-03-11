## For a complicted knot like this, the general idea is to specify the
## rotational symmetry first, for every node (here, rothex).  Then the
## mirror symmetry; here I specify the horizontal symmetry (hexMver)
## but see how only three nodes (18-16; 24-10; 11-23) are needed as
## the remaining horizontal and vertical mirror symmetry is a product
## of the sixfold rotational symmetry imposed by rothex.  We also need
## to enforce a single node (17) to be on the vertical axis---see how
## the first row of rothex then forces node 44 to be on the vertical
## axis as well; there is no need to have 17,44 as a row in hexMver.




library(knotR)
filename <- "hexknot3.svg"
a <- reader(filename)
jj <- c(-1,1)*350
#plot(jj,jj,asp=1)
#knotplot2(a,node=TRUE,add=TRUE)

rothex <- matrix(c(
    19,09,59,49,39,29,
    20,10,60,50,40,30,
    18,08,58,48,38,28,
    11,01,51,41,31,21,
    12,02,52,42,32,22,
    27,17,07,57,47,37,
    12,02,52,42,32,22,
    26,16,06,56,46,36,
    13,03,53,43,33,23,
    25,15,05,55,45,35,
    04,54,44,34,24,14
),byrow=TRUE,ncol=6)

hexMver <- matrix(c(

    20,18,
    27,11,
    12,26,
    13,25,
    24,14,
    12,26,
    21,17
    ),byrow=T,ncol=2)

#knotplot2(a,node=T)

symhex <- symmetry_object(a, Mrot=rothex,Mver=hexMver,
                          Mhor=NULL,
                          xver=c(19),xhor=c(4,34),
                          celtic=TRUE)

a <- symmetrize(a,symhex)
#knotplot2(a,node=T,circ=FALSE,add=TRUE,lwd=1,seg=F)


if(FALSE){
  abline(0,tan(pi/3),col='gray',lty=3)
  abline(0,-tan(pi/3),col='gray',lty=3)
  abline(0,tan(pi/6),col='gray',lty=3)
  abline(0,-tan(pi/6),col='gray',lty=3)
  abline(h=0,v=0,col='gray',lty=3)
}


#knotplot2(a,text=TRUE,node=FALSE,lwd=0.1,circ=F,add=TRUE)

ouhex <- matrix(c(

    08,01,   # 1
    15,04,  # 2
    02,17,  # 3
    18,11, # 4
    25,14, # 5
    12,27, # 6
    28,21, # 7
    35,24, # 8
    22,37, # 9    


    38, 31,
    45, 34,
    32, 47,
    48, 41,
    52, 07,
    05, 54,
    55, 44,
    42, 57,
    58, 51
    
),ncol=2,byrow=TRUE)

#knotplot(a,ouhex,gap=2)




jj <- knotoptim(filename,
                symobj = symhex,
                ou     = ouhex,
                prob   = 0,
#                iterlim=100, print.level=2
                control=list(trace=100,maxit=10000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
