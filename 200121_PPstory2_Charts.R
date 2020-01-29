#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
#  Script to assess general model stories and charts.
#  Ultimate goal is identify a publishable storyline.
# 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

invisible(source("RICEx_plots/RICEx_plots.R"))





## -----------------   EXPERIMENTS   -----------------------------------

# Retrieve experiments fom automated procedure

PPstory = list()
PPstory = experiments_load_as_list(PPstory,"PPstory")

PPstory2 = list()
PPstory2 = experiments_load_as_list(PPstory2,"PPstory2")

PPstory3 = list()
PPstory3 = experiments_load_as_list(PPstory3,"PPstory3")



# shortcuts
PP = PPstory$v1x00$OPTIM$ed57
PPssp2_cooppop   = PP$ssp2$coop_pop
PPssp2_noncoop   = PP$ssp2$noncoop_pop
PPssp2_coopngsh  = PP$ssp2$coop_negishi

PP2 = PPstory2$v1x00$OPTIM$ed57
PP2ssp2_cooppop   = PP2$ssp2$coop_pop
PP2ssp2_noncoop   = PP2$ssp2$noncoop_pop
PP2ssp2_coopngsh  = PP2$ssp2$coop_negishi

PP3 = PPstory3$v1x00$OPTIM$ed57
PP3ssp2_cooppop   = PP3$ssp2$coop_pop
PP3ssp2_noncoop   = PP3$ssp2$noncoop_pop
PP3ssp2_coopngsh  = PP3$ssp2$coop_negishi






##------------- Additional data needed for plotting --------------------


source("OTHER_datamng/HIST_emissions_data.R")
# DICE values 
source("OTHER_datamng/DICE_results_management.R")
# (available in "DICEresults" list)



## Add today values to historical for continuity
E_hist_PRIMAP_world_y = rbind(E_hist_PRIMAP_world_y, data.frame(year=2015, value= 35.04)) 



#=========================================================================##
## ----------------- _____________   LINE CHARTS  _____________  ------------
#=========================================================================##


## -----------------  World EMISSIONS - SSP2 - BURKE SR varying COOPERATION  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different cooperation scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


# >>> RICEx.plot.lineplot.world_emissions?
# COSA Migliorare
# Historical nere + BAU nere (e grigie se altre presenti)

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA coop ngsh"    = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA noncoop"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    
    ,"DICE16 BAU"       = DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"DICE16 CBA"       = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg" = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
  )
  ,title  = "World FFI Emissions SSP2 - BURKESR - Different cooperation"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 3
); plottigat


## -----------------  World Carbon Intensity - SSP2 - BURKE SR varying COOPERATION  -------------------



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal carbon intensity trends under 
# different cooperation scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"CBA coop ngsh"    = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"CBA noncoop"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    
    
    ,"DICE16 BAU"       = merge(DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"DICE16 CBA"       = merge(DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"BAU nodmg" = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_CIntensity_ty
    
  )
  ,title  = "World Carbon Intensity - SSP2 - Burke SR - Different cooperation"
  ,yLabel = "Carbon Intensity [kgCO2/$]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 3
); plottigat



## -----------------  World EMISSIONS - SSP2 - Different BURKE func  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different BURKE fun specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop SR "      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop SRdiff"  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop LR"      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop LRdiff"  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"Noncoop SR "     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop SRdiff"  = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop LR"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop LRdiff"  = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg"   = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
  )
  ,title  = "World FFI Emissions SSP2 - CBAs with different BURKE function"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
)



## -----------------  World DAMAGES - SSP2 - Different BURKE func  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal damages trends under 
# different BURKE fun specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop SR "      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop SRdiff"  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop LR"      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop LRdiff"  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    ,"Noncoop SR "     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop SRdiff"  = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop LR"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop LRdiff"  = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    
  )
  ,title  = "World DAMAGES - SSP2 - CBAs with different BURKE function"
  ,yLabel = "Damages [% GDP]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
)



## -----------------  World EMISSIONS - SSP2 - Different IMPACT func  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different IMPACT specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop BURKE SR "  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop KAHN"      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop DJO"       = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop DICEreg"   = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"Noncoop BURKE SR " = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop KAHN"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop DJO"       = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop DICEreg"   = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg" = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
  )
  ,title  = "World FFI Emissions SSP2 - CBAs with different IMPACT functions"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  
); plottigat






## -----------------  World DAMAGES - SSP2 - Different IMPACT func  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different IMPACT specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop BURKE SR "  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop KAHN"      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop DJO"       = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop DICEreg"   = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    ,"Noncoop BURKE SR " = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop KAHN"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop DJO"       = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop DICEreg"   = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    ,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("DAMFRAC") %>% mutate(value = value*(-1)) %>% mutate(unit = "GtCO2/year")
    
  )
  ,title  = "World DAMAGES - SSP2 - CBAs with different IMPACT functions"
  ,yLabel = "Damages [% GDP]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  
); plottigat




# -----------------  World EMISSIONS - BURKE SR - Different SSPs  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different SSP specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop SSP1 "  = PPstory$v1x00$OPTIM$ed57$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    
    ,"Noncoop SSP1 " = PPstory$v1x00$OPTIM$ed57$ssp1$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    
    
    
    
    #,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    
  )
  ,title  = "World FFI Emissions - BURKE SR - CBAs with different SSPs "
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 5
); plottigat






## -----------------  World DAMAGES - BURKE SR - Different SSPs  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different SSP specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop SSP1 "  = PPstory$v1x00$OPTIM$ed57$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    
    ,"Noncoop SSP1 " = PPstory$v1x00$OPTIM$ed57$ssp1$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    
    
    
  )
  ,title  = "World DAMAGES - BURKE SR - CBAs with different SSPs "
  ,yLabel = "Damages [% GDP]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 5
); plottigat



## -----------------  World TATM - BURKE SR - Different SSPs  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different SSP specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop SSP1 "  = PPstory$v1x00$OPTIM$ed57$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Coop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Coop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Coop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Coop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    
    
    ,"Noncoop SSP1 " = PPstory$v1x00$OPTIM$ed57$ssp1$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Noncoop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Noncoop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Noncoop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Noncoop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    
    
    
    
  )
  ,title  = "World TATM - BURKE SR - CBAs with different SSPs "
  ,yLabel = "Temperature increase [ºC]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 5
); plottigat




## -----------------  World CIntensity - BURKE SR - Different SSPs  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal carbon intensity trends under 
# different SSP specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop SSP1 "  = PPstory$v1x00$OPTIM$ed57$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Coop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Coop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Coop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Coop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    
    
    ,"Noncoop SSP1 " = PPstory$v1x00$OPTIM$ed57$ssp1$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Noncoop SSP2"  = PPstory$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Noncoop SSP3"  = PPstory$v1x00$OPTIM$ed57$ssp3$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Noncoop SSP4"  = PPstory$v1x00$OPTIM$ed57$ssp4$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"Noncoop SSP5"  = PPstory$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    
    
    
    
  )
  ,title  = "World CARBON INTENSITY - Burke SR - CBAs with different SSPs "
  ,yLabel = "Carbon Intensity [kgCO2/$]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 5
); plottigat



## -----------------  SCC - BURKE SR - Different Cooperation  -------------------


# Negishi 

p1 = ggplot() + 
  
  geom_line(data= PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1)  + 
  
  # graphic details
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Coop Negishi" ) + 
  xlab("Year") +
  ylab("SCC [$/tCO2]")  ; p1



# POP

p2 = ggplot() + 
  
  geom_line(data= PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1)  + 
  
  # graphic details
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Coop Pop" ) + 
  xlab("Year") +
  ylab("SCC [$/tCO2]")  ; p2


# NONCOOP



p3 = ggplot() + 
  
  geom_line(data= PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1)  + 
  
  # graphic details
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Noncoop" ) + 
  xlab("Year") +
  ylab("SCC [$/tCO2]")  ; p3





p4 = ggplot() + 
  
  geom_line(data=  DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("scc")  ,
            aes(x=year, y=value, group=1, color = "DICE"),
            size = 1)  + 
  
  # graphic details
  
  #scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  
  
  theme( legend.position="none",
         plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("DICE" ) + 
  xlab("Year") +
  ylab("SCC [$/tCO2]")  ; p4

## Combine

nCol = 2
nRow = 2
myTitle = "Social cost of Carbon - SSP2 - BURKESR - Different cooperation"

annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))


## -----------------  MIU - BURKE SR - Different Cooperation  -------------------


# Negishi 

p1 = ggplot() + 
  
  geom_line(data= PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1)  + 
  
  # graphic details
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Coop Negishi" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ; p1



# POP

p2 = ggplot() + 
  
  geom_line(data= PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1)  + 
  
  # graphic details
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Coop Pop" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ; p2


# NONCOOP



p3 = ggplot() + 
  
  geom_line(data= PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1)  + 
  
  # graphic details
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Noncoop" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ; p3




p4 = ggplot() + 
  
  geom_line(data=  DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("MIU")  ,
            aes(x=year, y=value, group=1, color = "DICE"),
            size = 1)  + 
  
  # graphic details
  
  #scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  
  
  theme( legend.position="none",
         plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("DICE" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ; p4





## Combine

nCol = 2
nRow = 2
myTitle = "Mitigation - SSP2 - BURKESR - Different cooperation"

annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))


#=========================================================================##
## ----------------- _____________   MAP CHARTS   _____________  ------------
#=========================================================================##


## -----------------  Local DAMAGES - BURKE SR SSP2 - varying COOPERATION -----------

myyear = 2050

RICEx.plot.multimap(
  EXPdata   = list(
    
    #  "BAU "             = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_DAMAGEperc_nty %>% filter(year == myyear)
    
    "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DICE16 CBA"      = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("DAMFRAC") %>% filter(year == myyear) %>% mutate(value = value*(1)) %>% mutate(unit = "%") %>% mutate(n = "world")
    
    
  )
  
  ,title  = paste0("Burke SR Damages in ",myyear," - SSP2 under different cooperation")
  ,legend = "Damages \n[% GDP]" 
  ,min_data = -0.186
  ,max_data = 0.186
  
  
)


## -----------------  Local DAMAGES - BURKE SR SSP2 noncoop - varying YEAR -----------

experiment = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA

RICEx.plot.multimap(
  EXPdata   = list(
    
    #  "BAU "             = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_DAMAGEperc_nty %>% filter(year == myyear)
    
    "CBA noncoop, year 2025"    = experiment$get_DAMAGEperc_nty %>% filter(year == 2025)
    ,"CBA noncoop, year 2050"   = experiment$get_DAMAGEperc_nty %>% filter(year == 2050)
    ,"CBA noncoop, year 2075"   = experiment$get_DAMAGEperc_nty %>% filter(year == 2075)
    ,"CBA noncoop, year 2100"   = experiment$get_DAMAGEperc_nty %>% filter(year == 2100)
    
  )
  
  ,title  = paste0("Burke SR Damages in different years - SSP2 with no cooperation")
  ,legend = "Damages \n[% GDP]" 

  
)



## -----------------  Local TEMPERATURE - BURKE SR SSP2 - varying Cooperation -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    ,"CBA coop ngsh"    = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Average local-temperature incease in ",myyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "T Increase \n[+ºC]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  ,max_data = 2.45
  
)



## -----------------  MIU - BURKE SR SSP2 - varying Cooperation -----------

myyear = 2030


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty   %>% filter(year==myyear)
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty  %>% filter(year==myyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty   %>% filter(year==myyear)
    ,"DICE16 CBA"      = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("MIU") %>% filter(year == myyear) %>% mutate(value = value*(1)) %>% mutate(unit = "%") %>% mutate(n = "world")
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "MIU \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 1.02
)



## -----------------  Cumulative EMISSIONS absolute - BURKE SR SSP2 - varying Cooperation -----------

startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_n(year_start = startyear, year_limit = endyear)
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
    ,"BAU with no damages"   = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
    ,"BAU with damages"      = PPstory3$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_CUML5y_EMItot_n(year_start = startyear, year_limit = endyear)
  )
  
  ,title  = paste0("Cumulative absolute emissions from ",startyear," to ",endyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "Cuml EMI \n[GtCO2]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  , min_data = min(PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_n(year_limit = myyear)$value,
                   PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_n(year_limit = myyear)$value
  )
                   
)


## -----------------  Cumulative EMISSIONS norm on BAU - BURKE SR SSP2 - varying Cooperation -----------

startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_on_EMIbau_n(year_start = startyear, year_limit = endyear)
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_on_EMIbau_n(year_start = startyear,year_limit=endyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_EMItot_on_EMIbau_n(year_start = startyear,year_limit=endyear)
    ,"BAU with no damages"   = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_on_EMIbau_n(year_start = startyear,year_limit=endyear)
    ,"BAU with damages"      = PPstory3$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAUdam$get_CUML5y_EMItot_on_EMIbau_n(year_start = startyear, year_limit = endyear)
  )
  
  ,title  = paste0("Cumulative absolute emissions from ",startyear," to ",endyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "Cuml EMI \n[GtCO2]"
  ,max_data = 1.49
  ,min_data = -0.49
  
)




## -----------------  Cumulative MITIGATION  - BURKE SR SSP2 - varying Cooperation -----------


# Summing all the mius
# Result would not be significative by itself 
# but only in relative way.

startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
     "CBA coop pop"    = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_CUML5y_n(variable_name = "MIU",  year_start = startyear, year_limit = endyear)
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_CUML5y_n(variable_name = "MIU",  year_start = startyear, year_limit = endyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_CUML5y_n(variable_name = "MIU",  year_start = startyear, year_limit = endyear)
 )
  
  ,title  = paste0("Cumulative Mitigation efforts from ",startyear," to ",endyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "Cuml MIU \n[sum(%)]"
  ,palette =  RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  
)



## -----------------  Cumulative DAMAGES over Cumulative GDP  - BURKE SR SSP2 - varying Cooperation -----------


# Summing all the mius
# Result would not be significative by itself 
# but only in relative way.

startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"    = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_DAMAGES_on_YGROSS_n(  year_start = startyear, year_limit = endyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CUML5y_DAMAGES_on_YGROSS_n(   year_start = startyear, year_limit = endyear)
  )
  
  ,title  = paste0("Cumulative Mitigation efforts from ",startyear," to ",endyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "Cuml DAMAGES \n[%cumlGDP]"

  
)






## -----------------  Weights NEGISHI  - BURKE SR SSP2  -----------


RICEx.plot.multimap(
  EXPdata   = list(
    
     "NWeights 2015"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2015)  %>% select(-year)
    ,"NWeights 2050"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2050) %>% select(-year)
    ,"NWeights 2075"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2075) %>% select(-year)
    ,"NWeights 2100"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2100) %>% select(-year)
  )
  
  ,title  = paste0("Negishi Weights - BURKE SR SSP2")
  ,legend = "Weight"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
,min_data = 0
,max_data = 0.26
)







## -----------------   POP Weights POP - BURKE SR SSP2  -----------


RICEx.plot.multimap(
  EXPdata   = list(
     
     "PopWeights 2015"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2015)  %>% select(-year)
    ,"PopWeights 2050"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2050) %>% select(-year)
    ,"PopWeights 2075"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2075) %>% select(-year)
    ,"PopWeights 2100"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2100) %>% select(-year)
  )
  
  ,title  = paste0("Pop Weights - BURKE SR SSP2")
  ,legend = "Weight"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)


## -----------------   SCC - BURKE SR SSP2 - Varying YEAR -----------


RICEx.plot.multimap(
  EXPdata   = list(
    
     "SCC in 2015"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty  %>% filter(year==2015)  %>% select(-year)
    ,"SCC in 2050"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty  %>% filter(year==2050) %>% select(-year)
    ,"SCC in 2075"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty  %>% filter(year==2075) %>% select(-year)
    ,"SCC in 2100"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty  %>% filter(year==2100) %>% select(-year)
  )
  
  ,title  = paste0("SCC at different timesteps - BURKE SR SSP2")
  ,legend = "SCC \n[$/tCO2]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)



## -----------------   SCC - Year 2100 - Varying IMPACT Function -----------



myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
     "SCC in BURKE SR"          = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    ,"SCC in KAHN "             = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    ,"SCC in DICEreg (uniform)" = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    ,"SCC in DJO"               = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("SCC in ",myyear," - Cooperative POP SSP2 under different IMPACT functions")
  ,legend = "SCC \n[$/tCO2]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)





## -----------------  Carbon Intensity - BURKE SR SSP2 - varying Cooperation -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BAU "             = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CIntensity_nty %>% filter(year == myyear)
    #,"DICE16 CBA"      = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("DAMFRAC") %>% filter(year == myyear) %>% mutate(value = value*(1)) %>% mutate(unit = "%") %>% mutate(n = "world")
    
    
  )
  
  ,title  = paste0("Carbon Intensity in ",myyear," - BURKE SR SSP2 - Under different cooperation")
  ,legend = "Carbon Intensity \n[kgCO2/$]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = -0.1
  ,max_data = 0.58
  
)







## -----------------  Local DAMAGES - NONCOOP - varying BURKE Type -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE SRdiff " = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LR "     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LRdiff " = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("NONCOOPERATION Damages in ",myyear," - SSP2 under different BURKE functions")
  ,legend = "Damages \n[% GDP]"
)


## -----------------  Local DAMAGES - COOP - varying BURKE Type -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE SRdiff " = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LR "     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LRdiff " = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("COOPERATION Damages in ",myyear," - SSP2 under different BURKE functions")
  ,legend = "Damages \n[% GDP]"
  , min_data = -0.19
  , max_data = 0.19
)




## -----------------  Local DAMAGES - NONCOOP - varying IMPACT Function -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"KAHN "         = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DICEreg (uniform)" = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DJO"           = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("NONCOOPERATION Damages in ",myyear," - SSP2 under different IMPACT functions")
  ,legend = "Damages \n[% GDP]"
  
)


## -----------------  DAMAGES associated to TATM - SSP2 - Varying Impact Function  -----------


myTATM = 2


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "          = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"KAHN "             = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"DJO"               = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"BURKE LR "         = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"BURKE SR diff"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"BURKE LR diff"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    
  )
  
  ,title  = paste0("Damages associated to TATM + ",myTATM,"DEG - SSP2 under different IMPACT functions")
  ,legend = "Damages \n[% GDP]"
  
)





## -----------------  Local DAMAGES - COOP - varying IMPACT Function -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"KAHN "         = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DICEreg (uniform)" = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DJO"           = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
    
  )
  
  ,title  = paste0("COOPERATION Damages in ",myyear," - SSP2 under different IMPACT functions")
  ,legend = "Damages \n[% GDP]"
  , min_data = -0.23
  , max_data = 0.23
)










## -----------------  Weights NEGISHI POP MIU - BURKE SR SSP2  -----------


myyear = 2030


RICEx.plot.multimap(
  EXPdata   = list(
    
    "PopWeights "     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==myyear)  
    ,"CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty   %>% filter(year==myyear)
    ,"NWeights"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==myyear) %>% mutate(unit = "%")
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty  %>% filter(year==myyear)
 )
  
  ,title  = paste0("Pop Weights - BURKE SR SSP2")
  ,legend = "Weight"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)


