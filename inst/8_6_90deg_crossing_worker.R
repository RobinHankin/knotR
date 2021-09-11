library(knotR)
filename <- "8_6_90deg_crossing.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


Mver <- matrix(c(
     22,23,
     21,1,
     12,10,
     13,9,
     2,20,
     19,3,
     4,18,
     5,17,
     14,8,
     6,16,
     7,15
),ncol=2,byrow=TRUE)

sym86 <- symmetry_object(a,Mver=Mver,xver=11)
a <- symmetrize(a,sym86)
#knotplot2(a,lwd=1,text=TRUE,rainbow=TRUE,circ=FALSE)

ou86 <- matrix(c(
     11,1,
     18,9,
     8,15,
     14,5,
     22,12,
     4,19,
     20,3,
     2,21

     
),ncol=2,byrow=TRUE)
#knotplot(a,ou86)
w <- c(pot = 1,
      ang = 100,
      ben = 1,
      len = 1,
      mid = 1,
      clo = 1,
      swi = 1,
      con = 1,
      ncn = 1
      )

jj <-
  knotoptim(filename,weights=w,
            symobj = sym86,
            ou   = ou86,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#            control=list(trace=100,maxit=2000), # these arguments for optim()
#            useNLM=FALSE
)

write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

