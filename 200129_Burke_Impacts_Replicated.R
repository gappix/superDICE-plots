#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
#  BURKE COMPARISON : Focus on damages
#  
#  Are our Damages in line with Burke et al. 2015 Paper? 
# 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

invisible(source("RICEx_plots/RICEx_plots.R"))





## -----------------   EXPERIMENTS   -----------------------------------

# Retrieve experiments fom automated procedure


PPstory3 = list()
PPstory3 = experiments_load_as_list(PPstory3,"PPstory3")

PPstory4 = list()
PPstory4 = experiments_load_as_list(PPstory4,"PPstory4")


TBurke = list()
TBurke = experiments_load_as_list(TBurke,"TBurke")




# shortcuts
PP3 = PPstory3$v1x00$OPTIM$ed57
PP3ssp2_cooppop   = PP3$ssp2$coop_pop
PP3ssp2_noncoop   = PP3$ssp2$noncoop_pop
PP3ssp2_coopngsh  = PP3$ssp2$coop_negishi

BAUdamSSP3 = PPstory4$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2
BAUdamSSP5 = PPstory4$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2






### 



GDPssp3SR     = BAUdamSSP3$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250) 
GDPssp3LR     = BAUdamSSP3$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
GDPssp3SRdiff = BAUdamSSP3$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
GDPssp3LRdiff = BAUdamSSP3$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
GDPssp3nodam  = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2250)

TATMssp3SR     = BAUdamSSP3$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250) 
TATMssp3LR     = BAUdamSSP3$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
TATMssp3SRdiff = BAUdamSSP3$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
TATMssp3LRdiff = BAUdamSSP3$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
TATMssp3nodam  = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)

GDPssp5SR     = BAUdamSSP5$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
GDPssp5LR     = BAUdamSSP5$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
GDPssp5SRdiff = BAUdamSSP5$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
GDPssp5LRdiff = BAUdamSSP5$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
GDPssp5nodam  = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2250)

TATMssp5SR     = BAUdamSSP5$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250) 
TATMssp5LR     = BAUdamSSP5$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
TATMssp5SRdiff = BAUdamSSP5$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
TATMssp5LRdiff = BAUdamSSP5$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
TATMssp5nodam  = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)



Build_Damage_DF = function(GDPdam, GDPnodam, TATMdam, Experiment = "SSP3 - BURKE SR"){
  
  ## TEST +++++++++++++++++++++++++
  # GDPdam   = GDPssp5SR
  # GDPnodam = GDPssp5nodam
  # TATMdam  = TATMssp5SR
  #++++++++++++++++++++++++++++++++
  
  BKdam = merge(GDPdam,GDPnodam, by = c("t","year")) %>% rename(YGROSSdam = value.x, YGROSSnodam = value.y) %>% mutate(BKdamage =  100 * (YGROSSdam - YGROSSnodam )/YGROSSnodam )
  
  return( merge(BKdam, TATMdam, by = c("t","year")) %>% rename(TATM = value) %>% mutate("Experiment" = Experiment ))

}


## Build dataframe


BKDF = rbind( 
         Build_Damage_DF( GDPssp5SR      ,GDPssp5nodam,  TATMssp5SR     ,"SSP5 - Burke SR"    )
       , Build_Damage_DF( GDPssp5LR      ,GDPssp5nodam,  TATMssp5LR     ,"SSP5 - Burke LR"    )
       , Build_Damage_DF( GDPssp5SRdiff  ,GDPssp5nodam,  TATMssp5SRdiff ,"SSP5 - Burke SRdiff")
       , Build_Damage_DF( GDPssp5LRdiff  ,GDPssp5nodam,  TATMssp5LRdiff ,"SSP5 - Burke LRdiff")
       
    #   , Build_Damage_DF( GDPssp3SR      ,GDPssp3nodam,  TATMssp3SR     ,"SSP3 - Burke SR"    )
    #   , Build_Damage_DF( GDPssp3LR      ,GDPssp3nodam,  TATMssp3LR     ,"SSP3 - Burke LR"    )
    #   , Build_Damage_DF( GDPssp3SRdiff  ,GDPssp3nodam,  TATMssp3SRdiff ,"SSP3 - Burke SRdiff")
    #   , Build_Damage_DF( GDPssp3LRdiff  ,GDPssp3nodam,  TATMssp3LRdiff ,"SSP3 - Burke LRdiff")
)




# Colors 



my_categories <- (BKDF %>% select(Experiment) %>% distinct)$Experiment
ncolors = length(my_categories)


my_legend_elements_with_colors = c(i_want_pollos_colors( howmany_colors      = ncolors,
                                                         howmany_categories  = 2,
                                                         colors_per_category = 4 ))
names(my_legend_elements_with_colors) = my_categories

myLegend =  "Experiments"
mytitle  =  "Burke Damages"
myXlabel =  "Temperature"
myYlabel =  "GDP losses [%GDP no damages]"
# Plotter .......................

plottigat = ggplot() + 
  
  
  
  # MY DATA
  
  geom_line(data = BKDF, aes(TATM,BKdamage, group = Experiment, color=Experiment), size = 1.2)  +  
  
  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  
  scale_color_manual( breaks = names(my_legend_elements_with_colors),
                      values = my_legend_elements_with_colors ) +
  
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         #legend.spacing.y = unit(10.0, 'mm'),
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 16),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = myLegend) + 
  ggtitle(mytitle) + 
  xlab(myXlabel) +
  ylab(myYlabel)  ; plottigat






# Plotter .......................


myXlabel =  "Year"

plottigat = ggplot() + 
  
  
  
  # MY DATA
  
  geom_line(data = BKDF, aes(year,BKdamage, group = Experiment, color=Experiment), size = 1.2)  +  
  
  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  
  scale_color_manual( breaks = names(my_legend_elements_with_colors),
                      values = my_legend_elements_with_colors ) +
  
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         #legend.spacing.y = unit(10.0, 'mm'),
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 16),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = myLegend) + 
  ggtitle(mytitle) + 
  xlab(myXlabel) +
  ylab(myYlabel)  + 
  ylim(-80,10) +
  xlim(2100,2225); plottigat




## -----------



DAMFRAC_ssp3SR     = BAUdamSSP3$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp3LR     = BAUdamSSP3$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp3SRdiff = BAUdamSSP3$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp3LRdiff = BAUdamSSP3$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)


DAMFRAC_ssp5SR     = BAUdamSSP5$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp5LR     = BAUdamSSP5$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp5SRdiff = BAUdamSSP5$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp5LRdiff = BAUdamSSP5$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)



DAMFRACDF =  rbind(   
    merge( DAMFRAC_ssp5SR    ,  TATMssp5SR     , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP5 - Burke SR"    )
  , merge( DAMFRAC_ssp5LR    ,  TATMssp5LR     , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP5 - Burke LR"    )
  , merge( DAMFRAC_ssp5SRdiff,  TATMssp5SRdiff , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP5 - Burke SRdiff")
  , merge( DAMFRAC_ssp5LRdiff,  TATMssp5LRdiff , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP5 - Burke LRdiff")
  #, merge( DAMFRAC_ssp3SR    ,  TATMssp3SR     , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP3 - Burke SR"    )
  #, merge( DAMFRAC_ssp3LR    ,  TATMssp3LR     , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP3 - Burke LR"    )
  #, merge( DAMFRAC_ssp3SRdiff,  TATMssp3SRdiff , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP3 - Burke SRdiff")
  #, merge( DAMFRAC_ssp3LRdiff,  TATMssp3LRdiff , by= c("t","year")) %>% rename(TATM = value) %>% mutate(Experiment = "SSP3 - Burke LRdiff")
  

)




## DAMFRAC PLOTS ------------



# Colors 



my_categories <- (DAMFRACDF %>% select(Experiment) %>% distinct)$Experiment
ncolors = length(my_categories)


my_legend_elements_with_colors = c(i_want_pollos_colors( howmany_colors      = ncolors,
                                                         howmany_categories  = 2,
                                                         colors_per_category = 4 ))
names(my_legend_elements_with_colors) = my_categories

myLegend =  "Experiments"
mytitle  =  "Burke Damfrac"
myYlabel =  "GDP losses [%GDP]"



# Plotter .......................
myXlabel =  "Temperature"
plottigat = ggplot() + 
  
  
  
  # MY DATA
  
  geom_line(data = DAMFRACDF, aes(TATM,damfrac, group = Experiment, color=Experiment), size = 1.2)  +  
  
  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  
  scale_color_manual( breaks = names(my_legend_elements_with_colors),
                      values = my_legend_elements_with_colors ) +
  
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         #legend.spacing.y = unit(10.0, 'mm'),
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 16),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = myLegend) + 
  ggtitle(mytitle) + 
  xlab(myXlabel) +
  ylab(myYlabel)  ; plottigat






# Plotter .......................


myXlabel =  "Year"

plottigat = ggplot() + 
  
  
  
  # MY DATA
  
  geom_line(data = DAMFRACDF, aes(year,damfrac, group = Experiment, color=Experiment), size = 1.2)  +  
  
  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  
  scale_color_manual( breaks = names(my_legend_elements_with_colors),
                      values = my_legend_elements_with_colors ) +
  
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         #legend.spacing.y = unit(10.0, 'mm'),
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 16),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = myLegend) + 
  ggtitle(mytitle) + 
  xlab(myXlabel) +
  ylab(myYlabel)  + 
  ylim(-40,10) +
  xlim(2015,2125); plottigat








RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "BAU no damages"     = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke SR"       = PPstory4$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke LR"       = PPstory4$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke SRdiff"       = PPstory4$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke LRdiff"       = PPstory4$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    
    
    
    
  )
  ,title  = "Which YGROSS SSP3 is our reference line to eval damages (YGROSS-YNET)?"
  ,yLabel = "YGROSS [Trill USD/Year]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
)  






## RCP 8.5 verificato ----------------

ssp3_rftot_marker = sspDB_total_forcing %>% filter(model == "AIM/CGE", scenario == "SSP3-Baseline")
ssp5_rftot_marker = sspDB_total_forcing %>% filter(model == "REMIND-MAGPIE", scenario == "SSP5-Baseline")



RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "RICEx BAU no dmg ssp3"     = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")  %>% select(year,value)
     ,"SSP3 Marker"          = ssp3_rftot_marker %>% select(year,value)
     ,"RICEx BAU no dmg ssp5"     = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC") %>% select(year,value)
     ,"SSP5 Marker"          = ssp5_rftot_marker %>% select(year,value)
  )
  ,title  = "Baseline Forcings Compared "
  ,yLabel = "[W/m2]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 2
  
)  + xlim(2015,2150)




RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "BAU no dmg ssp3"     = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"BAU no dmg ssp5"     = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    
  )
  ,title  = "Which YGROSS SSP3 is our reference line to eval damages (YGROSS-YNET)?"
  ,yLabel = "YGROSS [Trill USD/Year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 1
  
)   + xlim(2015,2110)





## TLocal in 2100 ------

myyear = 2115



RICEx.plot.multimap(
  EXPdata   = list(
    
"BAU no dmg ssp5"     = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_TLOCALincr_nty%>% filter(year == myyear) %>% rename(n = "ed57")
    
  )
  
  ,title  = paste0("BEFORE UPDATE - Average local-temperature increase in ",myyear)
  ,legend = "T Increase \n[+ºC]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = TRUE
,min_data = 0,
max_data = 6.44
  
)

RICEx.plot.multimap(
  EXPdata   = list(
    
    "BAU no dmg ssp5"     = TBurke$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TLOCALincr_nty%>% filter(year == myyear)
    
  )
  
  ,title  = paste0(" AFTER UPDATE - Average local-temperature increase in ",myyear)
  ,legend = "T Increase \n[+ºC]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = TRUE
  ,min_data = 0,
  max_data = 6.44
  
)







BurkeCC <- read.csv("../BURKE 2015 - Replication/data/input/CCprojections/CountryTempChange_RCP85.csv")
BurkeCC = BurkeCC %>% rename(n = GMI_CNTRY, value = Tchg) %>% select(n,value) 
myshp <- st_read("qgis/shape_outfile/geo_iso3/geo_iso3.shp")    %>% rename(n= ISO3)




RICEx.plot.multimap(EXPdata =list("Burke" = BurkeCC)
                    ,legend = "Tlocal \nincrease [+ºC]"
                    ,title = "Burke (2015) country-level avg temperature increase"
                    ,palette = (RColorBrewer::brewer.pal(9, "OrRd"))
                    ,shape = myshp
                    ,legend_symmetric = TRUE
                    ,min_data = 0            )


## WORLD EMISSIONS SSPs 


source("OTHER_datamng/SSP_IIASA_data_management.R")
ssp3_co2tot_marker = sspDB_all_baseline_CO2_total %>% filter(model == "AIM/CGE", scenario == "SSP3-Baseline")
ssp5_co2tot_marker = sspDB_all_baseline_CO2_total %>% filter(model == "REMIND-MAGPIE", scenario == "SSP5-Baseline")

ssp3_co2ffi_marker = sspDB_all_baseline_CO2_ffi %>% filter(model == "AIM/CGE", scenario == "SSP3-Baseline")
ssp5_co2ffi_marker = sspDB_all_baseline_CO2_ffi %>% filter(model == "REMIND-MAGPIE", scenario == "SSP5-Baseline")




RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "BAU no dmg ssp3"     = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMItot_ty %>% select(year,value)
   ,"SSP3 Marker"         = ssp3_co2tot_marker %>% select(year,value)
   ,"BAU no dmg ssp5"     = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMItot_ty %>% select(year,value)
  ,"SSP5 Marker"          = ssp5_co2tot_marker %>% select(year,value)
  )
  ,title  = "SSP3/5 CO2tot Emissions"
  ,yLabel = "World Emissions [GtCO2/Year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 2
  
)   + xlim(2015,2110)





RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "BAU no dmg ssp3"     = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty %>% select(year,value)
    ,"SSP3 Marker"         = ssp3_co2ffi_marker %>% select(year,value)
    ,"BAU no dmg ssp5"     = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty %>% select(year,value)
    ,"SSP5 Marker"          = ssp5_co2ffi_marker %>% select(year,value)
  )
  ,title  = "SSP3/5 CO2FFI Emissions"
  ,yLabel = "World Emissions [GtCO2/Year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 2
  
)   + xlim(2015,2110)



