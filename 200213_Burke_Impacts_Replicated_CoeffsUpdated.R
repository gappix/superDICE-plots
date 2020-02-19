#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
#  BURKE COMPARISON : Focus on damages
#  
#  Are our Damages in line with Burke et al. 2015 Paper? 
#  > Updated downscaling coefficients by Johannes
# 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

invisible(source("RICEx_plots/RICEx_plots.R"))





## -----------------   EXPERIMENTS   -----------------------------------

# Retrieve experiments fom automated procedure


# Pre-update
PPstory4 = list()
PPstory4 = experiments_load_as_list(PPstory4,"PPstory4")

# Post-update
PPstory5 = list()
PPstory5 = experiments_load_as_list(PPstory5,"PPstory5")





# shortcuts
oldBAUdamSSP3 = PPstory4$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2
oldBAUdamSSP5 = PPstory4$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2

upBAUdamSSP3  = PPstory5$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2
upBAUdamSSP5  = PPstory5$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2




# __FUNCTION__
# To evauate damage across two different baselines
#
Build_Damage_DF = function(GDPdam, GDPnodam, TATMdam, Experiment = "SSP3 - BURKE SR"){
  
  ## TEST +++++++++++++++++++++++++
  # GDPdam   = GDPssp5SR
  # GDPnodam = GDPssp5nodam
  # TATMdam  = TATMssp5SR
  #++++++++++++++++++++++++++++++++
  
  BKdam = merge(GDPdam,GDPnodam, by = c("t","year")) %>% rename(YGROSSdam = value.x, YGROSSnodam = value.y) %>% mutate(BKdamage =  100 * (YGROSSdam - YGROSSnodam )/YGROSSnodam )
  
  return( merge(BKdam, TATMdam, by = c("t","year")) %>% rename(TATM = value) %>% mutate("Experiment" = Experiment ))
  
}


### PRE UPDATE ---------------------------------



oldGDPssp3SR     = oldBAUdamSSP3$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250) 
oldGDPssp3LR     = oldBAUdamSSP3$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
oldGDPssp3SRdiff = oldBAUdamSSP3$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
oldGDPssp3LRdiff = oldBAUdamSSP3$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
oldGDPssp3nodam  = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2250)

oldTATMssp3SR     = oldBAUdamSSP3$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250) 
oldTATMssp3LR     = oldBAUdamSSP3$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
oldTATMssp3SRdiff = oldBAUdamSSP3$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
oldTATMssp3LRdiff = oldBAUdamSSP3$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
oldTATMssp3nodam  = PPstory4$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)

oldGDPssp5SR     = oldBAUdamSSP5$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
oldGDPssp5LR     = oldBAUdamSSP5$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
oldGDPssp5SRdiff = oldBAUdamSSP5$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
oldGDPssp5LRdiff = oldBAUdamSSP5$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
oldGDPssp5nodam  = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2250)

oldTATMssp5SR     = oldBAUdamSSP5$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250) 
oldTATMssp5LR     = oldBAUdamSSP5$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
oldTATMssp5SRdiff = oldBAUdamSSP5$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
oldTATMssp5LRdiff = oldBAUdamSSP5$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
oldTATMssp5nodam  = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)




### POST UPDATE ---------------------------------

upGDPssp3SR     = upBAUdamSSP3$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250) 
upGDPssp3LR     = upBAUdamSSP3$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
upGDPssp3SRdiff = upBAUdamSSP3$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
upGDPssp3LRdiff = upBAUdamSSP3$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
upGDPssp3nodam  = PPstory5$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2250)

upTATMssp3SR     = upBAUdamSSP3$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250) 
upTATMssp3LR     = upBAUdamSSP3$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
upTATMssp3SRdiff = upBAUdamSSP3$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
upTATMssp3LRdiff = upBAUdamSSP3$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
upTATMssp3nodam  = PPstory5$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)

upGDPssp5SR     = upBAUdamSSP5$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
upGDPssp5LR     = upBAUdamSSP5$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
upGDPssp5SRdiff = upBAUdamSSP5$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
upGDPssp5LRdiff = upBAUdamSSP5$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2250)
upGDPssp5nodam  = PPstory5$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2250)

upTATMssp5SR     = upBAUdamSSP5$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250) 
upTATMssp5LR     = upBAUdamSSP5$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
upTATMssp5SRdiff = upBAUdamSSP5$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
upTATMssp5LRdiff = upBAUdamSSP5$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)
upTATMssp5nodam  = PPstory5$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty( variable_name = "TATM",year_limit = 2250)




### DRAW  ---------------------------------

## Build dataframe ..........


# pre-update
oldBKDF = rbind( 
  
         Build_Damage_DF( oldGDPssp5SR      ,oldGDPssp5nodam,  oldTATMssp5SR     ,"SSP5 - Burke SR"    )
       , Build_Damage_DF( oldGDPssp5LR      ,oldGDPssp5nodam,  oldTATMssp5LR     ,"SSP5 - Burke LR"    )
       , Build_Damage_DF( oldGDPssp5SRdiff  ,oldGDPssp5nodam,  oldTATMssp5SRdiff ,"SSP5 - Burke SRdiff")
       , Build_Damage_DF( oldGDPssp5LRdiff  ,oldGDPssp5nodam,  oldTATMssp5LRdiff ,"SSP5 - Burke LRdiff")
       
       , Build_Damage_DF( oldGDPssp3SR      ,oldGDPssp3nodam,  oldTATMssp3SR     ,"SSP3 - Burke SR"    )
       , Build_Damage_DF( oldGDPssp3LR      ,oldGDPssp3nodam,  oldTATMssp3LR     ,"SSP3 - Burke LR"    )
       , Build_Damage_DF( oldGDPssp3SRdiff  ,oldGDPssp3nodam,  oldTATMssp3SRdiff ,"SSP3 - Burke SRdiff")
       , Build_Damage_DF( oldGDPssp3LRdiff  ,oldGDPssp3nodam,  oldTATMssp3LRdiff ,"SSP3 - Burke LRdiff")
)

# post-update
upBKDF = rbind( 
  
    Build_Damage_DF( upGDPssp5SR      ,upGDPssp5nodam,  upTATMssp5SR     ,"SSP5 - Burke SR"    )
  , Build_Damage_DF( upGDPssp5LR      ,upGDPssp5nodam,  upTATMssp5LR     ,"SSP5 - Burke LR"    )
  , Build_Damage_DF( upGDPssp5SRdiff  ,upGDPssp5nodam,  upTATMssp5SRdiff ,"SSP5 - Burke SRdiff")
  , Build_Damage_DF( upGDPssp5LRdiff  ,upGDPssp5nodam,  upTATMssp5LRdiff ,"SSP5 - Burke LRdiff")
  
  , Build_Damage_DF( upGDPssp3SR      ,upGDPssp3nodam,  upTATMssp3SR     ,"SSP3 - Burke SR"    )
  , Build_Damage_DF( upGDPssp3LR      ,upGDPssp3nodam,  upTATMssp3LR     ,"SSP3 - Burke LR"    )
  , Build_Damage_DF( upGDPssp3SRdiff  ,upGDPssp3nodam,  upTATMssp3SRdiff ,"SSP3 - Burke SRdiff")
  , Build_Damage_DF( upGDPssp3LRdiff  ,upGDPssp3nodam,  upTATMssp3LRdiff ,"SSP3 - Burke LRdiff")
)



upBKDFssp5 = rbind( 
  
    Build_Damage_DF( upGDPssp5SR      ,upGDPssp5nodam,  upTATMssp5SR     ,"SSP5 - Burke SR"    )
  , Build_Damage_DF( upGDPssp5LR      ,upGDPssp5nodam,  upTATMssp5LR     ,"SSP5 - Burke LR"    )
  , Build_Damage_DF( upGDPssp5SRdiff  ,upGDPssp5nodam,  upTATMssp5SRdiff ,"SSP5 - Burke SRdiff")
  , Build_Damage_DF( upGDPssp5LRdiff  ,upGDPssp5nodam,  upTATMssp5LRdiff ,"SSP5 - Burke LRdiff")
  
)





# Colors and appearance ...........

my_categories <- (upBKDF %>% select(Experiment) %>% distinct)$Experiment

ncolors = length(my_categories)

my_legend_elements_with_colors = c(i_want_pollos_colors( howmany_colors      = ncolors,
                                                         howmany_categories  = 2,
                                                         colors_per_category = 4 ))
names(my_legend_elements_with_colors) = my_categories

myLegend =  "Experiments"

myXlabel =  "Temperature"
myYlabel =  "GDP losses [%GDP no damages]"










# Plotter DAMAGE/TEMPERATURE  ----------------


mytitle  =  "Burke Damages - After Coeffs Update"
mydata   =   upBKDF


plottigat = ggplot() + 
  
  
  
  # MY DATA
  
  geom_line(data = mydata, aes(TATM,BKdamage, group = Experiment, color=Experiment), size = 1.2)  +  
  
  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  
  scale_color_manual( breaks = names(my_legend_elements_with_colors),
                      values = my_legend_elements_with_colors ) +
  
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 16),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = myLegend) + 
  
  ggtitle(mytitle) + 
  
  xlab(myXlabel) +
  ylab(myYlabel) +
  
  ylim(-100, 10) ; plottigat






# Plotter DAMAGE/YEAT  ----------------


mytitle  =  "Burke Damages - After Coeffs Update"
mydata   =   upBKDF


plottigat = ggplot() + 
  
  
  
  # MY DATA
  
  geom_line(data = mydata, aes(year,BKdamage, group = Experiment, color=Experiment), size = 1.2)  +  
  
  
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
  xlab("Year") +
  ylab(myYlabel)  + 
  ylim(-60,10) +
  xlim(2015,2130); plottigat




## -----------

# Damages on a world with damages

DAMFRAC_ssp3SR     = BAUdamSSP3$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp3LR     = BAUdamSSP3$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp3SRdiff = BAUdamSSP3$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp3LRdiff = BAUdamSSP3$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)


DAMFRAC_ssp5SR     = BAUdamSSP5$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp5LR     = BAUdamSSP5$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp5SRdiff = BAUdamSSP5$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)
DAMFRAC_ssp5LRdiff = BAUdamSSP5$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = 100*value) %>% rename(damfrac = value)



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
    
    
    "BAU no damages"     = PPstory5$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke SR"       = PPstory5$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke LR"       = PPstory5$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke SRdiff"       = PPstory5$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    ,"BAU Burke LRdiff"       = PPstory5$v1x00$SIMUL$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty("YGROSS")
    
    
    
    
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
    
    
     "RICEx BAU no dmg ssp3"     = PPstory5$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")  %>% select(year,value)
     ,"SSP3 Marker"          = ssp3_rftot_marker %>% select(year,value)
     ,"RICEx BAU no dmg ssp5"     = PPstory5$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC") %>% select(year,value)
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
    
    
    "BAU no dmg ssp3"     = PPstory5$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"BAU no dmg ssp5"     = PPstory5$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    
  )
  ,title  = "Which YGROSS SSP3 is our reference line to eval damages (YGROSS-YNET)?"
  ,yLabel = "YGROSS [Trill USD/Year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 1
  
)   + xlim(2015,2110)





## TLocal in 2100 ------

myyear = 2115

# shapefiles
ed57shp   <- st_read("qgis/shape_outfile/geo_ene57/geo_ene57.shp")        %>% rename(n= REG_NAME) %>% mutate(region_key = paste0("ed57_",n))
iso3shp   <- st_read("qgis/shape_outfile/geo_iso3/geo_iso3.shp")    %>% rename(n= ISO3)




map1 = RICEx.plot.map( 
  
  data    = PPstory5$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TLOCALincr_nty%>% filter(year == myyear)
,legend   = "T Increase \n[+ºC]"
,title    = paste0("AFTER UPDATE - Average local-temperature increase in ",myyear)
,palette  = RColorBrewer::brewer.pal(9, "OrRd") 
,min_data = 0
,max_data = 7
,shape    = ed57shp
,centre_data = 3.5   )



map2 = RICEx.plot.map( 
  
  data    = PPstory4$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_TLOCALincr_nty%>% filter(year == myyear) %>% rename(n="ed57")
  ,legend   = "T Increase \n[+ºC]"
  ,title    = paste0("BEFORE UPDATE - Average local-temperature increase in ",myyear)
  ,palette  = RColorBrewer::brewer.pal(9, "OrRd") 
  ,min_data = 0
  ,max_data = 7
  ,shape    = ed57shp
  ,centre_data = 3.5   )






BurkeCC <- read.csv("../BURKE 2015 - Replication/data/input/CCprojections/CountryTempChange_RCP85.csv")
BurkeCC = BurkeCC %>% rename(n = GMI_CNTRY, value = Tchg) %>% select(n,value) 


map3 = RICEx.plot.map(   
   data = BurkeCC
  ,legend = "Tlocal \nincrease [+ºC]"
  ,title = "Burke (2015) country-level avg temperature increase"
  ,palette = (RColorBrewer::brewer.pal(9, "OrRd"))
  ,shape = iso3shp
  ,min_data = 0
  ,max_data = 7  
  ,centre_data = 3.5  )


plotlist = list()
plotlist[[1]] =  local(print(map1  + theme(legend.position="none")))
plotlist[[2]] =  local(print(map2  + theme(legend.position="none")))
plotlist[[3]] =  local(print(map3  + theme(legend.position="none")))


nRow = 2
nCol = 2

annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob("Local temperatures under Forcing ~8.5", face = "bold", size = 16)
)




## WORLD EMISSIONS SSPs 


source("OTHER_datamng/SSP_IIASA_data_management.R")
ssp3_co2tot_marker = sspDB_all_baseline_CO2_total %>% filter(model == "AIM/CGE", scenario == "SSP3-Baseline")
ssp5_co2tot_marker = sspDB_all_baseline_CO2_total %>% filter(model == "REMIND-MAGPIE", scenario == "SSP5-Baseline")

ssp3_co2ffi_marker = sspDB_all_baseline_CO2_ffi %>% filter(model == "AIM/CGE", scenario == "SSP3-Baseline")
ssp5_co2ffi_marker = sspDB_all_baseline_CO2_ffi %>% filter(model == "REMIND-MAGPIE", scenario == "SSP5-Baseline")




RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "BAU no dmg ssp3"     = PPstory5$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMItot_ty %>% select(year,value)
   ,"SSP3 Marker"         = ssp3_co2tot_marker %>% select(year,value)
   ,"BAU no dmg ssp5"     = PPstory5$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMItot_ty %>% select(year,value)
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
    
    
    "BAU no dmg ssp3"     = PPstory5$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty %>% select(year,value)
    ,"SSP3 Marker"         = ssp3_co2ffi_marker %>% select(year,value)
    ,"BAU no dmg ssp5"     = PPstory5$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty %>% select(year,value)
    ,"SSP5 Marker"          = ssp5_co2ffi_marker %>% select(year,value)
  )
  ,title  = "SSP3/5 CO2FFI Emissions"
  ,yLabel = "World Emissions [GtCO2/Year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 2
  
)   + xlim(2015,2110)



