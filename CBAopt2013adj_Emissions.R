source("RICEx_data_management/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")


# Retrieve experiments

MYexp = list()
MYexp = experiments_load_as_list(MYexp,"CBAopt2013adj")




 
## -------------------:  BURKE SR VARYING COOPERATION : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
   EXPdata   = list(
     "BAU"           = MYexp$v0x90$OPT$ed57$ssp2$coop$maccED$clWITCHco2$damOFF$savFXconv$runBAU$get_VARIABLE_ty("TATM")
     ,"Coop Pop"     = MYexp$v0x90$OPT$ed57$ssp2$coop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_VARIABLE_ty("TATM")
     ,"Coop Negishi" = MYexp$v0x90$OPT$ed57$ssp2$coopngsw$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_VARIABLE_ty("TATM")
     ,"Non Coop"     = MYexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_VARIABLE_ty("TATM")
   )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation (Pback adjusted)"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)

## World emissions Varying cooperation

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
 
    "BAU"           = MYexp$v0x90$OPT$ed57$ssp2$coop$maccED$clWITCHco2$damOFF$savFXconv$runBAU$get_worldEMItot_ty
    ,"Coop Popx"     = MYexp$v0x90$OPT$ed57$ssp2$coop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_worldEMItot_ty
        ,"Coop Pop"     = MYexp$v0x90$OPT$ed57$ssp2$coop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_PARAMETER_ty("world_E")
    ,"Coop Negishi" = MYexp$v0x90$OPT$ed57$ssp2$coopngsw$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_PARAMETER_ty("world_E")
    ,"Non Coop"     = MYexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_PARAMETER_ty("world_E")
  )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation (Pback adjusted)"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


# World damages

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Coop Pop"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Coop Negishi" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Non Coop"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying cooperation"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)

require_package("gridExtra")


# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot,tatm_plot,damages_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF





## -------------------:   COOPERATION VARYING BURKE TYPE : --------------------------------


## TEMPERATURES Varying Burke


tatm_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
    "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
  )
  
  ,EXPtitle  = "Temperature increase in cooperation (pop) varying Burke function-type"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
  
)



## World emissions Varying cooperation

emi_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("W_EMI")%>% filter(ghg == "co2"),
    "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2"),
    "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI")%>% filter(ghg == "co2"),
    "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2"),
    "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2")
  )
  
  ,EXPtitle  = "World Emissions in cooperation (pop) varying Burke function-type"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


# World damages

damages_plot <- RICEx.plot.lineplot(
  EXPdata = list(
     "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
  )
  
  ,EXPtitle  = "World damages in cooperation (pop) varying Burke function-type"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
  
)

require_package("gridExtra")


# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot,tatm_plot,damages_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF







## -------------------:   NON COOPERATION VARYING BURKE TYPE : --------------------------------


## TEMPERATURES Varying Burke


tatm_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
    "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
  )
  
  ,EXPtitle  = "Temperature increase in non-cooperation varying Burke function-type"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
  
)



## World emissions Varying cooperation

emi_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("W_EMI")%>% filter(ghg == "co2"),
    "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2"),
    "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI")%>% filter(ghg == "co2"),
    "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2"),
    "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2")
  )
  
  ,EXPtitle  = "World Emissions in non-cooperation varying Burke function-type"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


# World damages

damages_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
  )
  
  ,EXPtitle  = "World damages in non-cooperation varying Burke function-type"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
  
)

require_package("gridExtra")


# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot,tatm_plot,damages_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF










## -------------------:    COOPERATION NEGISHI VARYING BURKE TYPE : --------------------------------


## TEMPERATURES Varying Burke


tatm_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
    "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("TATM"),
    "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
  )
  
  ,EXPtitle  = "Temperature increase in coop Negishi varying Burke function-type"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
  
)



## World emissions Varying cooperation

emi_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("W_EMI")%>% filter(ghg == "co2"),
    "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2"),
    "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI")%>% filter(ghg == "co2"),
    "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2"),
    "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2")
  )
  
  ,EXPtitle  = "World Emissions in coop Negishi varying Burke function-type"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


# World damages

damages_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
  )
  
  ,EXPtitle  = "World damages in coop Negishi varying Burke function-type"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
  
)

require_package("gridExtra")


# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot,tatm_plot,damages_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF




## -------------------:    COOPERATION NEGISHI VARYING BURKE TYPE AND DICEreg: --------------------------------


## TEMPERATURES Varying Burke


tatm_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM")
    ,"Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM")
    ,"Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
    ,"Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("TATM")
    ,"Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
    ,"DICE reg"    = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damDICEreg$savFXconv$polCBA$get_Variable_ty("TATM")
  )
  
  ,EXPtitle  = "Temperature increase in coop Negishi varying Burke function-type"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
  
)



## World emissions Varying cooperation

emi_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("W_EMI")%>% filter(ghg == "co2")
    ,"Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2")
    ,"Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI")%>% filter(ghg == "co2")
    ,"Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2")
    ,"Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2")
    ,"DICE reg"    = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damDICEreg$savFXconv$polCBA$get_Variable_ty("W_EMI") %>% filter(ghg == "co2")
  )
  
  ,EXPtitle  = "World Emissions in coop Negishi varying Burke function-type"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


# World damages

damages_plot <- RICEx.plot.lineplot(
  EXPdata = list(
    "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
    ,"DICE reg"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damDICEreg$savFXconv$polCBA$get_WORLDagg_VARnty_ty("DAMAGES")
  )
  
  ,EXPtitle  = "World damages in coop Negishi varying Burke function-type"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
  
)

require_package("gridExtra")


# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot,tatm_plot,damages_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF


