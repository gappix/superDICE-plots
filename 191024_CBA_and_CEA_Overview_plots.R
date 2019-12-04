source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("OTHER_datamng/HIST_emissions_data.R")


# Retrieve experiments

PBLs1exp = list()
PBLs1exp = experiments_load_as_list(PBLs1exp,"PBLs1")


baseexp = PBLs1exp$v0x100$OPTIM$ed57$ssp2 #common part





## -------------------:  CBA OVERVIEW with OPT PB : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"Coop Pop"           = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_TATM_ty
    ,"Coop Negishi"       = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_TATM_ty
    ,"Non Coop"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_TATM_ty

  )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)



# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Pop"     = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Negishi" = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Non Coop"     = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying cooperation"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)

require_package("gridExtra")



## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"Coop Pop"     = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_worldEMItot_ty
    ,"Coop Negishi" = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_worldEMItot_ty
    ,"Non Coop"     = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_worldEMItot_ty
 )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)






# Forcing overview


forc_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")
    ,"Coop Pop"           = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_ty("FORC")
    ,"Coop Negishi"       = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_ty("FORC")
    ,"Non Coop"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_ty("FORC")
    
  )
  ,EXPtitle  = "Increase in Radiating Forcing"
  ,EXPylabel = "FOC increase [W/m2 from 1900]"
  ,EXPlegend = "Experiments"
)



# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot, damages_plot, tatm_plot, forc_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF







## -------------------:  CBA OVERVIEW WITH OLD-DICE PB : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"Coop Pop"           = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_TATM_ty
    ,"Coop Negishi"       = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_TATM_ty
    ,"Non Coop"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_TATM_ty
    
  )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)



# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Pop"     = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Negishi" = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Non Coop"     = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying cooperation"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)

require_package("gridExtra")



## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"Coop Pop"     = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_worldEMItot_ty
    ,"Coop Negishi" = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_worldEMItot_ty
    ,"Non Coop"     = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_worldEMItot_ty
  )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)






# Forcing overview


forc_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")
    ,"Coop Pop"           = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_ty("FORC")
    ,"Coop Negishi"       = baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_ty("FORC")
    ,"Non Coop"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_ty("FORC")
    
  )
  ,EXPtitle  = "Increase in Radiating Forcing"
  ,EXPylabel = "FOC increase [W/m2 from 1900]"
  ,EXPlegend = "Experiments"
)



# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot, damages_plot, tatm_plot, forc_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF











## -------------------: CEA with UPDATED BACKSTOP: --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700$get_TATM_ty
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800$get_TATM_ty
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900$get_TATM_ty
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000$get_TATM_ty
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100$get_TATM_ty
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200$get_TATM_ty
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300$get_TATM_ty
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400$get_TATM_ty
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500$get_TATM_ty
    
  )
  ,EXPtitle  = "Temperature increase with CEA and different CBudget"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)

## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700$get_worldEMItot_ty
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800$get_worldEMItot_ty
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900$get_worldEMItot_ty
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000$get_worldEMItot_ty
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100$get_worldEMItot_ty
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200$get_worldEMItot_ty
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300$get_worldEMItot_ty
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400$get_worldEMItot_ty
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500$get_worldEMItot_ty
  )
  ,EXPtitle  = "World emissions with CEA and different CBudget"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying CBudget"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)

require_package("gridExtra")





# Forcing overview


forc_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700$get_VARIABLE_ty("FORC")
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800$get_VARIABLE_ty("FORC")
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900$get_VARIABLE_ty("FORC")
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000$get_VARIABLE_ty("FORC")
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100$get_VARIABLE_ty("FORC")
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200$get_VARIABLE_ty("FORC")
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300$get_VARIABLE_ty("FORC")
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400$get_VARIABLE_ty("FORC")
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500$get_VARIABLE_ty("FORC")
  )
  ,EXPtitle  = "Increase in Radiating Forcing"
  ,EXPylabel = "FOC increase [W/m2 from 1900]"
  ,EXPlegend = "Experiments"
)




# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot ,damages_plot ,forc_plot, tatm_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF







## -------------------: CEA  with DICE backstop : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700_pbDICE$get_TATM_ty
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800_pbDICE$get_TATM_ty
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900_pbDICE$get_TATM_ty
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000_pbDICE$get_TATM_ty
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100_pbDICE$get_TATM_ty
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200_pbDICE$get_TATM_ty
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300_pbDICE$get_TATM_ty
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400_pbDICE$get_TATM_ty
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500_pbDICE$get_TATM_ty
    
  )
  ,EXPtitle  = "Temperature increase with CEA and different CBudget"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)

## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700_pbDICE$get_worldEMItot_ty
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800_pbDICE$get_worldEMItot_ty
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900_pbDICE$get_worldEMItot_ty
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000_pbDICE$get_worldEMItot_ty
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100_pbDICE$get_worldEMItot_ty
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200_pbDICE$get_worldEMItot_ty
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300_pbDICE$get_worldEMItot_ty
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400_pbDICE$get_worldEMItot_ty
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500_pbDICE$get_worldEMItot_ty
  )
  ,EXPtitle  = "World emissions with CEA and different CBudget"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)

# Forcing overview


forc_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400_pbDICE$get_VARIABLE_ty("FORC")
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500_pbDICE$get_VARIABLE_ty("FORC")
  )
  ,EXPtitle  = "Increase in Radiating Forcing"
  ,EXPylabel = "FOC increase [W/m2 from 1900]"
  ,EXPlegend = "Experiments"
)



# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"        = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 700"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 800"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_800_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 900"   = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_900_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1000"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1100"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1100_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1200"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1300"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1300_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1400"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1400_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"CEA 1500"  = baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500_pbDICE$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying CBudget"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)

require_package("gridExtra")



# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(emi_plot ,damages_plot ,forc_plot, tatm_plot, nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF




#------------  SCC of CBAS for Updated PB -----------------------------


scc_NONCOOP = my_plot_ny(mydf=  baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_PARAMETER_nty("scc")
        ,mygroup  = "n" 
        ,myx      = "year" 
        ,myy      = "value"
        ,myLegend  = "Regions"
        ,myXlab    = "Year"
        ,myYlab    = "SCC [$/tCO2]"
        ,myTitle   = "Social cost of carbon for NonCoop CBA"
)


scc_COOPPOP  = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_PARAMETER_nty("scc")
                         ,mygroup  = "n" 
                         ,myx      = "year" 
                         ,myy      = "value"
                         ,myLegend  = "Regions"
                         ,myXlab    = "Year"
                         ,myYlab    = "SCC [$/tCO2]"
                         ,myTitle   = "Social cost of carbon for Coop Pop CBA"
)


scc_COOPNGSW = my_plot_ny(mydf=  baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_PARAMETER_nty("scc")
                         ,mygroup  = "n" 
                         ,myx      = "year" 
                         ,myy      = "value"
                         ,myLegend  = "Regions"
                         ,myXlab    = "Year"
                         ,myYlab    = "SCC [$/tCO2]"
                         ,myTitle   = "Social cost of carbon for Coop Negishi CBA"
)

# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(scc_COOPPOP, scc_COOPNGSW, scc_NONCOOP,nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF




 
#------------  SCC of CBAS  for DICEconv pb  -----------------------------


scc_NONCOOP = my_plot_ny(mydf=  baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_PARAMETER_nty("scc")
                         ,mygroup  = "n" 
                         ,myx      = "year" 
                         ,myy      = "value"
                         ,myLegend  = "Regions"
                         ,myXlab    = "Year"
                         ,myYlab    = "SCC [$/tCO2]"
                         ,myTitle   = "Social cost of carbon for NonCoop CBA"
)


scc_COOPPOP  = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_PARAMETER_nty("scc")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "SCC [$/tCO2]"
                          ,myTitle   = "Social cost of carbon for Coop Pop CBA"
)


scc_COOPNGSW = my_plot_ny(mydf=  baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_PARAMETER_nty("scc")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "SCC [$/tCO2]"
                          ,myTitle   = "Social cost of carbon for Coop Negishi CBA"
)

# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(scc_COOPPOP, scc_COOPNGSW, scc_NONCOOP,nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF











#------------  CPRICES of CBAS  for OPT pb  -----------------------------


cpr_NONCOOP = my_plot_ny(mydf=  baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_nty("CPRICE")
                         ,mygroup  = "n" 
                         ,myx      = "year" 
                         ,myy      = "value"
                         ,myLegend  = "Regions"
                         ,myXlab    = "Year"
                         ,myYlab    = "CPRICE [$/tCO2]"
                         ,myTitle   = "CPRICE for NonCoop CBA"
)


cpr_COOPPOP  = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_nty("CPRICE")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "CPRICE [$/tCO2]"
                          ,myTitle   = "CPRICE for Coop Pop CBA"
)


cpr_COOPNGSW = my_plot_ny(mydf=  baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__OPTpb$get_VARIABLE_nty("CPRICE")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "CPRICE [$/tCO2]"
                          ,myTitle   = "CPRICE for Coop Negishi CBA"
)

# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(cpr_COOPPOP, cpr_COOPNGSW, cpr_NONCOOP,nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF







#------------  CPRICES of CBAS  for DICEconv pb  -----------------------------


cpr_NONCOOP = my_plot_ny(mydf=  baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_nty("CPRICE")
                         ,mygroup  = "n" 
                         ,myx      = "year" 
                         ,myy      = "value"
                         ,myLegend  = "Regions"
                         ,myXlab    = "Year"
                         ,myYlab    = "CPRICE [$/tCO2]"
                         ,myTitle   = "CPRICE for NonCoop CBA"
)


cpr_COOPPOP  = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_nty("CPRICE")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "CPRICE [$/tCO2]"
                          ,myTitle   = "CPRICE for Coop Pop CBA"
)


cpr_COOPNGSW = my_plot_ny(mydf=  baseexp$coop_negishi$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_nty("CPRICE")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "CPRICE [$/tCO2]"
                          ,myTitle   = "CPRICE for Coop Negishi CBA"
)

# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(cpr_COOPPOP, cpr_COOPNGSW, cpr_NONCOOP,nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF










#------------  CPRICES of CEAs  for Optimized pb  -----------------------------


CB700 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700$get_VARIABLE_nty("CPRICE")
                         ,mygroup  = "n" 
                         ,myx      = "year" 
                         ,myy      = "value"
                         ,myLegend  = "Regions"
                         ,myXlab    = "Year"
                         ,myYlab    = "CPRICE [$/tCO2]"
                         ,myTitle   = "CPRICE for CBudget 700"
)


CB1000 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000$get_VARIABLE_nty("CPRICE")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "CPRICE [$/tCO2]"
                          ,myTitle   = "CPRICE for CBudget 1000"
)


CB1200 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200$get_VARIABLE_nty("CPRICE")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "CPRICE [$/tCO2]"
                          ,myTitle   = "CPRICE for CBudget 1200"
)


CB1500 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500$get_VARIABLE_nty("CPRICE")
                          ,mygroup  = "n" 
                          ,myx      = "year" 
                          ,myy      = "value"
                          ,myLegend  = "Regions"
                          ,myXlab    = "Year"
                          ,myYlab    = "CPRICE [$/tCO2]"
                          ,myTitle   = "CPRICE for CBudget 1500"
)

# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(CB700, CB1000, CB1200,CB1500,nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF












#------------  SCC of CEAs  for Optimized pb  -----------------------------


CB700 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700$get_VARIABLE_nty("scc")
                   ,mygroup  = "n" 
                   ,myx      = "year" 
                   ,myy      = "value"
                   ,myLegend  = "Regions"
                   ,myXlab    = "Year"
                   ,myYlab    = "SCC [$/tCO2]"
                   ,myTitle   = "SCC for CBudget 700"
)


CB1000 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000$get_VARIABLE_nty("scc")
                    ,mygroup  = "n" 
                    ,myx      = "year" 
                    ,myy      = "value"
                    ,myLegend  = "Regions"
                    ,myXlab    = "Year"
                    ,myYlab    = "SCC [$/tCO2]"
                    ,myTitle   = "SCC for CBudget 1000"
)


CB1200 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200$get_VARIABLE_nty("scc")
                    ,mygroup  = "n" 
                    ,myx      = "year" 
                    ,myy      = "value"
                    ,myLegend  = "Regions"
                    ,myXlab    = "Year"
                    ,myYlab    = "SCC [$/tCO2]"
                    ,myTitle   = "SCC for CBudget 1200"
)


CB1500 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500$get_VARIABLE_nty("scc")
                    ,mygroup  = "n" 
                    ,myx      = "year" 
                    ,myy      = "value"
                    ,myLegend  = "Regions"
                    ,myXlab    = "Year"
                    ,myYlab    = "SCC [$/tCO2]"
                    ,myTitle   = "SCC for CBudget 1500"
)

# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(CB700, CB1000, CB1200,CB1500,nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF





#------------  SCC of CEAs  for DICE pb  -----------------------------


CB700 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_700_pbDICE$get_VARIABLE_nty("scc")
                   ,mygroup  = "n" 
                   ,myx      = "year" 
                   ,myy      = "value"
                   ,myLegend  = "Regions"
                   ,myXlab    = "Year"
                   ,myYlab    = "SCC [$/tCO2]"
                   ,myTitle   = "SCC for CBudget 700"
)


CB1000 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1000_pbDICE$get_VARIABLE_nty("scc")
                    ,mygroup  = "n" 
                    ,myx      = "year" 
                    ,myy      = "value"
                    ,myLegend  = "Regions"
                    ,myXlab    = "Year"
                    ,myYlab    = "SCC [$/tCO2]"
                    ,myTitle   = "SCC for CBudget 1000"
)


CB1200 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1200_pbDICE$get_VARIABLE_nty("scc")
                    ,mygroup  = "n" 
                    ,myx      = "year" 
                    ,myy      = "value"
                    ,myLegend  = "Regions"
                    ,myXlab    = "Year"
                    ,myYlab    = "SCC [$/tCO2]"
                    ,myTitle   = "SCC for CBudget 1200"
)


CB1500 = my_plot_ny(mydf=  baseexp$coop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CEA__cbudget_1500_pbDICE$get_VARIABLE_nty("scc")
                    ,mygroup  = "n" 
                    ,myx      = "year" 
                    ,myy      = "value"
                    ,myLegend  = "Regions"
                    ,myXlab    = "Year"
                    ,myYlab    = "SCC [$/tCO2]"
                    ,myTitle   = "SCC for CBudget 1500"
)

# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
grid.arrange(CB700, CB1000, CB1200,CB1500,nrow = 2)
savePlot("clipboard", type="wmf") #saves plot to WMF
















# ------------  Lineplot supply  -------


my_plot_y <- function(mydf, 
                       mygroup  = 1, 
                       myx      = 'year', 
                       myy      = 'value',
                       myLegend = 'Experiments',
                       myXlab   = "year",
                       myYlab   = "value",
                       myTitle  = "Line Plot"
){
  
  
  
  plottigat = ggplot(mydf, aes(year,
                               value,
                               group=1,
                               color=myLegend)) + geom_line(size = 1.2)+
    
    
    
    # graphic details
    guides(colour=guide_legend(ncol=1)) +
    scale_color_manual(values = c(
                                  wes_palette(name = "Darjeeling1"), 
                                  wes_palette(name = "GrandBudapest2"))) +
           
    
    theme( legend.text   = element_text(size = 13),
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(myTitle) + 
    xlab(myXlab) +
    ylab(myYlab)  ; 
  
  return(plottigat)
  
}








my_plot_ny <- function(mydf, 
                    mygroup  = 'n', 
                    myx      = 'year', 
                    myy      = 'value',
                    myLegend = 'Experiments',
                    myXlab   = "year",
                    myYlab   = "value",
                    myTitle  = "Line Plot"
                    ){
  
  

  plottigat = ggplot(mydf, aes(year,
                               value,
                               group=n,
                               color=n)) + geom_line(size = 1.2)+
    
    
    
    # graphic details
    guides(colour=guide_legend(ncol=3)) +
    scale_color_manual(values = colorize_regions("ed57")) +
    
    
    theme( legend.text   = element_text(size = 13),
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(myTitle) + 
    xlab(myXlab) +
    ylab(myYlab)  ; 
  
  return(plottigat)
  
}




#------------------:  STACKED EMISSIONS CTAX 30 const :------------------------------

ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$UNKwelfare$savings_fixed_converging$CTAX30con$get_EIND_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  
  #ADVANCE
  
  geom_line(data= ADVANCE_MODELS,
            aes(x=year, y=value, group = model, color = "ADVANCE"),
            size = 0.6)  +
  
  geom_smooth(data= ADVANCE_MODELS,
              aes(x=year, y=value,  color = "MEDIAN"),
              size = 1.5,  linetype = "dotted", se = F, span = 0.2) +
  
  
  # HISTORICAL DATA
  
  geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="historical"), size = 1.2)  +  
  
  
  
  # graphic details
  
  scale_fill_manual(values = colorize_regions("ed57") ) +
  
  scale_color_manual(breaks= c("ADVANCE","MEDIAN","historical"),
                     values = c("black", "blue", "black")) + 
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=3)) +
  
  ggtitle("Emissions Stacked CTAX 30 const with best MACC optim so far") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat




#------------------:  STACKED EMISSIONS CTAX 80 const :------------------------------


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const



plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$UNKwelfare$savings_fixed_converging$CTAX80con$get_EIND_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  
  #ADVANCE
  
  geom_line(data= ADVANCE_MODELS,
            aes(x=year, y=value, group = model, color = "ADVANCE"),
            size = 0.6)  +
  
  geom_smooth(data= ADVANCE_MODELS,
              aes(x=year, y=value,  color = "MEDIAN"),
              size = 1.5,  linetype = "dotted", se = F, span = 0.2) +
  
  
  # HISTORICAL DATA
  
  geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="historical"), size = 1.2)  +  
  
  
  
  # graphic details
  
  scale_fill_manual(values = colorize_regions("ed57") ) +
  
  scale_color_manual(breaks= c("ADVANCE","MEDIAN","historical"),
                     values = c("black", "blue", "black")) + 
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=3)) +
  
  ggtitle("Emissions Stacked CTAX 80 const with best MACC optim so far") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat


#------------------:  STACKED EMISSIONS CTAX 30 gr5 :------------------------------


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5



plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$UNKwelfare$savings_fixed_converging$CTAX30gr5$get_EIND_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  
  
  #ADVANCE
  
  geom_line(data= ADVANCE_MODELS,
            aes(x=year, y=value, group = model, color = "ADVANCE"),
            size = 0.6)  +
  
  geom_smooth(data= ADVANCE_MODELS,
              aes(x=year, y=value,  color = "MEDIAN"),
              size = 1.5,  linetype = "dotted", se = F, span = 0.2) +
  
  
  # HISTORICAL DATA
  
  geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="historical"), size = 1.2)  +  
  
  
  
  # graphic details
  
  scale_fill_manual(values = colorize_regions("ed57") ) +
  
  scale_color_manual(breaks= c("ADVANCE","MEDIAN","historical"),
                     values = c("black", "blue", "black")) + 
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=3)) +
  
  ggtitle("Emissions Stacked CTAX 30 gr5 with best MACC optim so far") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat
