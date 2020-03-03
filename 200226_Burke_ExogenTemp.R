#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
#  BURKE MATCH : Focus on exogenoue temperatures
#  
#  Are our Damages in line with Burke et al. 2015 Paper? 
#  > Updated downscaling coefficients by Johannes
#  > exogenous temps to detect model issues
# 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

invisible(source("RICEx_plots/RICEx_plots.R"))





## -----------------   EXPERIMENTS   -----------------------------------

# Retrieve experiments fom automated procedure


BKmatch = list()
BKmatch = experiments_load_as_list(BKmatch,"BKmatch")



TATMexogen   = BKmatch$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$clexogenTATM
TLOCALexogen = BKmatch$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$clexogenTLOCAL
original     = BKmatch$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2






## BURKE SR/LR - Different Climates -----------------------------------------------------


#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different gamma scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


###  BURKE SR/LR

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    # SR
    "B.SR - endogen"      =  original$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
    ,"B.SR - TATM exogen" =  TATMexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    ,"B.SR - TLOC exogen" =  TLOCALexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    
    # LR 
    ,"B.LR - endogen"      =  original$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
    ,"B.LR - TATM exogen" =  TATMexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    ,"B.LR - TLOC exogen" =  TLOCALexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    

  )
  ,title  = "Burke Damages - cutoff unchanged (World GDPpc) - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 3
  
) + xlim(2000,2100) + ylim(-30,5); plottigat



###  BURKE SRdiff/LRdiff

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    # SR diff
    "B.SRdiff - endogen"      =     original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
    ,"B.SRdiff - TATM exogen" =    TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    ,"B.SRdiff - TLOC exogen" =  TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    
    # LR diff
    ,"B.LRdiff - endogen"      =     original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
    ,"B.LRdiff - TATM exogen" =    TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    ,"B.LRdiff - TLOC exogen" =  TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    
    
    
  )
  ,title  = "Burke Damages - cutoff unchanged (World GDPpc) - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 3
  
) + xlim(2000,2100) + ylim(-30,5); plottigat






## SR diff cutoffs
plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    

     "TATMexogen"            =    TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    ,"TATMex RPoff-median"     =    TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    
  
    ,"TLOCexogen"            =  TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    ,"TLOCexogen RPoff-median" =  TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
          

  
    # original
    ,"endogen"                =  original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
    ,"endogen RPoff-median"   =  original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
    
    
    
    
  )
  ,title  = "Burke Damages SRdiff -Different RPcutoffs - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 2
  
) + xlim(2000,2100) + ylim(-30,5); plottigat


## LRdiff

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "TATMexogen"            =    TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
     ,"TATMex RPoff-median"     =    TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
     
     
     ,"TLOCexogen"            =  TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
     ,"TLOCexogen RPoff-median" =  TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_world_DAMAGEperc_ty %>% mutate(value=value * 100)
    
     # original
     ,"endogen"   =  original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
     ,"endogen RPoff-median"   =  original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_world_DAMAGEperc_ty  %>% mutate(value=value * 100)
     
     
    
    
  )
  ,title  = "Burke Damages LRdiff -Different RPcutoffs - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 2
  
) + xlim(2000,2100) + ylim(-30,5); plottigat






### DRAW  ---------------------------------


# __FUNCTION__
# To evauate damage across two different baselines
#
Build_Damage_DF = function(YNETdam, YGROSSnodam, TATMdam, Experiment = "SSP3 - BURKE SR"){
  
  ## TEST +++++++++++++++++++++++++
  # YNETdam     = GDPssp5SR
  # YGROSSnodam = GDPssp5nodam
  # TATMdam     = TATMssp5SR
  #++++++++++++++++++++++++++++++++
  
  BKdam = merge(YNETdam,YGROSSnodam, by = c("t","year")) %>% rename(YNETdam = value.x, YGROSSnodam = value.y) %>% mutate(BKdamage =  100 * (YNETdam - YGROSSnodam )/YGROSSnodam )
  
  return( merge(BKdam, TATMdam, by = c("t","year")) %>% rename(TATM = value) %>% mutate("Experiment" = Experiment ))
  
}




# Exogen TLOCAL ................



TLOCALexogen_DF = rbind( 
  
    Build_Damage_DF( YNETdam      = TLOCALexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke LR - Exogen TLOCAL - cutoff Median"    )
    
    ,Build_Damage_DF(YNETdam      = TLOCALexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke LR - Exogen TLOCAL - cutoff World GDPpc"    )
    
    # SR
    
    ,Build_Damage_DF(YNETdam      = TLOCALexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke SR - Exogen TLOCAL - cutoff Median"    )
    
    ,Build_Damage_DF(YNETdam      = TLOCALexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke SR - Exogen TLOCAL - cutoff World GDPpc"    )
    
    # SRdiff
    
    ,Build_Damage_DF(YNETdam      = TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke SRdiff - Exogen TLOCAL - cutoff Median"    )
    
    ,Build_Damage_DF(YNETdam      = TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke SRdiff - Exogen TLOCAL - cutoff World GDPpc"    )
    
    
    # LRdiff
    
    ,Build_Damage_DF(YNETdam      = TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke LRdiff - Exogen TLOCAL - cutoff Median"    )
    
    ,Build_Damage_DF(YNETdam      = TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                     ,YGROSSnodam = TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                     ,TATMdam     = TLOCALexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                     ,"SSP5 - Burke LRdiff - Exogen TLOCAL - cutoff World GDPpc"    )
    
    
)



## Exogen TATM .......................

TATMexogen_DF = rbind( 
  
  Build_Damage_DF( YNETdam      = TATMexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LR - Exogen TATM - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = TATMexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LR - Exogen TATM - cutoff World GDPpc"    )
  
  # SR
  
  ,Build_Damage_DF(YNETdam      = TATMexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SR - Exogen TATM - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = TATMexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SR - Exogen TATM - cutoff World GDPpc"    )
  
  # SRdiff
  
  ,Build_Damage_DF(YNETdam      = TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SRdiff - Exogen TATM - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SRdiff - Exogen TATM - cutoff World GDPpc"    )
  
  
  # LRdiff
  
  ,Build_Damage_DF(YNETdam      = TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LRdiff - Exogen TATM - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffWorldGPDP$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = TATMexogen$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffWorldGPDP$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LRdiff - Exogen TATM - cutoff World GDPpc"    )
  
  
)




## Endogenous climate  .......................

endogenous_DF = rbind( 
  
  Build_Damage_DF( YNETdam      = original$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LR - endogenous Climate - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = original$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LR - endogenous Climate - cutoff World GDPpc"    )
  
  # SR
  
  ,Build_Damage_DF( YNETdam      = original$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SR - endogenous Climate - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = original$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SR - endogenous Climate - cutoff World GDPpc"    )
  
  # SRdiff
  
  ,Build_Damage_DF( YNETdam      = original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SRdiff - endogenous Climate - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke SRdiff - endogenous Climate - cutoff World GDPpc"    )
  
  
  # LRdiff
  
  ,Build_Damage_DF( YNETdam      = original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU__cutoffMedian$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam__cutoffMedian$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LRdiff - endogenous Climate - cutoff Median"    )
  
  ,Build_Damage_DF(YNETdam      = original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YNET", year_limit = 2100)
                   ,YGROSSnodam = original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "YGROSS", year_limit = 2100)
                   ,TATMdam     = original$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_TATM_ty %>% filter(year <= 2100)
                   ,"SSP5 - Burke LRdiff - endogenous Climate - cutoff World GDPpc"    )
  
  
)



## REDO EVERYTHING ---- 


###  BURKE SR/LR

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    # SR
    "B.SR - endogen"      =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke SR - endogenous Climate - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.SR - TATM exogen" =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke SR - Exogen TATM - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.SR - TLOC exogen" =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke SR - Exogen TLOCAL - cutoff World GDPpc") %>% rename(value = BKdamage)
    
    # LR 
    ,"B.LR - endogen"     =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke LR - endogenous Climate - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.LR - TATM exogen" =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke LR - Exogen TATM - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.LR - TLOC exogen" =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke LR - Exogen TLOCAL - cutoff World GDPpc") %>% rename(value = BKdamage)
    
    
  )
  ,title  = "Burke Damages - cutoff unchanged (World GDPpc) - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 3
  
) + xlim(2050,2100) + ylim(-80,5); plottigat



###  BURKE SRdiff/LRdiff

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    # SR
    "B.SRdiff - endogen"      =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke SRdiff - endogenous Climate - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.SRdiff - TATM exogen" =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke SRdiff - Exogen TATM - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.SRdiff - TLOC exogen" =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke SRdiff - Exogen TLOCAL - cutoff World GDPpc") %>% rename(value = BKdamage)
    
    # LR 
    ,"B.LRdiff - endogen"     =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke LRdiff - endogenous Climate - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.LRdiff - TATM exogen" =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke LRdiff - Exogen TATM - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"B.LRdiff - TLOC exogen" =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke LRdiff - Exogen TLOCAL - cutoff World GDPpc") %>% rename(value = BKdamage)
    
    
  )
  ,title  = "Burke Damages - cutoff unchanged (World GDPpc) - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 3
  
) + xlim(2050,2100) + ylim(-80,5); plottigat




## SR diff cutoffs
plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "TATM exogen"           =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke SRdiff - Exogen TATM - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"TATM exogen - median" =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke SRdiff - Exogen TATM - cutoff Median") %>% rename(value = BKdamage)
    
    ,"TLOC exogen"          =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke SRdiff - Exogen TLOCAL - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"TLOC exogen - median" =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke SRdiff - Exogen TLOCAL - cutoff Median") %>% rename(value = BKdamage)
    
    ,"endogen"              =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke SRdiff - endogenous Climate - cutoff World GDPpc") %>% rename(value = BKdamage)
    ,"endogen - median"     =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke SRdiff - endogenous Climate - cutoff Median") %>% rename(value = BKdamage)
    
    
    
  )
  ,title  = "Burke Damages SRdiff -Different RPcutoffs - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 2
  
) + xlim(2000,2100) + ylim(-40,5); plottigat

## LR diff cutoffs
plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(

  "TATM exogen"           =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke LRdiff - Exogen TATM - cutoff World GDPpc") %>% rename(value = BKdamage)
  ,"TATM exogen - median" =  TATMexogen_DF   %>% filter(Experiment == "SSP5 - Burke LRdiff - Exogen TATM - cutoff Median") %>% rename(value = BKdamage)
  
  ,"TLOC exogen"          =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke LRdiff - Exogen TLOCAL - cutoff World GDPpc") %>% rename(value = BKdamage)
  ,"TLOC exogen - median" =  TLOCALexogen_DF %>% filter(Experiment == "SSP5 - Burke LRdiff - Exogen TLOCAL - cutoff Median") %>% rename(value = BKdamage)
  
  ,"endogen"              =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke LRdiff - endogenous Climate - cutoff World GDPpc") %>% rename(value = BKdamage)
  ,"endogen - median"     =  endogenous_DF   %>% filter(Experiment == "SSP5 - Burke LRdiff - endogenous Climate - cutoff Median") %>% rename(value = BKdamage)

    
  )
  ,title  = "Burke Damages LRdiff -Different RPcutoffs - Exogenous Climates"
  ,yLabel = "Damages [%BAU]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 2
  
) + xlim(2000,2100) + ylim(-40,5); plottigat




##:::::::::::::::::::::::::::::::::::: ------
##:::::::::::::::::::::::::::::::::::: ------
##:::::::::::::::::::::::::::::::::::: ------
##:::::::::::::::::::::::::::::::::::: ------



# Colors and appearance --------

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



