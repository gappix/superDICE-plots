source("30_sDC_experiments_central_storage.R")
require_package("ggplot2")
require_package("ggspatial")
require_package("ggrepel")
require_package("raster")
require_package("sf")


# Get the Enerdata56 shape
ed57_shp <- st_read("qgis/shape_outfile/geo_ene57/geo_ene57.shp") %>% rename(n= REG_NAME)

pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))


my_Scen = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == 2200)






daaaai = merge(ed57_shp, my_Scen, by = c("n") )





ggplot() +
  geom_sf(data=daaaai) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = pal, 
                       breaks=c(-1,0,1),
                       labels=c(-1,0,1),
                       limits=c(-1,1))


scale_fill_viridis_c(option = "cividis" , trans = "sqrt")




  theme(panel.grid.major = element_line(color = "white")) +
  scale_colour_gradientn(colors = terrain.colors(20))
  geom_sf(fill = NA) +
  geom_sf(data = IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKELR$polCBA$get_CUML_ABATECOST_perc_iso3(end_year = 2100), 
          aes(color = value)) +
  scale_color_gradientn(colors = pal)
