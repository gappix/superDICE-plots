source("OTHER_datamng/ADVANCE_data_management.R")
source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_plots/RICEx_00_colors_settings.R")

# Retrieve experiments

CTAXexp = list()
CTAXexp = experiments_load_as_list(CTAXexp,"MYEXPERIMENT")


baseexp = CTAXexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv
BAU     = CTAXexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runBAU



## ------------------:   CTAX DIAG 30 gr5   :---------------------


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
    "minMU7 maxMUt28 \npback550 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C30_gr5_xxA$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback550 gback025 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C30_gr5_xxB$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback550 gback025\n      fullpb10 "  = baseexp$runCTAX_DIAG_C30_gr5_xxC$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback05  \n      fullpb28 "  = baseexp$runCTAX_DIAG_C30_gr5_xxD$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C30_gr5_xxE$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C30_gr5_xxF$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb14 "  = baseexp$runCTAX_DIAG_C30_gr5_xxG$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()



MIUdata_nty = intermediate$runCTAX_DIAG_C30_gr5_xxpb550_gb0.025_ptend28_tminM7_tmaxM28$get__VARIABLE_nty("MIU")
expName     =  "pb550 gb025 tminM7  tmaxM28 ptend28 "


plotMIU()



## ------------------:   CTAX DIAG 30 const   :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
    "minMU7 maxMUt28 \npback550 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C30_const_xxA$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback550 gback025 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C30_const_xxB$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback550 gback025\n      fullpb10 "  = baseexp$runCTAX_DIAG_C30_const_xxC$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback05  \n      fullpb28 "  = baseexp$runCTAX_DIAG_C30_const_xxD$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C30_const_xxE$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C30_const_xxF$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb14 "  = baseexp$runCTAX_DIAG_C30_const_xxG$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()




## ------------------:   CTAX DIAG 80 const   :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
    "minMU7 maxMUt28 \npback550 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C80_const_xxA$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback550 gback025 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C80_const_xxB$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback550 gback025\n      fullpb10 "  = baseexp$runCTAX_DIAG_C80_const_xxC$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback05  \n      fullpb28 "  = baseexp$runCTAX_DIAG_C80_const_xxD$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C80_const_xxE$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C80_const_xxF$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb14 "  = baseexp$runCTAX_DIAG_C80_const_xxG$get_worldEMIffi_ty
) 
EXPtitle  = "World Emissions under CTAX DIAG 80 const "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()

## ---------------:   CTAX 80 gr5   :------------------------------------------- 

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
    "minMU7 maxMUt28 \npback550 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C80_gr5_xxA$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback550 gback025 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C80_gr5_xxB$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback550 gback025\n      fullpb10 "  = baseexp$runCTAX_DIAG_C80_gr5_xxC$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback05  \n      fullpb28 "  = baseexp$runCTAX_DIAG_C80_gr5_xxD$get_worldEMIffi_ty
  , "minMU7 maxMUt28 \npback344 gback025 \n      fullpb28 "  = baseexp$runCTAX_DIAG_C80_gr5_xxE$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb10 "  = baseexp$runCTAX_DIAG_C80_gr5_xxF$get_worldEMIffi_ty
  , "minMU14 maxMUt28 \npback344 gback05 \n      fullpb14 "  = baseexp$runCTAX_DIAG_C80_gr5_xxG$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()






## ---------------:   CTAX 30 gr5  Only DICE2016 MACC  :------------------------------------------- 


intermediate = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccDICE$clWITCHco2$damOFF$savFXconv


EXPdata   = list(
  
  "pb550 gb025 \ntminM14 tmaxM28 \n NO_ED"  = intermediate$runCTAX_DIAG_C30_gr5_xxpb550_gb0.025_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \n NO_ED"  = intermediate$runCTAX_DIAG_C30_gr5_xxpb550_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 WITHOUT ENERDATA MACC"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()





## -----------------: PLOT CTAX FUNCTION :-----------------------------------------------

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



# Plottigat
plotCTAX <- function(){

  mytitle  =  EXPtitle
  myYlabel =  EXPylabel
  myLegend =  EXPlegend
  
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  

plottigat = ggplot() + 
  
  #ADVANCE

  geom_line(data= ADVANCE_MODELS,
            aes(x=year, y=value, group = model, color = "_ADVANCE"),
            size = 0.8)  +
  
  geom_smooth(data= ADVANCE_MODELS,
              aes(x=year, y=value,  color = "_MEDIAN"),
              size = 1.1,  linetype = "dashed", se = F, span = 0.2) +
  
  # MY DATA
  
  geom_line(data = mydf, aes(year,value, color=cat), size = 1.2)  +  

  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks= c("_ADVANCE","_MEDIAN",names(EXPdata)),
                     values = c("grey","black", wes_palette(name = "Darjeeling1"), wes_palette(name = "GrandBudapest2"),
                                
                                
                                
                                
                                "#f77f2f", #orange
                                "#db0f20", 
                                "red",      # red
                                
                                "#d64cf5", # pink
                                
                                "#8232c7", #violet
                                "#450094",
                                
                                "blue",   #blue
                                "#0f86db",
                                "#0ccfab",
                                
                                "green",  #greens
                                
                                "#32c738",  
                                "#046918",
                                
                                
                                
                                "#c4570e",  # brown
                                "#fff100",  #yellow
                                "#9c4317"
                     )) +
  
  
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         #legend.spacing.y = unit(10.0, 'mm'),

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
