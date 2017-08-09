\name{symmetrize}
\alias{symmetrize}
\alias{symmetrise}
\alias{force_nodes}
\alias{force_nodes_exactly_horizontal}
\alias{force_nodes_exactly_vertical}
\alias{force_nodes_mirror_images_LR}
\alias{force_nodes_mirror_images_UD}
\alias{force_nodes_on_V_axis}
\alias{force_nodes_on_H_axis}
\alias{force_nodes_rotational}
\alias{symmetrize}
\alias{tag_notneeded}
\alias{make_minsymvec_from_minobj}
\alias{make_minobj_from_minsymvec}
\alias{symmetry_object}
\alias{minsymvec}
\alias{knot}
\title{Symmetry and knots}
\description{
Various functionality to impose different types of symmetry on knots
}
\usage{
force_nodes_mirror_images_LR(x,symobj)
force_nodes_mirror_images_UD(x,symobj)
force_nodes_exactly_horizontal(x,symobj)
force_nodes_exactly_vertical(x,symobj)
force_nodes_on_V_axis(x,xver)
force_nodes_on_H_axis(x,xhor)
force_nodes_rotational(x,symobj)
symmetrize(x,symobj)
tag_notneeded(x, Mver, xver, Mhor, xhor, Mrot,exact_h,exact_v)
make_minsymvec_from_minobj(x,symobj)
minsymvec(vec)
make_minobj_from_minsymvec(minsymvec,symobj)
symmetry_object(x, Mver=NULL, xver=NULL, Mhor=NULL, xhor=NULL,
Mrot=NULL, exact_h=NULL, exact_v=NULL,
mcdonalds=FALSE, celtic=FALSE, reefknot=FALSE,center_crossing=FALSE)
knot(x, overunderobj, symobj, Mver=NULL, xver=NULL, Mhor=NULL,
xhor=NULL, Mrot=NULL, mcdonalds=FALSE, celtic=FALSE,
reefknot=FALSE,center_crossing=FALSE)
}
\arguments{
  \item{x}{Object coerced to class \code{minobj}}
  \item{Mver,Mhor}{Matrices specifying vertical (horizontal) symmetry,
    with two columns.  The rows specify pairs of symmetric
    nodes about a vertical (horizontal) axis.  Nodes
    specified by the first column should be on the left (upper) side}
  \item{Mrot}{A matrix specifying rotational symmetry.  Each row
    corresponds to a set of nodes in a rotational relationship.  The
    number of columns specifies the order of the rotational symmetry}
  \item{xver,xhor}{Vector specifying nodes to be on the vertical
    (horizontal) axis of symmetry.   The nodes are assumed to flow from
    left to right}
  \item{exact_h,exact_v}{Vector specifying nodes to be exactly
    horizontal or exactly vertical.  A node is exactly horizontal
    (vertical) if the y(x) coordinate of the node is the same as the
    y(x) coordinate of the handle.  Note that the position of an exactly
    horizontal node is not restricted, and may be anywhere}
  \item{symobj}{An object representing the symmetry of the knot, usually
    created by function \code{symmetry_object()}}
  \item{mcdonalds}{For vertical symmetry, argument \code{mcdonalds} is
    Boolean, defaulting to \code{FALSE}, with \code{TRUE} meaning that
    the symmetric pairs of strands approach the vertical line of
    symmetry in the same sense (either both moving inward, or both
    moving outward).  It is hard to explain (and named for the gesture
    one makes when tracing the top two strands a knot with this type of
    symmetry).  The only common knot that needs this is \code{7_2}}
  \item{celtic}{Like \code{mcdonalds} but for horizontal symmetry}
  \item{reefknot}{Like \code{mcdonalds} but for the reefknot}
  \item{center_crossing}{Implements a peculiar type of rotational
    symmetry in which the strands pass through the geometrical center of
    the knot projection.  The only common knot needing this is
    \code{9_29}}
  \item{minsymvec}{A \dQuote{minimal symmetric vector}.  This is a
    numeric vector containing just the independent degrees of freedom of
    a knot, after symmetry constraints have been imposed.  The idea is
    that one may optimize a \code{minsymvec} object using \code{nlm()},
    and then reconstruct a knot using
    \code{make_minobj_from_minsymvec()} together with a symmetry object}
  \item{vec}{A vector, given to function \code{minsymvec()}}
  \item{overunderobj}{A matrix specifying the overs and the unders; a
    two-column matrix with rows corresponding to pairs of strands
    intersecting.  The first element of a row identifies the overstrand
    and the second element specifies the understrand}
}
\details{
  \itemize{
    \item Function \code{symmetry_object()} creates a symmetry object
    from \code{Mver} et seq, but if given a \code{knot} object, returns
    the embedded symmetry object.
    \item Functions \code{force_nodes_mirror_images_LR()} and
    \code{force_nodes_mirror_images_UD()} symmetrize a knot about a  vertical
    (horizontal) axis by taking ordered pairs  of nodes, specified by
    matrix \code{Mver} (\code{Mhor}) and forcing the second node to be
    symmetrically placed with respect to the first
    \item  Functions \code{force_nodes_exactly_horizontal()} and
    \code{force_nodes_exactly_vertical()} force nodes to be exactly
    horizontal or exactly vertical respectively.  Nodes so forced do not
    need to be on an axis of symmetry; they can be anywhere
    \item Function \code{symmetrize_ROT()} symmetrizes a knot around a
    point of symmetry, producing a rotationally symmetric knot
  }
}
\value{
These functions return a symmetric knot in \code{minobj} form.
}
\author{Robin K.S. Hankin}
\note{You can achieve up-down symmetry (that is, a horizontal line of
  symmetry) by making a left-right symmetric knot and rotating by 90
  degrees.  D'oh.
}

\examples{

# each row of M = a pair of symmetrical nodes; each element of v is a
# node on the vertical axis

M <- matrix(c(6,4,13,11,7,3,2,8,9,1,14,10),byrow=TRUE,ncol=2) 
v <-  c(5,12) # on vertical axis

sym_7_3 <- symmetry_object(k7_3, M, v)

k <- symmetrize(as.minobj(k7_3), sym_7_3)

knotplot2(k)  #nice and symmetric!


## OK now convert to and from a mimimal vector for a symmetrical knot:

mii <- make_minsymvec_from_minobj(k, sym_7_3)
pii <- make_minobj_from_minsymvec(mii,sym_7_3)
knotplot2(pii)


##   So 'mii' is a minimal vector for a symmetrical knot, and 'pii' is
##   the corresponding minobj object.  Note that you can mess about with
##   mii, but whatever you do the resulting knot is still symmetric:

mii[2] <- 1000
knotplot2(make_minobj_from_minsymvec(mii,sym_7_3))   # still symmetric.

## and, in particular, you can optimize the badness, using nlm():

\dontrun{
fun <- function(m){badness(make_minobj_from_minsymvec(m,sym_7_3))}
o <- nlm(fun,mii,iterlim=4,print.level=2)

knotplot2(make_minobj_from_minsymvec(o$estimate,sym_7_3))
}


}
