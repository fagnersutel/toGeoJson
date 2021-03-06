# convert data frame
data(quakes)
toGeoJSON(data=quakes, name="quakes", dest=tempdir(), lat.lon=c(1,2))
quakes

# convert data frame - minimal call
# storing output file path in variable
data(quakes)
path <- toGeoJSON(data=quakes)

# preserve existing files from overwriting
toGeoJSON(data=quakes, overwrite=FALSE)

# convert Spatial objects
library(sp)
data(meuse)
meuse
coordinates(meuse) <- ~x+y
proj4string(meuse) <- CRS("+init=epsg:28992")
toGeoJSON(data=meuse, dest=tempdir()) # rgdal package required

crd <- coordinates(meuse)
msl <- SpatialLines(list(Lines(list(Line(crd)), "line1")), 
                    proj4string=CRS("+init=epsg:28992"))
toGeoJSON(data=msl, dest=tempdir()) # rgdal package required

data(meuse.riv)
meuse.riv

msp <- SpatialPolygons(list(Polygons(list(Polygon(meuse.riv)), 
                                     "meuse.riv")), proj4string=CRS("+init=epsg:28992"))
toGeoJSON(data=msp, dest=tempdir()) # rgdal package required
toGeoJSON(data=msp, dest='/Users/fsmoura/Documents/R-files/') # rgdal package required

# convert a shapefile (in zipped archive)
# (httr package required)
toGeoJSON(data=system.file(package="leafletR", "files", "lynx.zip"), 
          name="lynx_telemetry", dest=tempdir())

# convert a KML/KMZ file
# using name of data file and saving to working directory
# (httr package required)
toGeoJSON(system.file(package="leafletR", "files", "peak_sk.kmz"))

## End(Not run)


library(ggplot2)
library(geojsonio)
us_state <- meuse.riv
us_state
us_cities
geojson_write(us_state, 
              geometry = "polygon", 
              group = "group", 
              file = "file.geojson")
