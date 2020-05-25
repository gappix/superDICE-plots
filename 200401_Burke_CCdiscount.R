#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
# PPstory : Focus on Disentangled stories 
#  - AFTER UPDATING downscaler coeffs
#  - AFTER UPDATING damage function 
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


BurkeDDLT = list()
BurkeDDLT = experiments_load_as_list(BurkeDDLT,"BurkeDDLT")



# shortcuts
BKDDD = BurkeDDLT$v1x00$SIMUL$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging

BKDDDssp2 = BurkeDDLT$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging

BKDDDssp2noncoop = BurkeDDLT$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging

BKDDDssp2coop = BurkeDDLT$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging


##------------- Additional data needed for plotting --------------------


source("OTHER_datamng/HIST_emissions_data.R")
# DICE values 
source("OTHER_datamng/DICE_results_management.R")
# (available in "DICEresults" list)



## Add today values to historical for continuity
E_hist_PRIMAP_world_y = rbind(E_hist_PRIMAP_world_y, data.frame(year=2015, value= 35.04)) 


Burke_dfrac_original_nty = BKDDD$BAUdam__AAA$get_PARAMETER_nty("damfrac_burkesim")

Burke_ssp2_dfrac_original_nty = BKDDDssp2$BAUdam__ADE$get_PARAMETER_nty("damfrac_burkesim")


#=============================================================================#
####          ____________  TESTS  ____________                ####
#=============================================================================#



#----   AA* test   -------------------------

myreg = "fin"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "AAA"  = BKDDD$BAUdam__AAA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    ,"AAB" = BKDDD$BAUdam__AAB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    ,"AAC" = BKDDD$BAUdam__AAC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    ,"AAD" = BKDDD$BAUdam__AAD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    ,"AAE" = BKDDD$BAUdam__AAE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    ,"AAF" = BKDDD$BAUdam__AAF$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    
    , "burke"    = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2160)
    
  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       plottigat



#----   AB* test   -------------------------

myreg = "fin"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "ABA" = BKDDD$BAUdam__ABA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ABB" = BKDDD$BAUdam__ABB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ABC" = BKDDD$BAUdam__ABC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 

,   "ABD" = BKDDD$BAUdam__ABD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ABE" = BKDDD$BAUdam__ABE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ABF" = BKDDD$BAUdam__ABF$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 

,   "burke"  = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2140)
    
  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       plottigat




#----   AC* test   -------------------------

myreg = "fin"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "ACA" = BKDDD$BAUdam__ACA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ACB" = BKDDD$BAUdam__ACB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ACC" = BKDDD$BAUdam__ACC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 

,   "ACD" = BKDDD$BAUdam__ACD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ACE" = BKDDD$BAUdam__ACE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ACF" = BKDDD$BAUdam__ACF$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 

,   "burke"  = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2125)

  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       plottigat



#----   AD* test   -------------------------

myreg = "fin"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "ADA" = BKDDD$BAUdam__ADA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ADB" = BKDDD$BAUdam__ADB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ADC" = BKDDD$BAUdam__ADC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 

,   "ADD" = BKDDD$BAUdam__ADD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ADE" = BKDDD$BAUdam__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "ADF" = BKDDD$BAUdam__ADF$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 

,   "burke"  = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2120)

)
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       plottigat



#----   **E test   -------------------------

{
  
myreg = "fin"


#.... discount factor 

p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "2100-2200" = BKDDD$BAUdam__AAE$get_PARAMETER_ty("ddlt", year_limit = 2300) 
,   "2090-2200" = BKDDD$BAUdam__BAE$get_PARAMETER_ty("ddlt", year_limit = 2300)     
,   "2075-2200" = BKDDD$BAUdam__CAE$get_PARAMETER_ty("ddlt", year_limit = 2300)


,   "2100-2150" = BKDDD$BAUdam__ABE$get_PARAMETER_ty("ddlt", year_limit = 2300) 
,   "2090-2150" = BKDDD$BAUdam__BBE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,   "2075-2150" = BKDDD$BAUdam__CBE$get_PARAMETER_ty("ddlt", year_limit = 2300)

,   "2100-2125" = BKDDD$BAUdam__ACE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,   "2090-2125" = BKDDD$BAUdam__BCE$get_PARAMETER_ty("ddlt", year_limit = 2300) 
,   "2075-2125" = BKDDD$BAUdam__CCE$get_PARAMETER_ty("ddlt", year_limit = 2300)


,   "2100-2110" = BKDDD$BAUdam__ADE$get_PARAMETER_ty("ddlt", year_limit = 2300) 
,   "2090-2110" = BKDDD$BAUdam__BDE$get_PARAMETER_ty("ddlt", year_limit = 2300) 
,   "2075-2110" = BKDDD$BAUdam__CDE$get_PARAMETER_ty("ddlt", year_limit = 2300)

    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 3
  ,LaTeX_text = FALSE
  ,legend_columns = 1
) ; p1


#.... Damages  


p2 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "2100-2200" = BKDDD$BAUdam__AAE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2090-2200" = BKDDD$BAUdam__BAE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)     
,   "2075-2200" = BKDDD$BAUdam__CAE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)


,   "2100-2150" = BKDDD$BAUdam__ABE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2090-2150" = BKDDD$BAUdam__BBE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
,   "2075-2150" = BKDDD$BAUdam__CBE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,   "2100-2125" = BKDDD$BAUdam__ACE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
,   "2090-2125" = BKDDD$BAUdam__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2075-2125" = BKDDD$BAUdam__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)


,   "2100-2110" = BKDDD$BAUdam__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2090-2110" = BKDDD$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2075-2110" = BKDDD$BAUdam__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,   "burke"  = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2160)

  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 3
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       p2

}

## Combine

nCol = 2
nRow = 1
myTitle = TeX("Fixed slope - different intervals")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat


#----   BC* test   -------------------------

{
  
  myreg = "fin"
  
  
#.... discount factor 

p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
      
    "2090-2125 | 0.15" = BKDDD$BAUdam__BCA$get_PARAMETER_ty("ddlt", year_limit = 2300) 
,   "2090-2125 | 0.25" = BKDDD$BAUdam__BCB$get_PARAMETER_ty("ddlt", year_limit = 2300)     
,   "2090-2125 | 0.40" = BKDDD$BAUdam__BCE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,   "2090-2125 | 0.50" = BKDDD$BAUdam__BCC$get_PARAMETER_ty("ddlt", year_limit = 2300) 
,   "2090-2125 | 0.75" = BKDDD$BAUdam__BCD$get_PARAMETER_ty("ddlt", year_limit = 2300)     
,   "2090-2125 | 1.00" = BKDDD$BAUdam__BCF$get_PARAMETER_ty("ddlt", year_limit = 2300)

  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  ) ; p1
  
  
  #.... Damages  
  

p2 <- RICEx.plot.lineplot(
  
EXPdata   = list(
    
  "2090-2125 | 0.15" = BKDDD$BAUdam__BCA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2090-2125 | 0.25" = BKDDD$BAUdam__BCB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)     
,   "2090-2125 | 0.40" = BKDDD$BAUdam__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2090-2125 | 0.50" = BKDDD$BAUdam__BCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,   "2090-2125 | 0.75" = BKDDD$BAUdam__BCD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)     
,   "2090-2125 | 1.00" = BKDDD$BAUdam__BCF$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    
,   "burke"  = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2120)
    
  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       p2
  
}

## Combine

nCol = 2
nRow = 1
myTitle = TeX("Fixed interval - different slopes")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat








#----   Other test   -------------------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "AAA" = BKDDD$BAUdam__AAA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"AAB" = BKDDD$BAUdam__AAB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"AAC" = BKDDD$BAUdam__AAC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"AAD" = BKDDD$BAUdam__AAD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 

    ,"ABA" = BKDDD$BAUdam__ABA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"ABB" = BKDDD$BAUdam__ABB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"ABC" = BKDDD$BAUdam__ABC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"ABD" = BKDDD$BAUdam__ABD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"ACA" = BKDDD$BAUdam__ACA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"ACB" = BKDDD$BAUdam__ACB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"ACC" = BKDDD$BAUdam__ACC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"ACD" = BKDDD$BAUdam__ACD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    )
  ,title  = "Finland damages - No mitigation"
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) ; plottigat



# same chart, better names



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "2100-2200 | .15" = BKDDD$BAUdam__AAA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2200 | .25" = BKDDD$BAUdam__AAB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2200 | .5 " = BKDDD$BAUdam__AAC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2200 | .75" = BKDDD$BAUdam__AAD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"2100-2150 | .15" = BKDDD$BAUdam__ABA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2150 | .25" = BKDDD$BAUdam__ABB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2150 | .5 " = BKDDD$BAUdam__ABC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2150 | .75" = BKDDD$BAUdam__ABD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"2100-2125 | .15" = BKDDD$BAUdam__ACA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2125 | .25" = BKDDD$BAUdam__ACB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2125 | .5 " = BKDDD$BAUdam__ACC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2125 | .75" = BKDDD$BAUdam__ACD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    , "Burke Orig" = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2160)
  )
  ,title  = "Finland damages - No mitigation"
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 4
  ,LaTeX_text = FALSE
) ; plottigat



#----  EARLY START in 2090  -------------------------





plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "BAA" = BKDDD$BAUdam__BAA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BAB" = BKDDD$BAUdam__BAB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BAC" = BKDDD$BAUdam__BAC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BAD" = BKDDD$BAUdam__BAD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"BBA" = BKDDD$BAUdam__BBA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BBB" = BKDDD$BAUdam__BBB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BBC" = BKDDD$BAUdam__BBC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BBD" = BKDDD$BAUdam__BBD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"BCA" = BKDDD$BAUdam__BCA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BCB" = BKDDD$BAUdam__BCB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BCC" = BKDDD$BAUdam__BCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"BCD" = BKDDD$BAUdam__BCD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    , "burke" = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2155)
    
  )
  ,title  = "Finland damages - No mitigation"
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 4
  ,LaTeX_text = FALSE
) ; plottigat



# same chart, better names



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "2090-2200 | .15"   = BKDDD$BAUdam__BAA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2200 | .25"   = BKDDD$BAUdam__BAB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2200 | .5 "   = BKDDD$BAUdam__BAC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2200 | .75"   = BKDDD$BAUdam__BAD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"2090-2150 | .15"   = BKDDD$BAUdam__BBA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2150 | .25"   = BKDDD$BAUdam__BBB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2150 | .5 "   = BKDDD$BAUdam__BBC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2150 | .75"   = BKDDD$BAUdam__BBD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"2090-2125 | .15"   = BKDDD$BAUdam__BCA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2125 | .25"   = BKDDD$BAUdam__BCB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2125 | .5 "   = BKDDD$BAUdam__BCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2125 | .75"   = BKDDD$BAUdam__BCD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    , "burke" = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2155)
    
  )
  ,title  = "Finland damages - No mitigation"
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 4
  ,LaTeX_text = FALSE
) ; plottigat







#----  Focus on best (ending 2125)   -------------------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "2100-2125 | .15"   = BKDDD$BAUdam__ACA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2125 | .25"   = BKDDD$BAUdam__ACB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2125 | .5 "   = BKDDD$BAUdam__ACC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2125 | .75"   = BKDDD$BAUdam__ACD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    ,"2090-2125 | .15"   = BKDDD$BAUdam__BCA$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2125 | .25"   = BKDDD$BAUdam__BCB$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2125 | .5 "   = BKDDD$BAUdam__BCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2125 | .75"   = BKDDD$BAUdam__BCD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    , "burke" = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2125)
    
  )
  ,title  = "Finland damages - No mitigation"
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = FALSE
) ; plottigat





## Discount factor ---------------------



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
     "2100-2125 | .15"   = BKDDD$BAUdam__ACA$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2125 | .25"   = BKDDD$BAUdam__ACB$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2125 | .5 "   = BKDDD$BAUdam__ACC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2125 | .75"   = BKDDD$BAUdam__ACD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2090-2125 | .15"   = BKDDD$BAUdam__BCA$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2125 | .25"   = BKDDD$BAUdam__BCB$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2125 | .5 "   = BKDDD$BAUdam__BCC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2125 | .75"   = BKDDD$BAUdam__BCD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2100-2110 | .15"   = BKDDD$BAUdam__ADA$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 | .25"   = BKDDD$BAUdam__ADB$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 | .5 "   = BKDDD$BAUdam__ADC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 | .75"   = BKDDD$BAUdam__ADD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = FALSE
) ; plottigat



## 


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "2100-2125 | .15"   = BKDDD$BAUdam__ACA$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2125 | .25"   = BKDDD$BAUdam__ACB$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2125 | .5 "   = BKDDD$BAUdam__ACC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2125 | .75"   = BKDDD$BAUdam__ACD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2090-2125 | .15"   = BKDDD$BAUdam__BCA$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2125 | .25"   = BKDDD$BAUdam__BCB$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2125 | .5 "   = BKDDD$BAUdam__BCC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2125 | .75"   = BKDDD$BAUdam__BCD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2100-2110 |sk3 .15"   = BKDDD$BAUdam__ADA3$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 |sk3 .25"   = BKDDD$BAUdam__ADB3$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 |sk3 .5 "   = BKDDD$BAUdam__ADC3$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 |sk3 .75"   = BKDDD$BAUdam__ADD3$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    ,"2100-2110 |sk1.5 .15"   = BKDDD$BAUdam__ADA1x5$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 |sk1.5 .25"   = BKDDD$BAUdam__ADB1x5$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 |sk1.5 .5 "   = BKDDD$BAUdam__ADC1x5$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 |sk1.5 .75"   = BKDDD$BAUdam__ADD1x5$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 4
  ,LaTeX_text = FALSE
) ; plottigat




p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    

    "2100-2125 | .5 "   = BKDDD$BAUdam__ACC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2125 | .75"   = BKDDD$BAUdam__ACD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2090-2125 | .5 "   = BKDDD$BAUdam__BCC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2125 | .75"   = BKDDD$BAUdam__BCD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2100-2110 | .5 "   = BKDDD$BAUdam__ADC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 | .75"   = BKDDD$BAUdam__ADD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 2
  ,LaTeX_text = FALSE
) ; p1



# che si riflette in


p2 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    
     "2100-2125 | .5 "   = BKDDD$BAUdam__ACC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2125 | .75"   = BKDDD$BAUdam__ACD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    ,"2090-2125 | .5 "   = BKDDD$BAUdam__BCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2125 | .75"   = BKDDD$BAUdam__BCD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    ,"2100-2110 | .5 "   = BKDDD$BAUdam__ADC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2110 | .75"   = BKDDD$BAUdam__ADD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    

    , "burke" = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2120)
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 2
  ,LaTeX_text = FALSE
) ; p2 




## Combine

nCol = 2
nRow = 1
myTitle = TeX("Damage fraction SSP2 BurkeSR - COOP/NONCOOP - Different Damage limit")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat





#----  Comparison E   -------------------------


p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    
    "2100-2125 | .4 "    = BKDDD$BAUdam__ACE$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2100-2110 | .4"    = BKDDD$BAUdam__ADE$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2090-2125 | .4 "   = BKDDD$BAUdam__BCE$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2090-2110 | .4"    = BKDDD$BAUdam__BDE$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2100-2110 | .5 "   = BKDDD$BAUdam__ADC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    

    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 2
  ,LaTeX_text = FALSE
) ; p1



# che si riflette in


p2 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    
     "2100-2125 | .4 "   = BKDDD$BAUdam__ACE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2100-2110 | .4"    = BKDDD$BAUdam__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    ,"2090-2125 | .4 "   = BKDDD$BAUdam__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2090-2110 | .4"    = BKDDD$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    ,"2100-2110 | .5 "   = BKDDD$BAUdam__ADC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    , "burke" = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2120)
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 4
  ,colors_per_category = 2
  ,LaTeX_text = FALSE
) ; p2 




## Combine

nCol = 2
nRow = 1
myTitle = TeX("Damage fraction SSP2 BurkeSR - COOP/NONCOOP - Different Damage limit")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat



#----  Comparison F   -------------------------


p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    

    
     "2075-2125 | .5"    = BKDDD$BAUdam__CCC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2125 | .75"   = BKDDD$BAUdam__CCD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2125 | .4"    = BKDDD$BAUdam__CCE$get_PARAMETER_ty("ddlt", year_limit = 2300)
  
    ,"2075-2110 | .5"    = BKDDD$BAUdam__CDC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2110 | .75"   = BKDDD$BAUdam__CDD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2110 | .4"    = BKDDD$BAUdam__CDE$get_PARAMETER_ty("ddlt", year_limit = 2300)
    

    ,"2090-2110 | .4"    = BKDDD$BAUdam__BDE$get_PARAMETER_ty("ddlt", year_limit = 2300)    
    
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 3
  ,LaTeX_text = FALSE
) ; p1



# che si riflette in


p2 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    
     "2075-2125 | .5"   = BKDDD$BAUdam__CCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2125 | .75"   = BKDDD$BAUdam__CCD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2125 | .4"    = BKDDD$BAUdam__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"2075-2110 | .5"    = BKDDD$BAUdam__CDC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2110 | .75"   = BKDDD$BAUdam__CDD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2110 | .4"    = BKDDD$BAUdam__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    ,"2090-2110 | .4"    = BKDDD$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin")    
    , "burke"            = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2115)
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 3
  ,LaTeX_text = FALSE
) ; p2 




## Combine

nCol = 2
nRow = 1
myTitle = TeX("Damage fraction SSP2 BurkeSR - COOP/NONCOOP - Different Damage limit")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat






#=============================================================================#
####          ____________  Best selection  ____________                ####
#=============================================================================#



#----  Combining best   -------------------------

{
  
  myreg = "fin"
  
  
  #.... discount factor 
  
  p1 <- RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      "2090-2125 | 0.40" = BKDDD$BAUdam__BCE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,     "2090-2125 | 0.50" = BKDDD$BAUdam__BCC$get_PARAMETER_ty("ddlt", year_limit = 2300) 
  
,     "2075-2125 | 0.40" = BKDDD$BAUdam__CCE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,     "2075-2125 | 0.50" = BKDDD$BAUdam__CCC$get_PARAMETER_ty("ddlt", year_limit = 2300) 
  
,     "2100-2110 | 0.40" = BKDDD$BAUdam__ADE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,     "2100-2110 | 0.50" = BKDDD$BAUdam__ADC$get_PARAMETER_ty("ddlt", year_limit = 2300) 

,     "2090-2110 | 0.40" = BKDDD$BAUdam__BDE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,     "2090-2110 | 0.50" = BKDDD$BAUdam__BDC$get_PARAMETER_ty("ddlt", year_limit = 2300) 

,     "2075-2110 | 0.40" = BKDDD$BAUdam__CDE$get_PARAMETER_ty("ddlt", year_limit = 2300)
,     "2075-2110 | 0.50" = BKDDD$BAUdam__CDC$get_PARAMETER_ty("ddlt", year_limit = 2300)

      
    )
    ,title  = "Discount factor"
    ,yLabel = "Value"
    ,legend = "Scenarios"
    ,categories = 6
    ,colors_per_category = 2
    ,LaTeX_text = FALSE
    ,legend_columns = 1
  ) ; p1
  
  
  #.... Damages  
  
  
  p2 <- RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      "2090-2125 | 0.40" = BKDDD$BAUdam__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
,     "2090-2125 | 0.50" = BKDDD$BAUdam__BCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2075-2125 | 0.40" = BKDDD$BAUdam__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
,     "2075-2125 | 0.50" = BKDDD$BAUdam__CCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2100-2110 | 0.40" = BKDDD$BAUdam__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
,     "2100-2110 | 0.50" = BKDDD$BAUdam__ADC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2090-2110 | 0.40" = BKDDD$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
,     "2090-2110 | 0.50" = BKDDD$BAUdam__BDC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2075-2110 | 0.40" = BKDDD$BAUdam__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
,     "2075-2110 | 0.50" = BKDDD$BAUdam__CDC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,    "burke"  = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2120)
      
    )
    
    ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
    ,yLabel = "Damages [%GDPssp]"
    ,legend = "Scenarios"
    ,categories = 6
    ,colors_per_category = 2
    ,LaTeX_text = FALSE
    ,legend_columns = 1
    
  )  + 
    geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
               aes(x=year, y=value)) +
    geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
              aes(x=year, y=value,label=round(value,2)),
              hjust=1.1, 
              vjust=0);       p2
  
}

## Combine

nCol = 2
nRow = 1
myTitle = TeX("Best combined")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat



## ------ Focus -----------------



myreg = "usa"

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
      "2090-2125 | 0.40" = BKDDD$BAUdam__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 

,     "2075-2125 | 0.40" = BKDDD$BAUdam__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2100-2110 | 0.40" = BKDDD$BAUdam__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2090-2110 | 0.40" = BKDDD$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2075-2110 | 0.40" = BKDDD$BAUdam__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,    "burke"  = Burke_dfrac_original_nty %>% filter(n==myreg, year <= 2140)

  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region.")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 6
  ,colors_per_category = 1
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       plottigat


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2075,2105), ylim = c(200,700))




#=============================================================================#
####          ____________  Other checks  ____________                ####
#=============================================================================#




## ------ SSP2 -----------------



myreg = "rus"

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
      "2090-2125 | 0.40" = BKDDDssp2$BAUdam__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    
,     "2075-2125 | 0.40" = BKDDDssp2$BAUdam__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2100-2110 | 0.40" = BKDDDssp2$BAUdam__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2090-2110 | 0.40" = BKDDDssp2$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,     "2075-2110 | 0.40" = BKDDDssp2$BAUdam__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)

,    "burke"  = Burke_ssp2_dfrac_original_nty %>% filter(n==myreg, year <= 2120)

  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region — SSP2")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 6
  ,colors_per_category = 1
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
)  + 
  geom_point(data=Burke_ssp2_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_ssp2_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       plottigat


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2075,2105), ylim = c(200,700))


## ------ CBA NONCOOP -----------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
      "2090-2125 | 0.40" = BKDDDssp2noncoop$CBA__BCE$get_world_EMIffi_ty

,     "2075-2125 | 0.40" = BKDDDssp2noncoop$CBA__CCE$get_world_EMIffi_ty

,     "2100-2110 | 0.40" = BKDDDssp2noncoop$CBA__ADE$get_world_EMIffi_ty

,     "2090-2110 | 0.40" = BKDDDssp2noncoop$CBA__BDE$get_world_EMIffi_ty

,     "2075-2110 | 0.40" = BKDDDssp2noncoop$CBA__CDE$get_world_EMIffi_ty

    
  )
  
  ,title  = paste0("World emissions")
  ,yLabel = "Emissions FFI [GtCO2]"
  ,legend = "Scenarios"
  ,categories = 6
  ,colors_per_category = 1
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
) ;       plottigat


## damages

myreg = "rus"

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "2090-2125 | 0.40" = BKDDDssp2noncoop$CBA__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    
    ,     "2075-2125 | 0.40" = BKDDDssp2noncoop$CBA__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
    
    ,     "2100-2110 | 0.40" = BKDDDssp2noncoop$CBA__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
    
    ,     "2090-2110 | 0.40" = BKDDDssp2noncoop$CBA__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
    
    ,     "2075-2110 | 0.40" = BKDDDssp2noncoop$CBA__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
    
    
  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region — CBA NONcoop SSP2")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 6
  ,colors_per_category = 1
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
) ;       plottigat


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2075,2105), ylim = c(200,700))


## ------ CBA COOP  -----------------

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "2090-2125 | 0.40" = BKDDDssp2coop$CBA__BCE$get_world_EMIffi_ty
    
,   "2075-2125 | 0.40" = BKDDDssp2coop$CBA__CCE$get_world_EMIffi_ty

,   "2100-2110 | 0.40" = BKDDDssp2coop$CBA__ADE$get_world_EMIffi_ty

,   "2090-2110 | 0.40" = BKDDDssp2coop$CBA__BDE$get_world_EMIffi_ty

,   "2075-2110 | 0.40" = BKDDDssp2coop$CBA__CDE$get_world_EMIffi_ty

    
  )
  
  ,title  = paste0("World emissions")
  ,yLabel = "Emissions FFI [GtCO2]"
  ,legend = "Scenarios"
  ,categories = 6
  ,colors_per_category = 1
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
) ;       plottigat




#------------------$$$$$_--------------------------



myreg = "rus"

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "2090-2125 | 0.40" = BKDDDssp2$BAUdam__BCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg) 
    
  ,     "2075-2125 | 0.40" = BKDDDssp2$BAUdam__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
  
  ,     "2100-2110 | 0.40" = BKDDDssp2$BAUdam__ADE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
  
  ,     "2090-2110 | 0.40" = BKDDDssp2$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
  
  ,     "2075-2110 | 0.40" = BKDDDssp2$BAUdam__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n==myreg)
  
  ,    "burke"  = Burke_ssp2_dfrac_original_nty %>% filter(n==myreg, year <= 2120)
  
  )
  
  ,title  = paste0("Damages (%GDPssp) for ", myreg, " region — SSP2")
  ,yLabel = "Damages [%GDPssp]"
  ,legend = "Scenarios"
  ,categories = 6
  ,colors_per_category = 1
  ,LaTeX_text = FALSE
  ,legend_columns = 1
  
)  + 
  geom_point(data=Burke_ssp2_dfrac_original_nty %>% filter(n==myreg, year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_ssp2_dfrac_original_nty %>% filter(n==myreg, year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);       plottigat


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2075,2105), ylim = c(200,700))



## ------------- othe --------------------
p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "2075-2125 | .5"    = BKDDD$BAUdam__CCC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2125 | .75"   = BKDDD$BAUdam__CCD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2125 | .4"    = BKDDD$BAUdam__CCE$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    ,"2075-2110 | .5"    = BKDDD$BAUdam__CDC$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2110 | .75"   = BKDDD$BAUdam__CDD$get_PARAMETER_ty("ddlt", year_limit = 2300)
    ,"2075-2110 | .4"    = BKDDD$BAUdam__CDE$get_PARAMETER_ty("ddlt", year_limit = 2300)
    
    
    ,"2090-2110 | .4"    = BKDDD$BAUdam__BDE$get_PARAMETER_ty("ddlt", year_limit = 2300)    
    
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 3
  ,LaTeX_text = FALSE
) ; p1



# che si riflette in


p2 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    
    "2075-2125 | .5"   = BKDDD$BAUdam__CCC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2125 | .75"   = BKDDD$BAUdam__CCD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2125 | .4"    = BKDDD$BAUdam__CCE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    ,"2075-2110 | .5"    = BKDDD$BAUdam__CDC$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2110 | .75"   = BKDDD$BAUdam__CDD$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    ,"2075-2110 | .4"    = BKDDD$BAUdam__CDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin") 
    
    
    ,"2090-2110 | .4"    = BKDDD$BAUdam__BDE$get_PARAMETER_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n=="fin")    
    , "burke"            = Burke_dfrac_original_nty %>% filter(n=="fin", year <= 2115)
    
  )
  ,title  = "Discount factor"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 3
  ,LaTeX_text = FALSE
)  + 
  geom_point(data=Burke_dfrac_original_nty %>% filter(n=="fin", year == 2100), 
             aes(x=year, y=value)) +
  geom_text(data=Burke_dfrac_original_nty %>% filter(n=="fin", year == 2100),  
            aes(x=year, y=value,label=round(value,2)),
            hjust=1.1, 
            vjust=0);    p2


## Combine

nCol = 2
nRow = 1
myTitle = TeX("Damage fraction SSP2 BurkeSR - COOP/NONCOOP - Different Damage limit")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat













































#------------------
#-------------------
#-----------------

#----  World EMI  -  SSP2 BHM SR - Damages Discounted -  # DISGamma    -------------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal emissions trends under 
# different gamma scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "CBA $\\gamma = 0$"     = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_world_EMIffi_ty
    ,"CBA $\\gamma = 0.5$"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5_OmegaFull_disc$get_world_EMIffi_ty
    ,"CBA $\\gamma = 1.45$" = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45_OmegaFull_disc$get_world_EMIffi_ty
    ,"CBA $\\gamma = 2$"    = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2_OmegaFull_disc$get_world_EMIffi_ty
    
    ,"CBA non-coop" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_world_EMIffi_ty
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__OmegaFull$get_world_EMIffi_ty
    ,"BAU dmg"     = BKC_sim$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__OmegaFull_disc$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 Burke SR - Damages Discounted - different Inequality Aversion ($\\gamma$)"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat


#...................
# wanna save?
ggsave(filename = "./plots/worldEMI_diff_Gammas.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)






#----  World EMI  -  SSP2 BHM SR - Damages Cap -  # DISGamma    -------------------------



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "CBA $\\gamma = 0$"     = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_world_EMIffi_ty
    ,"CBA $\\gamma = 0.5$"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5_OmegaFull_cap$get_world_EMIffi_ty
    ,"CBA $\\gamma = 1.45$" = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45_OmegaFull_cap$get_world_EMIffi_ty
    ,"CBA $\\gamma = 2$"    = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2_OmegaFull_cap$get_world_EMIffi_ty
    
    ,"CBA non-coop" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_world_EMIffi_ty
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__OmegaFull$get_world_EMIffi_ty
    ,"BAU dmg"     = BKC_sim$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__OmegaFull_cap$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 Burke SR - Damages Cap - different Inequality Aversion ($\\gamma$)"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





#----  World EMI  -  SSP2 BHM SR  -  # Omega type + Damages cap    -------------------------



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Coop, Omega full, Dam cap"      = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_world_EMIffi_ty
    ,"NoCoop, Omega full, Dam cap "   = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_world_EMIffi_ty
    
    
    ,"Coop, Omega simpl, Dam cap"     = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaSimple_cap$get_world_EMIffi_ty
    ,"NoCoop, Omega simpl, Dam cap "  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaSimple_cap$get_world_EMIffi_ty
    
    ,"Coop, Omega full, Dam disc"  = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_world_EMIffi_ty
    ,"NoCoop, Omega full, Dam disc "  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_world_EMIffi_ty
    
    
    ,"Coop, Omega simpl, Dam disc" = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaSimple_disc$get_world_EMIffi_ty
    ,"NoCoop, Omega simpl, Dam disc " = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaSimple_disc$get_world_EMIffi_ty
    
    
    
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__OmegaFull$get_world_EMIffi_ty
    ,"BAU dmg"     = BKC_sim$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__OmegaFull_cap$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 Burke SR - different Omega and Damage Cap"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 5
  ,colors_per_category = 2
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat






#----  World EMI  - SSP2 OMGfull DMGdisc -  # Burke function    -------------------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "COOP SR"       = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_world_EMIffi_ty
    ,"COOP SRdiff"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_world_EMIffi_ty
    ,"COOP LR"       = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_world_EMIffi_ty
    ,"COOP LRdiff"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_world_EMIffi_ty
    
    ,"NOCOOP SR"     = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_world_EMIffi_ty
    ,"NOCOOP SRdiff" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_world_EMIffi_ty
    ,"NOCOOP LR"     = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_world_EMIffi_ty
    ,"NOCOOP LRdiff" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_world_EMIffi_ty
    
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__OmegaFull$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 OMEGAfull DMGdisc - different Burke function"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





#----  World EMI  - SSP2 OMGfull DMGcap -  # Burke function    -------------------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "COOP SR"       = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_world_EMIffi_ty
    ,"COOP SRdiff"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_world_EMIffi_ty
    ,"COOP LR"       = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_world_EMIffi_ty
    ,"COOP LRdiff"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_world_EMIffi_ty
    
    ,"NOCOOP SR"     = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_world_EMIffi_ty
    ,"NOCOOP SRdiff" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_world_EMIffi_ty
    ,"NOCOOP LR"     = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_world_EMIffi_ty
    ,"NOCOOP LRdiff" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_world_EMIffi_ty
    
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__OmegaFull$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 OMEGAfull DMGcap - different Burke function"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat




#----  World EMI  - SSP2 OMEGsimple DMGdisc -  # Burke function    -------------------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "COOP SR"       = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaSimple_disc$get_world_EMIffi_ty
    ,"COOP SRdiff"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaSimple_disc$get_world_EMIffi_ty
    ,"COOP LR"       = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaSimple_disc$get_world_EMIffi_ty
    ,"COOP LRdiff"   = BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaSimple_disc$get_world_EMIffi_ty
    
    ,"NOCOOP SR"     = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaSimple_disc$get_world_EMIffi_ty
    ,"NOCOOP SRdiff" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$CBA__OmegaSimple_disc$get_world_EMIffi_ty
    ,"NOCOOP LR"     = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$CBA__OmegaSimple_disc$get_world_EMIffi_ty
    ,"NOCOOP LRdiff" = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$CBA__OmegaSimple_disc$get_world_EMIffi_ty
    
    
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__OmegaSimple$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 OMEGAsimple DMGdisc - different Burke function"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





#=============================================================================#
####          ____________  REGIONS LINE CHARTS  ____________                ####
#=============================================================================#




## -----------------  DAMFRAC nty - BAU SSP2 - Damages Cap -------------------


plottigat = ggplot() + 
  
  geom_line(data= BKC_sim$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__OmegaFull_cap$get_PARAMETER_nty("damfrac_estim_ykali")
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Damage fraction - Damage Cap " ) + 
  xlab("Year") +
  ylab("Damages [%GDPssp]")  ; plottigat



## -----------------  DAMFRAC nty - BAU SSP2 - Damages Disc  -------------------


plottigat = ggplot() + 
  
  geom_line(data= BKC_sim$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__OmegaFull_disc$get_PARAMETER_nty("damfrac_estim_ykali")
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Damage fraction - Damage Discounted " ) + 
  xlab("Year") +
  ylab("Damages [%GDPssp]")  ; plottigat





## -----------------  DAMFRAC nty - NONCOOP SSP2 SR - Damages Cap -------------------


{ plottigat = ggplot() + 
  
  geom_line(data= BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_DAMAGEperc_nty  %>% mutate(value = (-1)*value)
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Damage fraction - NONCOOP SSP2 BurkeSR - Damage Cap " ) + 
  xlab("Year") +
  ylab("Damages [%GDPssp]")  + ylim(-100,300); plottigat }


## -----------------  DAMFRAC nty - NONCOOP SSP2 SR - Damages Disco -------------------


{ plottigat = ggplot() + 
  
  geom_line(data= BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_DAMAGEperc_nty %>% mutate(value = (-1)*value)
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Damage fraction - NONCOOP SSP2 BurkeSR - Damage Discounted " ) + 
  xlab("Year") +
  ylab("Damages [%GDPssp]")  + ylim(-100,300)  ; plottigat }




## -----------------  DAMFRAC nty - COOP SSP2 SR - Damages Cap -------------------


{ plottigat = ggplot() + 
  
  geom_line(data= BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_DAMAGEperc_nty  %>% mutate(value = (-1)*value)
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Damage fraction - COOP SSP2 BurkeSR - Damage Cap " ) + 
  xlab("Year") +
  ylab("Damages [%GDPssp]")   + ylim(-100,300) ; plottigat }


## -----------------  DAMFRAC nty - COOP SSP2 SR - Damages Disc -------------------

plottigat = ggplot() + 
  
  geom_line(data= BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_DAMAGEperc_nty  %>% mutate(value = (-1)*value)
            ,aes(x=year, y=value, group=n, color = n)
            ,size = 1)  + 
  
  scale_color_manual(  values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Damage fraction - COOP SSP2 BurkeSR - Damage Disco " ) + 
  xlab("Year") +
  ylab("Damages [%GDPssp]")  ; plottigat 


## -----------------  COMBO DAMFRAC nty - SSP2 SR - # Coop # Damages -------------------


yup = 300

{
  
  p1 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_DAMAGEperc_nty  %>% mutate(value = (-1)*value)
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("NONCOOP - Damage Cap " ) + 
    xlab("Year") +
    ylab("Damages [%GDPssp]")  + ylim(-100,yup); p1
  
  
  #................
  
  p2 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_DAMAGEperc_nty %>% mutate(value = (-1)*value)
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("NONCOOP - Damage Discounted " ) + 
    xlab("Year") +
    ylab("Damages [%GDPssp]")  + ylim(-100,yup)  ; p2
  
  
  #.................
  
  
  p3 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_DAMAGEperc_nty  %>% mutate(value = (-1)*value)
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("COOP - Damage Cap " ) + 
    xlab("Year") +
    ylab("Damages [%GDPssp]")    + ylim(-100,yup) ; p3
  
  
  #.................
  
  
  p4 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_DAMAGEperc_nty  %>% mutate(value = (-1)*value)
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("COOP - Damage Discounted " ) + 
    xlab("Year") +
    ylab("Damages [%GDPssp]")  + ylim(-100,yup) ; p4 
  
} # << run whole block from here

## Combine

nCol = 2
nRow = 2
myTitle = TeX("Damage fraction SSP2 BurkeSR - COOP/NONCOOP - Different Damage limit")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat





## -----------------  COMBO MIU nty - SSP2 SR - # Coop # Damages -------------------



{
  
  p1 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_cap$get_MIU_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("NONCOOP - Damage Cap " ) + 
    xlab("Year") +
    ylab("Mitigation [%BAU]")  ; p1
  
  
  #................
  
  p2 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OmegaFull_disc$get_MIU_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("NONCOOP - Damage Discounted " ) + 
    xlab("Year") +
    ylab("Mitigation [%BAU]")    ; p2
  
  
  #.................
  
  
  p3 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_cap$get_MIU_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("COOP - Damage Cap " ) + 
    xlab("Year") +
    ylab("Mitigation [%BAU]")     ; p3
  
  
  #.................
  
  
  p4 = ggplot() + 
    
    geom_line(data= BKC_opt$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0_OmegaFull_disc$get_MIU_nty
              ,aes(x=year, y=value, group=n, color = n)
              ,size = 1)  + 
    
    scale_color_manual(  values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=3)) +
    
    theme( plot.title = element_text(size=14),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle("COOP - Damage Discounted " ) + 
    xlab("Year") +
    ylab("Mitigation [%BAU]")   ; p4 
  
} # << run whole block from here

## Combine

nCol = 2
nRow = 2
myTitle = TeX("Mitigation over time SSP2 BurkeSR - COOP/NONCOOP - Different Damage limit")

plottigat <- annotate_figure(do.call("ggarrange", c(list(p1,p2,p3,p4), ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat





#=============================================================================#
####          ____________  EXTRA LINE CHARTS  ____________                ####
#=============================================================================#


## -----------------  domg parameter  -------------------


plottigat = ggplot() + 
  
  geom_line(data= BKC_sim$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam__OmegaFull_disc$get_PARAMETER_ty("domg",year_limit = 2300)
            ,aes(x=year, y=value, group=1, color = "domg")
            ,size = 1)  + 
  
  
  
  guides(colour=guide_legend(ncol=3)) +
  
  theme( plot.title = element_text(size=18),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle("Omega discount factor" ) + 
  xlab("Year") +
  ylab("Value")  ; plottigat

## -----------------  World Carbon Intensity - SSP2 - BURKE SR varying DISGamma  -------------------



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I want to compare optimal carbon intensity trends under 
# different cooperation scenarios.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    
    
    ,"DICE16 BAU"       = merge(DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"DICE16 CBA"       = merge(DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"BAU nodmg"   = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_CIntensity_ty
    ,"BAU dmg" = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_CIntensity_ty
    
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
    
    
    "SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    ,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
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
      
      
      "Burke SR"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      ,"Burke LR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      ,"Burke SRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      ,"Burke LRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
      
      
      #"SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      ,"Burke LR"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      #,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      ,"Burke SRdiff"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      ,"Burke LRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
      
      
      #"SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      ,"Burke LR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      #,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      ,"Burke SRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      ,"Burke LRdiff" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
      
      
      #"SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      "Burke SR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      ,"Burke LR"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      #,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      ,"Burke SRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      ,"Burke LRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
    
    
    "SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    
    ,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    
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
      
      
      "Burke SR"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"Burke LR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"Burke LRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      
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
      
      
      
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke LR"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"Burke LRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      
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
      
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke LR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke LRdiff" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
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
      
      
      "Burke SR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"Burke LR"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"Burke LRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
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
      
      "BAU"                = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      
      
    )
    ,title  = "Burke SR"
    ,yLabel = "Damages \\[%GDP\\]"
    ,legend = "Scenarios"
    ,LaTeX_text = TRUE
    
    
  )+ ylim(-45, 1) + xlim(2010,2175)
  
  
  
  #Burke LR
  
  p2 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "BAU"                 = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)      
      ,"$\\gamma  = 0$"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      
      
    )
    ,title  = "Burke LR"
    ,yLabel = "Damages \\[%GDP\\]"
    ,legend = "Scenarios"
    ,LaTeX_text = TRUE
    
  )+ ylim(-45, 1)+ xlim(2010,2175)
  
  
  #Burke SRdiff
  
  p3 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "BAU"                = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty     %>% mutate(value = value *100)   
      ,"$\\gamma  = 0$"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      
      
    )
    ,title  = "Burke SRdiff"
    ,yLabel = "Damages \\[%GDP\\]"
    ,legend = "Scenarios"
    ,LaTeX_text = TRUE
    
  )+ ylim(-45, 1) + xlim(2010,2175)
  
  
  #Burke LRdiff
  
  p4 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "BAU"                = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty     %>% mutate(value = value *100)   
      ,"$\\gamma  = 0$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      
      
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    
    
    
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    
    
    
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    
    
    
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      
      
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      
      
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      
      
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
      
      
      "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      
    )
    ,title  = "$\\gamma = 0$"
    ,yLabel = "Temperature increase $\\[?C\\]$"
    ,legend = "Scenarios"
    ,categories = 5
    ,colors_per_category = 1
    ,LaTeX_text = TRUE
    
  ) + ylim(0,2.5)  + xlim(2010,2175) ; p1
  
  
  
  # Gamma 0.5 
  
  p2 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      
      
    )
    ,title  = "$\\gamma = 0.5$"
    ,yLabel = "Temperature increase $\\[ ?C\\]$"
    ,legend = "Scenarios"
    ,categories = 5
    ,colors_per_category = 1
    ,LaTeX_text = TRUE
    
  )+ ylim(0,2.5) + xlim(2010,2175)  ; p2  
  
  
  # Gamma 1.45 
  
  p3 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      
      
    )
    ,title  = "$\\gamma = 1.45$"
    ,yLabel = "Temperature increase $\\[ ?C\\]$"
    ,legend = "Scenarios"
    ,categories = 5
    ,colors_per_category = 1
    ,LaTeX_text = TRUE
    
  ) + ylim(0,2.5) + xlim(2010,2175)  ; p3 
  
  # Gamma 2 
  
  p4 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      #     ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      
      
    )
    ,title  = "$\\gamma = 2$"
    ,yLabel = "Temperature increase $\\[ ?C\\]$"
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    
    
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    
    
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    
    
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_SCC_nty
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_SCC_nty
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_SCC_nty
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_SCC_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_MIU_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_MIU_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_MIU_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_MIU_nty
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(   year_start = startyear,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n( year_start = startyear,year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start = startyear,year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_limit = endyear)
    
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(   year_start = startyear,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n( year_start = startyear,year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start = startyear,year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_limit = endyear)
    
    #   ,"BAU no damages"   = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
    #   ,"BAU with damages" = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CIntensity_nty %>% filter(year == myyear)
    
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_SCC_nty %>% filter(year == myyear)
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
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
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    
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
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)  
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)    
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0.5$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
  ,min_data = -29.55
  ,max_data = 29.55
)

# Gamma 1.45 

RICEx.plot.multimap(
  EXPdata   = list(
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100) 
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)  
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)  
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 1.45$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
  ,min_data = -29.55
  ,max_data = 29.55
)

# Gamma 2 

RICEx.plot.multimap(
  EXPdata   = list(
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)       %>% mutate(value = value *100)      
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)   %>% mutate(value = value *100)     
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)       %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)   %>% mutate(value = value *100)     
    
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
    
    "CBA, $\\gamma = 0$"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 0.5$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 1.45$"= PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 2$"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_MIU_nty %>% filter(year == myyear)
    
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

bauCUMemi =  PP7$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear ) %>% select(n,value) %>% rename(bau = value)









RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA, $\\gamma = 0$"    = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )    %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 0.5$"  = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )  %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 1.45$" = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear ) %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 2$"    = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )    %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    
  )
  
  ,title  = paste0("Overall Mitigation efforts from ",startyear," to ",endyear," - Burke SR, SSP2 - Different inequality aversion")
  ,legend = "Mitigaton relative \nscore"
  ,palette =  RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  , legend_symmetric = FALSE
  
  ,LaTeX_text = TRUE
  ,min_data = 0
  
)



## -----------------  Local DAMAGES - BURKE SR SSP2 Gamma 0.5 - varying YEAR -----------

experiment = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5


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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty    %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty    %>% filter(year == myyear)  
    
    
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
  ,legend = "T Increase \n[+?C]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  ,max_data = 2.45
  
)



## -----------------  Local TEMPERATURE - BURKE SR SSP2 DISGamma 0.5 - varying Year -----------


experiment = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5


RICEx.plot.multimap(
  
  EXPdata   = list(
    
    "CBA Gamma 0.5, year 2025"    = experiment$get_TLOCALincr_nty %>% filter(year == 2030) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2050"   = experiment$get_TLOCALincr_nty %>% filter(year == 2050) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2075"   = experiment$get_TLOCALincr_nty %>% filter(year == 2075) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2100"   = experiment$get_TLOCALincr_nty %>% filter(year == 2100) #%>% rename(n= "ed57")
    
  )
  
  
  ,title  = paste0("Local avg Temperature increase in different years - SSP2 with Inequality Gamma 0.5")
  ,legend = "TLocal Increase \n[+?C]" 
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  
  
)






## -----------------  Cumulative DAMAGES over Cumulative GDP  - BURKE SR SSP2 - varying DISGamma -----------



startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    
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
    
    "CBA noncoop"     = PP7$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA coop"      = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    
    ,"DICE16 BAU"       = DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"DICE16 CBA"       = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU" = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
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
    
    
    "Coop SR "      = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
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


PPstory6 = list()
PPstory6 = experiments_load_as_list(PPstory6,"PPstory6")


PPstory6 = list()
PPstory6 = experiments_load_as_list(PPstory6,"PPstory6")



# shortcuts
PP6 = PPstory7$v1x00$OPTIM$ed57




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
    
    "CBA $\\gamma = 0$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"CBA $\\gamma = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"CBA $\\gamma = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"CBA $\\gamma = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"CBA non-coop" = PP7$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    ,"BAU dmg"     = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_EMIffi_ty
    
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
    
    "CBA gamma 0" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"CBA gamma 0.5" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"CBA gamma 2" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"DICE16 BAU"       = DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"DICE16 CBA"       = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg"   = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    ,"BAU dmg" = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_EMIffi_ty
    
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
    
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    
    
    ,"DICE16 BAU"       = merge(DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"DICE16 CBA"       = merge(DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND") %>% rename(eind = value),  
                                DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("YGROSS") %>% rename(ygross  = value), 
                                by = c("t","year"))   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(t,year,value)%>%  mutate(unit = "kgCO2/USD")
    
    ,"BAU nodmg"   = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_CIntensity_ty
    ,"BAU dmg" = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_CIntensity_ty
    
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
    
    
    "SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    ,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    ,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
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
      
      
      "Burke SR"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      ,"Burke LR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      ,"Burke SRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      ,"Burke LRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
      
      
      #"SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      ,"Burke LR"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      #,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      ,"Burke SRdiff"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      ,"Burke LRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
      
      
      #"SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      ,"Burke LR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      #,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      ,"Burke SRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      ,"Burke LRdiff" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      # ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
      
      
      #"SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      "Burke SR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      ,"Burke LR"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      #,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      ,"Burke SRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      #,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
      # ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
      # ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
      ,"Burke LRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
      
      
      
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
    
    
    "SR g0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"LR g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"LR g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"LR g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"LR g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    
    ,"SRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"SRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"LRdiff g0"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"LRdiff g0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"LRdiff g1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"LRdiff g2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
    
    
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
      
      
      "Burke SR"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"Burke LR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"Burke LRdiff"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      
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
      
      
      
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke LR"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"Burke LRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      
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
      
      "Burke SR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke LR" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"Burke LRdiff" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
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
      
      
      "Burke SR"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"Burke LR"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"Burke SRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"Burke LRdiff"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
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
      
      "BAU"                = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)   
      
      
    )
    ,title  = "Burke SR"
    ,yLabel = "Damages \\[%GDP\\]"
    ,legend = "Scenarios"
    ,LaTeX_text = TRUE
    
    
  )+ ylim(-45, 1) + xlim(2010,2175)
  
  
  
  #Burke LR
  
  p2 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "BAU"                 = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty  %>% mutate(value = value *100)      
      ,"$\\gamma  = 0$"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      
      
    )
    ,title  = "Burke LR"
    ,yLabel = "Damages \\[%GDP\\]"
    ,legend = "Scenarios"
    ,LaTeX_text = TRUE
    
  )+ ylim(-45, 1)+ xlim(2010,2175)
  
  
  #Burke SRdiff
  
  p3 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "BAU"                = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty     %>% mutate(value = value *100)   
      ,"$\\gamma  = 0$"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      
      
    )
    ,title  = "Burke SRdiff"
    ,yLabel = "Damages \\[%GDP\\]"
    ,legend = "Scenarios"
    ,LaTeX_text = TRUE
    
  )+ ylim(-45, 1) + xlim(2010,2175)
  
  
  #Burke LRdiff
  
  p4 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "BAU"                = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$BAUdam$get_world_DAMAGEperc_ty     %>% mutate(value = value *100)   
      ,"$\\gamma  = 0$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 0.5$"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 1.45$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      ,"$\\gamma  = 2$"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty %>% mutate(value = value *100)   
      
      
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    
    
    
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_EMIffi_ty
    
    
    
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_EMIffi_ty
    
    
    
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
    
    
    "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_EMIffi_ty
    
    
    
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_DAMAGEperc_ty
      
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_DAMAGEperc_ty
      
      
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_DAMAGEperc_ty
      
      
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
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_DAMAGEperc_ty
      
      
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
      
      
      "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_TATM_ty
      
    )
    ,title  = "$\\gamma = 0$"
    ,yLabel = "Temperature increase $\\[?C\\]$"
    ,legend = "Scenarios"
    ,categories = 5
    ,colors_per_category = 1
    ,LaTeX_text = TRUE
    
  ) + ylim(0,2.5)  + xlim(2010,2175) ; p1
  
  
  
  # Gamma 0.5 
  
  p2 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_TATM_ty
      
      
    )
    ,title  = "$\\gamma = 0.5$"
    ,yLabel = "Temperature increase $\\[ ?C\\]$"
    ,legend = "Scenarios"
    ,categories = 5
    ,colors_per_category = 1
    ,LaTeX_text = TRUE
    
  )+ ylim(0,2.5) + xlim(2010,2175)  ; p2  
  
  
  # Gamma 1.45 
  
  p3 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_TATM_ty
      
      
    )
    ,title  = "$\\gamma = 1.45$"
    ,yLabel = "Temperature increase $\\[ ?C\\]$"
    ,legend = "Scenarios"
    ,categories = 5
    ,colors_per_category = 1
    ,LaTeX_text = TRUE
    
  ) + ylim(0,2.5) + xlim(2010,2175)  ; p3 
  
  # Gamma 2 
  
  p4 = RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "SSP1"  = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_TATM_ty
      
      
    )
    ,title  = "$\\gamma = 2$"
    ,yLabel = "Temperature increase $\\[ ?C\\]$"
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_CIntensity_ty
    
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_world_CIntensity_ty
    
    
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_world_CIntensity_ty
    
    
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
    
    
    "SSP1"   = PP7$ssp1$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP2"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP3"  = PP7$ssp3$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP4"  = PP7$ssp4$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    ,"SSP5"  = PP7$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_world_CIntensity_ty
    
    
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_SCC_nty
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_SCC_nty
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_SCC_nty
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
    
    geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_SCC_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_MIU_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_MIU_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_MIU_nty
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
  
  geom_line(data= PPstory7$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_MIU_nty
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(   year_start = startyear,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n( year_start = startyear,year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start = startyear,year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_limit = endyear)
    
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(   year_start = startyear,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n( year_start = startyear,year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start = startyear,year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_limit = endyear)
    
    #   ,"BAU no damages"   = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
    #   ,"BAU with damages" = PPstory7$v1x00$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAUdam$get_CUML5y_EMItot_n(year_start = startyear,year_limit=endyear)
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CIntensity_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CIntensity_nty %>% filter(year == myyear)
    
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_SCC_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_SCC_nty %>% filter(year == myyear)
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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_VARIABLE_CUML5y_n(variable_name = "scc", year_start = startyear ,year_limit = endyear)
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
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    
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
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)  
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)    
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0.5$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
  ,min_data = -29.55
  ,max_data = 29.55
)

# Gamma 1.45 

RICEx.plot.multimap(
  EXPdata   = list(
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100) 
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)  
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)      %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)  %>% mutate(value = value *100)  
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 1.45$, SSP2 - different Burke's functions"))
  ,legend = "Damages \n[% GDP]"
  ,min_data = -29.55
  ,max_data = 29.55
)

# Gamma 2 

RICEx.plot.multimap(
  EXPdata   = list(
    
    "Burke SR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)       %>% mutate(value = value *100)      
    ,"Burke SRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)   %>% mutate(value = value *100)     
    ,"Burke LR "     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)       %>% mutate(value = value *100)   
    ,"Burke LRdiff " = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year == myyear)   %>% mutate(value = value *100)     
    
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
    
    "CBA, $\\gamma = 0$"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 0.5$" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 1.45$"= PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 2$"   = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_MIU_nty %>% filter(year == myyear)
    
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

bauCUMemi =  PP7$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear ) %>% select(n,value) %>% rename(bau = value)









RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA, $\\gamma = 0$"    = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )    %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 0.5$"  = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )  %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 1.45$" = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear ) %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    ,"CBA, $\\gamma = 2$"    = merge(PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_EMItot_n(year_start =startyear, year_limit = endyear )    %>% select(n,value) %>% rename(mitigated = value), bauCUMemi, by="n")  %>% mutate(value = (bau-mitigated)/bau * 100 )
    
  )
  
  ,title  = paste0("Overall Mitigation efforts from ",startyear," to ",endyear," - Burke SR, SSP2 - Different inequality aversion")
  ,legend = "Mitigaton relative \nscore"
  ,palette =  RColorBrewer::brewer.pal(9, "Greens") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  , legend_symmetric = FALSE
  
  ,LaTeX_text = TRUE
  ,min_data = 0
  
)



## -----------------  Local DAMAGES - BURKE SR SSP2 Gamma 0.5 - varying YEAR -----------

experiment = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5


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
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_DAMAGEperc_nty    %>% filter(year == myyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year == myyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_DAMAGEperc_nty    %>% filter(year == myyear)  
    
    
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
  ,legend = "T Increase \n[+?C]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  ,max_data = 2.45
  
)



## -----------------  Local TEMPERATURE - BURKE SR SSP2 DISGamma 0.5 - varying Year -----------


experiment = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5


RICEx.plot.multimap(
  
  EXPdata   = list(
    
    "CBA Gamma 0.5, year 2025"    = experiment$get_TLOCALincr_nty %>% filter(year == 2030) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2050"   = experiment$get_TLOCALincr_nty %>% filter(year == 2050) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2075"   = experiment$get_TLOCALincr_nty %>% filter(year == 2075) #%>% rename(n= "ed57")
    ,"CBA Gamma 0.5, year 2100"   = experiment$get_TLOCALincr_nty %>% filter(year == 2100) #%>% rename(n= "ed57")
    
  )
  
  
  ,title  = paste0("Local avg Temperature increase in different years - SSP2 with Inequality Gamma 0.5")
  ,legend = "TLocal Increase \n[+?C]" 
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0
  
  
)






## -----------------  Cumulative DAMAGES over Cumulative GDP  - BURKE SR SSP2 - varying DISGamma -----------



startyear = 2015
endyear   = 2100


RICEx.plot.multimap(
  EXPdata   = list(
    
    "CBA gamma 0"     = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 0.5"  = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0x5$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 1.45" = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma1x45$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    ,"CBA gamma 2"    = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_CUML5y_DAMAGES_on_YGROSS_n(    year_start = startyear, year_limit = endyear)
    
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
    
    "CBA noncoop"     = PP7$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_world_EMIffi_ty
    ,"CBA coop"      = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
    
    ,"DICE16 BAU"       = DICEresults$DICE2016R_091916ap_BAU_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    ,"DICE16 CBA"       = DICEresults$DICE2016R_091916ap_OPT_vanilla_results$get_VARIABLE_ty("EIND")  %>% mutate(unit = "GtCO2/year")
    
    ,"Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU" = PPstory7$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_world_EMIffi_ty
    
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
    
    
    "Coop SR "      = PP7$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_world_EMIffi_ty
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



