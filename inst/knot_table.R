# produces knottable.pdf.



# Compare allknotplotter.R, which plots  every knot in the package.


filename <- "knottable.pdf"

library(knotR)
library(magrittr)

affine <- function(M,offset,scale){
    cm <- colMeans(M)
    M %<>% sweep(2,cm-offset) %>% "*"(scale) %>% sweep(2,-cm)
    return(M)
}

scaled_knotplot <- function(knot,offset,scale=1,...){
    knotplot(
        x  = affine(as.inkscape(knot),offset=offset,scale=scale),
        ou = knot$overunder,add=TRUE, ...)
}

x0 <- 1000
y0 <- 0


xd <- +2200   # horizontal distance between knots
yd <- -2200   # vertical distance
list_o_knots <- list(
    unknot, k3_1,   k4_1,   k5_1,  k5_2,
    k6_1  , k6_2,   k6_3,   k7_1,  k7_2,
    k7_3  , k7_4,   k7_5,   k7_6,  k7_7
)


pdf(file="knottable.pdf")
plot(NA,xlim=c(0,13000),ylim=c(-8000,0),asp=1,pty='m',type='n')

for(i in 1:5){
    for(j in 1:3){
        n <- i +(j-1)*5  # knot to plot
        scaled_knotplot(list_o_knots[[n]],
                        offset=c(x0+xd*(i-1),y0+yd*(j-1)),lwd=2
                        )
    }
}  # plot commands end

dev.off()
