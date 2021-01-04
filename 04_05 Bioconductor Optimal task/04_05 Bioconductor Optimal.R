# Copyright Mark Niemann-Ross, 2017
# Author: Mark Niemann-Ross. mark.niemannross@gmail.com
# LinkedIn: https://www.linkedin.com/in/markniemannross/
# Github: https://github.com/mnr
# More Learning: http://niemannross.com/link/mnratlil
# Description: Optimal example for Bioconductor
# How many buildings in a satellite image?

source("http://bioconductor.org/biocLite.R")

biocLite("EBImage")
install.packages("nasadata")
install.packages("ggmap")

library(EBImage)
library(nasadata)
library(ggmap)

nasa_api_key <- "DEMO_KEY" # get your key at https://api.nasa.gov/api.html
myCity <- geocode("Portland, OR")

# invoke various EBImage functions
city_image <- earth_image(nasa_api_key, myCity[["lon"]], myCity[["lat"]], date = "2017-01-01", plot=TRUE)
city_image_png <- as.Image(city_image[["image_png"]])

hist_values <- hist(city_image_png) # from EBImage

threshold_here <- quantile(hist_values$density, 0.6)
city_image_thresholded <- city_image_png > threshold_here

display(city_image_thresholded) # from EBImage

building_count <- bwlabel(city_image_thresholded) # from EBImage

max(building_count) # returns the highest labeled item from bwlabel

