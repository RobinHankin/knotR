\name{knotR-package}
\alias{knotR-package}
\alias{knotR}
\docType{package}
\title{
\packageTitle{knotR}
}
\description{
\packageDescription{knotR}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{knotR}
\packageIndices{knotR}

The package contains a large number of knots, optimized for visual
appearance in the sense that the knot path is nice and smooth, and
strands cross at close to right angles.  These can be displayed by
typing

\code{knotplot(k9_23)}

at the R prompt.  The package includes all prime knots up to and
including 9 crossings, and a number of other interesting and attractive
knots.

The package facilitates the creation and optimization of new knots.  The
basic workflow is to create an \code{.svg} file in inkscape comprising a
single closed path (that is, the first and last node are the same
point).  Control nodes should all be symmetrical.  Many examples of
correctly formatted \code{.svg} files are given in the \code{inst/}
directory.

The best way to reproduce a knot from an image of its projection is to
fire up inkscape, then \emph{import} the image into inkscape, resize and
rotate as desired, then follow the string with the \sQuote{Bezier curves
and straight lines} tool (also called the \sQuote{pen tool} by Kirsanov;
the keyboard shortcut is shift-F6).  Use 1-2 nodes per segment, or 3
nodes for longer or more visually prominent segments.

Keep the lines straight at first.  Close the path by making a final
click on the initial node; now you have a closed polygon, which will
self-intersect at the path crossing points.  To smoothen the path,
select the \sQuote{edit paths by node} tool (shift-F2), then convert the
corner nodes of the path to symmetric Bezier nodes (\sQuote{make
selected nodes symmetric}).  You can then tweak the path by moving the
control nodes about with the mouse.  Be aware that adding or deleting
nodes changes the adjacent nodes to asymmetrical Bezier control points;
make them symmetric by selecting all nodes (\sQuote{Ctrl-A}), then hit
the \sQuote{make selected nodes symmetric} button.  Do this frequently
to avoid confusion.

An \code{.svg} file may be imported into R using the 
\code{reader()} function, which creates an \code{inkscape} object.  This
represents the \emph{path} of the knot: it does not include over and under
information.  The package assumes that inkscape uses absolute
coordinates (as opposed to relative coordinates); see \code{reader.Rd}
for more information.

The package provides four classes of objects that specify the path of a knot:
\code{inkscape}, \code{minobj}, \code{controlpoints}, and
\code{knotvec}.  These four classes have different uses, and objects may
be converted from one form to another by using functions such as
\code{as.minobj()}, documented at \code{as.Rd} and \code{utilities.Rd}.

A knot requires information on which strands pass over or under which
other strands; full documentation at \code{?overunder}.

Knots sometimes have symmetry constraints such as horizontal or vertical
symmetry, or rotational symmetry.  Symmetry is imposed by using the
\code{symmetrize()} function: this takes a knot path (coereced to
\code{minobj} form) and a symmetry object.  Symmetry objects are created
with function \code{symmetry_object()}, which takes a knot path and a
series of matrices and vectors that specify the symmetry of the knot.
}
\author{
\packageAuthor{knotR}

Maintainer: \packageMaintainer{knotR}
}
\keyword{ package }
\examples{


a <- reader(system.file("7_6.svg",package="knotR"))
knotplot2(a)  # shows curvature

# Now use text=TRUE to display strand numbers so you can figure out the
# overunder relations:

knotplot2(a,text=TRUE,lwd=1)

ou76 <- matrix(c(
    12,01,
    02,11,
    07,03,
    04,15,
    16,06,
    14,08,
    10,13
    ),byrow=TRUE,ncol=2)

# Now we can do a proper knot plot:

knotplot(a,ou76)


# To symmetrize a knot we use the symmetry functionality of the knot:

a <- reader(system.file("3_1_not_symmetric.svg",package="knotR"))

knotplot2(a,seg=TRUE,text=TRUE,lwd=1,node=TRUE)

# First specify the vertical symmetry:
         
Mver <- matrix(c(
    08,10,
    07,11,
    02,04,
    01,05,
    12,06
    ),ncol=2,byrow=TRUE)

# Then the rotational symmetry:
Mrot <- matrix(c(
    09,05,01,
    10,06,02,
    08,04,12
    ),byrow=TRUE,ncol=3)


# Now the overunder information:
ou31 <- matrix(c(
    03,08,
    11,04,
    07,12
    ),byrow=TRUE,ncol=2)


# create a symmetry object:

sym31 <- symmetry_object(a, Mver=Mver,xver=c(9,3),Mrot=Mrot)   


knotplot(symmetrize(a,sym31),ou31)

# Symmetric-- but ugly as a burglar's bulldog.

# to beautify, either use the knotoptim() function, or do it by hand:


objective <- function(m) {badness(make_minobj_from_minsymvec(m, sym31))}
startval  <- make_minsymvec_from_minobj(as.minobj(a),sym31)

\dontrun{

# Following examples take a long time to run.
# nlm() is the best optimization method, I think.  Limit to 1 iteration:
o <- nlm(f=objective, p=startval, iterlim=1)

# extract the evaluate:
oo <- make_minobj_from_minsymvec(o$estimate, sym31)

# create a knot:
k31_marginally_better <- 
knot(x = oo, overunderobj = ou31, symobj = sym31)

# then plot it:
knotplot(k31_marginally_better)
}
}
