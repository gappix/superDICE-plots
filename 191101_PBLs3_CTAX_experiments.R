source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("OTHER_datamng/ADVANCE_data_management.R")
source("OTHER_datamng/HIST_emissions_data.R")

## -----------------:   EXPERIMENTS   :-----------------------------------------------
# Retrieve experiments

PBLs3exp = list()

PBLs3exp = experiments_load_as_list(PBLs3exp,"PBLs3")



baseexp  = PBLs3exp$v0x103$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging


## -----------------: PLOT CTAX FUNCTION :-----------------------------------------------

# >>>  run section ad close  


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


## ------------------:   CTAX DIAG 30 gr5   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
   "tpb2100 tmiup2150" =    baseexp$CTAX30gr5__tbk18_7m28$get_worldEMIffi_ty
  ,"tpb2100 tmiup2200" =    baseexp$CTAX30gr5__tbk18_7m38$get_worldEMIffi_ty
  ,"tpb2150 tmiup2150" =    baseexp$CTAX30gr5__tbk28_7m28$get_worldEMIffi_ty
  ,"tpb2150 tmiup2200" =    baseexp$CTAX30gr5__tbk28_7m38$get_worldEMIffi_ty
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


#show
plotCTAX()





#MIU
MIUdata_nty  = baseexp$CTAX30gr5__tbk28_7m38$get_MIU_nty
expName      = "tpb2150 tmiup2200"
plotMIU()


#CPrice
CPRICEdata_nty =  baseexp$CTAX30gr5__tbk28_7m38$get_VARIABLE_nty("CPRICE")
expName      = "tpb2150 tmiup2200"
plotCPrice()


## ------------------:   CTAX DIAG 30 const   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
   "tpb2100 tmiup2150" =    baseexp$CTAX30con__tbk18_7m28$get_worldEMIffi_ty
  ,"tpb2100 tmiup2200" =    baseexp$CTAX30con__tbk18_7m38$get_worldEMIffi_ty
  ,"tpb2150 tmiup2150" =    baseexp$CTAX30con__tbk28_7m28$get_worldEMIffi_ty
  ,"tpb2150 tmiup2200" =    baseexp$CTAX30con__tbk28_7m38$get_worldEMIffi_ty
  ,"tpb2200 tmiup2150" =    baseexp$CTAX30con__tbk38_7m28$get_worldEMIffi_ty
  ,"tpb2200 tmiup2200" =    baseexp$CTAX30con__tbk38_7m38$get_worldEMIffi_ty  
  ,"tpb2100 tmiup2100" =    baseexp$CTAX30con__tbk18_7m18$get_worldEMIffi_ty
  ,"tpb2150 tmiup2100" =    baseexp$CTAX30con__tbk28_7m18$get_worldEMIffi_ty
  ,"tpb2200 tmiup2100" =    baseexp$CTAX30con__tbk38_7m18$get_worldEMIffi_ty
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


#show
plotCTAX()



## ------------------:   CTAX DIAG 80 const   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
   "tpb2100 tmiup2150" =    baseexp$CTAX80con__tbk18_7m28$get_worldEMIffi_ty
  ,"tpb2100 tmiup2200" =    baseexp$CTAX80con__tbk18_7m38$get_worldEMIffi_ty
  ,"tpb2150 tmiup2150" =    baseexp$CTAX80con__tbk28_7m28$get_worldEMIffi_ty
  ,"tpb2150 tmiup2200" =    baseexp$CTAX80con__tbk28_7m38$get_worldEMIffi_ty
  ,"tpb2200 tmiup2150" =    baseexp$CTAX80con__tbk38_7m28$get_worldEMIffi_ty
  ,"tpb2200 tmiup2200" =    baseexp$CTAX80con__tbk38_7m38$get_worldEMIffi_ty  
  ,"tpb2100 tmiup2100" =    baseexp$CTAX80con__tbk18_7m18$get_worldEMIffi_ty
  ,"tpb2150 tmiup2100" =    baseexp$CTAX80con__tbk28_7m18$get_worldEMIffi_ty
  ,"tpb2200 tmiup2100" =    baseexp$CTAX80con__tbk38_7m18$get_worldEMIffi_ty
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


#show
plotCTAX()











## ------------------:   WORLD EMI AGGREGATED COMPARED TO GLOBAL-MODEL EMI   :---------------------








EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "regions aggregated" =   PBLs3exp$v0x103$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX30gr5$get_worldEMIffi_ty
  ,"world native" =    PBLs3exp$v0x103$OPTIM$global$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX30gr5$get_worldEMIffi_ty
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 compared "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


#show
plotCTAX()


## 80 const ::::::::::::::::::::::::::::::::::::


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "regions aggregated" =   PBLs3exp$v0x103$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX80con$get_worldEMIffi_ty
  ,"world native" =    PBLs3exp$v0x103$OPTIM$global$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX80con$get_worldEMIffi_ty
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const compared "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


#show
plotCTAX()




## 80 gr5 ::::::::::::::::::::::::::::::::::::


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "regions aggregated" =   PBLs3exp$v0x103$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX80gr5$get_worldEMIffi_ty
  ,"world native" =    PBLs3exp$v0x103$OPTIM$global$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX80gr5$get_worldEMIffi_ty
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 comapred "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


#show
plotCTAX()




## 30 const ::::::::::::::::::::::::::::::::::::


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "regions aggregated" =   PBLs3exp$v0x103$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX30con$get_worldEMIffi_ty
  ,"world native" =    PBLs3exp$v0x103$OPTIM$global$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CTAX30con$get_worldEMIffi_ty
  #,"tbackstop 38" =    baseexp$CTAX30gr5__tbackstop38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const compared "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


#show
plotCTAX()















####### bohh


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
  ylab(myYlabel)  ; plottigat

