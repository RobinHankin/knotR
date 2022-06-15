`reader` <- function(filename){  # reader('7_3.svg')

  jj <- readLines(filename)
  jj <- jj[regexpr('^ *d=',jj)>0]
  jj <- gsub("[[[:alpha:],=\"\t]",' ',jj,fixed=FALSE)
  jj <- as.numeric(strsplit(jj," ")[[1]])
  jj <- jj[!is.na(jj)]
  jj <- matrix(jj,ncol=2,byrow=TRUE)
  colnames(jj) <- c("x","y")
  jj[,2] <- -jj[,2]  # inkscape uses image() coordinates, not xy coords.  See also .make_string(), used in write_svg()
  return(inkscape(jj))
}

`knotplot2` <-
    function(x, rainbow=FALSE, seg=FALSE, text=FALSE, cross=FALSE, ink=FALSE,
             node=FALSE, width=TRUE, all=FALSE, n=100, circ=1000, lwd=8, add=FALSE, ...){ # knotplot(reader("7_3.svg"))
        
  if(all){ # switch everything on
    rainbow <- TRUE  
    seg <- TRUE
    text <- TRUE
    cross <- TRUE
    ink <- TRUE
    node <- TRUE
    width <- TRUE
  }

  a <- as.inkscape(x)
  b <- as.controlpoints(x)

  ## first set up the axes:
      
  if(!add){plot(a,type='n',asp=1, axes=FALSE, xlab='',ylab='')}

  ## Next the basic plot:

  ##  xy <- getstringpoints(b,give_strand=TRUE)
  for(i in seq_along(b)){
    bez <- bezier(b[[i]],n=n)

    if(width){
        width_col <- rainbow(length(b)+1)[i]
        points(bez,cex=circ*abs(bezier_curvature(b[[i]],n=n)),col=width_col )
    }
    
    if(text){
        text(bez[seq(from=1,by=10,to=nrow(bez)),],as.character(i),offset=5,cex=1)
    }

      if(seg){myseg(b[[i]])}
      
  } # i loop closes

        if(ink){ text(a[,1],a[,2],seq_len(nrow(a)),cex=2.5) }


        if(cross){
            jj <- crossing_points(b,give_all = FALSE)
            points(jj,pch=16,cex=4)
            text(jj,as.character(seq_len(nrow(jj))),col='red',cex=2)
        }
        

        ## finally, plot the strand (this has to come last, otherwise
        ## the strand is obscured behind the other stuff)
        
        for(i in seq_along(b)){
            bez <- bezier(b[[i]],n=n)
            if(rainbow){
                stringcol <- rainbow(length(b)+1)[i]
            } else {
                stringcol <- "black"
            }
            points(bez, col=stringcol, type='l',  lwd=lwd,...)
        }
        
        if(node){
            jj <- as.minobj(a)$node
            points(jj,pch=15,col='gray',cex=5)
            text(jj,as.character(seq_len(nrow(jj))),col='blue',cex=2)
            
#      jj <- as.minobj(a)$handle_A
#      points(jj,pch=16,col='gray',cex=3)
#      text(jj,as.character(seq_len(nrow(jj))),col='blue',cex=2)
        }
}

`getstringpoints` <- function(b,give_strand=FALSE,n=100){
    b <- as.controlpoints(b)
    if(give_strand){
        f <- function(i){cbind(bezier(b[[i]],n=n),i)}
    } else {
        f <- function(i){bezier(b[[i]],n=n)}
    }
    do.call("rbind",sapply(seq_along(b),f,simplify=FALSE))
}

`knotplot_old` <- function(x, ou, gap=20, n=100, lwd=8, add=FALSE, ...){
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

    xy <- matrix(0,0,2)
    for(i in seq_along(b)){  # loop over all Bezier segments
      tee <- seq(from=0, to=1, len=n)  # start with no NAs
      overs <- ou[ou[,2]==i,1]  # strands that pass *over* strand i  (NB: might be empty!)
      for(j in overs){  # loop over strands j that pass over strand i; i is under, j is over
        jj <- bezier_intersect(b[[i]],b[[j]],'para') # c(ess,tee)
        crosspoint <- jj[1]  # parameter for the understrand
        underb <- b[[i]]
        tee1 <- bezier_find_length(underb,len=gap,from=crosspoint,increasing=FALSE)
        tee2 <- bezier_find_length(underb,len=gap,from=crosspoint,increasing=TRUE)
        tee[(tee>tee1) & (tee<tee2)] <- NA   # mark undercrossing strand as NA
      }
      xy <- rbind(xy,bezier(b[[i]],tee=tee))
    } # 'i' loop closes
    points(xy,type='l',lwd=lwd, lend=1, ljoin=1, ...)
    return(invisible(xy))
}

`knotplot` <- function(x, ou, gapwidth=1, n=100, lwd=8, add=FALSE, ...){
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

    points(xy_thin, type='l',lwd=lwd,              lend=1, ljoin=1,              ...)
    points(xy_thick,type='l',lwd=lwd*(1+gapwidth), lend=1, ljoin=1, col="white", ...)
    points(xy_thick,type='l',lwd=lwd,              lend=1, ljoin=1,              ...)

    return(invisible(xy_thin))
}

`bezier_angle` <- function(P1,P2){  # returns \cos^2\theta, where
                                    # \theta is the angle of
                                    # intersection.

  if(!bezier_intersect(P1,P2,'bool')){
    return(1)  # corresponds to the strands crossing when they are
               # parallel
  }
     

    st <- bezier_intersect(P1,P2,'para')

    v1 <- bezier_deriv(P1,tee=st[1])
    v2 <- bezier_deriv(P2,tee=st[2])

    sum(v1*v2)^2/((sum(v1^2)*sum(v2^2)))
}

`crossing_matrix` <- function(b){   # crossing_matrix(make_controlpoints_from_ink(a))
    out <- matrix(0,length(b),length(b))
    for(i in seq_along(b)){
        for(j in seq_along(b)[-i]){
            jj <- bezier_intersect(b[[i]],b[[j]],'all')
            if(jj$intersect){ out[i,j] <- 1 }
        }
    }
    return(out)        
}

#`crossing_points` <- function(b, give_strand=FALSE){  # this is cpb
#    stop()
#  b <- as.controlpoints(b)
#    if(give_strand){
#        out <- matrix(NA,0,6)
#    } else {
#        out <- matrix(NA,0,2)
#    }
#    for(i in seq_along(b)){
#        for(j in seq(from=1,len=i-1)){
#            jj <- bezier_intersect(b[[i]],b[[j]],'all')
#            if(jj$intersect){
#                if(give_strand){
#                    out <- rbind(out, c(i,j,jj$pos,jj$optim$par))
#                } else {
#                    out <- rbind(out, jj$pos)
#                }
#            }
#        }
#    }
#    return(out)
#}

`crossing_points` <- function(b,give_all=TRUE){  # this is cpb
  SMALL <- 0.01
  b <- as.controlpoints(b)
  out <- matrix(0,0,7)
    for(i in seq_along(b)){
      for(j in seq(from=1,len=i-1)){
        jj <- bezier_intersect(b[[i]],b[[j]],'all')
        out <-
          rbind(out, c(i,j,jj$pos, jj$optim$par, jj$optim$val))
      }
    }
  colnames(out) <- c("i", "j", "x","y", "bez1","bez2","dist")

  ## OK, now find whether a pair of strands crosses, is consecutive,
  ## or misses completely (0=F,1=T)


  f1 <- function(x){      # consecutive
    jj <- sort(x[1:2])
    (jj[2]-jj[1]==1)    ||   ((min(jj)==1) & (max(jj)==length(b)))
  }
    
  f2 <- function(x){ # intersects but *not* consecutive
    !f1(x) & (x[7] < 1)
  }

  f3 <- function(x){   # misses
    x[7] >= 1
  }

  out <- 
    cbind(out,
          consec = apply(out,1,f1),
          inters = apply(out,1,f2),
          misses = apply(out,1,f3)
          )
  
  if(give_all){
    return(out)
  } else {
    return(out[out[,9]==1,3:4,drop=FALSE]) # (x,y) coordinates of the real intersections
  }
}

`crossing_strands` <- function(b){
    out <- crossing_points(b,give_all=TRUE)
    out[out[,9]>0,1:2]
}
  
`total_crossing_angle_badness` <- function(b,cpb){
  if(missing(cpb)){cpb <- crossing_points(b)}
  
  jj <- cpb[cpb[,9]==1,1:2,drop=FALSE]  # strand numbers of crossing strand pairs
  out <- 0
  for(i in seq_len(nrow(jj))){
    out <- out + bezier_angle(b[[jj[i,1]]],b[[jj[i,2]]])
  }
  return(out)
}

`total_bending_energy` <- function(b,power=2){
  out <- unlist(lapply(b,bezier_bending_energy,power=power))
  return(sum(out))
}

`total_crossing_potential_energy` <- function(b,cpb){
  if(missing(cpb)){cpb <- crossing_points(b)}
  o <- cpb[cpb[,9]==1,3:4,drop=FALSE]
  m <-
    apply(o, 1, function(y) {
      apply(o, 1, function(x) {
        sum((x-y)^2)
      })
    })
  m <- m[m>0]
  return(sum(1/m))
}

`total_string_length` <- function(b){
  b <- as.controlpoints(b)
  sum(unlist(lapply(b,bezier_arclength)))
}

`midpoint_badness` <- function(b,cpb){
  if(missing(cpb)){  cpb <- crossing_points(b)}

  jj <- cpb[cpb[,9]==1,5:6]  # (tee,ess), of the two strands
  return(sum((jj-1/2)^6))
}

`node_crossing_badness` <- function(b,cpb){
  b <- as.controlpoints(b)
  if(missing(cpb)){  cpb <- crossing_points(b)}
  
  xy_node <- as.minobj(b)$node  # (x,y) coords of nodes
  xy_cros <- cpb[cpb[,9]==1,3:4,drop=FALSE]  # (x,y) of crossing points

  dist_squared <-   # rows = crossing points, columns = nodes
    apply(xy_node, 1, function(y) {
      apply(xy_cros, 1, function(x) {
        sum((x-y)^2)
      })
    })
  return(sum(1/dist_squared))
}

`curvature_switching_badness` <- function(b){
    b <- as.controlpoints(b)
    badness <- function(P){
        jj <- bezier_curvature(P,n=100)
        jmm <- c(min(jj,na.rm=TRUE),max(jj,na.rm=TRUE))
        
        if(prod(jmm)>=0){ # either always +ve or always -ve
            return(0)
        } else {
            return(min(abs(jmm))^2)
        }
    }
    
    out <- unlist(lapply(b,badness))
    return(sum(out))
}

`bezier_total_curvature` <- function(P, give=FALSE, ...){
    out <-
        integrate(function(x){bezier_curvature(P,tee=x)},lower=0,upper=1, ...)
    if(give){
        return(out)
    } else {
        return(out$value)
    }
}

`curvature_consecutive_segment_switching_badness` <- function(b, ...){
    b <-as.controlpoints(b)
    n <- length(b)
    signed_curvature <- rep(0,n)
    for(i in seq_along(b)){
        signed_curvature[i] <- bezier_total_curvature(b[[i]], ...)
    }

    jj <- cbind(seq_len(n),c(2:n,1))
    `minpen` <- function(a,b){ifelse(a*b<0,min(abs(c(a,b))),0)}
    `f` <- function(x){minpen(signed_curvature[x[1]],signed_curvature[x[2]])}
    out <- apply(jj,1,f)

    return(sum(out)^2)      ## or perhaps return(sum(out^2))
}

`always_left_badness` <- function(b){ #penalizes knots that should always bend to the left and have a segment bending to the right.
    out <- NULL
    for(i in b){
        out <- c(out,bezier_curvature(i))
    }
    return(var(out))
}

`non_crossing_strand_close_approach_badness` <- function(b,cpb){
    if(missing(cpb)){  cpb <- crossing_points(b) }
    o <- cpb[cpb[,10]==1,7]  # distances between pairs of strands that miss one another
    sum(1/o)
}

`metrics` <- function(b,cpb){
  b <- as.controlpoints(b)
  k <- as.minobj(b)
  
  if(missing(cpb)){  cpb <- crossing_points(b) }  
  c(
      pot = total_crossing_potential_energy(b,cpb=cpb),
      ang = total_crossing_angle_badness(b,cpb=cpb),
      ben = total_bending_energy(b,power=2),
      len = total_string_length(b),
      mid = midpoint_badness(b,cpb),
      clo = node_crossing_badness(b,cpb),
      swi = curvature_switching_badness(b),
      con = curvature_consecutive_segment_switching_badness(b),
      ncn = non_crossing_strand_close_approach_badness(b,cpb)
      )
}

`badness` <- function(b, cpb, weights=1, prob=0, give=FALSE){   # objective(make_vector(make_minimal_object(a)))
  b <- as.controlpoints(b)
  if(missing(cpb)){  cpb <- crossing_points(b) }
  weights <- weights * 
    c(pot = 100,
      ang = 0.1,
      ben = 6,
      len = 0.000001,
      mid = 100,
      clo = 10,
      swi = 100,
      con = 100,
      ncn = 10
      )*5
  
  
  jj <- metrics(b,cpb)
  jj[4] <- (jj[4]-5000)^2
  if(runif(1) < prob){
    dput(b)
    print(jj*weights)
    knotplot2(b,seg=TRUE,circ=1200)
  }
  if(give){
      return(jj*weights)
  } else {
      return(sum(jj*weights))
  }
}

`myseg` <- function(P, ...){
  segments(x0=P[1,1],y0=P[1,2],x1=P[2,1],y1=P[2,2],...)
  segments(x0=P[3,1],y0=P[3,2],x1=P[4,1],y1=P[4,2],...)
  points(P,...)
}

`.make_string` <- function(k){
  k <- unclass(as.inkscape(k))
  k[,2] <- -k[,2]  # inkscape uses image() coordinates, not xy coords.  See also reader().
  `comma` <- function(x){paste(x[1]," , ",x[2],sep="")}
  out <- '       d="M '
  out <- paste(out, comma(k[1,]))
  out <- paste(out," C ",sep="")
  for(i in 2:nrow(k)){
    out <- paste(out, comma(k[i,]),sep=" ")
  }
  out <- paste(out, ' Z "',sep="")
  return(out)
}

`.arse` <- function(filename){
  paste(sub(".svg","",filename),"_smoothed.svg",sep="")
}

`.getn` <- function(reg,text){
    n <- grep(reg,text)
    if(length(n)>1){
        stop(paste("more than one line matches regexp",reg, " "))
    } else if(length(n)<1){
        stop(paste("no lines match regexp",reg," "))
    } else {
        return(n)
    }
}

`write_svg` <- function(k, oldfile, safe=TRUE, regex1 = 'sodipodi:docname=', regex2=' *d *= *" *M.*C.*[zZ] *"'){

    if(safe){
    	newfile <- .arse(oldfile)
    } else {
	newfile <- oldfile
    }
    text <- readLines(oldfile)
    
    ## first the filename:
    if(!safe){
      n <- .getn(regex1,text)
      text[n] <- sub(oldfile,newfile,text[n])
    }
    
    ## now the data line:
    n <- .getn(regex2,text)
    text[n] <- .make_string(k)

    write(text,newfile)
    return(invisible(text))
}

`knotoptim` <-
  function(
           svg, weights=1,symobj=NULL,
           Mver = NULL, xver = NULL, Mhor = NULL, xhor = NULL, Mrot = NULL, mcdonalds = FALSE, celtic=FALSE,
           ou, prob=0, useNLM=TRUE, ...){
    a <- reader(svg)
    if(is.null(symobj)){
      symobj <-
        symmetry_object(a, Mver = Mver, xver = xver, Mhor = Mhor, xhor = xhor, Mrot = Mrot, mcdonalds = mcdonalds,celtic=celtic)
    }
    
    symk <- symmetrize(as.minobj(a), symobj)
    `objective` <- function(m){ badness(make_minobj_from_minsymvec(m,symobj),weights=weights,prob=prob) }

    startval <- make_minsymvec_from_minobj(symk,symobj)

    if(useNLM){
      out <- nlm(f=objective, p=startval, ...)$estimate
    } else {
      out <- optim(par=startval, fn=objective, ...)$par
    }
    
    knot(x=make_minobj_from_minsymvec(out,symobj),
         overunderobj=ou,
         symobj=symobj)
  }

`is.sensible` <- function(overunderobj,x){

    jj1 <- crossing_points(x,TRUE)
    jj1 <- jj1[jj1[,9]==1,1:2,drop=FALSE]
    if(length(jj1)==0){  # unknot
      return(length(overunderobj)==0)
    }
    jj1 <- t(apply(jj1,1,sort))
    jj1 <- jj1[order(jj1[,1],jj1[,2]),]
    
    jj2 <- t(apply(overunderobj,1,sort))
    jj2 <- jj2[order(jj2[,1],jj2[,2]),]

    if(all(dim(jj1)==dim(jj2))){
        return(all(jj1==jj2))
    } else {
        return(FALSE)
    }
}
 
`overunder` <- function(x){
  x$overunderobj
}

`overunder<-` <- function(x,value){
  stopifnot(is.sensible(value,x))
  x$overunderobj <- value
  return(x)
}

`mirror` <- function(x){
  jj <- x$overunderobj
  jj <- jj[,2:1]
  overunder(x) <- jj
  return(x)
}

`head.inkscape` <- function(x, ...){
  head(unclass(x),...)		
}

`tail.inkscape` <- function(x, ...){
  tail(unclass(x),...)		
}
