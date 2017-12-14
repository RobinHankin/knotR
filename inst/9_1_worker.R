## This shows how to impose reflectional symmetry on
## k9_1, the nine-sided starry knot.
library(knotR)
filename <- "9_1.svg"
a <- reader(filename)
            
Mver <- matrix(c(
    53,01,
    26,28
),ncol=2,byrow=TRUE)


Mrot <-
`[<-`(sweep(matrix(seq(from=1,by=30,len=54),byrow=TRUE,ncol=9),1,c(52:54,25:27),"+")%%54,2,1,54)

sym91 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = c(27,54),
        Mrot = Mrot,
        )

as <- symmetrize(a,sym91)


ou91  <-
    matrix(c(
        02,29,
        32,05,
        08,35,
        38,11,
        14,41,
        44,17,
        20,47,
        50,23,
        26,53
        ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj = sym91,
                ou   = ou91,
                prob=0,
                iterlim=1000,print.level=2
                )


write_svg(jj,filename,safe=FALSE)

