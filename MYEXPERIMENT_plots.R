source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")


# Retrieve experiments

MYexp = list()
MYexp = experiments_load_as_list(MYexp,"MYEXPERIMENT") #loads every gdx with this exp-codename




 
## -------------------:  BURKE SR VARYING COOPERATION : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
   EXPdata   = list(
     "BAU"               = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runBAU$get_TATM_ty
     ,"Coop Pop"         = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_TATM_ty
     ,"Coop Disent 0"    = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_0$get_TATM_ty
     ,"Coop Disent 0.5"  = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_0x5$get_TATM_ty
     ,"Coop Disent 1.45" = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_1x45$get_TATM_ty
   )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation "
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)


tatm_plot #show plot


## World emissions Varying cooperation

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"               = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runBAU$get_worldEMItot_ty
    ,"Coop Pop"         = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_worldEMItot_ty
    ,"Coop Disent 0"    = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_0$get_worldEMItot_ty
    ,"Coop Disent 0.5"  = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_0x5$get_worldEMItot_ty
    ,"Coop Disent 1.45" = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_1x45$get_worldEMItot_ty
  )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation (Pback adjusted)"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


emi_plot #show plot




# World damages

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"               = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runBAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Pop"         = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Disent 0"    = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_0$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Disent 0.5"  = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_0x5$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Disent 1.45" = MYexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCBA_xxdisen_1x45$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying cooperation"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)



damages_plot #show plot




# combine plots

require_package("gridExtra")


# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot,tatm_plot,damages_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF


