knotR - pleasing knot projections using Bezier curves
====================================

# Introduction

In this short article I introduce the knotR package, which
creates two dimensional knot diagrams optimized for visual appearance.

The knotR package is a systematic R-centric suite of software for
the creation of production-quality artwork of knot diagrams.







# Installation

To install the current development version use devtools:

    devtools::install_github("RobinHankin/knotR")

To install the CRAN version:

    install.packages("knotR")


# Package purpose

To create visually pleasing diagrams of knot projection using Bezier
curves and optimization routines to maximize appearance-related
objective functions.


# Basic workflow

First, create an svg file in inkscape; many working examples provided
in the inst/ directory, and detailed instructions provided in
knotR-package.Rd.

Then use the knotoptim() function to smoothen the knot path, and to
specify the details of the crossings.  Many working examples provided
in the inst/ directory.


# Further information

For more detail, see the package vignette

    vignette("knot")
 
 
 