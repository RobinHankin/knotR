library(knotR) 
filename <- "ornamental20.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


jj  <-
  matrix(c(
      15:25,
      37:47,
      04:14,
      26:36,
      48:55,1:3
      ),nrow=5,byrow=TRUE)


sym20 <- symmetry_object(a, xver=4, Mrot=t(jj))
a <- symmetrize(a,sym20)
#knotplot2(a)
#knotplot2(a,lwd=1,circ=F,text=T,rainbow=T)



ou20 <- matrix(c(
    1,50,  #1
    31,2,  #2
    3,33,  #3 
    27,4,  #4  
     5,37, #5
    12,6, #6
    9,35, #7
    36,11, #8
    42,13, #9
    14,44, #10 
    38,15, #11
    16,48, #12
    23,17, #13
    20,46, #14
    47,22, #15
    53,24, #16
    25,55,  #17
    34,28,  #18
    45,39,  # 19
    49,26  #20
    
),ncol=2,byrow=TRUE)

#knotplot(a,ou20)


# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = sym20,
                ou   = ou20,
                prob=0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=10000), # these arguments for optim()
#                useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
