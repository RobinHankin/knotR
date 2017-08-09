## This shows how to impose reflectional symmetry on
## k7_1, the seven-sided starry knot.

filename <- "7_1.svg"
a <- reader(filename)

Mver <- matrix(c(
    09,10,
    19,21,
    18,01,
    08,11,
    07,12,
    06,13,
    17,02,
    05,14,
    16,03,
    15,04
    ),ncol=2,byrow=TRUE)

Mrot <-
    rbind(
        c(09,21,12,03,15,06,18),
        c(10,01,13,04,16,07,19),
        c(20,11,02,14,05,17,08)
        )

sym71 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = 20,
        Mrot = Mrot,
        )


ou71  <-
    matrix(c(
        12,2,
        3,14,
        5,15,
        17,6,
        8,18,
        20,9,
        11,21
        ),byrow=TRUE,ncol=2)



jj <- knotoptim(filename,
                symobj = sym71,
                ou   = ou71,
                prob=0.01,
                iterlim=100,print.level=2
                )


write_svg(jj,filename)
stop() 






## Function symmetrize_LR() creates a symmetrized knot:
k71 <- symmetrize(as.minobj(a), sym71)

knotplot(k71,T,T,T,T,T,circ=500)  #OK, it looks terrible
grid()

mii <- make_minsymvec_from_minobj(k71,sym71)
pii <- make_minobj_from_minsymvec(mii,sym71)


ou71  <-
    matrix(c(
        12,2,
        3,14,
        5,15,
        17,6,
        8,18,
        20,9,
        11,21
        ),byrow=TRUE,ncol=2)

knotplot2(k71, ou71,gap=10)

# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m, sym71),prob=0.1)
}

o <- nlm(objective_function,mii,iterlim=100,print.level=2)
knotplot(make_minobj_from_minsymvec(o$estimate,sym71),T,T,T,T,circ=1900)
stop("intentional")


# create the knot object:
trefoil_symmetric_opt <- make_minobj_from_minsymvec(o$estimate,sym_fig8)


##  A couple of plots:
knotplot(trefoil_symmetric_opt,T,T,T,T,circ=1900)
knotplot2(trefoil_symmetric_opt,ou_3_1)




## Now write a new inkscape file using write_svg():
write_svg(trefoil_symmetric_opt,
          oldfile = "~/packages/rhankin/packages/trunk/knot/inst/3_1_not_symmetric.svg",
          newfile = "~/packages/rhankin/packages/trunk/knot/inst/3_1_yes_symmetric.svg"
          )

