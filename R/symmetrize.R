`.notneededval` <- function(...){-9999}

`.rot` <- function(x,theta){
  M <- matrix(c(cos(theta),sin(-theta),sin(theta),cos(theta)),2,2)
  
  if(is.matrix(x)){  # x is a two-column matrix
    return(t(tcrossprod(M,x)))
  } else {
    return(drop(M %*% x))
  }
}
 
`force_nodes_mirror_images_LR` <- function(x,symobj){
  stopifnot(inherits(x,"minobj"))
  Mver <- symobj$Mver
  for(i in seq_len(nrow(Mver))){
    a <- Mver[i,2]
    b <- Mver[i,1]  # basic idea is a <- b
    
    x$node[a,1] <-  -x$node[b,1]  # x coord
    x$node[a,2] <-  +x$node[b,2]  # y coord; cf equivalent lines in force_nodes_mirror_images_UD()

    if(symobj$mcdonalds){  # like 7_2
      x$handle_A[a,1] <- -x$node[b,1] - (x$handle_A[b,1] - x$node[b,1])    # x coord of handle
      x$handle_A[a,2] <- +x$node[b,2] + (x$handle_A[b,2] - x$node[b,2])    # y coord of handle (NB: strand goes the other way)
    } else { # like 6_2; default
      x$handle_A[a,1] <- -x$node[b,1] + (x$handle_A[b,1] - x$node[b,1])    # x coord of handle
      x$handle_A[a,2] <- +x$node[b,2] - (x$handle_A[b,2] - x$node[b,2])    # y coord of handle (NB: strand goes the other way)
    }
  }
  return(x)
}

`force_nodes_mirror_images_UD` <- function(x,symobj){
  stopifnot(inherits(x,"minobj"))
  Mhor <- symobj$Mhor

  for(i in seq_len(nrow(Mhor))){
    a <- Mhor[i,2]
    b <- Mhor[i,1]  # basic idea is a <- b
    
    x$node[a,1] <-  +x$node[b,1]  # x coord
    x$node[a,2] <-  -x$node[b,2]  # y coord; cf equivalent lines in force_nodes_mirror_images_LR()
    
    if(isTRUE(symobj$celtic)){
      x$handle_A[a,1] <- +x$node[b,1] - (x$handle_A[b,1] - x$node[b,1])    # x coord of handle
      x$handle_A[a,2] <- -x$node[b,2] + (x$handle_A[b,2] - x$node[b,2])    # y coord of handle (NB: strand goes the other way)
    } else { # default case; everything else pretty much
      x$handle_A[a,1] <- +x$node[b,1] + (x$handle_A[b,1] - x$node[b,1])    # x coord of handle
      x$handle_A[a,2] <- -x$node[b,2] - (x$handle_A[b,2] - x$node[b,2])    # y coord of handle (NB: strand goes the other way)
    }

    if(isTRUE(symobj$reefknot)){
        x$handle_A[a,1] <- +x$node[b,1] - (x$handle_A[b,1] - x$node[b,1])    # x coord of handle (NB: strand goes the other way)
        x$handle_A[a,2] <- -x$node[b,2] + (x$handle_A[b,2] - x$node[b,2])    # y coord of handle (NB: strand goes the other way)
    }
  }
  return(x)
}

`force_nodes_on_V_axis` <- function(x,xver){
  stopifnot(inherits(x,"minobj"))
  for(i in xver){
    x$node[i,1] <- 0  # x coordinate
    x$handle_A[i,2] <- x$node[i,2]   
  }
  return(x)
}

`force_nodes_on_H_axis` <- function(x,xhor){
  stopifnot(inherits(x,"minobj"))
  for(i in xhor){
    x$node[i,2] <- 0  # y coordinate
    x$handle_A[i,1] <- x$node[i,1]   
  }
  return(x)
}

`force_nodes_exactly_horizontal` <- function(x,symobj){  # but not necessarily on the vertical axis of symmetry
  stopifnot(inherits(x,"minobj"))
  eh <- symobj$exact_h
  x$handle_A[eh,2] <- x$node[eh,2]
  return(x)
}

`force_nodes_exactly_vertical` <- function(x,symobj){  # but not necessarily on the horizontal axis of symmetry
  stopifnot(inherits(x,"minobj"))
  ev <- symobj$exact_h
  x$handle_A[ev,2] <- x$node[ev,2]
  return(x)
}

`force_nodes_rotational` <- function(x,symobj){
  stopifnot(inherits(x,"minobj"))
  Mrot <- symobj$Mrot
  n <- ncol(Mrot)

  thetafun <- function(j){(j-1)*2*pi/n}
  
  for(i in seq_len(nrow(Mrot))){
    for(j in seq(from=2,to=ncol(Mrot))){
      a <- Mrot[i,j]
      b <- Mrot[i,1]


      rotated_node <- .rot(x$node    [b,], theta=thetafun(j))
      rotated_span <- .rot(x$handle_A[b,]- x$node[b,], theta=thetafun(j))

      x$node[a,] <- rotated_node
      
      if(isTRUE(symobj$center_crossing)){
        x$handle_A[a,] <- rotated_node - rotated_span
      } else {
        x$handle_A[a,] <- rotated_node + rotated_span
      }
      
    } # j loop closes
  } # i loop closes
  return(x)  
}

`symmetrize` <- function(x, symobj){
  x <- as.minobj(x)
  if(!is.null(symobj$xver)){x <- force_nodes_on_V_axis(x,symobj$xver)}
  if(!is.null(symobj$xhor)){x <- force_nodes_on_H_axis(x,symobj$xhor)}
  if(!is.null(symobj$Mver)){x <- force_nodes_mirror_images_LR(x,symobj)}
  if(!is.null(symobj$Mhor)){x <- force_nodes_mirror_images_UD(x,symobj)}
  if(!is.null(symobj$Mrot)){x <- force_nodes_rotational      (x,symobj)}
  if(!is.null(symobj$exact_h)){x <- force_nodes_exactly_horizontal(x,symobj)}
  if(!is.null(symobj$exact_v)){x <- force_nodes_exactly_vertical(x,symobj)}
  return(x)
}

`tag_notneeded` <- function(x, Mver, xver, Mhor, xhor, Mrot, exact_h, exact_v){
  stopifnot(inherits(x,"minobj"))

  ## first the reflection-symmetric nodes about a vertical axis; only
  ## the first column of Mver is needed, all else "notneeded":
  x$node[Mver[,-1],]     <- .notneededval()
  x$handle_A[Mver[,-1],] <- .notneededval()
  ## Note that columns 1 and 2 are set (x- and y- coords)

  ## Now the vertical centreline nodes:
  x$node    [xver,1] <- .notneededval()   # x coord for vertical centreline node (=0)
  x$handle_A[xver,2] <- .notneededval()   # y coord for handle of vertical centerline node (=y-coord of node itself)
   
  ## Now the reflection-symmetric nodes about a horizontal axis:
  x$node[Mhor[,-1],]     <- .notneededval()
  x$handle_A[Mhor[,-1],] <- .notneededval()

  ## now horizontal centreline nodes:
  x$node    [xhor,2] <- .notneededval()   # y coord for horizontal centreline node (=0)
  x$handle_A[xhor,1] <- .notneededval()   # x coord for handle of horizontal centerline node (=x-coord of node itself)
  
  ## Now the rotationally symmetric nodes; only the first column of Mrot is needed, all else "notneeded":
  x$node[Mrot[,-1],]     <- .notneededval()
  x$handle_A[Mrot[,-1],] <- .notneededval()

  ## now the nodes that are forced to be exactly horizontal:
  x$handle_A[exact_h,1]  <- .notneededval()

  ## now the nodes that are forced to be exactly vertical:
  x$handle_A[exact_v,1]  <- .notneededval()

  return(x)
  
}

`symmetry_object` <- function(x, Mver=NULL, xver=NULL, Mhor=NULL, xhor=NULL, Mrot=NULL, exact_h=NULL, exact_v=NULL,
                              mcdonalds=FALSE, celtic=FALSE, reefknot=FALSE,center_crossing=FALSE){

  if(inherits(x,"knot")){return(x$symobj)}
  
  if(!is.null(Mver) && ncol(Mver) != 2){
    stop("Mver must have two columns: the rows represent pairs of nodes
          symmetric about a vertical line of symmetry")
  }
  
  if(!is.null(Mhor) && ncol(Mhor) != 2){
    stop("Mhor must have two columns: the rows represent pairs of nodes
          symmetric about a horizontal line of symmetry")
  }
  
  indep <- as.knotvec(tag_notneeded(as.minobj(x), Mver, xver, Mhor, xhor, Mrot,exact_h, exact_v)) != .notneededval()

  return(list(
      Mver    = Mver,
      xver    = xver,
      Mhor    = Mhor,
      xhor    = xhor,
      Mrot    = Mrot,
      exact_h = exact_h,
      exact_v = exact_v,
      mcdonalds=mcdonalds, celtic=celtic, reefknot=reefknot, center_crossing=center_crossing, indep = indep))
}

`make_minsymvec_from_minobj` <- function(x,symobj){

    ## minsymvec == minimal symmetric vector; use
    ## make_minsymvec_from_minobj(as.minobj(k7_3), indep=indep_7_3

    stopifnot(inherits(x,"minobj"))

    out <- as.knotvec(x)
    out <- out[symobj$indep]
    return(minsymvec(out))
}

`make_minobj_from_minsymvec` <- function(minsymvec,symobj) {

  ## minsymvec == minimal symmetric vector; this is a vector of
  ## reals, each element of which is a degree of freedom for the
  ## optimizer.  It can be converted into a minobj object which
  ## corresponds to a symmetric knot.
  
  out <- 0*(symobj$indep+1)
  out[symobj$indep] <- minsymvec
  out <- knotvec(out)
  out <- symmetrize(as.minobj(out),symobj)
  return(out)
}
