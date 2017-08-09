library(knotR)
filename <- "perko_A.svg"
a <- reader(filename)

ou_perko_A <- matrix(c(
    08,01,
    11,02,
    03,12,
    13,04,
    18,05,
    06,19,
    07,14,
    16,09,
    10,17,
    15,20
    ),byrow=TRUE, ncol=2)
knotplot(a,ou_perko_A)
stop()


## jj <- reader(system.file("perko_B.svg",package="knot"))
jj <- reader("~/packages/rhankin/packages/trunk/knot/inst/perko_B.svg")
sym_perko_B <- symmetry_object(jj, xver=23 )
perko_B <-  symmetrize(as.minobj(jj),sym_perko_B)

knotplot(perko_B,circ=300)

mii <- make_minsymvec_from_minobj(as.minobj(perko_B), sym_perko_B)
pii <- make_minobj_from_minsymvec(mii,sym_perko_B)

knotplot(pii)

## now some optimization:

`fun` <- function(vec){   # objective function
  out <- badness(make_minobj_from_minsymvec(vec,sym_perko_B))
  return(out)
}

o <- nlm(fun,mii,iterlim=1,print.level=2)
knotplot(make_minobj_from_minsymvec(o$estimate,sym_perko_B))

## second round of optimization:
#o2 <- nlm(fun,o$estimate,iterlim=10,print.level=2)

perko_B_ou <- matrix(c(
    16,1,
    2,14,
    3,20,
    12,4,
    18,5,
    6,17,
    7,11,
    22,8,
    10,23,
    19,13),
    byrow=TRUE,ncol=2)


perkoB_opt <- knot(
    x=make_minobj_from_minsymvec(o$estimate,sym_perko_B),
    overunderobj = perko_B_ou,
    xver = 23)

save(perkoB_opt,file="~/optimized_perkoB")
