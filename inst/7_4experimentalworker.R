## This shows how to impose reflectional symmetry on
## k7_4
a <- reader("~/packages/rhankin/packages/trunk/knot/inst/7_4_experimental.svg")
knotplot(a,T,T,T,T,T)
## Now create a symmetry object (look at the knotplot(a) to see the
## nodes that are rotationally related, and also the nodes that are on
## the centreline)


Mver <- matrix(c( 4,10, 5,9, 13,1, 12,2, 6,8, 11,3 ),ncol=2,byrow=TRUE)
xver <-  c(7,14)   # nodes on centreline
Mhor <- matrix(c(05,12,04,11,13,06,14,07,01,08,10,03,09,02),ncol=2,byrow=TRUE)
ou  <-  matrix( c(1,11,9,2,4,8,11,4,4,14,13,6,7,11),byrow=TRUE,ncol=2)

jj <-
    knotoptim("~/packages/rhankin/packages/trunk/knot/inst/7_4_experimental.svg",
            Mver = Mver, xver = xver, Mhor=Mhor, ou=ou,
            iterlim=100,print.level=2,prob=0.4)
knotplot(jj,ever=T)
stop()






jjMhor <-
    matrix(c(
        05,12,
        04,11,
        13,06,
        14,07,
        01,08,
        10,03,
        09,02
        ),ncol=2,byrow=TRUE)

sym74 <- symmetry_object(a, Mver=jjMver, xver=jjv, Mhor=jjMhor)  
k74  <- symmetrize(as.minobj(a),sym74)
knotplot(k74,T,T,T,T,T,circ=500)  #OK, it looks terrible

## Function symmetrize_LR() creates a symmetrized knot:

mii <- make_minsymvec_from_minobj(k74,sym74)
pii <- make_minobj_from_minsymvec(mii,sym74)

ou74 <-
    matrix(
        c(
            1,11,
            9,2,
            4,8,
            11,4,
            4,14,
            13,6,
            7,11
        ),byrow=TRUE,ncol=2)


knotplot2(k74, ou74)

# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m, sym74))
}

o <- nlm(objective_function,mii,iterlim=100,print.level=2)

optknot74 <-  knot(make_minobj_from_minsymvec(o$estimate,sym74),ou74,sym74)
knotplot(optknot74,T,T,T,T,circ=1900)

stop()

optknot74 <- 
structure(list(minsymvec = structure(c(-75.546314030929, -475.06583696795, 
-465.844466363306, -20.6856618628832, 239.608437707992, 96.404394286175, 
25.0513723094883, -281.465469748823, -474.194552647129, -346.556021453004, 
254.747783104722, 84.7070522941651, 85.103708533547, 145.080368039035
), .Names = c("handle_A4", "handle_A5", "handle_A13", "handle_A14", 
"handle_A18", "handle_A19", "handle_A27", "node4", "node5", "node13", 
"node18", "node19", "node27", "node28"), class = "minsymvec"), 
    overunderobj = structure(c(1, 9, 4, 11, 4, 13, 7, 11, 2, 
    8, 4, 14, 6, 11), .Dim = c(7L, 2L)), symobj = structure(list(
        Mver = structure(c(4, 5, 13, 10, 9, 1), .Dim = c(3L, 
        2L)), xver = c(7, 14), Mhor = structure(c(5, 4, 13, 14, 
        1, 10, 9, 12, 11, 6, 7, 8, 3, 2), .Dim = c(7L, 2L)), 
        xhor = NULL, Mrot = NULL, mcdonalds = FALSE, indep = structure(c(FALSE, 
        FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, 
        FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, 
        TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
        FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, 
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, 
        FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, 
        FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE), .Names = c("handle_A1", 
        "handle_A2", "handle_A3", "handle_A4", "handle_A5", "handle_A6", 
        "handle_A7", "handle_A8", "handle_A9", "handle_A10", 
        "handle_A11", "handle_A12", "handle_A13", "handle_A14", 
        "handle_A15", "handle_A16", "handle_A17", "handle_A18", 
        "handle_A19", "handle_A20", "handle_A21", "handle_A22", 
        "handle_A23", "handle_A24", "handle_A25", "handle_A26", 
        "handle_A27", "handle_A28", "node1", "node2", "node3", 
        "node4", "node5", "node6", "node7", "node8", "node9", 
        "node10", "node11", "node12", "node13", "node14", "node15", 
        "node16", "node17", "node18", "node19", "node20", "node21", 
        "node22", "node23", "node24", "node25", "node26", "node27", 
        "node28"))), .Names = c("Mver", "xver", "Mhor", "xhor", 
    "Mrot", "mcdonalds", "indep"))), .Names = c("minsymvec", 
"overunderobj", "symobj"), class = "knot")

