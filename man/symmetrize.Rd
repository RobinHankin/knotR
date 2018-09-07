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
  \item{Mver,Mhor}{Matrices specifying vertical (resp. horizontal) symmetry,
    with two columns.  The rows specify pairs of symmetric nodes about a
    vertical (resp. horizontal) axis.  Nodes specified by the first column
    should be on the left (resp. upper) side; these are fixed.  Used by
    functions \code{force_nodes_mirror_images_LR()} and
    \code{force_nodes_mirror_images_UD()} which move the right (resp. lower)
    nodes and their associated handles to the positions required for
    exact vertical (resp. horizontal) symmetry}
  \item{Mrot}{A matrix specifying rotational symmetry.  Each row
    corresponds to a set of nodes in a rotational relationship.  The
    number of columns specifies the order of the rotational symmetry.
    The first column corresponds to nodes whose position is fixed.
    Used by \code{force_nodes_rotational()}, which also moves handles
    appropriately} 
  \item{xver,xhor}{Vector specifying nodes to be on the vertical
    (resp. horizontal) axis of symmetry.  The nodes are assumed to flow from
    left to right.  Used by functions \code{force_nodes_on_V_axis()} and
    \code{force_nodes_on_H_axis()} respectively, which also move the
    handles} 
  \item{exact_h,exact_v}{Vector specifying nodes to be exactly
    horizontal or exactly vertical.  A node is exactly horizontal
    (resp. vertical) if the y (resp. x) coordinate of the node is the same as the
    y (resp. x) coordinate of the handle.  Note that the position of an exactly
    horizontal or vertical node is not restricted, and may be anywhere.  Used by
    functions \code{force_nodes_exactly_horizontal()} and
    \code{force_nodes_exactly_vertical()}}
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

    Function \code{symmetry_object()} creates a symmetry object from
    \code{Mver} et seq, but if given a \code{knot} object, returns the
    embedded symmetry object.

    There are seven types of symmetry that may be imposed on a knot.
    These are imposed by the following seven \code{force_nodes_foo()}
    functions:
    
  \itemize{
    \item Functions \code{force_nodes_mirror_images_LR()} and
    \code{force_nodes_mirror_images_UD()} symmetrize a knot about a vertical
    (resp. horizontal) axis by taking ordered pairs of nodes, specified by
    matrix \code{Mver} (resp. \code{Mhor}) and forcing the second node to be
    symmetrically placed with respect to the first.  It does the same
    thing to the handles too.
    \item Functions \code{force_nodes_exactly_horizontal()} and
    \code{force_nodes_exactly_vertical()} force nodes to be exactly
    horizontal (resp. vertical) by restricting the
    position of their handles.  Nodes so forced do not
    need to be on an axis of symmetry; they can be anywhere
    \item Functions \code{force_nodes_on_V_axis()} and
    \code{force_nodes_on_H_axis()} force nodes specified by \code{xver}
    (resp. \code{xhor}) to be on the vertical (resp. horizontal)
    axis, and to have appropriately placed handles 
    \item Function \code{force_nodes_rotational()} imposes the
    rotational symmetry specified by \code{Mrot}
  }

  Function \code{symmetrize()} imposes the seven kinds of symmetry by
  calling each of the \code{force_nodes_foo()} functions in turn.

  Function \code{tag_notneeded()} is an internal function, not really
  intended for the end-user.  It takes a \code{minobj} object and marks
  a maximal set of dependent entries with a \sQuote{not needed} value.
  The values of the entries so marked may be determined by a combination
  of the imposed symmetry relations and the unmarked values.  The
  unmarked entries constitute a \code{minsymvec} object (see above).
  These are the \emph{real} degrees of freedom in the symmetrical knot.
  Only these unmarked values are modified by the optimization routines
  in \code{knotoptim()}
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
