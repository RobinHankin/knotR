library(knotR)

filename <- "3_1_not_symmetric.svg"
a <- reader(filename)
knotplot2(a,seg=T,text=T,lwd=1,node=T)


         
Mver <- matrix(c(
    08,10,
    07,11,
    02,04,
    01,05,
    12,06
    ),ncol=2,byrow=TRUE)

Mrot <- matrix(c(
    09,05,01,
    10,06,02,
    08,04,12
    ),byrow=TRUE,ncol=3)

ou31 <- matrix(c(
    03,08,
    11,04,
    07,12
    ),byrow=TRUE,ncol=2)



sym31 <- symmetry_object(a, Mver=Mver,xver=c(9,3),Mrot=Mrot)   

knotplot2(symmetrize(a,sym31),seg=T,node=T)

jj <- knotoptim(filename,
                symobj = sym31,
                ou   = ou31,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))


stop() 




## Function symmetrize_LR() creates a symmetrized knot:
k77 <- symmetrize(as.minobj(a), sym77)

knotplot(k77,T,T,T,T,T,circ=500)  #OK, it looks terrible

mii <- make_minsymvec_from_minobj(k77,sym77)
pii <- make_minobj_from_minsymvec(mii,sym77)




knotplot2(k77,ou77)


# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m, sym77))
}

o <- nlm(objective_function,mii,iterlim=30,print.level=2)

opt77 <-  make_minobj_from_minsymvec(o$estimate,sym77)
knotplot(opt77,T,T,T,T,circ=1900)



