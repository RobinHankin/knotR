## This file contains three groups of functions:

## First, functions to create objects of class inkscape and so on.

## Second, functions like make_minobj_from_ink() that convert from one
## class to another;

## Third, functions like as.inkscape() which are user-friendly
## functions that convert from one form to another.


## First the functions to create the various objects.

`inkscape` <- function(x){
  stopifnot(is.matrix(x))
  stopifnot(ncol(x)==2)
  stopifnot(nrow(x)%%3 ==1)
  class(x) <- "inkscape"   
  return(x)
}

`minobj` <- function(x){
  stopifnot(is.list(x))
  stopifnot(length(x)==2)
  stopifnot(nrow(x[[1]]) == nrow(x[[2]]))
  stopifnot(ncol(x[[1]]) == 2)
  stopifnot(ncol(x[[2]]) == 2)
  class(x) <- "minobj"
  return(x)
}

`knotvec` <- function(x){
  stopifnot(is.vector(x))
  class(x) <- "knotvec"
  return(x)
}

`controlpoints` <- function(x){
  stopifnot(is.list(x))
  stopifnot(all(unlist(lapply(x,nrow))==4))
  stopifnot(all(unlist(lapply(x,ncol))==2))
  class(x) <- "controlpoints"
  return(x)
}

`minsymvec` <- function(vec){
  stopifnot(is.vector(vec))
  class(vec) <- "minsymvec"
  return(vec)
}


## Now the functions to convert from one type to another:

`make_minobj_from_ink` <- function(a){  # creates a minimal object
                                        # from inkscape object 'a';
                                        # note that 'a' contains
                                        # redundancy: a[18,] - a[19,]
                                        # == a[19,]-a[20,] etc.
    ##  need  34(5)  --  bracket indicates calculable from the other terms

  ## 3  4 (5)
  ## 6  7 (8)
  ## 9 10 (11)
  ## ...
  ## 39 40 (41)
  ## 42 43 (2)  sic  [because the loop is closed]

  ## also note 1==43 (because the path is closed)

  n_handle_A <- seq(from=3,by=3,to=nrow(a)-1)
  n_node     <- c(seq(from=4,by=3,to=nrow(a)-3),1)

  b1 <- a[n_handle_A,]
  rownames(b1) <- paste("r",n_handle_A ,sep="_")

  b2 <- a[n_node,]
  rownames(b2) <- paste("r",n_node ,sep="_")
  
  out <- list(
      handle_A = b1,
      node     = b2
  )

  ## of course, out$handle_B <- out$node +(out$node-out$handle_A)
  
  return(minobj(out))
}

`make_ink_from_minobj` <- function(x){

## inverse function to make_minimal_object(); takes a minobj and
## returns an inkscape object

  n <- nrow(x[[1]])
  out <- matrix(0,1+n*3,2)

  out[seq(from=3,by=3,len=n),] <- x$handle_A
  out[seq(from=4,by=3,len=n-1),] <- x$node[-n,]
  out[2,] <- x$node[n,]

  out[seq(from=5,by=3,len=n-1),] <- (x$node +(x$node-x$handle_A))[-n,]

  out[1,] <- x$node[n,]
  out[1+n*3,] <- out[1,]
  out[2,] <- (x$node +(x$node-x$handle_A))[n,]

  return(inkscape(out))
}

`make_knotvec_from_minobj` <- function(x){
  out <- c(x, recursive=TRUE)
  return(knotvec(out))
}

`make_minobj_from_vector` <- function(vec){
    n <- length(vec)
    stopifnot(n%%4==0)
    out <-
      list(
          handle_A = matrix(vec[1:(n/2)],ncol=2),
          node     = matrix(vec[(n/2+1):n],ncol=2)
      )

    return(minobj(out))
}

`make_controlpoints_from_ink` <- function(a){  # 'a' is an inkscape object
 
  start <- seq(from=1,to=nrow(a)-1,by=3)

  out <- list()
  for(i in start){
    jj <- seq(from=i,to=i+3)
    neew <- a[jj,]
    rownames(neew) <- paste("r",jj,sep="_")
    out <- c(out,list(neew))
  }
  return(controlpoints(out))
}

`make_inkscape_from_controlpoints` <- function(b){   # 'b' is a controlpoints object
  out <- do.call("rbind",lapply(b,function(x){x[1:3,]}))
  out <- rbind(out,out[1,])
  return(inkscape(out))
}

`make_minobj_from_knot` <- function(k){
  make_minobj_from_minsymvec(k$minsymvec,k$symobj)
}


## Now the user-friendly functions for coercing and creating:

`as.inkscape` <- function(x){
  if(inherits(x,'inkscape')){
    return(x)
  } else if(is.matrix(x)){
    return(inkscape(x))
  } else if(inherits(x,"knot")){
    return(make_ink_from_minobj(make_minobj_from_knot(x)))
  } else if(inherits(x,'minobj')){
    return(make_ink_from_minobj(x))
  } else if(inherits(x,'knotvec')){
    return(make_ink_from_minobj(make_minobj_from_vector(x)))
  } else if(inherits(x,'controlpoints')){
    return(make_inkscape_from_controlpoints(x))
  } else {
    stop("as.inkscape() doesn't have this functionality")
  }
}

`as.minobj` <- function(x){
  if(inherits(x,"minobj")){
    return(x)
  } else if(inherits(x,"knot")){
    return(make_minobj_from_knot(x))
  } else if(inherits(x,"inkscape")){
    return(make_minobj_from_ink(x))
  } else if(inherits(x,"knotvec")){
    return(make_minobj_from_vector(x))
  } else if(inherits(x,"controlpoints")){
    return(make_minobj_from_ink(make_inkscape_from_controlpoints(x)))
  } else {
    stop("function as.minobj() cannot deal with this")
  }
}

`as.controlpoints` <- function(x){
  if(inherits(x,"controlpoints")){
    return(x)
  } else if(inherits(x,"knot")){
    return(make_controlpoints_from_ink(make_ink_from_minobj(make_minobj_from_knot(x))))
  } else if(inherits(x,"inkscape")){
      return(make_controlpoints_from_ink(x))
  } else if(inherits(x,"minobj")){
    return(make_controlpoints_from_ink(make_ink_from_minobj(x)))
  } else if(inherits(x,"knotvec")){
    return(make_controlpoints_from_ink(make_ink_from_minobj(make_minobj_from_vector(x))))
  } else { # x is assumed to be a vector
    return(make_controlpoints_from_ink(make_ink_from_minobj(make_minobj_from_vector(x))))
  }
}

`as.knotvec` <- function(x){
  if(inherits(x,"knotvec")){
    return(x)
  } else if(inherits(x,"knot")){
    return(make_knotvec_from_minobj(x$minobj))
  } else if(inherits(x,"minobj")){
    return(make_knotvec_from_minobj(x))
  } else if(inherits(x,"inkscape")){
    return(make_knotvec_from_minobj(make_minobj_from_ink(x)))
  } else if(inherits(x,"controlpoints")){
    return(make_knotvec_from_minobj(make_minobj_from_ink(make_inkscape_from_controlpoints(x))))
  } else {
    stop("as.knotvec() cannot deal with this")
  }
}

`as.minsymvec` <- function(x,symobj){
  if(inherits(x,"knot")){
    return(make_minsymvec_from_minobj(as.minobj(x),x$symobj))
  } else {
    return(make_minsymvec_from_minobj(as.minobj(x),symobj))
  }
}

`knot` <- function(x, overunderobj, symobj, Mver=NULL, xver=NULL, Mhor=NULL, xhor=NULL, Mrot=NULL, mcdonalds=FALSE, celtic=FALSE,reefknot=FALSE,center_crossing=FALSE){

  if(inherits(x,'knot')){return(knot)}
  if(missing(symobj)){
    symobj <-
      symmetry_object(x,
                      Mver=Mver,
                      xver=xver,
                      Mhor=Mhor,
                      xhor=xhor,
                      Mrot=Mrot,
                      mcdonalds=mcdonalds,
                      celtic=celtic,
                      reefknot=reefknot,
                      center_crossing=center_crossing
                      )
  }

  out <-
    list(
        minsymvec    = make_minsymvec_from_minobj(symmetrize(x,symobj),symobj),
        overunderobj = overunderobj,
        symobj       = symobj
    )
  class(out) <- "knot"
  return(out)
}
