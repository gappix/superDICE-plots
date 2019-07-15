require_package("ggplot2")
require_package("ggspatial")
require_package("ggrepel")
require_package("raster")
require_package("sf")
library(conflicted)
conflict_prefer("filter", "dplyr")

##  IMPORT REGIONS SHP        -------------------------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



ed57shp   <- st_read("qgis/shape_outfile/geo_ene57/geo_ene57.shp")        %>% rename(n= REG_NAME) %>% mutate(region_key = paste0("enerdata56_",n))
ed35shp   <- st_read("qgis/shape_outfile/geo_ene35/geo_ene35.shp")        %>% rename(n= REG_NAME) %>% mutate(region_key = paste0("enerdata35_",n))
wt17shp   <- st_read("qgis/shape_outfile/geo_witch17/geo_witch17.shp")    %>% rename(n= REG_NAME) %>%  mutate(n = tolower(n)) %>% mutate(region_key = paste0("witch17_",n))
r5shp     <- st_read("qgis/shape_outfile/geo_r5/geo_r5.shp")              %>% rename(n= REG_NAME) %>%  mutate(n = tolower(n)) %>% mutate(region_key = paste0("r5_",n))
global1shp <- st_read("qgis/shape_outfile/geo_global1/geo_global1.shp")   %>% rename(n= REG_NAME) %>% mutate(region_key = paste0("global_",n))


shp_data = rbind(ed57shp,ed35shp,wt17shp,r5shp,global1shp)

#......................................

write.csv(shp_data, paste0(output_dir,"//","n_geopoints_bridge.csv"), row.names = FALSE)













##  < MIU NONCOOP MAP > MITIGATION at set time with different regions      -----------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




dam_pal <- (RColorBrewer::brewer.pal(9, "OrRd"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys



# min/max scale: noncoop the maximum gap? 
max_data = 1.2 # max((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)
min_data = 0 # ((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)

my_year = 2200


#::::::::::::::::   ENERDATA 57  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed57shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("57 regions - Scenario CBA noncoop ")



#::::::::::::::::   ENERDATA 35  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed35shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("35 regions - Scenario CBA noncoop ")




#::::::::::::::::   WITCH 17  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  wt17shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("17 regions - Scenario CBA noncoop ")




#::::::::::::::::   R5  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  r5shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("5 regions - Scenario CBA noncoop ")




#::::::::::::::::   GLOBAL1  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  global1shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("1 region - Scenario CBA noncoop ")





##  < MIU DISTRIBUTION MAP > COOP NEGISHI MITIGATION at set time with different regions      ------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




dam_pal <- (RColorBrewer::brewer.pal(9, "OrRd"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys



# min/max scale: noncoop the maximum gap? 
max_data = 1.2 # max((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)
min_data = 0 # ((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)

my_year = 2100


#::::::::::::::::   ENERDATA 57  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed57shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("57 regions - Scenario CBA coopngsw ")



#::::::::::::::::   ENERDATA 35  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$enerdata35$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed35shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("35 regions - Scenario CBA coopngsw ")




#::::::::::::::::   WITCH 17  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$witch17$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  wt17shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("17 regions - Scenario CBA coopngsw ")




#::::::::::::::::   R5  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$r5$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  r5shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("5 regions - Scenario CBA coopngsw ")




#::::::::::::::::   GLOBAL1  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$global$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  global1shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("1 region - Scenario CBA coopngsw ")


















##  < MIU DISTRIBUTION MAP > COOP POPULATION MITIGATION at set time with different regions      --------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




dam_pal <- (RColorBrewer::brewer.pal(9, "OrRd"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys



# min/max scale: noncoop the maximum gap? 
max_data = 1.2 # max((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)
min_data = 0 # ((REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_Variable_nty("DAMFRAC")  %>% filter( year == 2100))$value)

my_year = 2200


#::::::::::::::::   ENERDATA 57  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed57shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("57 regions - Scenario CBA coop pop ")



#::::::::::::::::   ENERDATA 35  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$enerdata35$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  ed35shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("35 regions - Scenario CBA coop pop ")




#::::::::::::::::   WITCH 17  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$witch17$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  wt17shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("17 regions - Scenario CBA coop pop ")




#::::::::::::::::   R5  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$r5$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  r5shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("5 regions - Scenario CBA coop pop ")




#::::::::::::::::   GLOBAL1  ::::::::::::::::::::

my_data = TBDexp$kaliPUMICE$global$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% filter( year == my_year)


# plot 
ggplot() +
  geom_sf(data =  merge(  global1shp,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
  ) +
  labs (fill = paste0("Mitigation in ", my_year," [%BAU_Emissions]")) + 
  ggtitle("1 region - Scenario CBA coop pop ")









































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





