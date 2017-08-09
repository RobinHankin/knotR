## This shows how to symmetrize 4_1.svg (aka the "figure of eight knot")

## First read the inkscape file:
a <- reader("~/packages/rhankin/packages/trunk/knot/inst/4_1_not_symmetric.svg")

knotplot(a)
## Now create a symmetry object (look at the knotplot(a) to see the
## nodes that are mirror images, and the nodes that are on the
## centreline)

jjM <-
  matrix(c(
      1,3,
      7,5,
      4,8
  ),byrow=TRUE,ncol=2)

jjv <- c(2,6)


sym_4_1 <- symmetry_object(a, M=jjM, v=jjv)

## Function symmetrize_LR() creates a symmetrized knot:
k4_1_symmetrized <- symmetrize_LR(as.minobj(a), sym_4_1)


knotplot(k4_1_symmetrized)  #OK, OK, it looks terrible

mii <- make_minsymvec_from_minobj(k4_1_symmetrized,sym_4_1)

# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m,sym_4_1))
}

o <- nlm(objective_function,mii,iterlim=7,print.level=2)


## OK, the nlm() optimization above works, and returns a nicely optimized knot, after about 200 iterations.

## following line overwrites o$estimate with "one I made earlier":

o$estimate <-
c(-282.644533578784, 185.947356969593, 229.547253138081, 11.5964447756388, 
104.750560354452, 467.63782, 68.8193140434279, -835.952760393696, 
327.63782, -516.091428691126, 97.4178402741775, 415.712781279902, 
84.1214810420745, 399.808094476753, -43.1012874450844, -344.154370716368, 
147.64299276457, -336.152933363871)




## create  the symmetric optimized knot:
k4_1_symmetric_optimized <- make_minobj_from_minsymvec(o$estimate,sym_4_1)

## look at it:
knotplot(k4_1_symmetric_optimized)
# still sucks (it looks a little better after 30 iterations, honest)

## Further optimization:
oo <- nlm(objective_function,o$estimate,iterlim=3,print.level=2

          )

## Try knotplot2():
## Need an overunderobject:

overunder_4_1 <-
    matrix(
        c(
            1,4,
            7,2,
            3,6,
            5,8),
        ncol=2,byrow=TRUE
        )


knotplot2(k4_1_symmetric_optimized,overunder_4_1)
## Now write a new inkscape file using write_svg():
write_svg(k4_1_symmetric_optimized,
          oldfile = "~/packages/rhankin/packages/trunk/knot/inst/4_1_not_symmetric.svg",
          newfile = "~/packages/rhankin/packages/trunk/knot/inst/4_1_yes_symmetric.svg"
          )

