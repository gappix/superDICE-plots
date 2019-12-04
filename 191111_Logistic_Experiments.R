source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("OTHER_datamng/ADVANCE_data_management.R")
source("OTHER_datamng/HIST_emissions_data.R")


## -----------------:   EXPERIMENTS   :-----------------------------------------------
# Retrieve experiments

PBLs4exp = list()

PBLs4exp = experiments_load_as_list(PBLs4exp,"PBLs4")
baseexp  = PBLs4exp$v0x103$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging


## -----------------: PLOT FUNCTIONS :-----------------------------------------------

# >>>  run section ad close  



# PLOT MIU :::::::::::::::::::::::::::::::::::::::

plotMIU <- function(){
  
  
  
  mytitle  =  paste0( "MIU values for DIAG 30 gr5 - ", expName  )
  myYlabel =  "Abatement [%BAU]"
  myLegend =  "Regions"
  
  plottigat = ggplot() + 
    
    
    # MY DATA
    
    geom_line(data = MIUdata_nty, aes(year,value, color=n), size = 1.2)  +  
    
    
    # graphic details
    
    guides(colour=guide_legend(ncol=3)) +
    scale_color_manual(
      values = colorize_regions("ed57")) +
    
    
    theme( legend.text   = element_text(size = 13),
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ;
  return(plottigat)
  
}

# PLOT CPRICE :::::::::::::::::::::::::::::::::::::::

plotCPrice <- function(){
  
  
  
  mytitle  =  paste0( "CPrice values for DIAG 30 gr5 - ", expName  )
  myYlabel =  "CPrice [$/tCO2]"
  myLegend =  "Regions"
  
  plottigat = ggplot() + 
    
    
    # MY DATA
    
    geom_line(data = CPRICEdata_nty, aes(year,value, color=n), size = 1.2)  +  
    
    
    # graphic details
    
    guides(colour=guide_legend(ncol=3)) +
    scale_color_manual(
      values = colorize_regions("ed57")) +
    
    
    theme( legend.text   = element_text(size = 13),
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ;
  return(plottigat)
  
}


# PLOT CTAX :::::::::::::::::::::::::::::::::::::::

# Plottigat
plotCTAX <- function(){
  
  mytitle  =  EXPtitle
  myYlabel =  EXPylabel
  myLegend =  EXPlegend
  legendColumns = ifelse(length(EXPdata) < 13, 1, 2) 
  
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  
  
  plottigat = ggplot() + 
    
    #ADVANCE
    
    geom_line(data= ADVANCE_MODELS,
              aes(x=year, y=value, group = model, color = "__ADVANCE"),
              size = 0.8)  +
    
    geom_smooth(data= ADVANCE_MODELS,
                aes(x=year, y=value,  color = "__MEDIAN"),
                size = 1.1,  linetype = "dashed", se = F, span = 0.2) +
    
    # MY DATA
    
    geom_line(data = mydf, aes(year,value, color=cat), size = 1.2)  +  
    
    # HISTORICAL DATA
    
    geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="__historical"), size = 1.2)  +  
    
    # graphic details
    
    guides(colour=guide_legend(ncol=legendColumns)) +
    scale_color_manual(breaks= c("__ADVANCE","__MEDIAN","__historical",names(EXPdata)[order(names(EXPdata))]),
                       values = c("grey","black","black", wes_palette(name = "Darjeeling1"), #wes_palette(name = "GrandBudapest2"),
                                  
                                  
                                  "blue",   #blue
                                  #???"#0f86db",
                                  #"#0ccfab",
                                  
                                  "green",  #greens
                                  "#d64cf5", # pink
                                  
                                  "#8232c7", #violet
                                  "#450094",
                                  "#32c738",  
                                  "#046918",
                                  
                                  
                                  "#f77f2f", #orange
                                  "#db0f20", 
                                  "red",      # red
                                  
                                  
                                  
                                  
                                  
                                  
                                  "#c4570e",  # brown
                                  "#fff100",  #yellow
                                  "#9c4317"
                       )) +
    
    
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
    ylab(myYlabel)  ; 
  
  return(plottigat)
}




# PLOT CBAs :::::::::::::::::::::::::::::::::::::::

# Plottigat
plotCBAs <- function(){
  
  mytitle  =  EXPtitle
  myYlabel =  EXPylabel
  myLegend =  EXPlegend
  legendColumns = ifelse(length(EXPdata) < 13, 1, 2) 
  
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  
  
  plottigat = ggplot() + 
    

    
    # MY DATA
    
    geom_line(data = mydf, aes(year,value, color=cat), size = 1.2)  +  
    
    # HISTORICAL DATA
    
    geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="historical"), size = 1.2)  +  
    
    # graphic details
    
    guides(colour=guide_legend(ncol=legendColumns)) +
    scale_color_manual(breaks= c("BAU","historical",names(EXPdata)[order(names(EXPdata))]),
                       values = c("black","black", wes_palette(name = "Darjeeling1"), #wes_palette(name = "GrandBudapest2"),
                                  
                                  
                                  "blue",   #blue
                                  #???"#0f86db",
                                  #"#0ccfab",
                                  
                                  "green",  #greens
                                  "#d64cf5", # pink
                                  
                                  "#8232c7", #violet
                                  "#450094",
                                  "#32c738",  
                                  "#046918",
                                  
                                  
                                  "#f77f2f", #orange
                                  "#db0f20", 
                                  "red",      # red
                                  
                                  
                                  
                                  
                                  
                                  
                                  "#c4570e",  # brown
                                  "#fff100",  #yellow
                                  "#9c4317"
                       )) +
    
    
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
    ylab(myYlabel)  ; 
  
  return(plottigat)
}






## ------------------:   CTAX DIAG 30 gr5   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
   "k1    pb18 " =    baseexp$CTAX30gr5___log_K1P18$get_worldEMIffi_ty
  ,"k0.5  pb18 " =    baseexp$CTAX30gr5___log_K0x5P18$get_worldEMIffi_ty
  ,"k0.25 pb18 " =    baseexp$CTAX30gr5___log_K0x25P18$get_worldEMIffi_ty
  ,"k1    pb28 " =    baseexp$CTAX30gr5___log_K1P28$get_worldEMIffi_ty
  ,"k0.5  pb28 " =    baseexp$CTAX30gr5___log_K0x5P28$get_worldEMIffi_ty
  ,"k0.25 pb28 " =    baseexp$CTAX30gr5___log_K0x25P28$get_worldEMIffi_ty
  ,"k1    pb38 " =    baseexp$CTAX30gr5___log_K1P38$get_worldEMIffi_ty
  ,"k0.5  pb38 " =    baseexp$CTAX30gr5___log_K0x5P38$get_worldEMIffi_ty
  ,"k0.25 pb38 " =    baseexp$CTAX30gr5___log_K0x25P38$get_worldEMIffi_ty

  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


#show
plotCTAX()

# pbb 28 e 38 are tooo far! 



## ------------------:   CTAX DIAG 30 gr5   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
   "k1    pb18 " =    baseexp$CTAX30gr5___log_K1P18$get_worldEMIffi_ty
  ,"k0.5  pb18 " =    baseexp$CTAX30gr5___log_K0x5P18$get_worldEMIffi_ty
  ,"k0.25 pb18 " =    baseexp$CTAX30gr5___log_K0x25P18$get_worldEMIffi_ty
  ,"k2    pb18 " =    baseexp$CTAX30gr5___log_K2P18$get_worldEMIffi_ty
  ,"k1.5  pb18 " =    baseexp$CTAX30gr5___log_K1x5P18$get_worldEMIffi_ty
  ,"k4    pb18 " =    baseexp$CTAX30gr5___log_K4P18$get_worldEMIffi_ty
  

  
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


#show
plotCTAX()

# k < 1 is better! 



## ------------------:   CTAX DIAG 30 gr5   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "k1    pb18 " =    baseexp$CTAX30gr5___log_K1P18$get_worldEMIffi_ty
  ,"k0.5  pb18 " =    baseexp$CTAX30gr5___log_K0x5P18$get_worldEMIffi_ty
  ,"k0.25 pb18 " =    baseexp$CTAX30gr5___log_K0x25P18$get_worldEMIffi_ty
  ,"k0.4  pb18 " =    baseexp$CTAX30gr5___log_K0x4P18$get_worldEMIffi_ty
  ,"k0.2  pb18 " =    baseexp$CTAX30gr5___log_K0x2P18$get_worldEMIffi_ty
  ,"k0.01  pb18 " =    baseexp$CTAX30gr5___log_K0x01P18$get_worldEMIffi_ty
  
  
  
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


#show
plotCTAX()

# k 0.2 is nicer! 





## ------------------:   CTAX DIAG 30 gr5   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "k1    pb18 " =    baseexp$CTAX30gr5___log_K1P18$get_worldEMIffi_ty
  ,"k0.4  pb18 " =    baseexp$CTAX30gr5___log_K0x4P18$get_worldEMIffi_ty
  ,"k0.5  pb18 " =    baseexp$CTAX30gr5___log_K0x5P18$get_worldEMIffi_ty
  ,"k0.2  pb18 " =    baseexp$CTAX30gr5___log_K0x2P18$get_worldEMIffi_ty
  ,"linear"      =    baseexp$CTAX30gr5__linear$get_worldEMIffi_ty
# 
#   ,"k1    pb23 " =    baseexp$CTAX30gr5___log_K1P23$get_worldEMIffi_ty
#   ,"k0.5  pb23 " =    baseexp$CTAX30gr5___log_K0x5P23$get_worldEMIffi_ty
#   ,"k0.2  pb23 " =    baseexp$CTAX30gr5___log_K0x2P23$get_worldEMIffi_ty
#   
#   
  
  
  
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


#show
plotCTAX()

# tpb 23 pushes too far ! 






## ------------------:   CTAX DIAG 80 gr5   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
   "k1    pb18 " =    baseexp$CTAX80gr5___log_K1P18$get_worldEMIffi_ty
  ,"k0.5  pb18 " =    baseexp$CTAX80gr5___log_K0x5P18$get_worldEMIffi_ty
  ,"k0.25 pb18 " =    baseexp$CTAX80gr5___log_K0x25P18$get_worldEMIffi_ty
  ,"k0.4  pb18 " =    baseexp$CTAX80gr5___log_K0x4P18$get_worldEMIffi_ty
  ,"linear"      =    baseexp$CTAX80gr5__linear$get_worldEMIffi_ty

  
  
  
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


#show
plotCTAX()

# k 0.25 is nicer! 






## ------------------:   CBAs noncoop   :---------------------


EXPdata   = list(
   "BAU"         =    baseexp$BAU$get_worldEMIffi_ty
  ,"k1    pb18 " =    baseexp$CBA___log_K1P18$get_worldEMIffi_ty
  ,"k0.5  pb18 " =    baseexp$CBA___log_K0x5P18$get_worldEMIffi_ty
  ,"k0.25 pb18 " =    baseexp$CBA___log_K0x25P18$get_worldEMIffi_ty
  ,"k0.4  pb18 " =    baseexp$CBA___log_K0x4P18$get_worldEMIffi_ty
  ,"linear "     =    baseexp$CBA__linear$get_worldEMIffi_ty
  
  
  
  
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions -  CBA noncoop"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


#show
plotCBAs()

# k 0.25 is nicer! 








## -------------------:  CBA overview : --------------------------------

CBAbase= PBLs4exp$v0x103$OPTIM$ed57$ssp2

## TEMPERATURES Varying cooperation


tatm_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_TATM_ty
    ,"Coop Pop"           = CBAbase$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_TATM_ty
    ,"Coop Negishi"       = CBAbase$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_TATM_ty
    ,"Non Coop"           = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_TATM_ty
    
  )
  ,EXPtitle  = "Temperature increase with Burke SR by varying cooperation"
  ,EXPylabel = "Temperature atmosphere increase [ºC]"
  ,EXPlegend = "Experiments"
)



# World damages 

damages_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Pop"     = CBAbase$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Coop Negishi" = CBAbase$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
    ,"Non Coop"     = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_VARIABLE_WORLDagg_ntyTOty("DAMAGES")
  )
  ,EXPtitle  = "Damages measured with Burke SR by varying cooperation"
  ,EXPylabel = "World Damages [Trill USD/year]"
  ,EXPlegend = "Experiments"
)


## World emissions Varying cooperation        get_worldEMItot_ty

emi_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"           = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_worldEMItot_ty
    ,"Coop Pop"     = CBAbase$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_worldEMItot_ty
    ,"Coop Negishi" = CBAbase$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_worldEMItot_ty
    ,"Non Coop"     = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_worldEMItot_ty
  )
  ,EXPtitle  = "World emissions with Burke SR by varying cooperation"
  ,EXPylabel = "World emissions [GtCO2/year]"
  ,EXPlegend = "Experiments"
)






# Forcing overview


forc_plot <- RICEx.plot.lineplot(
  EXPdata   = list(
    "BAU"                 = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_VARIABLE_ty("FORC")
    ,"Coop Pop"           = CBAbase$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_VARIABLE_ty("FORC")
    ,"Coop Negishi"       = CBAbase$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_VARIABLE_ty("FORC")
    ,"Non Coop"           = CBAbase$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA___log_K0x25P18$get_VARIABLE_ty("FORC")
    
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



