#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

#' CarbR: A package that is helpful for creating surface features such as slope and aspect using DEM in R.
#'
#' This package provides a workflow for deriving slope and aspect using R studio. The package includes a function called slope and aspect
#' which can be used to derive the slope and aspect for any given region in the world. The sample DEM is also included, and documentation for the function.
#'
#' @docType package
#' @name CarbR-package
#' @author Chinyere Ottah, School of Earth, Environment and Society, McMaster Univetsity
#' @references \url{https://github.com/p/ChinyereRuth/CarbR/}
NULL

#' NWT-2023 Elevation Dataset
#'
#' A dataset containing the Digital Elevation Model (DEM) in meters for Northwestern Territory, Canada for the year 2023.
#' Areas of higher values depict areas of higher elevation, and areas with low values depict areas with low elevation.
#' The data was obtained from the USGS website.
#'
#' @source USGS website: https://search.earthdata.nasa.gov/search/granules?projectId=2435656526
#'
#' # Example usage of the Elevation dataset includes deriving slope and aspect
#'
#' \code{
#' # Load the dataset (assuming you've already installed and loaded CarbR package)
#' data("Elevation")
#'
#' # Derive slope and aspect using appropriate functions
#' slope_result <- calculate_slope(Elevation)
#' aspect_result <- calculate_aspect(Elevation)
#' }
#'
#' @keywords dataset
#' @format rdata
#' @name Elevation
#' @docType data
#' @usage data(Elevation)
#' @author Chinyere Ottah, School of Earth, Environment and Society, McMaster Univetsity
#' @references \url{https://github.com/p/ChinyereRuth/CarbR/}
NULL


