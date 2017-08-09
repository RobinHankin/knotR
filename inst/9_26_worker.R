library(knotR)

filename <- "9_26.svg"
a <- reader(filename)

sym926 <- symmetry_object(a,celtic=FALSE,xver=27)
a <- symmetrize(a,sym926)

ou926 <- matrix(  # alternating
    c(
        02,18,
        20,04,
        06,21,
        17,07,
        08,26,
        15,10,
        11,24,
        23,13,
        25,16
    ), byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj=sym926,
                ou   = ou926,
                prob=0,
                iterlim=1000,print.level=2
                )

write_svg(jj,filename,safe=FALSE)
save(jj,file=sub('.svg','.S',filename))


