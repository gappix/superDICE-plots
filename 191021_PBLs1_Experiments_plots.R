source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("OTHER_datamng/ADVANCE_data_management.R")
source("OTHER_datamng/HIST_emissions_data.R")


# Retrieve experiments

PBLs1exp = list()
PBLs2exp = list()

PBLs1exp = experiments_load_as_list(PBLs1exp,"PBLs1")
PBLs2exp = experiments_load_as_list(PBLs1exp,"PBLs2")


baseexp  = PBLs1exp$v0x100$OPTIM$ed57$ssp2
baseexp2 = PBLs2exp$v0x101$OPTIM$ed57$ssp2 #common part






## -------------------:  BURKE SR VARYING COOPERATION : --------------------------------


## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"Coop Pop"           = baseexp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_TATM_ty
    ,"Coop Negishi"       = baseexp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_TATM_ty
    ,"Non Coop"           = baseexp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_TATM_ty

     )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)

## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"            = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"Coop Pop"      = baseexp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_worldEMItot_ty
    ,"Coop Negishi"  = baseexp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_worldEMItot_ty
    ,"Non Coop"      = baseexp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_worldEMItot_ty

    )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)


# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = baseexp$noncoop_pop$macc_EnerData_powerfit$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Pop"     = baseexp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Negishi" = baseexp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Non Coop"     = baseexp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA__DICEpb$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    
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
