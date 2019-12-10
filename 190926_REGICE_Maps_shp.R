require_package("ggplot2")
require_package("ggspatial")
require_package("ggrepel")
require_package("raster")
require_package("sf")



##  IMPORT REGIONS SHP        -------------------------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



ed57shp   <- st_read("qgis/shape_outfile/geo_ene57/geo_ene57.shp")        %>% rename(n= REG_NAME)
ed35shp   <- st_read("qgis/shape_outfile/geo_ene35/geo_ene35.shp")        %>% rename(n= REG_NAME)
wt17shp   <- st_read("qgis/shape_outfile/geo_witch17/geo_witch17.shp")    %>% rename(n= REG_NAME)
r5shp     <- st_read("qgis/shape_outfile/geo_r5/geo_r5.shp")              %>% rename(n= REG_NAME)
globalshp <- st_read("qgis/shape_outfile/geo_global1/geo_global1.shp")    %>% rename(n= REG_NAME)



##    DAMAGES DISTRIBUTED  DIFFERENT BURKES IN 2100 - COOP COMPARED      ---------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




dam_pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys



# min/max scale: noncoop the maximum gap? 
max_data = max((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)
min_data = min((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)



#::::::::::::::::   COOP NEGISHI  ::::::::::::::::::::

my_data = REGICEexp$kaliQUARTZ$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC") %>% filter( year == 2100)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed57shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,breaks=c(-0.4,-0.2,0,0.2,0.4)
                       ,labels=c(-0.4,-0.2,0,0.2,0.4)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data))) #symmetric scale (0 in the middle)
  ) +
  labs (fill = "Damages [%GDP] \nin 2100 ") + 
  ggtitle("Scenario coop Negishi - Burke SR")



#::::::::::::::::   COOP POP  ::::::::::::::::::::

my_data = REGICEexp$kaliQUARTZ$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC") %>% filter( year == 2100)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed57shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,breaks=c(-0.4,-0.2,0,0.2,0.4)
                       ,labels=c(-0.4,-0.2,0,0.2,0.4)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data))) #symmetric scale (0 in the middle)
  ) +
  labs (fill = "Damages in 2100 [%GDP]") + 
  ggtitle("Scenario coop Population - Burke SR")




#::::::::::::::::   NONCOOP  ::::::::::::::::::::

my_data = REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC") %>% filter( year == 2100)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed57shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                        ,breaks=c(-0.4,-0.2,0,0.2,0.4)
                       ,labels=c(-0.4,-0.2,0,0.2,0.4)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data))) #symmetric scale (0 in the middle)
  ) +
  labs (fill = "Damages in 2100 [%GDP]") + 
  ggtitle("Scenario noncoop - Burke SR")




##    DAMAGES DISTRIBUTED -  DIFFERENT REGIONS    ------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




dam_pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys



# min/max scale: 57r the maximum gap? 
max_data = max((REGICEexp$kaliQUARTZ$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)
min_data = min((REGICEexp$kaliQUARTZ$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)



#::::::::::::::::   ED57   ::::::::::::::::::::

my_data = REGICEexp$kaliQUARTZ$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC") %>% filter( year == 2100)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed57shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,breaks=c(-0.4,-0.2,0,0.2,0.4)
                       ,labels=c(-0.4,-0.2,0,0.2,0.4)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data))) #symmetric scale (0 in the middle)
  ) +
  labs (fill = "Damages in 2100 \n[%GDP]") + 
  ggtitle("57 Regions")


#::::::::::::::::   WITCH17   ::::::::::::::::::::

my_data = REGICEexp$kaliQUARTZ$witch17$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC") %>% filter( year == 2100)


# plot 
ggplot() +
  geom_sf(data =  merge(  witch17shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,breaks=c(-0.4,-0.2,0,0.2,0.4)
                       ,labels=c(-0.4,-0.2,0,0.2,0.4)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data))) #symmetric scale (0 in the middle)
  ) +
  labs (fill = "Damages in 2100 \n[%GDP]") + 
  ggtitle("17 Regions")


#::::::::::::::::   R5   ::::::::::::::::::::

my_data = REGICEexp$kaliQUARTZ$r5$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC") %>% filter( year == 2100)


# plot 
ggplot() +
  geom_sf(data =  merge(  r5shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,breaks=c(-0.4,-0.2,0,0.2,0.4)
                       ,labels=c(-0.4,-0.2,0,0.2,0.4)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data))) #symmetric scale (0 in the middle)
  ) +
  labs (fill = "Damages in 2100 \n[%GDP]") + 
  ggtitle("5 Regions")



#::::::::::::::::   global   ::::::::::::::::::::

my_data = REGICEexp$kaliQUARTZ$global$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC") %>% filter( year == 2100)


# plot 
ggplot() +
  geom_sf(data =  merge(  globalshp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,breaks=c(-0.4,-0.2,0,0.2,0.4)
                       ,labels=c(-0.4,-0.2,0,0.2,0.4)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data))) #symmetric scale (0 in the middle)
  ) +
  labs (fill = "Damages in 2100 \n[%GDP]") + 
  ggtitle("1 Regions")





