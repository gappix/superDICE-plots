#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
# PPstory : Focus on Disentangled stories AFTER UPDATING downscaler coeffs
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


PPstory5 = list()
PPstory5 = experiments_load_as_list(PPstory5,"PPstory5")


PPstory5 = list()
PPstory5 = experiments_load_as_list(PPstory5,"PPstory5")



# shortcuts
PP5 = PPstory5$v1x00$OPTIM$ed57




##------------- Additional data needed for plotting --------------------


source("OTHER_datamng/HIST_emissions_data.R")
# DICE values 
source("OTHER_datamng/DICE_results_management.R")
# (available in "DICEresults" list)



## Add today values to historical for continuity
E_hist_PRIMAP_world_y = rbind(E_hist_PRIMAP_world_y, data.frame(year=2015, value= 35.04)) 



#=========================================================================##
## ---------- ____________  LINE CHARTS  ____________  ------------
#=========================================================================##


## -----------------  World EMISSIONS - SSP2 - BURKE SR varying DISGamma  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different gamma scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "CBA $\\gamma = 0$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"CBA $\\gamma = 0.5$"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"CBA $\\gamma = 1.45$" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"CBA $\\gamma = 2$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"CBA non-coop" = PP5$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = PPstory5$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    ,"BAU dmg"     = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_EMIffi_ty
     
  )
  ,title  = "World FFI Emissions - SSP2 Burke SR - different Inequality Aversion ($\\gamma$)"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2175); plottigat



# wanna save?
ggsave(filename = "./plots/worldEMI_diff_Gammas.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)




## -----------------  World EMISSIONS - SSP2 - BURKE SR varying DISGamma + DICE trends -------------------


#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different gamma scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "CBA gamma 0" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"CBA gamma 0.5" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"CBA gamma 2" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"DICE16 BAU"       = DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"DICE16 CBA"       = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg"   = PPstory5$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    ,"BAU dmg" = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_EMIffi_ty
    
  )
  ,title  = "World FFI Emissions - SSP2 BURKESR - Different Inequality Aversion"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
); plottigat








## -----------------  World Carbon Intensity - SSP2 - BURKE SR varying DISGamma  -------------------



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal carbon intensity trends under 
# different cooperation scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    
    
    ,"DICE16 BAU"       = merge(DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"DICE16 CBA"       = merge(DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"BAU nodmg"   = PPstory5$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_CIntensity_ty
    ,"BAU dmg" = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_CIntensity_ty
    
  )
  ,title  = "World Carbon Intensity - SSP2 - Burke SR - Different Inequality Aversion"
  ,yLabel = "Carbon Intensity [kgCO2/$]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
); plottigat



## -----------------  World EMISSIONS - SSP2 - Varying BURKE func and DISGamma -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different BURKE fun specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


# all together

RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "SR g0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty

    ,"LR g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"LR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"LR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"LR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    ,"SRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"LRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"LRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"LRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"LRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
  )
  ,title  = "World FFI Emissions SSP2 - CBAs with different BURKE function"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 4
)



# gamma 0
{
p1 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Burke SR"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"SR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"SR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"SR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Burke LR"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"LR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"LR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"LR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
     
    
    ,"Burke SRdiff"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"SRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"SRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"SRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Burke LRdiff"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"LRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"LRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"LRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
  )
  ,title  = "Gamma 0"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1
)

# gamma 0.45

p2 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    #"SR g0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"SR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    "Burke SR" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"SR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    #,"LR g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
     ,"Burke LR"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"LR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"LR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    #,"SRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
     ,"Burke SRdiff"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"SRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"SRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    #,"LRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"Burke LRdiff"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"LRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"LRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
  )
  ,title  = "Gamma 0.45"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1
); p2


# gamma 1.45

p3 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    #"SR g0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"SR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    "Burke SR" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"SR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    #,"LR g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"LR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
     ,"Burke LR" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"LR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    #,"SRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"SRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
     ,"Burke SRdiff"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"SRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    #,"LRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"LRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
     ,"Burke LRdiff" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    # ,"LRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
  )
  ,title  = "Gamma 1.45"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1
) ;p3


# gamma 2

p4 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    #"SR g0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"SR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"SR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    "Burke SR"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    #,"LR g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"LR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"LR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
     ,"Burke LR"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    #,"SRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"SRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"SRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
     ,"Burke SRdiff"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    #,"LRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    # ,"LRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    # ,"LRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
     ,"Burke LRdiff"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
  )
  ,title  = "Gamma 2"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1
); p4
}
## Combine

nCol = 2
nRow = 2
myTitle = "World FFI Emissions - SSP2 -  Different BURKE Function and Inequality Aversion"

annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))


## -----------------  World DAMAGES - SSP2 - Different BURKE func  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal damages trends under 
# different BURKE fun specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


# all together

RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SR g0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"LR g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"LR g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"LR g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"LR g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    
    ,"SRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"LRdiff g0"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"LRdiff g0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"LRdiff g1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"LRdiff g2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    
    )
  ,title  = "World Damages - SSP2 - Varying BURKE function and Inequality Aversion"
  ,yLabel = "Damages [%GDP]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 4
)



## -----------------  World DAMAGES - SSP2 - Different BURKE func per each DISGamma -------------------


{
# gamma 0

p1 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Burke SR"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Burke LR"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Burke SRdiff"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Burke LRdiff"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
  
   )
  ,title  = "Gamma 0"
  ,yLabel = "Damages [%GDP]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1
  
)  + ylim(-0.3, 0.01) ; p1

# gamma 0.45

p2 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    

    "Burke SR" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
   ,"Burke LR"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
   ,"Burke SRdiff"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
   ,"Burke LRdiff"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty

  )
  ,title  = "Gamma 0.45"
  ,yLabel = "Damages [%GDP]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1
  
) + ylim(-0.3, 0.01); p2


# gamma 1.45

p3 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Burke SR" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
   ,"Burke LR" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
   ,"Burke SRdiff"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Burke LRdiff" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
)
  ,title  = "Gamma 1.45"
,yLabel = "Damages [%GDP]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1

)  + ylim(-0.3, 0.01);p3


# gamma 2

p4 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
   "Burke SR"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,"Burke LR"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,"Burke SRdiff"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,"Burke LRdiff"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,""
  )
  ,title  = "Gamma 2"
  ,yLabel = "Damages [%GDP]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 1
) + ylim(-0.3, 0.01); p4


}

## Combine

nCol = 2
nRow = 2
myTitle = "World Damages - SSP2 -  Different BURKE Function and Inequality Aversion"

annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))




## -----------------  World DAMAGES - SSP2 - Different DISGamma per each Burke Fun -------------------

{

#Burke SR

 
p1 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "BAU"                = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 0$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
    ,"$\\gamma  = 0.5$"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
    ,"$\\gamma  = 1.45$" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
    ,"$\\gamma  = 2$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   

    
  )
  ,title  = "Burke SR"
  ,yLabel = "Damages \\[%GDP\\]"
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  
  
)+ ylim(-45, 1) + xlim(2010,2175)



#Burke LR

p2 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "BAU"                 = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)      
    ,"$\\gamma  = 0$"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 0.5$"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 1.45$" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 2$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    
    
  )
  ,title  = "Burke LR"
  ,yLabel = "Damages \\[%GDP\\]"
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  
)+ ylim(-45, 1)+ xlim(2010,2175)


#Burke SRdiff

p3 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     
    "BAU"                = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty     %>% mutate(value = value *100)   
    ,"$\\gamma  = 0$"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 0.5$"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 1.45$" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 2$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    
    
  )
  ,title  = "Burke SRdiff"
  ,yLabel = "Damages \\[%GDP\\]"
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  
)+ ylim(-45, 1) + xlim(2010,2175)


#Burke LRdiff

p4 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "BAU"                = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty     %>% mutate(value = value *100)   
    ,"$\\gamma  = 0$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 0.5$"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 1.45$" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    ,"$\\gamma  = 2$"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
    
    
  )
  ,title  = "Burke LRdiff"
  ,yLabel = "Damages \\[%GDP\\]"
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  
)+ ylim(-45, 1) + xlim(2010,2175)



}
## Combine

nCol = 2
nRow = 2
myTitle = TeX("World Damages - SSP2 -  Different Burke function and inequality aversion $\\gamma$")


plottigat = annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))

plottigat

# wanna save?
ggsave(filename = "Damages_4Burkes_DifferGamma.png",plot = plottigat, device = "png", width=14, height=8)





## -----------------  World EMISSIONS - SSP2 - Different IMPACT func  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different IMPACT specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop BURKE SR "  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop KAHN"      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop DJO"       = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Coop DICEreg"   = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"Noncoop BURKE SR " = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop KAHN"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop DJO"       = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop DICEreg"   = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    ,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg" = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
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
    
    
    "Coop BURKE SR "  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop KAHN"      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop DJO"       = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"Coop DICEreg"   = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    ,"Noncoop BURKE SR " = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
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


# Gamma 0 

p1 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    
    
    
    #,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    
  )
  ,title  = TeX("$\\gamma = 0 $")
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
); p1



# Gamma 0.5 

p2 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    
    
    
    #,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    
  )
  ,title  = TeX("$\\gamma = 0.5 $")
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
); p2


# Gamma 1.45 

p3 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    
    
    
    #,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    
  )
  ,title = TeX("$\\gamma = 1.45 $")
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
); p3


# Gamma 2 

p4 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
    #,"DICE16 CBA"  = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    
  )
  ,title  = TeX("$\\gamma = 2 $")
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
); p4


## Combine

nCol = 2
nRow = 2
myTitle = "World FFI Emissions -  Different SSPs and Inequality Aversion"

annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))



## -----------------  World DAMAGES - BURKE SR - Different SSPs  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different SSP specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++

# Gamma 0 
{
p1 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    
  )
  ,title  = "$\\gamma = 0$"
  ,yLabel = "Damages $\\[% GDPgross\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
) + ylim(-0.3,0.01)  + xlim(2010,2175) ; p1



# Gamma 0.5 

p2 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    
  
  )
  ,title  = "$\\gamma = 0.5$"
  ,yLabel = "Damages $\\[% GDPgross\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
)+ ylim(-0.3,0.01)  + xlim(2010,2175) ; p2  


# Gamma 1.45 

p3 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    

  )
  ,title  = "$\\gamma = 1.45$"
  ,yLabel = "Damages $\\[% GDPgross\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
) + ylim(-0.3,0.01)  + xlim(2010,2175) ; p3 

# Gamma 2 

p4 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
  
  )
  ,title  = "$\\gamma = 2$"
  ,yLabel = "Damages $\\[% GDPgross\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
) + ylim(-0.3,0.01)  + xlim(2010,2175); p4 
}

## Combine

nCol = 2
nRow = 2
myTitle = "World Damages - Burke SR -  different Inequality Aversion varying SSPs"

plottigat = annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16));
plottigat


# wanna save?
ggsave(filename = "./plots/worldDMG_diff_Gammas_SSPs.png",plot = plottigat, dpi="retina", device = "png", width=11, height=8)




## -----------------  World TATM - BURKE SR - Different SSPs  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different SSP specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++

{
# Gamma 0 

p1 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"   = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
    
  )
  ,title  = "$\\gamma = 0$"
  ,yLabel = "Temperature increase $\\[ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
) + ylim(0,2.5)  + xlim(2010,2175) ; p1



# Gamma 0.5 

p2 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"   = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
    
    
  )
  ,title  = "$\\gamma = 0.5$"
  ,yLabel = "Temperature increase $\\[ ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
)+ ylim(0,2.5) + xlim(2010,2175)  ; p2  


# Gamma 1.45 

p3 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"   = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
    
    
  )
  ,title  = "$\\gamma = 1.45$"
  ,yLabel = "Temperature increase $\\[ ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
) + ylim(0,2.5) + xlim(2010,2175)  ; p3 

# Gamma 2 

p4 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"  = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
    
    
  )
  ,title  = "$\\gamma = 2$"
  ,yLabel = "Temperature increase $\\[ ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  ,LaTeX_text = TRUE
  
) + ylim(0,2.5)  + xlim(2010,2175); p4 

}
## Combine

nCol = 2
nRow = 2
myTitle = TeX("World TATM -  Different inequality aversion $\\gamma$ varying SSPs")

plottigat = annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16)); 
plottigat


# wanna save?
ggsave(filename = "./plots/worldTATM_diff_Gammas_SSPs.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)





## -----------------  World CIntensity - BURKE SR - Different SSPs  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal carbon intensity trends under 
# different SSP specs.
#++++++++++++++++++++++++++++++++++++++++++++++++++++
# Gamma 0 

p1 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"   = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    
  )
  ,title  = "Gamma 0 "
  ,yLabel = "Carbon Intensity [kgCO2/$]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
)  + ylim(-0.05,0.5); p1



# Gamma 0.5 

p2 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"   = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    
    
  )
  ,title  = "Gamma 0.5 "
  ,yLabel = "Carbon Intensity [kgCO2/$]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
)+ ylim(-0.05,0.5)  ; p2  


# Gamma 1.45 

p3 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"   = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    
    
  )
  ,title  = "Gamma 1.45"
  ,yLabel = "Carbon Intensity [kgCO2/$]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
) + ylim(-0.05,0.5) ; p3 

# Gamma 2 

p4 = RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "SSP1"   = PP5$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP2"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP3"  = PP5$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP4"  = PP5$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP5"  = PP5$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    
    
  )
  ,title  = "Gamma 2"
  ,yLabel = "Carbon Intensity [kgCO2/$]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 1
  
)+ ylim(-0.05,0.5) ; p4 


## Combine

nCol = 2
nRow = 2
myTitle = "World Carbon Intensity -  Different SSPs and Inequality Aversion"

annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))


# wanna save?
ggsave(filename = "SCC_diff_Gammas.pdf",plot = plottigat, device = "pdf", width=14, height=8)




## -----------------  SCC - BURKE SR - Different DISGamma  -------------------


topSCC = 30000
myncol = 2

# Gamma 0 
{
  p1 = ggplot() + 
    
    geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_SCC_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    # graphic details
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=myncol)) +
    
    theme( plot.title = element_text(size=16),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle(TeX("$\\gamma = 0$")) + 
    xlab("Year") +
    ylim(0,topSCC) + 
    ylab("SCC [$/tCO2]")  ; p1
  
  
  
  # Gamma 0.5
  
  p2 = ggplot() + 
    
    geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_SCC_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    # graphic details
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=myncol)) +
    
    theme( plot.title = element_text(size=16),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle(TeX("$\\gamma = 0.5$")) + 
    ylim(0,topSCC) + 
    xlab("Year") +
    ylab("SCC [$/tCO2]")  ; p2
  
  
  # Gamma 1.45
  
  
  
  p3 = ggplot() + 
    
    geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_SCC_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    # graphic details
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=myncol)) +
    
    theme( plot.title = element_text(size=16),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle(TeX("$\\gamma = 1.45$")) + 
    xlab("Year") +
    ylim(0,topSCC) + 
    ylab("SCC [$/tCO2]")  ; p3
  
  
  
  # Gamma 2
  
  
  p4 = ggplot() + 
    
    geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_SCC_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    # graphic details
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=myncol)) +
    
    theme( legend.position="none",
           plot.title = element_text(size=16),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle(TeX("$\\gamma = 2$")) + 
    xlab("Year") +
    ylim(0,topSCC) + 
    ylab("SCC [$/tCO2]")  ; p4

  
} # << run whole block from here

## Combine

nCol = 2
nRow = 2
myTitle = TeX("Social cost of Carbon - SSP2 Burke SR - Different inequality aversion $\\gamma$")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat


# wanna save?
ggsave(filename = "./plots/SCC_diff_Gammas.png",plot = plottigat, dpi="retina", device = "png", width=11, height=8)



## -----------------  MIU - BURKE SR - Different DISGamma  -------------------


# Gamma 0 

p1 = ggplot() + 
  
  geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_MIU_nty
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Gamma 0" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ; p1



# Gamma 0.5

p2 = ggplot() + 
  
  geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_MIU_nty
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Gamma 0.5" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ; p2




# Gamma 1.45

p3 = ggplot() + 
  
  geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_MIU_nty
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Gamma 1.45" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ; p3




# Gamma 2


p4 = ggplot() + 
  
  geom_line(data= PPstory5$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_MIU_nty
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  theme( legend.position="none",
         plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Gamma 2" ) + 
  xlab("Year") +
  ylab("Mitigation [% BAU]")  ;  p4





## Combine

nCol = 2
nRow = 2
myTitle = "Mitigation Efforts - SSP2 - BURKE SR - Different Inequality Aversion"

annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                ,top =  text_grob(myTitle, face = "bold", size = 16))


#=========================================================================##
## ----------------- _____________   MAP CHARTS   _____________  ------------
#=========================================================================##


## -----------------  CUMLT EMISSIONS absolute - BURKE SR SSP2 - varying DISGamma -----------

startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(   year_start = startyear,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n( year_start = startyear,year_limit = endyear)
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start = startyear,year_limit = endyear)
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_limit = endyear)
    
 )
  
  ,title  = paste0("Cumulative absolute emissions from ",startyear," to ",endyear," - BURKE SR SSP2 - under different Inequality Aversion")
  ,legend = "Cuml EMI \n[GtCO2]"
  ,palette =  rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys  ## rev
  ,legend_symmetric = TRUE
  )
  

## -----------------  CUMLT EMISSIONS absolute - BURKE SR SSP2 - varying DISGamma + BAU -----------

startyear = 2050
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(   year_start = startyear,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n( year_start = startyear,year_limit = endyear)
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start = startyear,year_limit = endyear)
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_limit = endyear)
    
  #   ,"BAU no damages"   = PPstory5$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
  #   ,"BAU with damages" = PPstory5$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
   )
  
  ,title  = paste0("Cumulative absolute emissions from ",startyear," to ",endyear," - BURKE SR SSP2 - under different Inequality Aversion")
  ,legend = "Cuml EMI \n[GtCO2]"
  ,palette =  rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys  ## rev
  ,legend_symmetric = TRUE
)




## -----------------  Carbon Intensity - BURKE SR SSP2 - varying DISGamma -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CIntensity_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("Carbon Intensity in ",myyear," - BURKE SR SSP2 - different Inequality Aversion")
  ,legend = "Carbon Intensity \n[kgCO2/$]"
  #,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = TRUE
  
)




## -----------------   SCC - BURKE SR SSP2 - Varying YEAR -----------

myyear= 2100

RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_SCC_nty %>% filter(year == myyear)
  )
  
  ,title  = paste0("SCC in 2100 - BURKE SR SSP2 - different Inequality Aversion")
  ,legend = "SCC \n[$/tCO2]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)





## -----------------   SCC CUMLT - BURKE SR SSP2 - Varying YEAR -----------

startyear= 2015
endyear = 2100

RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
  )
  
  ,title  = paste0("Cumulated SCC from 2015 to 2100 - BURKE SR SSP2 - different Inequality Aversion")
  ,legend = "SCC \n[Cuml $/tCO2]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = FALSE
)




## -----------------  Local DAMAGES - Gammas - varying BURKE Type -----------

myyear = 2100


# Gamma 0 

plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
     "Burke SR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   

  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
)

plottigat

# wanna save?
ggsave(filename = "./plots/mapDMG_gamma0_diffBurke.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)





# Gamma 0.5

RICEx.plot.multimap(
  EXPdata   = list(
    
     "Burke SR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)  
    ,"Burke SRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)    
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0.5$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
  ,min_data = -29.55
  ,max_data = 29.55
)

# Gamma 1.45 

RICEx.plot.multimap(
  EXPdata   = list(
    
     "Burke SR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100) 
    ,"Burke SRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)  
    ,"Burke LR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)  
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 1.45$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
  ,min_data = -29.55
  ,max_data = 29.55
)

# Gamma 2 

RICEx.plot.multimap(
  EXPdata   = list(
    
     "Burke SR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)       %>% mutate(value = value *100)      
    ,"Burke SRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)   %>% mutate(value = value *100)     
    ,"Burke LR "     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)       %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)   %>% mutate(value = value *100)     

  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 2$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
  ,min_data = -29.55
  ,max_data = 29.55
)


## -----------------  MIU - BURKE SR SSP2 - varying DISGamma -----------

myyear = 2050


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
     "CBA, $\\gamma = 0$"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 0.5$" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 1.45$"= PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 2$"   = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_MIU_nty %>% filter(year == myyear)
  
    )
  
  ,title  = paste0("Mitigation in ",myyear," - Burke SR, SSP2 - Different Inequality Aversion")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 1.2
  ,LaTeX_text = TRUE
  
) 
plottigat

# wanna save?
ggsave(filename = "./plots/mapMIU_2050_diffGamma.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)



## -----------------  MIU CUMLT - BURKE SR SSP2 - varying DISGamma -----------


# Summing all the mius
# Result would not be significative by itself 
# but only in relative way.

startyear = 2015
endyear   = 2100

bauCUMemi =  PP5$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear ) %>% select(n,value) %>% rename(bau = value)









RICEx.plot.multimap(
  EXPdata   = list(
                                                                                                                                                
     "CBA, $\\gamma = 0$"    = merge(PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )    %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 0.5$"  = merge(PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )  %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 1.45$" = merge(PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear ) %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 2$"    = merge(PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )    %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
 
    )
  
  ,title  = paste0("Overall Mitigation efforts from ",startyear," to ",endyear," - Burke SR, SSP2 - Different inequality aversion")
  ,legend = "Mitigaton relative \nscore"
  ,palette =  RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
, legend_symmetric = FALSE

,LaTeX_text = TRUE
,min_data = 0
  
)



## -----------------  Local DAMAGES - BURKE SR SSP2 Gamma 0.5 - varying YEAR -----------

experiment = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5


RICEx.plot.multimap(
  EXPdata   = list(
    
    #  "BAU "             = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_DAMAGEperc_nty %>% filter(year == myyear)
    
     "CBA Gamma 0.5, year 2025"    = experiment$get_DAMAGEperc_nty %>% filter(year == 2030)
    ,"CBA Gamma 0.5, year 2050"   = experiment$get_DAMAGEperc_nty %>% filter(year == 2050)
    ,"CBA Gamma 0.5, year 2075"   = experiment$get_DAMAGEperc_nty %>% filter(year == 2075)
    ,"CBA Gamma 0.5, year 2100"   = experiment$get_DAMAGEperc_nty %>% filter(year == 2100)
    
  )
  
  ,title  = paste0("Burke SR Damages in different years - SSP2 with Inequality Gamma 0.5")
  ,legend = "Damages \n[% GDP]" 
  
  
)




## -----------------  Local DAMAGES - BURKE SR SSP2 - varying DISGamma -----------

myyear = 2100

RICEx.plot.multimap(
  EXPdata   = list(
    
    #  "BAU "             = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_DAMAGEperc_nty %>% filter(year == myyear)
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty    %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty    %>% filter(year == myyear)  
    
    
  )
  
  ,title  = paste0("Damages in ",myyear," - Burke SR SSP2 - different Inequality Aversion")
  ,legend = "Damages \n[% GDP]" 
  
)






## -----------------  Local TEMPERATURE - BURKE SR SSP2 - varying Cooperation -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    ,"CBA coop ngsh"    = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    ,"CBA noncoop"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_TLOCALincr_nty  %>% rename(n= "ed57") %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Average local-temperature incease in ",myyear," - BURKE SR SSP2 - under different cooperation")
  ,legend = "T Increase \n[+ºC]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  ,max_data = 2.45
  
)



## -----------------  Local TEMPERATURE - BURKE SR SSP2 DISGamma 0.5 - varying Year -----------


experiment = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5


RICEx.plot.multimap(
  
  EXPdata   = list(
    
    "CBA Gamma 0.5, year 2025"    = experiment$get_TLOCALincr_nty %>% filter(year == 2030) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2050"   = experiment$get_TLOCALincr_nty %>% filter(year == 2050) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2075"   = experiment$get_TLOCALincr_nty %>% filter(year == 2075) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2100"   = experiment$get_TLOCALincr_nty %>% filter(year == 2100) #%>% rename(n= "ed57")
    
  )
  

  ,title  = paste0("Local avg Temperature increase in different years - SSP2 with Inequality Gamma 0.5")
  ,legend = "TLocal Increase \n[+ºC]" 
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  
  
)






## -----------------  Cumulative DAMAGES over Cumulative GDP  - BURKE SR SSP2 - varying DISGamma -----------



startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 0.5"  = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 1.45" = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 2"    = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    
    )
  
  ,title  = paste0("Cumulative damages from ",startyear," to ",endyear," - BURKE SR SSP2 - different Inequality Advesion")
  ,legend = "Cuml DAMAGES \n[%cumlGDP]"
  
  
)






## -----------------  Weights NEGISHI  - BURKE SR SSP2  -----------


RICEx.plot.multimap(
  EXPdata   = list(
    
    "NWeights 2015"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2015)  %>% select(-year)
    ,"NWeights 2050"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2050) %>% select(-year)
    ,"NWeights 2075"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2075) %>% select(-year)
    ,"NWeights 2100"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==2100) %>% select(-year)
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
    
    "PopWeights 2015"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2015)  %>% select(-year)
    ,"PopWeights 2050"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2050) %>% select(-year)
    ,"PopWeights 2075"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2075) %>% select(-year)
    ,"PopWeights 2100"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==2100) %>% select(-year)
  )
  
  ,title  = paste0("Pop Weights - BURKE SR SSP2")
  ,legend = "Weight"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)




## -----------------   SCC - Year 2100 - Varying IMPACT Function -----------



myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "SCC in BURKE SR"          = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    ,"SCC in KAHN "             = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    ,"SCC in DICEreg (uniform)" = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DICEreg$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    ,"SCC in DJO"               = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_SCC_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("SCC in ",myyear," - Cooperative POP SSP2 under different IMPACT functions")
  ,legend = "SCC \n[$/tCO2]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)








## -----------------  Local DAMAGES - COOP - varying BURKE Type -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE SRdiff " = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LR "     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LRdiff " = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
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
    
    "BURKE SR "      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
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
    
    "BURKE SR "          = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"KAHN "             = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_KAHNn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"DJO"               = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_DJOn$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"BURKE LR "         = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"BURKE SR diff"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    ,"BURKE LR diff"     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGESperc_for_TATM_n(TATM_to_check = myTATM) 
    
  )
  
  ,title  = paste0("Damages associated to TATM + ",myTATM,"DEG - SSP2 under different IMPACT functions")
  ,legend = "Damages \n[% GDP]"
  
)





## -----------------  Local DAMAGES - COOP - varying IMPACT Function -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
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
    
    "PopWeights "     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_POPshare_nty  %>% filter(year==myyear)  
    ,"CBA coop pop"     = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty   %>% filter(year==myyear)
    ,"NWeights"     = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_PARAMETER_nty("nweights")  %>% filter(year==myyear) %>% mutate(unit = "%")
    ,"CBA coop ngsh"   = PP3ssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_MIU_nty  %>% filter(year==myyear)
  )
  
  ,title  = paste0("Pop Weights - BURKE SR SSP2")
  ,legend = "Weight"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
)




#=========================================================================##
## -------------- _____________   COOPERATION  _____________  ------------
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
    
    "CBA noncoop"     = PP5$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA coop"      = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    
    ,"DICE16 BAU"       = DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"DICE16 CBA"       = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU" = PPstory5$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
  )
  ,title  = "World FFI Emissions SSP2 - BURKESR - Different cooperation"
  ,yLabel = "Emissions [GtCO2/year]"
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
    
    
    "Coop SR "      = PP5$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop SRdiff"  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop LR"      = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop LRdiff"  = PP3ssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    
    ,"Noncoop SR "     = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop SRdiff"  = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop LR"      = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Noncoop LRdiff"  = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg"   = PP3ssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
  )
  ,title  = "World FFI Emissions SSP2 - CBAs with different BURKE function"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
)




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



