source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("OTHER_datamng/HIST_emissions_data.R")


# Retrieve experiments

LUoghg = list()
LUoghg = experiments_load_as_list(LUoghg,"LUOGHG")


baseexp = LUoghg$v0x104$OPTIM$ed57$ssp2 #common part




## -------------------:  PB convergence 18 : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"Coop Pop"           = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Coop Negishi"       = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"Non Coop"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_TATM_ty
    ,"zCEA 700"            = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA$get_TATM_ty
    
  )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)



# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Pop"     = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Negishi" = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Non Coop"     = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"zCEA 700"            = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    )
  ,EXPtitle  = "Damages measured with Burke SR by varying cooperation"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)


## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"Coop Pop"     = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_worldEMItot_ty
    ,"Coop Negishi" = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_worldEMItot_ty
    ,"Non Coop"     = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_worldEMItot_ty
    ,"zCEA 700"            = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA$get_worldEMItot_ty
    )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)






# Forcing overview


forc_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")
    ,"Coop Pop"           = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_ty("FORC")
    ,"Coop Negishi"       = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_ty("FORC")
    ,"Non Coop"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_VARIABLE_ty("FORC")
    ,"zCEA 700"            = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA$get_VARIABLE_ty("FORC")
  )
  ,EXPtitle  = "Increase in Radiating Forcing"
  ,EXPylabel = "FOC increase [W/m2 from 1900]"
  ,EXPlegend = "Experiments"
)


require_package("gridExtra")



# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot, damages_plot, tatm_plot, forc_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF








## -------------------:  PB convergence 28 : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"Coop Pop"           = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_TATM_ty
    ,"Coop Negishi"       = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_TATM_ty
    ,"Non Coop"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_TATM_ty
    
  )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)



# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Pop"     = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Negishi" = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Non Coop"     = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying cooperation"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)


## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"Coop Pop"     = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_worldEMItot_ty
    ,"Coop Negishi" = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_worldEMItot_ty
    ,"Non Coop"     = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_worldEMItot_ty
  )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)






# Forcing overview


forc_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")
    ,"Coop Pop"           = baseexp$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_VARIABLE_ty("FORC")
    ,"Coop Negishi"       = baseexp$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_VARIABLE_ty("FORC")
    ,"Non Coop"           = baseexp$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__pb28mup28$get_VARIABLE_ty("FORC")
    
  )
  ,EXPtitle  = "Increase in Radiating Forcing"
  ,EXPylabel = "FOC increase [W/m2 from 1900]"
  ,EXPlegend = "Experiments"
)


require_package("gridExtra")



# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot, damages_plot, tatm_plot, forc_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF


