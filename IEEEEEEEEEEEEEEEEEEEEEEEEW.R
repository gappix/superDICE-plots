require_package("ggplot2")
require_package("ggspatial")
require_package("ggrepel")
require_package("raster")
require_package("sf")

ed56 <- st_read("../qgis/geo_ene56/geo_ene56.shp") %>% rename(n= REG_NAME)




## TEMPERATURE and EMISSIONS compared  ----------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::





plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "burkeSR noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "burkeSR coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "burkeSR coop pop"),
            size = 1.4) + 
  
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damDICEreg$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "DICEreg noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damDICEreg$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "DICEreg coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damDICEreg$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "DICEreg coop pop"),
            size = 1.4) + 
  
  
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                  "#ff5e24",
                                  "orange",
                                  "#b50000",
                                 
                                 
                                 "#0094b5",
                                 
                          "#0ccfab",
                                 "blue",
                             
                                    "#4a4a4a",
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Emissions profiles compared") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat



plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_Variable_ty(variable_name = "TATM") %>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_Variable_ty("TATM")%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "burkeSR noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_Variable_ty("TATM")%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "burkeSR coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Variable_ty("TATM")%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "burkeSR coop pop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damDICEreg$polCBA$get_Variable_ty("TATM")%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "DICEreg noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damDICEreg$polCBA$get_Variable_ty("TATM")%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "DICEreg coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damDICEreg$polCBA$get_Variable_ty("TATM")%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "DICEreg coop pop"),
            size = 1.4) + 
  
  
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#ff5e24",
                                 "orange",
                                 "#b50000",
                                 
                                 
                                 "#0094b5",
                                 
                                 "#0ccfab",
                                 "blue",
                                 
                                 "#4a4a4a",
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Temperature profiles compared") + 
  xlab("Year") +
  ylab("Atmosphere temperature increase [ºC]")  ; plottigat












## CUMULATED EMISSIONS ----------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::





plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR coop pop"),
            size = 1.4) + 
  
  
  
  
  # graphic detail
  scale_color_manual(values = c( "black", "orange",  "#32c738",  "#450094","#4a4a4a",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 "#cf0cb2",
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "scenario") + 
  ggtitle("Cumulative Emissions") + 
  xlab("Year") +
  ylab("Cumulative Emissions [GtCO2]")  ; plottigat


# 
# emiperc = merge(IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_CUML_EMISSIONS_abs_n(end_year=2100) %>% rename(emi = value),
# IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_CUML5y_Variable_n(variable_name = "YGROSS")  %>% rename(ygross = value),
# by = "n") %>% mutate(value = emi/ygross) %>% dplyr::select(n,value)
# 
# 
# 




#highscale is for non coop scenario
maxemivalue = max(IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_CUML_EMISSIONS_abs_n(end_year = 2100)$value)

emi_pal <- (RColorBrewer::brewer.pal(9, "OrRd"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys


my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Emissions_nty %>% dplyr::filter(year==2200)

max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_Emissions_nty %>% dplyr::filter(year==2200))$value)
min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Emissions_nty %>% dplyr::filter(year==2200))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = emi_pal
                        # ,breaks=c(-1,0,1)
                        # ,labels=c(-1,0,1)
                        ,limits=c(min_data,max_data)
                       ) +
  labs (fill = "GtCO2") + 
  ggtitle("Emissions in 2100 noncoop")



## DAMAGES DISTRIBUTED  2100-----------------------------------------------------


dam_pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys


my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)

max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 noncoop")





my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)

max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 noncoop")



my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)

max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 coop negishi")




my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damDICEreg$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 DICEreg noncoop")





## DAMAGES DISTRIBUTED  2200-----------------------------------------------------


dam_pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys


my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200)

max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200))$value)
min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2200 noncoop")





my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200)

# max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200))$value)
# min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2200 coop pop")


##

my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200)

# max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200))$value)
# min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2200 coop negishi")




my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damDICEreg$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2200)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2200 DICEreg noncoop")


## ABATECOSTS distributed -------------------------------



plottigat= ggplot() + 
  
  
  # Scenario
  # geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_CUMLn_Variable_y("ABATECOST"),
  #           aes(x=year, y=value, group=1, color = "BAU"),
  #           size = 1.4) + 
  # 
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUMLn_Variable_y("ABATECOST") %>% dplyr::filter(year<2200),
            aes(x=year, y=value, group=1, color = "burkeSR noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_CUMLn_Variable_y("ABATECOST") %>% dplyr::filter(year<2200),
            aes(x=year, y=value, group=1, color = "burkeSR coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUMLn_Variable_y("ABATECOST") %>% dplyr::filter(year<2200),
            aes(x=year, y=value, group=1, color = "burkeSR coop pop"),
            size = 1.4) + 
  
  
  
  
  # graphic detail
  scale_color_manual(values = c(  "orange",  "#32c738",  "#450094","#4a4a4a",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 "#cf0cb2",
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Abatement Costs World") + 
  xlab("Year") +
  ylab("Abatement Costs [Trill $]")  ; plottigat







abat_pal <- (RColorBrewer::brewer.pal(9, "Purples"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys


## noncoop


my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_ABATECOST_perc_n(end_year = 2100)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = (RColorBrewer::brewer.pal(9, "Purples"))
                        # ,breaks=c(-1,0,1)
                        # ,labels=c(-1,0,1)
                       # ,limits=c(min_data,max_data)
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated abatecosts by 2100 noncoop")



#coop pop 

my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_ABATECOST_perc_n(end_year = 2100)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = (RColorBrewer::brewer.pal(9, "Greens"))
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       # ,limits=c(min_data,max_data)
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated abatecosts by 2100 coop pop")


#coop ngsw



my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_CUML_ABATECOST_perc_n(end_year = 2100)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = (RColorBrewer::brewer.pal(9, "OrRd"))
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       # ,limits=c(min_data,max_data)
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated abatecosts by 2100 coop negishi")






#####




plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= ,
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR coop pop"),
            size = 1.4) + 
  
  
  




dataaaa = plotdata2$value

ggplot() +
  geom_sf(data=daaaai) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = pal, 
                       breaks=c(-1,0,1),
                       labels=c(-1,0,1),
                       limits=c(-1,1))


# SETUP EACH PLOT :::::::::


### 1


sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "enerdata30"
sDCworld$attribute = "value"



plot1 <- sDCworld


### 2

my_Scenario = IEWexp$kaliBASALT$witch17$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "witch17"
sDCworld$attribute = "value"



plot2 <- sDCworld



### 3

my_Scenario = IEWexp$kaliBASALT$r5$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "r5"
sDCworld$attribute = "value"



plot3 <- sDCworld



### 4
my_Scenario = IEWexp$kaliBASALT$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "global"
sDCworld$attribute = "value"



plot4 <- sDCworld



# ADD PLOTS TO LIST :::::::::


plot_this_list = list()

plot_this_list$elements$plot1  <- plot1
plot_this_list$elements$plot2  <- plot2
plot_this_list$elements$plot3  <- plot3
plot_this_list$elements$plot4  <- plot4



plot_this_list$title    <- "Abatement costs up to  2100 [%cumulated GDP] according to different regional detail" 
plot_this_list$palette  <- "OrRd"




# COLORS AND CATS ::::::::::::::

# extract data
dataaaa = 0
for(p in plot_this_list$elements){ dataaaa = c(dataaaa, p$data[[p$attribute]])  }

# evaluate colors

plot_this_list$class_colors <- map.normal.color(dataaaa, 
                                                pal_choice = plot_this_list$palette,
                                                reverse = FALSE)
# plot_this_list$class_colors <- diverge.color( dataaaa, 
#                                               pal_choice = plot_this_list$palette,  
#                                               reverse = TRUE, 
#                                               centeredOn = 0)
# assign
plot_this_list$colorpalette = plot_this_list$class_colors[[2]]
plot_this_list$catMethod    = plot_this_list$class_colors[[1]][["brks"]]


# PLOT IT   ::::::::::::::::::

multiple_map_plotter(plot_this_list)


#__________________________________ END MULTIPLE PLOT __________________________________________
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::






















## ABATE COSTS UNDER DIFFERENT BURKE ---------------------------------

max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)


dam_pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys




my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 Burke SR noncoop")





##

my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELR$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)



ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 Burke LR noncoop")



##

my_data = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESRdiff$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)



ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 Burke SR diff ")




##

my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKELRdiff$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 Burke LR diff ")











##  EMISSIONS UNDER DIFFERENT BURKE ---------------------------------



##noncoop

plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR diff "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELR$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR diff "),
            size = 1.4) +
  

  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 "blue",
                                 
                                 "#ff5e24",
                                
                                 
                                 "#4a4a4a",
                                 "#8232c7",
                             
                                 "#d64cf5",
                                 
                                 "#0ccfab",
                                 
                                 "#9c4317", 
                                 "#b50000",
                                  "#046918",
                                     "#0ccfab",
                              
                                 "blue",
                                 
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 
                                  
                                 
                                 "blue",
                                 
                                 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                             
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ylim(-10, 82)+
  ggtitle("Emissions profiles compared - noncoop") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat






##coop

plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKESRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR diff "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKELR$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKELRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR diff "),
            size = 1.4) +
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 "blue",
                                 
                                 "#ff5e24",
                                 
                                 
                                 "#4a4a4a",
                                 "#8232c7",
                                 
                                 "#d64cf5",
                                 
                                 "#0ccfab",
                                 
                                 "#9c4317", 
                                 "#b50000",
                                 "#046918",
                                 "#0ccfab",
                                 
                                 "blue",
                                 
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 
                                 
                                 
                                 "blue",
                                 
                                 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Emissions profiles compared - coop pop") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat



##coop

plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR diff "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKELR$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR "),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKELRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR diff "),
            size = 1.4) +
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 "blue",
                                 
                                 "#ff5e24",
                                 
                                 
                                 "#4a4a4a",
                                 "#8232c7",
                                 
                                 "#d64cf5",
                                 
                                 "#0ccfab",
                                 
                                 "#9c4317", 
                                 "#b50000",
                                 "#046918",
                                 "#0ccfab",
                                 
                                 "blue",
                                 
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 
                                 
                                 
                                 "blue",
                                 
                                 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Emissions profiles compared - coop negishi") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat

##  EMISSIONS UNDER DIFFERENT BURKE ---------------------------------




plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR noncoop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR coop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR coopnegishi"),
            size = 1.4) +
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#ff5e24",
                                 "orange",
                                 "#b50000",
                                 
                                 
                                 "#0094b5",
                                 
                                 "#0ccfab",
                                 "blue",
                                 
                                 "#4a4a4a",
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Emissions profiles compared") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat




##

plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELR$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR noncoop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKELR$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR coop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKELR$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR coopnegishi"),
            size = 1.4) +
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#ff5e24",
                                 "orange",
                                 "#b50000",
                                 
                                 
                                 "#0094b5",
                                 
                                 "#0ccfab",
                                 "blue",
                                 
                                 "#4a4a4a",
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Emissions profiles compared") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat





##



plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR diff noncoop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKESRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke SR diff coop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BurkeSR diff coopnegishi"),
            size = 1.4) +
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#ff5e24",
                                 "orange",
                                 "#b50000",
                                 
                                 
                                 "#0094b5",
                                 
                                 "#0ccfab",
                                 "blue",
                                 
                                 "#4a4a4a",
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Emissions profiles compared") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat


##


plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR diff noncoop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKELRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR diff coop"),
            size = 1.4) +
  
  geom_line(data=  IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKELRdiff$polCBA$get_WORLD_EmissionsTOT_ty%>% dplyr::filter(year<=2200),
            aes(x=year, y=value, group=1, color = "Burke LR diff coopnegishi"),
            size = 1.4) +
  
  
  # graphic detail
  scale_color_manual(values = c( "black",
                                 
                                 "#ff5e24",
                                 "orange",
                                 "#b50000",
                                 
                                 
                                 "#0094b5",
                                 
                                 "#0ccfab",
                                 "blue",
                                 
                                 "#4a4a4a",
                                 "#32c738",  "#450094",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "Scenario") + 
  ggtitle("Emissions profiles compared") + 
  xlab("Year") +
  ylab("Emissions [GtCO2/year]")  ; plottigat






## LOCAL TEMPERATURE  ----------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


myBT= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_Variable_nty(variable_name = "T_LOCAL") %>% 
  dplyr::filter(year==2015) %>% dplyr::select(n,value) %>% rename(tbase = value)


plottigat= ggplot() + 
  
  
  # Scenario
  geom_line(data= merge(myBT, IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_Variable_nty(variable_name = "T_LOCAL"),
                        by = c("n")) %>% mutate(tdiff = value - tbase),
            aes(x=year, y=tdiff, group=1, color = "BAU"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR noncoop"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR coop negishi"),
            size = 1.4) + 
  
  
  geom_line(data= IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "CCO2E"),
            aes(x=year, y=value, group=1, color = "burkeSR coop pop"),
            size = 1.4) + 
  
  
  
  
  # graphic detail
  scale_color_manual(values = c( "black", "orange",  "#32c738",  "#450094","#4a4a4a",
                                 
                                 #greens
                                 
                                 "#046918",
                                 "#8232c7", 
                                 
                                 "blue",
                                 
                                 "#f77f2f", 
                                 
                                 
                                 "#c4570e",
                                 "#4cf5d6" , 
                                 
                                 
                                 "#0ccfab",
                                 "#d64cf5", 
                                 "#cf0cb2",
                                 "#9c4317", 
                                 "#9c1717"
                                 
                                 
  )) +
  labs (color= "scenario") + 
  ggtitle("Cumulative Emissions") + 
  xlab("Year") +
  ylab("Cumulative Emissions [GtCO2]")  ; plottigat





# 
# emiperc = merge(IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_CUML_EMISSIONS_abs_n(end_year=2100) %>% rename(emi = value),
# IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_CUML5y_Variable_n(variable_name = "YGROSS")  %>% rename(ygross = value),
# by = "n") %>% mutate(value = emi/ygross) %>% dplyr::select(n,value)
# 
# 
# 



tlocal_pal <- (RColorBrewer::brewer.pal(9, "OrRd"))
tlocalabs_pal  <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys

temp_local_bau = merge(myBT, IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_Variable_nty(variable_name = "T_LOCAL"),
                        by = c("n")) %>% mutate(tdiff = value - tbase) %>% dplyr::filter(year.y==2100) %>% dplyr::select(n,tdiff)

temp_local_noncoop = merge(myBT, IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "T_LOCAL"),
                      by = c("n")) %>% mutate(tdiff = value - tbase) %>% dplyr::filter(year.y==2100) %>% dplyr::select(n,tdiff)

temp_local_coop = merge(myBT, IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "T_LOCAL"),
                        by = c("n")) %>% mutate(tdiff = value - tbase) %>% dplyr::filter(year.y==2100) %>% dplyr::select(n,tdiff)

temp_local_coopngsw = merge(myBT, IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "T_LOCAL"),
                        by = c("n")) %>% mutate(tdiff = value - tbase) %>% dplyr::filter(year.y==2100) %>% dplyr::select(n,tdiff)


max_data = max(temp_local_bau$tdiff)
max_abs_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_Variable_nty(variable_name = "T_LOCAL")%>% dplyr::filter(year==2100))$value)
min_abs_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damOFF$polBAU$get_Variable_nty(variable_name = "T_LOCAL")%>% dplyr::filter(year==2100))$value)


## BAU

ggplot() +
  geom_sf(data =  merge(  ed56,
                          temp_local_bau,
                          by =c("n"))) + 
  aes(fill = tdiff) + 
  scale_fill_gradientn(colors = tlocal_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(0,max_data)
  ) +
  labs (fill = "+ºC") + 
  ggtitle("Local temperature increase in 2015-2100 BAU")






ggplot() +
  geom_sf(data =  merge(  ed56,
                          IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_Variable_nty(variable_name = "T_LOCAL")%>% dplyr::filter(year==2100),
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = tlocalabs_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(6,max_abs_data)
  ) +
  labs (fill = "ºC") + 
  ggtitle("Local temperature in 2100 BAU")




## NONCOOP

ggplot() +
  geom_sf(data =  merge(  ed56,
                          temp_local_noncoop,
                          by =c("n"))) + 
  aes(fill = tdiff) + 
  scale_fill_gradientn(colors = tlocal_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(0,max_data)
  ) +
  labs (fill = "+ºC") + 
  ggtitle("Local temperature increase in 2015-2100 noncoop Burke SR")






ggplot() +
  geom_sf(data =  merge(  ed56,
                          IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "T_LOCAL")%>% dplyr::filter(year==2100),
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = tlocalabs_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(6,max_abs_data)
  ) +
  labs (fill = "ºC") + 
  ggtitle("Local temperature in 2100 noncoop Burke SR")



##  COOP

ggplot() +
  geom_sf(data =  merge(  ed56,
                          temp_local_coop,
                          by =c("n"))) + 
  aes(fill = tdiff) + 
  scale_fill_gradientn(colors = tlocal_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(0,max_data)
  ) +
  labs (fill = "+ºC") + 
  ggtitle("Local temperature increase in 2015-2100 coop pop Burke SR")






ggplot() +
  geom_sf(data =  merge(  ed56,
                          IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "T_LOCAL")%>% dplyr::filter(year==2100),
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = tlocalabs_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(6,max_abs_data)
  ) +
  labs (fill = "ºC") + 
  ggtitle("Local temperature in 2100 coop pop Burke SR")




##  COOP

ggplot() +
  geom_sf(data =  merge(  ed56,
                          temp_local_coopngsw,
                          by =c("n"))) + 
  aes(fill = tdiff) + 
  scale_fill_gradientn(colors = tlocal_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(0,max_data)
  ) +
  labs (fill = "+ºC") + 
  ggtitle("Local temperature increase in 2015-2100 coop negishi Burke SR")






ggplot() +
  geom_sf(data =  merge(  ed56,
                          IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_Variable_nty(variable_name = "T_LOCAL")%>% dplyr::filter(year==2100),
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = tlocalabs_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(6,max_abs_data)
  ) +
  labs (fill = "ºC") + 
  ggtitle("Local temperature in 2100 coop negishi Burke SR")



## DAMAGES DISTRIBUTED  DIFFERENT BURKES 2100-----------------------------------------------------


dam_pal <- rev(RColorBrewer::brewer.pal(9, "RdBu"))
#RdBu  OrRd  PuBu  Greens RdPu Purples  Greys


my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)

max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKELR$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 coop negishi - Burke SR")





my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKELR$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)

# max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
# min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 coop negishi  - Burke LR")



my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESRdiff$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)

# max_data = max((IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
# min_data = min((IEWexp$kaliBASALT$enerdata56$ssp2$coop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100))$value)
# 

ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 coop negishi  - Burke SR diff")




my_data = IEWexp$kaliBASALT$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKELRdiff$polCBA$get_CUML_DAMAGES_perc_n(end_year = 2100)


ggplot() +
  geom_sf(data =  merge(  ed56,
                          my_data,
                          by =c("n"))) + 
  aes(fill = value) + 
  scale_fill_gradientn(colors = dam_pal
                       # ,breaks=c(-1,0,1)
                       # ,labels=c(-1,0,1)
                       ,limits=c(min(c(min_data, -max_data)),max(max_data, abs(min_data)))
  ) +
  labs (fill = "[%cumGDP]") + 
  ggtitle("Cumulated damages by 2100 coop negishi  - Burke LR diff")






