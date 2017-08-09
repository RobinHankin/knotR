library(knotR)
filename <- "7_3.svg"
a <- reader(filename)

#knotplot2(a,node=TRUE)

Mver  <- matrix(c(
      22,20,
      09,07,
      10,06,
      11,05,
      23,19,
      12,04,
      24,18,
      03,13,
      02,14,
      25,17,
      15,01,
      26,16
    ),byrow=TRUE,ncol=2)

sym73 <- symmetry_object(a, Mver=Mver, xver=c(8,21))
a <- symmetrize(a,sym73)
#knotplot2(a)
#knotplot2(a,text=TRUE,lwd=1,circ=FALSE,rainbow=TRUE)

ou73 <-
    matrix(c(
    08,20,
    19,05,
    01,16,
    15,02,
    04,13,
    12,24,
    23,09
        ),byrow=TRUE,ncol=2)

#knotplot(a,ou73)


jj <- knotoptim(filename,
                symobj = sym73,
                ou   = ou73,
                prob=0,
                iterlim=1000,print.level=2
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

stop() 





## Function symmetrize_LR() creates a symmetrized knot:
k7_3_symmetrized <- symmetrize(as.minobj(k7_3), sym_7_3)

knotplot(k7_3_symmetrized,T,T,T,T,T,circ=500)  #OK, it looks terrible


mii <- make_minsymvec_from_minobj(k7_3_symmetrized,sym_7_3)
pii <- make_minobj_from_minsymvec(mii,sym_7_3)





knotplot2(k7_3_symmetrized, ou_7_3)

# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m, sym_7_3),prob=0.1)
}

o <- nlm(objective_function,mii,iterlim=200,print.level=2)


opt_7_3 <-  make_minobj_from_minsymvec(o$estimate,sym_7_3)
knotplot(opt_7_3,T,T,T,T,circ=1900)



