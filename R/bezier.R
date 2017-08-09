
`bezier` <- function(P,tee,n=100){  #r=3 hard-coded.
    if(missing(tee)){tee <- seq(from=0,to=1,len=n)}
    crossprod(rbind((1-tee)^3, 3*tee*(1-tee)^2, 3*tee^2*(1-tee), tee^3),P)
}

`bezier_arclength` <- function(P, t1=0, t2=1, give=FALSE, ...){  # arc length from bez(t1) to bez(t2)
    `f` <- function(tee){sqrt(rowSums(bezier_deriv(P,tee)^2))}

    out <- integrate(f,lower=t1,upper=t2, ...)
    if(give){
        return(out)
    } else {
        return(out$value)
    }
}

`bezier_find_length` <- function(P, len, from=0, increasing=TRUE, give=FALSE, ...){

    if(increasing){
        `f` <- function(x){bezier_arclength(P,t1=from,t2=x,give=FALSE, ...)-len}
        out <- uniroot(f,interval=c(from,1))
    } else {
        `f` <- function(x){bezier_arclength(P,t1=x,t2=from,give=FALSE, ...)-len}
        out <- uniroot(f,interval=c(0,from))
    }
    if(give){
        return(out)
    } else {
        return(out$root)
    }
}

`bezier_deriv` <- function(P,tee,n=100){  #r=3 hard-coded.
    if(missing(tee)){tee <- seq(from=0,to=1,len=n)}
    crossprod(rbind(-3*(1-tee)^2,
                          3*(1-tee)*(1-3*tee),
                          3*tee*(2-3*tee),
                          3*tee^2),
                   P)
}

`bezier_deriv2` <- function(P,tee,n=100){  #second derivative
    if(missing(tee)){tee <- seq(from=0,to=1,len=n)}
    crossprod(rbind(
        6 - 6*tee,
        -12 +18*tee,
        6-18*tee,
        6*tee), P)
}

`bezier_radius` <- function(P,tee,n=100){
    if(missing(tee)){tee <- seq(from=0,to=1,len=n)}
    d1 <- bezier_deriv(P,tee)
    d2 <- bezier_deriv2(P,tee)  # second derivative
    rowSums(d1^2)^(3/2)/(d1[,1]*d2[,2]-d1[,2]*d2[,1])
}

`bezier_curvature` <- function(P,tee,n=100){
    if(missing(tee)){tee <- seq(from=0,to=1,len=n)}
    d1 <- bezier_deriv(P,tee)
    d2 <- bezier_deriv2(P,tee)  # second derivative
    (d1[,1]*d2[,2]-d1[,2]*d2[,1])/rowSums(d1^2)^(3/2)
}

`bezier_bending_energy` <- function(P, t1=0, t2=1, give=FALSE, power=2, ...){

  `f` <- function(tee){
    sqrt(rowSums(bezier_deriv(P,tee)^2))/abs(bezier_radius(P,tee))^power
  }
  out <- integrate(f, lower=t1, upper=t2,...)

  if(give){
    return(out)
  } else {
    return(out$value)
  }
}

`bezier_intersect` <- function(P1,P2,type='pos', ...){
    distfun <- function(x){ sum((bezier(P1,x[1])-bezier(P2,x[2]))^2) }
    jj <-
        constrOptim(
            theta=c(1,1)/2,
            grad=NULL,
            f=distfun,
            ui=rbind(diag(2),-diag(2)),
            ci=c(0,0,-1,-1),
            ...
            )

    o <- sort(jj$par)
    consecutive <- (o[1] < 0.01) & (o[2]>0.99)  # end of one,  beginning of another

    intersect <- (!consecutive) & (jj$value<1) # Boolean with TRUE meaning curves P and Q intersect
    pos  = bezier(P1,jj$par[1])           # coordinates of intersection point
    
    out <- switch(type,
                  'pos'  = pos,                   # coordinates of intersection point
                  'cons' = consecutive,           # if curves are consecutive strands
                  'bool' = intersect,             # Boolean with TRUE meaning curves P and Q intersect
                  'para' = jj$par,                # c(tee,ess); parameters of P,Q at intersection
                  'opt'  = jj,                    # result of constrOptim()
                  'all'  = list(
                      optim=jj,pos=pos,
                      consecutive=consecutive,
                      intersect=intersect)
                  )
                  
    return(out)
}

