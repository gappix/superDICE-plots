# Script to evaluate different transitions of the MACCurves and CPrices
# and determine their impact on the overall model

#+++++++++++++++++++++++++
# Some reference times:
# 2020 -> t = 2
# 2040 -> t = 6
# 2050 -> t = 8
# 2100 -> t = 18
# 2125 -> t = 23
# 2150 -> t = 28
# 2200 -> t = 38
# 2250 -> t = 48
# 2300 -> t = 58
#+++++++++++++++++++++++++




## -----------------   source file   -----------------------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_plots/RICEx_00_colors_settings.R")
source("OTHER_datamng/ADVANCE_data_management.R")
source("OTHER_datamng/HIST_emissions_data.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

## -----------------   EXPERIMENTS   -----------------------------------------------
# Retrieve experiments

UNDNeg = list()

UNDNeg = experiments_load_as_list(UNDNeg,"UNDNeg")



##--------------- Additional data needed for plotting --------------------------------



## Add today values to historical for continuity
E_hist_PRIMAP_world_y = rbind(E_hist_PRIMAP_world_y, data.frame(year=2015, value= 35.04)) 




# -------------- PLOT CBA::  World Emissions  :: Comparing different experiments  -------------------



RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"A (23.10) PBLs1 "  = UNDNeg$v0x100$OPTIM$ed57$ssp2$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___PBLs1_DICEpb$get_worldEMIffi_ty
    
    ,"B (28.10) PBLs2 "  = UNDNeg$v0x101$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___PBLs2_DICEpb$get_worldEMIffi_ty
    
    ,"C (04.11) PBLs3 "  = UNDNeg$v0x103$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___PBLs3_pb18mup28$get_worldEMIffi_ty
    
    ,"D (11.11) PBLs4 "  = UNDNeg$v0x103$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___PBLs4_log_K0x25P18$get_worldEMIffi_ty
    
    ,"E (19.11) LUOGHG "  = UNDNeg$v0x104$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___LUOGHG$get_worldEMIffi_ty
    
    ,"F (10.12) LRExp PPP "  = UNDNeg$v0x9$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___LRexp_PPP_exmed_48_Ls_disc$get_worldEMIffi_ty
    
    ,"G (10.12) LRExp MER "  = UNDNeg$v0x9$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___LRexp_MER_exmed_48_Ls_disc$get_worldEMIffi_ty
    
    ,"H (10.01) PPstory PPP"  = UNDNeg$v1x00$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___PPstory$get_worldEMIffi_ty
    
  )
  ,title  = "World FFI Emissions SSP2 - Negishi Cooperative over model evolutions"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Model phases"
)

