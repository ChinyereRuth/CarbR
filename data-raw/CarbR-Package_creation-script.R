usethis::use_description()
usethis::use_package_doc()
usethis::use_mit_license()
# Turn the project into a git repository.
usethis::use_git()
# Use GitHub.
usethis::use_github()
# At this point you can check the project to see that everything is in order.
devtools::check()

# Initialize a folder for your raw data; this will create a folder `/data-raw` and a file called DATA.R. You can delete this file.
usethis::use_data_raw()

# Use GitHub if desired.
usethis::use_github()

# At this point you can check the project to see that everything is in order.
devtools::check()

# Initialize a folder for your raw data; this will create a folder `/data-raw` and a file called DATA.R. You can delete this file.
usethis::use_data_raw()




# Run the following function to create the documentation; the documentation goes in folder `/man`.
devtools::document()
#install.packages("sf")
#library(sf)
#install.packages("sp")
#install.packages("raster")
#library(sp)
#library(raster)

# First we will create a new function to add to the package. To do this, use the following function
# (from the {usethis} package) to create a new R script. The name of the function will be SlopeAspectr:

usethis::use_r(name = "SlopeAspectr")

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

## example of how you can use this function

# Load DEM
elevation_raster <- raster("Elevation")

# Calculate slope and aspect
result <-calculate_slope_aspect(Elevation)


# Access the slope and aspect rasters
slope_raster <- result$slope
aspect_raster <- result$aspect

# Plot the results
plot(slope_raster, main="Slope")
plot(aspect_raster, main="Aspect")

devtools::document()
devtools::check()

# This command will build the package

devtools::build()
devtools::install()

# Create a README file for your repository. Edit the file as appropriate AND KNIT.
usethis::use_readme_rmd()


#To create a vignette for surfaceR
usethis::use_vignette("CarbR-vignette")
usethis::use_package("CarbR")
browseVignettes("surfaceR")
devtools::build_vignettes()
devtools::check()




