% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SlopeAspectr.R
\name{calculate_slope_aspect}
\alias{calculate_slope_aspect}
\title{Calculate slope and aspect using a Digital Elevation Model (DEM)}
\usage{
calculate_slope_aspect(dem)
}
\arguments{
\item{dem}{A raster object representing the Digital Elevation Model.}
}
\value{
A list containing two raster objects: 'slope' and 'aspect'.
}
\description{
This function takes a Digital Elevation Model (DEM) raster and calculates both
the slope and aspect using focal operations.
}
\examples{
# Load DEM
#require(raster)
#Elevation <- raster("https://github.com/ChinyereRuth/CarbR/blob/master/data/Elevation.rda")

# Calculate slope and aspect
#result <- calculate_slope_aspect(Elevation)

# Access the slope and aspect rasters
#slope_raster <- result$slope
#aspect_raster <- result$aspect

# Plot the results
#plot(slope_raster, main="Slope")
#plot(aspect_raster, main="Aspect")

}
