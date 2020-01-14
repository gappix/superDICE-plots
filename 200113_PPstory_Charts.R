#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
#  Script to assess general model stories and charts.
#  Ultimate goal is identify a publishable storyline.
# 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("OTHER_datamng/HIST_emissions_data.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

source("RICEx_plots/RICEx_plots.R")

require_package("conflicted")
conflict_prefer("filter", "dplyr")
conflict_prefer("select", "dplyr")


#<<<<< DICE values




## -----------------   EXPERIMENTS   -----------------------------------

# Retrieve experiments fom automated procedure

PPstory = list()
PPstory = experiments_load_as_list(PPstory,"PPstory")



# shortcuts
EXP = PPstory$v1x00$OPTIM$ed57
EXPssp2_cooppop   = EXP$ssp2$coop_pop
EXPssp2_noncoop   = EXP$ssp2$noncoop_pop
EXPssp2_coopngsh  = EXP$ssp2$coop_negishi


#=========================================================================##
## ---------------- ——————————   LINE CHARTS   ————————————  ------------
#=========================================================================##


## -----------------  World EMISSIONS — BURKE SR varying COOPERATION  -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different cooperation scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


# >>> RICEx.plot.lineplot.world_emissions?
# COSA Migliorare
# Historical nere + BAU nere (e grigie se altre presenti)

RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg" = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
    ,"CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA coop ngsh"    = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA noncoop"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty

  )
  ,title  = "World FFI Emissions SSP2 - BURKESR - Different cooperation"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
)





## -----------------  World EMISSIONS — BURKE SR varying COOPERATION  +  DICE profiles -------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different cooperation scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


# >>> RICEx.plot.lineplot.world_emissions?
# COSA Migliorare
# Historical nere + BAU nere (e grigie se altre presenti)

RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg" = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
    ,"CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA coop ngsh"    = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA noncoop"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    
  )
  ,title  = "World FFI Emissions SSP2 - BURKESR - Different cooperation"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
)





## -----------------  DAMAGES COMPARED  -------------------


RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"CBA coop ngsh"    = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    ,"CBA noncoop"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    ,"CBA noncoop BurkeLRdiff"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_world_DAMAGEperc_ty
    
    
    
  )
  ,title  = "World FFI Emissions SSP2 - BURKESR - Different cooperation"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
)










#=========================================================================##
## ---------------- ——————————   MAP CHARTS   ————————————  ------------
#=========================================================================##


## -----------------  Local DAMAGES — BURKE SR varying COOPERATION -----------

myyear = 2100

RICEx.plot.multimap(
  EXPdata   = list(
    
     "BAU "             = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_DAMAGEperc_nty %>% filter(year == myyear)
    
    ,"CBA coop pop"     = EXPssp2_cooppop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA coop ngsh"    = EXPssp2_coopngsh$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA noncoop"      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
    
  )
          
  ,title  = paste0("Burke SR Damages in ",myyear," - SSP2 under different cooperation")
  ,legend = "Damages \n[% GDP]"
)





## -----------------  Local DAMAGES —  NONCOOP varying BURKE Type -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE SRdiff " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LR "     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LRdiff " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)

  )
  
  ,title  = paste0("Noncooperation Damages in ",myyear," — SSP2 under different BURKE functions")
  ,legend = "Damages \n[% GDP]"
)


## -----------------  Local DAMAGES —  COOP varying BURKE Type -----------

myyear = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "BURKE SR "      = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE SRdiff " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57SRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LR "     = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LR$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"BURKE LRdiff " = EXPssp2_noncoop$mcEDct4$climate_WITCHco2$damages_BURKE57LRdiff$welfare_DICE$savings_fixed_converging$CBA$get_DAMAGEperc_nty %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("Noncooperation Damages in ",myyear," — SSP2 under different BURKE functions")
  ,legend = "Damages \n[% GDP]"
)






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


