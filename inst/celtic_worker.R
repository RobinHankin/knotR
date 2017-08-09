library(knotR)
a <- reader("celtic.svg")
knotplot(a,ev=T)

Mver <- matrix(c(
    10,1,
    11,2,
    12,3,
    5,14,
    16,7,
    17,8,
    18,9,
    4,13,
    6,15,
    4,13
    ),ncol=2,byrow=TRUE)

Mhor <- matrix(c(
    10,18,
    11,17,
    12,16,
    6,4,
    15,13,
    1,9,
    2,8,
    3,7

 ),ncol=2,byrow=TRUE)
xhor <- c(5,14)
ou <- matrix(c(
    1,7,
    10,1,
    1,13,
    5,1,
    16,5,
    13,16,
    16,10,
    7,16,
    4,15,
    14,7,
    10,14,
    6,13,
    10,6,
    13,4,
    4,10,
    7,4,
    15,1
    ),ncol=2,byrow=TRUE)


s <- symmetry_object(a, Mver=Mver,Mhor=Mhor,xhor=xhor, celtic=TRUE, mcdonalds=TRUE)

a <- as.minobj(symmetrize(a,s))

mi <- make_minsymvec_from_minobj(a,s) 

knotplot(make_minobj_from_minsymvec(mi,s))  # fails


jj <- 
knotoptim("celtic.svg",
          Mver=Mver,Mhor=Mhor,xhor=xhor, ou=ou,
                    celtic=TRUE, mcdonalds=TRUE,
          print.level=2,
          prob=0.1)



