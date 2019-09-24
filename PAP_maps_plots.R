require_package("ggplot2")
require_package("ggspatial")
require_package("ggrepel")
require_package("raster")
require_package("sf")
require_package("conflicted")
conflict_prefer("filter", "dplyr")

##---------:  IMPORT REGIONS SHP   :-------------------------------------------------------------------------------------------------



ed57shp   <- st_read("qgis/shape_outfile/geo_ene57/geo_ene57.shp")        %>% rename(n= REG_NAME) %>% mutate(region_key = paste0("ed57_",n))
ed35shp   <- st_read("qgis/shape_outfile/geo_ene35/geo_ene35.shp")        %>% rename(n= REG_NAME) %>% mutate(region_key = paste0("ed3_",n))
wt17shp   <- st_read("qgis/shape_outfile/geo_witch17/geo_witch17.shp")    %>% rename(n= REG_NAME) %>% mutate(n = tolower(n)) %>% mutate(region_key = paste0("witch17_",n))
r5shp     <- st_read("qgis/shape_outfile/geo_r5/geo_r5.shp")              %>% rename(n= REG_NAME) %>% mutate(n = tolower(n)) %>% mutate(region_key = paste0("r5_",n))
global1shp <- st_read("qgis/shape_outfile/geo_global1/geo_global1.shp")   %>% rename(n= REG_NAME) %>% mutate(region_key = paste0("global_",n))


# shp_data = rbind(ed57shp,ed35shp,wt17shp,r5shp,global1shp)
# 
# #......................................
# 
# write.csv(shp_data, paste0(output_dir,"//","n_geopoints_bridge.csv"), row.names = FALSE)
# 



## --------- DAMAGES in 2100 BURKE SR:------------

myyear = 2100

my_data_coop     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_noncoop  = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_coopngsw = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)



# coop 

RICEx.plot.map(
   myshape = ed57shp                
  ,mydata =  my_data_coop
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SR coop Scenario - Damages"
)


# coop negishi


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_coopngsw
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Damages"
)


# noncoop


RICEx.plot.map(
   myshape = ed57shp                
  ,mydata =  my_data_noncoop
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SR noncoop Scenario - Damages"
)




## --------- MIU in 2100 BURKE SR:------------

myyear = 2100

my_data_coop     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_noncoop  = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_coopngsw = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)



# coop 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_coop
  
  ,mypalette = (RColorBrewer::brewer.pal(9, "Greens")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2 #max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0  # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SR coop Scenario - Abatement"
)


# coop negishi


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_coopngsw
  
  ,mypalette = (RColorBrewer::brewer.pal(9, "Greens")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2 #max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0  # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Abatement"
)

# noncoop



RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_noncoop
  
  ,mypalette = (RColorBrewer::brewer.pal(9, "Greens")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2 #max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0  # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SR noncoop Scenario - Abatement"
)











## --------- < DAMAGES in 2100 > COOP VARYING BURKE TYPE :------------

myyear = 2100

my_data_SR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_SRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_LR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_LRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)




# SR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SR
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.4  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.4 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SR coop Scenario - Damages"
)



# SR diff

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SRdiff
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.4  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.4 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SRdiff coop Scenario - Damages"
)



# LR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LR
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.4  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.4 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke LR coop Scenario - Damages"
)

# LRdiff

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LRdiff
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.4  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.4 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke LRdiff coop Scenario - Damages"
)








## ---------- < MIU in 2100 > COOP VARYNG BURKE TYPE ------------------------------


myyear = 2100

my_data_SR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_SRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_LR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_LRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)




# SR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SR coop Scenario - Abatements"
)



# SR diff


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SRdiff coop Scenario - Abatements"
)




# LR 


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke LR coop Scenario - Abatements"
)



# LRdiff


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke LRdiff coop Scenario - Abatements"
)















## --------- < DAMAGES in 2100 > NONCOOP VARYING BURKE TYPE :------------

myyear = 2100

my_data_SR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_SRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_LR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_LRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)




# SR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SR
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SR noncoop Scenario - Damages"
)



# SR diff

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SRdiff
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SRdiff noncoop Scenario - Damages"
)



# LR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LR
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke LR noncoop Scenario - Damages"
)

# LRdiff

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LRdiff
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke LRdiff noncoop Scenario - Damages"
)







## ---------- < MIU in 2100 > NONCOOP VARYNG BURKE TYPE ------------------------------


myyear = 2100

my_data_SR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_SRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_LR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_LRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)




# SR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SR coop Scenario - Abatements"
)



# SR diff


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SRdiff coop Scenario - Abatements"
)




# LR 


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke LR coop Scenario - Abatements"
)



# LRdiff


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke LRdiff coop Scenario - Abatements"
)








## --------- < DAMAGES in 2100 > COOP NEGISHI VARYING BURKE TYPE :------------

myyear = 2100

my_data_SR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_SRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_LR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)
my_data_LRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_nty("DAMFRAC") %>% filter(year == myyear)




# SR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SR
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Damages"
)



# SR diff

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SRdiff
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke SRdiff coop Negishi Scenario - Damages"
)



# LR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LR
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke LR coop Negishi Scenario - Damages"
)

# LRdiff

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LRdiff
  
  ,mypalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 0.6  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = -0.6 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Damages in ", myyear, "\n[%GDP]")
  ,mytitle   = "Burke LRdiff coop Negishi Scenario - Damages"
)



## ---------- < MIU in 2100 > COOP NEGISHI VARYNG BURKE TYPE ------------------------------


myyear = 2100

my_data_SR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_SRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_LR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)
my_data_LRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_nty("MIU") %>% filter(year == myyear)




# SR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Abatements"
)



# SR diff


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke SRdiff coop Negishi Scenario - Abatements"
)




# LR 


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke LR coop Negishi Scenario - Abatements"
)



# LRdiff


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = 1.2  # max(my_data_noncoop$value, -min(my_data_noncoop$value))
  ,min_data  = 0 # min(my_data_noncoop$value)
  ,mylegend  = paste0("Abatements in ", myyear, "\n[%BAU]")
  ,mytitle   = "Burke LRdiff coop Negishi Scenario - Abatements"
)





## ---------- < MIU in 2100 > COOP NEGISHI VARYNG BURKE TYPE ------------------------------


myyear = 2100

my_data_SR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_nty("E") %>% filter(year == myyear)
my_data_SRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_nty("E") %>% filter(year == myyear)
my_data_LR      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_nty("E") %>% filter(year == myyear)
my_data_LRdiff  = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_nty("E") %>% filter(year == myyear)




# SR 

RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = max(my_data_SR$value, -min(my_data_LRdiff$value))
  ,min_data  = min(my_data_LRdiff$value)
  ,mylegend  = paste0("Local Temperatures in ", myyear, "\n[°C]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Temperatures"
)



# SR diff



RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_SRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = max(my_data_SR$value, -min(my_data_LRdiff$value))
  ,min_data  = min(my_data_LRdiff$value)
  ,mylegend  = paste0("Local Temperatures in ", myyear, "\n[°C]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Temperatures"
)




# LR 



RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LR
  
  ,mypalette = RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = max(my_data_SR$value, -min(my_data_LRdiff$value))
  ,min_data  = min(my_data_LRdiff$value)
  ,mylegend  = paste0("Local Temperatures in ", myyear, "\n[°C]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Temperatures"
)




# LRdiff


RICEx.plot.map(
  myshape = ed57shp                
  ,mydata =  my_data_LRdiff
  
  ,mypalette = RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,max_data  = max(my_data_SR$value, -min(my_data_LRdiff$value))
  ,min_data  = min(my_data_LRdiff$value)
  ,mylegend  = paste0("Local Temperatures in ", myyear, "\n[°C]")
  ,mytitle   = "Burke SR coop Negishi Scenario - Temperatures"
)




