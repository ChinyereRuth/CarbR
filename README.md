
# CarbR: Deriving Slope and Aspect Maps in R

CarbR is an R package for deriving slope and aspect maps using the
`calculate_slope_aspect` function. This function takes a raster object
representing the Digital Elevation Model (DEM) as input and returns two
rasters representing slope and aspect. The package is designed to assist
in various analyses, providing a cost-free solution using R. It also
facilitates easy distribution and reproducibility among researchers,
teammates, and decision-makers.

## Package Outline

The CarbR package includes the following key components:

- **Overview**: Brief introduction to the package and its capabilities.
- **Sample data**: Information on what is needed to use this package.
- **Sample Data**: Examples of sample data that can be used with the
  package.
- **CarbR Function “aspect and slope”**: Explanation of the main
  function in the package.
- **Example Usage**: Demonstrations and code snippets for using the
  CarbR package.

## Overview

CarbR is suitable for researchers, students, and decision-makers
interested in surface analysis to understand topographic influences.
This can be applied to various scenarios such as wildfire behavior,
flooding, and other disturbances where slope and aspect play crucial
roles.

## Sample Data

The sample data included in this package was collected from the North
Western Territory (NWT) in Canada for the year 2023. You can download
the sample data from [GitHub](https://github.com/ChinyereRuth/CarbR) or
directly from the [USGS
webpage](https://search.earthdata.nasa.gov/search/granules?projectId=2435656526).

## CarbR Function: Aspect and Slope

The `calculate_slope_aspect` function in CarbR is used to create aspect
and slope maps. Given a raster DEM as input, the function returns
rasters for slope and aspect in degrees. Slope indicates the steepness
and inclination of a surface, while aspect describes the direction of
the slope (North, East, West, South).

Not only does the function enable the fast generation of aspect and
slope maps, but it also facilitates the derivation of new maps for
various analyses.

## Example Usage

Here are concrete examples of using the `calculate_slope_aspect`
function in CarbR:

### Preliminaries

Ensure that R and RStudio are installed. Install the CarbR package from
GitHub:

``` r
# install.packages("remotes")
# remotes::install_github("ChinyereRuth/CarbR", dependencies = TRUE, build_vignettes = TRUE)
```

Also, install and load the required raster package:

``` r
# install.packages("raster")
```

``` r
library(raster)
```

    ## Loading required package: sp

Workflow for this package

Firstly, we have to load the elevation data. To load the data, use the
function `data()`:

    data("Elevation")

Inspect the object using summary():

    summary(Elevation)

## Quality checks on data

Next, we check for missing values for the raster data. if there are
missing values, We will fill the DEM. Filling a DEM when working with
raster data ensures that the ensure that the elevation data is
continuous and there are no missing values.

    # Check if there are any NAs (missing values) in the DEM
    has_nas <- any(is.na(values(Elevation)))

    if (has_nas) {
      # Fill the gaps using a simple interpolation method (linear interpolation)
      filled_dem <- raster::interpolate(Elevation, method = "bilinear")
    } else {
      filled_dem <- Elevation
    }

Save the filled DEM:

``` r
# usethis::use_data(Elevation, overwrite = TRUE)
```

Next, we use the slope and aspect function from the CarbR package to
calculate the aspect and slope using the saved DEM as input

``` r
library(raster)
data("Elevation")
#summary(Elevation)
library(CarbR)
CarbR::calculate_slope_aspect(Elevation)
```

    ## $slope
    ## class      : RasterLayer 
    ## dimensions : 3601, 3601, 12967201  (nrow, ncol, ncell)
    ## resolution : 0.0002777778, 0.0002777778  (x, y)
    ## extent     : -109.0001, -107.9999, 59.99986, 61.00014  (xmin, xmax, ymin, ymax)
    ## crs        : +proj=longlat +datum=WGS84 +no_defs 
    ## source     : memory
    ## names      : layer 
    ## values     : 0, 89.87595  (min, max)
    ## 
    ## 
    ## $aspect
    ## class      : RasterLayer 
    ## dimensions : 3601, 3601, 12967201  (nrow, ncol, ncell)
    ## resolution : 0.0002777778, 0.0002777778  (x, y)
    ## extent     : -109.0001, -107.9999, 59.99986, 61.00014  (xmin, xmax, ymin, ymax)
    ## crs        : +proj=longlat +datum=WGS84 +no_defs 
    ## source     : memory
    ## names      : layer 
    ## values     : 0, 359.7031  (min, max)

Next, we get the result of the function and call the result.

``` r
result <- CarbR::calculate_slope_aspect(Elevation)
slope_raster <- result$slope
aspect_raster <- result$aspect
```

We can plot the result to see the aspect and slope

``` r
plot(slope_raster, main="Slope")
```

![](README_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
plot(aspect_raster, main="Aspect")
```

![](README_files/figure-gfm/unnamed-chunk-7-2.png)<!-- -->
