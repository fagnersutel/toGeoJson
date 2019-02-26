#Write geojson
#====

#Load libraries
library(rgdal)

#dataMap is a dataframe with coordinates on cols 11 (LATITUDE) and 12 (LONGITUDE)
#Transfor coordinates to numeric
dataMap$LATITUDE  <- as.numeric(dataMap$LATITUDE)
dataMap$LONGITUDE  <- as.numeric(dataMap$LONGITUDE)
dataMap.SP  <- SpatialPointsDataFrame(dataMap[,c(12,11)],dataMap[,-c(12,11)])
str(dataMap.SP) # Now is class SpatialPointsDataFrame

#Write as geojson
writeOGR(dataMap.SP, 'dataMap.geojson','dataMap', driver='GeoJSON')