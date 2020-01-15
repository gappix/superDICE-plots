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



# shortcuts
EXP = PPstory$v1x00$OPTIM$ed57
EXPssp2_cooppop   = EXP$ssp2$coop_pop
EXPssp2_noncoop   = EXP$ssp2$noncoop_pop
EXPssp2_coopngsh  = EXP$ssp2$coop_negishi






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
    

     "CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA coop ngsh"    = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA noncoop"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty

    
    ,"DICE16 BAU"       = DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"DICE16 CBA"       = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
  
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg" = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
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
    
    
    "CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"CBA coop ngsh"    = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    ,"CBA noncoop"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_CIntensity_ty
    
    
    ,"DICE16 BAU"       = merge(DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"DICE16 CBA"       = merge(DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"BAU nodmg" = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_CIntensity_ty
    
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
    

    "Coop SR "      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop SRdiff"  = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop LR"      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop LRdiff"  = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"Noncoop SR "     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop SRdiff"  = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop LR"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop LRdiff"  = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg"   = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
        
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
    
    
    "Coop SR "      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop SRdiff"  = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop LR"      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop LRdiff"  = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    ,"Noncoop SR "     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop SRdiff"  = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop LR"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop LRdiff"  = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
  
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
    
    
    "Coop BURKE SR "  = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop KAHN"      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop DJO"       = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop DICEreg"   = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"Noncoop BURKE SR " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop KAHN"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop DJO"       = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop DICEreg"   = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg" = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
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
    
    
    "Coop BURKE SR "  = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop KAHN"      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop DJO"       = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop DICEreg"   = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    ,"Noncoop BURKE SR " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop KAHN"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop DJO"       = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Noncoop DICEreg"   = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
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







#=========================================================================##
## ----------------- _____________   MAP CHARTS   _____________  ------------
#=========================================================================##


## -----------------  Local DAMAGES - BURKE SR SSP2 - varying COOPERATION -----------

myyear = 2100

RICEx.plot.multimap(
  EXPdata   = list(
    
   #  "BAU "             = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_DAMAGEperc_nty %>% filter(year == myyear)
    
    "CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA coop ngsh"   = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA noncoop"     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DICE16 CBA"      = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("DAMFRAC") %>% filter(year == myyear) %>% mutate(value = value*(1)) %>% mutate(unit = "%") %>% mutate(n = "world")
    
   
  )
          
  ,title  = paste0("Burke SR Damages in ",myyear," - SSP2 under different cooperation")
  ,legend = "Damages \n[% GDP]" 

  
)



## -----------------  Local TEMPERATURE - BURKE SR SSP2 - varying Cooperation -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    ,"CBA coop ngsh"    = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    ,"CBA noncoop"     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)

  )
  
  ,title  = paste0("Average local-temperature incease in ",myyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "T Increase \n[+ºC]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  ,max_data = 2.4
  
)



## -----------------  MIU - BURKE SR SSP2 - varying Cooperation -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty   %>% filter(year==myyear)
    ,"CBA coop ngsh"   = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty  %>% filter(year==myyear)
    ,"CBA noncoop"     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty   %>% filter(year==myyear)
    ,"DICE16 CBA"      = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("MIU") %>% filter(year == myyear) %>% mutate(value = value*(1)) %>% mutate(unit = "%") %>% mutate(n = "world")
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "MIU \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
)


## -----------------  Region Weights - BURKE SR SSP2  -----------


RICEx.plot.multimap(
  EXPdata   = list(
    
    "NWeights 2015"     = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2015)  %>% select(-year)
    ,"NWeights 2050"     = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2050) %>% select(-year)
    ,"NWeights 2075"     = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2075) %>% select(-year)
    ,"NWeights 2100"     = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2100) %>% select(-year)
  )
  
  ,title  = paste0("Negishi Weights - BURKE SR SSP2")
  ,legend = "Weight"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
)





## -----------------  Carbon Intensity - BURKE SR SSP2 - varying Cooperation -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BAU "             = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA coop ngsh"   = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA noncoop"     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_CIntensity_nty %>% filter(year == myyear)
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
    
    "BURKE SR "      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE SRdiff " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LR "     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LRdiff " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)

  )
  
  ,title  = paste0("NONCOOPERATION Damages in ",myyear," - SSP2 under different BURKE functions")
  ,legend = "Damages \n[% GDP]"
)


## -----------------  Local DAMAGES - COOP - varying BURKE Type -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE SRdiff " = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LR "     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LRdiff " = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("COOPERATION Damages in ",myyear," - SSP2 under different BURKE functions")
  ,legend = "Damages \n[% GDP]"
  , min_data = -0.19
  , max_data = 0.19
)




## -----------------  Local DAMAGES - NONCOOP - varying IMPACT FUntion -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"KAHN "         = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DICEreg (uniform)" = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DJO"           = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("NONCOOPERATION Damages in ",myyear," - SSP2 under different IMPACT functions")
  ,legend = "Damages \n[% GDP]"

)




## -----------------  Local DAMAGES - COOP - varying IMPACT FUntion -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"KAHN "         = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DICEreg (uniform)" = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"DJO"           = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    

    )
  
  ,title  = paste0("COOPERATION Damages in ",myyear," - SSP2 under different IMPACT functions")
  ,legend = "Damages \n[% GDP]"
  , min_data = -0.2
  , max_data = 0.2
)












