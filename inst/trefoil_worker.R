jj <-
  knotoptim("~/packages/rhankin/packages/trunk/knot/inst/3_1_not_symmetric.svg",
            Mver = rbind(c(6,7),c(1,3),c(5,8),c(9,4)),
            xver = 2,
            Mrot = rbind(c(6,3,9),c(7,4,1),c(2,8,5)),
            ou   = matrix(c(2,6, 8,3, 5,9),ncol=2,byrow=TRUE),
            prob=0.1, give=TRUE,
            
            iterlim=300,print.level=2,hessian=TRUE)
            


stop()
## This shows how to impose threefold rotational symmetry on  3_1.svg (aka the "trefoil knot")

## First read the inkscape file:
a <- reader(system.file("3_1_not_symmetric.svg",package="knot"))
knotplot(a)

## Now create a symmetry object (look at the knotplot(a) to see the
## nodes that are rotationally related, and also the nodes that are on
## the centreline)

jjM <- rbind(c(6,7),c(1,3),c(5,8),c(9,4))  # vertical symmetry
jjv <- 2  # node on centerline
jjMrot <- rbind(c(6,3,9),c(7,4,1),c(2,8,5))

sym_3_1 <- symmetry_object(a, Mver=jjM, xver=jjv, Mrot=jjMrot)   # order of the rotational symmetry defined by ncol(Mrot)


## Function symmetrize_LR() creates a symmetrized knot:
k3_1_symmetrized <- symmetrize(as.minobj(a), sym_3_1)


knotplot(k3_1_symmetrized,T,T,T,T,T,circ=200)  #OK, OK, it looks terrible


mii <- make_minsymvec_from_minobj(k3_1_symmetrized,sym_3_1)
pii <- make_minobj_from_minsymvec(mii,sym_3_1)

# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m,sym_3_1),prob=0.1)
}

o <- nlm(objective_function,mii,iterlim=100,print.level=2,stepmax=100)

knotplot(make_minobj_from_minsymvec(o$estimate,sym_3_1),T,T,T,T,circ=1900)


ou_3_1 <- matrix(c(2,6, 8,3, 5,9),ncol=2,byrow=TRUE)


# create the knot object:
trefoil_symmetric_opt <- make_minobj_from_minsymvec(o$estimate,sym_3_1)


##  A couple of plots:
knotplot(trefoil_symmetric_opt,T,T,T,T,circ=1900)
knotplot2(trefoil_symmetric_opt,ou_3_1)

## Now write a new inkscape file using write_svg():
write_svg(trefoil_symmetric_opt,
          oldfile = "~/packages/rhankin/packages/trunk/knot/inst/3_1_not_symmetric.svg",
          newfile = "~/packages/rhankin/packages/trunk/knot/inst/3_1_yes_symmetric.svg"
          )

