#///////////////////////////////////////////////////////////////////////////////////////////
#
#
# MMexp Script analysis to asses best multiplier correction values 
# to adjust ctax diagnostics
#
# @gappix 04.10.2019
#
#///////////////////////////////////////////////////////////////////////////////////////////


source("OTHER_datamng/ADVANCE_data_management.R")
source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_plots/RICEx_00_colors_settings.R")



## ------------------:    RETRIEVE EXPERIMENTS   :---------------------


MMexp = list()
MMexp = experiments_load_as_list(MMexp,"MMexp") #loads every gdx with this exp-codename


BAU = MMexp$v0x094$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runBAU_xxdice_ssp2marker_default


baseexp = MMexp$v0x094$OPT$ed57$ssp2 #common root across experiments



## ------------------:       CTAX DIAG 30 gr5     :---------------------


EXPdata   = list(
  "Base vanilla"            = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxvanilla_adv_default$get_worldEMIffi_ty
  ,"DICE advance"           = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxdice_adv_default$get_worldEMIffi_ty
  ,"DICE ssp2marker"        = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxdice_ssp2marker_default$get_worldEMIffi_ty
  ,"FREEFIT ssp2marker"     = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_default$get_worldEMIffi_ty
  ,"ALPHAFXFIT ssp2marker"  = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxalphafxfit_ssp2marker_default$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()


# some mius

MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxvanilla_adv_default$get_MIU_nty
expName     =  "vanilla"
plotMIU()

MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_default$get_MIU_nty
expName     =  "FREEFIT SSP"
plotMIU()


MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxalphafxfit_ssp2marker_default$get_MIU_nty
expName     =  "ALPHAFXFIT SSP"
plotMIU()

MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxdice_ssp2marker_default$get_MIU_nty
expName     =  "DICE SSP"
plotMIU()



## ------------------:   CTAX 80 gr5   :------------------------------------------- 



EXPdata   = list(
  "Base vanilla"            = baseexp$cooppop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C80_gr5_xxvanilla_adv_default$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()


# some mius

MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxvanilla_adv_default$get_MIU_nty
expName     =  "vanilla"
plotMIU()

MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_default$get_MIU_nty
expName     =  "FREEFIT SSP"
plotMIU()


MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxalphafxfit_ssp2marker_default$get_MIU_nty
expName     =  "ALPHAFXFIT SSP"
plotMIU()

MIUdata_nty = baseexp$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_gr5_xxdice_ssp2marker_default$get_MIU_nty
expName     =  "DICE SSP"
plotMIU()






## ------------------:   CTAX DIAG 30 const   :---------------------



EXPdata   = list(
  "Base vanilla"            = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxvanilla_adv_default$get_worldEMIffi_ty
  ,"DICE advance"           = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxdice_adv_default$get_worldEMIffi_ty
  ,"DICE ssp2marker"        = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxdice_ssp2marker_default$get_worldEMIffi_ty
  ,"FREEFIT advance"        = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxfreefit_adv_default$get_worldEMIffi_ty
  ,"FREEFIT ssp2marker"     = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_default$get_worldEMIffi_ty
  ,"ALPHAFXFIT advance"     = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxalphafxfit_adv_default$get_worldEMIffi_ty
  ,"EXPFXFIT advance"       = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxexpfxfit_adv_default$get_worldEMIffi_ty
  ,"BACKFXFIT advance"      = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C30_const_xxbackfxfit_adv_default$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()




## ------------------:   CTAX DIAG 80 const   :---------------------



EXPdata   = list(
  "Base vanilla"            = MMexp$v0x094$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker_default$get_worldEMIffi_ty
  ,"DICE advance"           = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxdice_adv_default$get_worldEMIffi_ty
  ,"DICE ssp2marker"        = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxdice_ssp2marker_default$get_worldEMIffi_ty
  ,"FREEFIT advance"        = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxfreefit_adv_default$get_worldEMIffi_ty
  ,"FREEFIT ssp2marker"     = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_default$get_worldEMIffi_ty
  ,"ALPHAFXFIT advance"     = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxalphafxfit_adv_default$get_worldEMIffi_ty
  ,"EXPFXFIT advance"       = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxexpfxfit_adv_default$get_worldEMIffi_ty
  ,"BACKFXFIT advance"      = MMexp$v0x094$OPT$ed57$ssp2$noncooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runCTAX_DIAG_C80_const_xxbackfxfit_adv_default$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()

## ------------------:   CTAX 30 gr5  Only DICE2016 MACC  :------------------------------------------- 


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





## ------------------: PLOT CTAX FUNCTION :-----------------------------------------------

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
