#' Calculate slope and aspect using a Digital Elevation Model (DEM)
#'
#' This function takes a Digital Elevation Model (DEM) raster and calculates both
#' the slope and aspect using focal operations.
#'
#' @param dem A raster object representing the Digital Elevation Model.
#' @return A list containing two raster objects: 'slope' and 'aspect'.
#'
#' @examples
#' # Load DEM
#' #require(raster)
#' #Elevation <- raster("https://github.com/ChinyereRuth/CarbR/blob/master/data/Elevation.rda")
#'
#' # Calculate slope and aspect
#' #result <- calculate_slope_aspect(Elevation)
#'
#' # Access the slope and aspect rasters
#' #slope_raster <- result$slope
#' #aspect_raster <- result$aspect
#'
#' # Plot the results
#' #plot(slope_raster, main="Slope")
#' #plot(aspect_raster, main="Aspect")
#'
#' @import raster
#' @export
calculate_slope_aspect <- function(dem) {
  # Calculate slope
  dzdx <- focal(dem, matrix(c(-1,0,1,-2,0,2,-1,0,1), nrow=3, ncol=3),
                fun=function(x) {sum(x)})

  dzdy <- focal(dem, matrix(c(1,2,1,0,0,0,-1,-2,-1), nrow=3, ncol=3),
                fun=function(x) {sum(x)})

  slope <- atan(sqrt(dzdx^2 + dzdy^2))

  # Convert slope to degrees
  slope <- slope * (180 / pi)

  # Calculate aspect
  aspect <- atan2(dzdy, -dzdx)

  # Convert aspect to degrees
  aspect <- (aspect * (180 / pi) + 360) %% 360

  return(list(slope = slope, aspect = aspect))
}
