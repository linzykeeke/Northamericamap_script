### This is the stub script to read the data and plot the maps
### You have to write the code suggested here.
### Feel free to follow the ideas in a different manner/in a different file.
### However, you have to submit your main code file.
###
### The file must be executable on the server!
### I.e. someone else must be able to just run it with 'Rscript maps.R'
### /on server/ and get the correct output.


## read the data
##



## hint1: figure out the correct format and use the correct function.
##

## hint2: read.table and friends are slow (about 6 min to read data).
## You may use data.table::fread instead (a few seconds)

#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("R.utils")
#install.packages("data.table")
#install.packages("gridExtra")


library(dplyr)
library(data.table)
library(decrypt)
temp_prec_encryptdf <- fread("~/Desktop/INFO-Homework /a5-remote-server-linzykeeke/temp-prec-encrypted.csv", 
                             sep = '\t' , stringsAsFactors = FALSE)
temp_prec_file <- decrypt::decryptData(temp_prec_encrypted.csv)

## filter out North American observations

north_america <- filter(temp_prec_encryptdf, latitude > 10 & latitude < 90 , longitude > 200  & longitude < 300 )
decreptedData<- decrypt::decryptData(north_america)
View(north_america)

## delete the original (large data) from R workspace
## this is necessary to conserve memory.
rm(temp_prec_file)

## -------------------- do the following for 1960, 1986, 2014 and temp/precipitation --------------------

north_america_yearsdf <- filter(north_america, time == 1960-01-01 | time == 1986-01-01 |time == 2014-01-01)
  
  ## select jpg graphics device
  ## select the correct year - plot longitude-latitude and color according to the temp/prec variable
  ## I recommend to use ggplot() but you can use something else too.
  ## 
#install.packages("mapproj")
library(mapproj)
library(ggplot2)


north_america_1960 <- filter(north_america, north_america$time == 1960-01-01)
jpeg("North-America-1960-temp-map.jpg")
filter(north_america, time == "1960-01-01") %>%
  ggplot() + 
  geom_point (aes(x= longitude, y=latitude, col=airtemp)) + coord_map()
title(main = "North America 1960 temp map")
dev.off()

#   Map 1986
north_america_1986 <- filter(north_america, north_america$time == 1986-01-01)
jpeg("North-America-1986-temp-map.jpg")
filter(north_america, time == "1986-01-01") %>%
  ggplot() + 
  geom_point (aes(x= longitude, y=latitude, col=airtemp)) + coord_map()
title(main = "North America 1986 temp map")
dev.off()

#   Map 2014

north_america_2014 <- filter(north_america, north_america$time == 2014-01-01)
jpeg("North-America-2014-temp-map.jpg")
filter(north_america, time == "2014-01-01") %>%
  ggplot() + 
  geom_point (aes(x= longitude, y=latitude, col=airtemp)) + coord_map()
title(main = "North America 2014 temp map")
dev.off()


  ## Note: if using ggplot, you may want to add "+ coord_map()" at the end of the plot.  This
  ## makes the map scale to look better.  You can also pick a particular map projection, look
  ## the documentation.  (You need 'mapproj' library).
  ## Warning: map projections may be slow (several minutes per plot).
  
## close the device

## -------------------- you are done.  congrats :-) --------------------

