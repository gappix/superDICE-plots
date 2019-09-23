require_package("ggplot2")
require_package("ggspatial")
require_package("ggrepel")
require_package("raster")
require_package("sf")



##  IMPORT REGIONS SHP        -------------------------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



ed57shp   <- st_read("qgis/shape_outfile/geo_ene57/geo_ene57.shp")        %>% rename(n= REG_NAME)
ed35shp   <- st_read("qgis/shape_outfile/geo_ene35/geo_ene35.shp")        %>% rename(n= REG_NAME)
wt17shp   <- st_read("qgis/shape_outfile/geo_witch17/geo_witch17.shp")  %>% rename(n= REG_NAME)
r5shp     <- st_read("qgis/shape_outfile/geo_r5/geo_r5.shp")     %>% mutate(REG_NAME = tolower(REG_NAME))   %>% rename(n= REG_NAME)
globalshp <- st_read("qgis/shape_outfile/geo_global1/geo_global1.shp")    %>% rename(n= REG_NAME)



##    DAMAGES DISTRIBUTED  DIFFERENT BURKES IN 2100 - COOP COMPARED      ---------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




dam_pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys



# plot 
ggplot() +
  geom_sf(data =  ed57shp) + 
  aes(fill = n) +
  scale_fill_manual(values= colorize_regions("ed57") ) + 
  ggtitle("Global1 regions")

