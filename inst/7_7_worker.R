library(knotR)

filename <- "7_7.svg"
a <- reader(filename)

Mver <- matrix(c(
    06,11,
    07,10,
    16,01,
    05,12,
    08,09,
    04,13,
    15,02,
    14,03
    ),ncol=2,byrow=TRUE)


ou77 <- matrix(c(
    01,12,
    10,02,
    04,14,
    09,05,
    13,09,
    06,17,
    16,08
    ),byrow=TRUE,ncol=2)

sym77 <- symmetry_object(a, Mver=Mver,xver=17)   

jj <- knotoptim(filename,
                symobj = sym77,
                ou   = ou77,
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



