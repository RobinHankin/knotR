library(knotR)
filename <- "9_2.svg"
a <- reader(filename)


Mver <- matrix(c(
    13,26,
    25,12,
    14,01,
    10,23,
    11,24,
    09,22,
    15,02,
    16,03,
    08,21,
    17,04,
    18,05,
    07,20,
    06,19
),ncol=2,byrow=TRUE)


sym92 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = NULL,
        mcdonalds=TRUE
        )


as <- symmetrize(a,sym92)


ou92  <-
    matrix(c(
        02,24,
        22,03,
        05,21,
        19,06,
        08,18,
        16,09,
        11,15,
        25,12,
        13,26
        ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj = sym92,
                ou   = ou92,
                prob=0,
                iterlim=1000,print.level=2
                )


write_svg(jj,filename)
stop() 
