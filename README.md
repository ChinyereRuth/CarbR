
# Overview

This repository contains an R function for calculating the slope and
aspect from a Digital Elevation Model (DEM). The function
`calculate_slope_aspect` takes a raster object representing the DEM as
input and returns two raters representing slope and aspect.

# Function used

The function that was used to create slope and aspect using this package
is called calculate_slope_aspect. The input data that is used or
integrated with this function is a digital elation model of the study
area of interest. The slope and aspect derived from using this function
is in degrees.

# Usage

Load the raster package

``` r
library(CarbR)
data("Elevation")
```