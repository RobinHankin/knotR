library("knotR")
library("hexSticker")

## Function knotplot_new() defined below is exactly the same as
## knotR:knotplot() except that the colour of the obscuring strand is
## different.

`knotplot_new` <- function(x, ou, gapwidth=1, n=100, lwd=8, add=FALSE, ...){
    if(inherits(x,'knot')){
      ou <- x$overunderobj
      x <- as.minobj(x)
    }
    stopifnot(is.sensible(ou,x))
    a <- as.inkscape(x)
    if(!add){
      plot(a,type='n',asp=1, axes=FALSE, xlab='', ylab='', ...)
    }

    b <- as.controlpoints(a)

    xy_thin  <- matrix(0,0,2)
    xy_thick <- matrix(0,0,2)
    for(i in seq_along(b)){  # loop over all Bezier segments
      tee <- seq(from=0, to=1, len=n)  
      overs <- ou[ou[,2]==i,1]  # strands that pass *over* strand i  (NB: might be empty!)
      for(j in overs){  # loop over strands j that pass over strand i; i is under, j is over
        jj <- bezier_intersect(b[[i]],b[[j]],'para') # jj: c(ess,tee)
        crosspoint <- jj[2]  # crosspoint parameter for the OVERstrand
        xy_thick <- rbind(xy_thick,bezier(b[[j]],tee=seq(from=crosspoint-0.2,to=crosspoint+0.2, length=n)),NA)
      }
      xy_thin <- rbind(xy_thin, bezier(b[[i]],tee=tee))
    } # 'i' loop closes

    points(xy_thin, type='l',lwd=lwd,              lend=1, ljoin=1,                ...)
    points(xy_thick,type='l',lwd=lwd*(1+gapwidth), lend=1, ljoin=1, col="#7733FF", ...)
    points(xy_thick,type='l',lwd=lwd,              lend=1, ljoin=1,                ...)

    return(invisible(xy_thin))
}


pdf(file="knotR_icon.pdf",bg="#7733FF")
par(mai=c(0,0,0,0))
knotplot_new(hexknot,lwd=15)
dev.off()

sticker("knotR_icon.pdf", package="knotR", p_size=18, s_x=1, s_y=1,
        s_width=0.9,asp=0.85, white_around_sticker=TRUE, h_fill="#7733FF",
        h_color="#000000", filename="knotR.png")

