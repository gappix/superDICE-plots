source("RICEx_data_management/RICEx_50_experiments_data_central_hub.R")
source("Other_data_management/ADVANCE_data_management.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_plots/RICEx_00_colors_settings.R")

# Retrieve experiments

CTAXexp = list()




CTAXexp = experiments_load_as_list(CTAXexp,"CTAXtest")




 
## -------------------:  BURKE SR VARYING COOPERATION : --------------------------------


EXPdata   = list(
  "Base"        = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxbase$get__PARAMETER_ty("world_E")
  ,"tmaxMIU18"  = CTAXexp$v0x90$OPT$ed57$ssp2$coop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtmaxmiu18$get__PARAMETER_ty("world_E")
  ,"tmaxMIU18 PBfull18"  = CTAXexp$v0x90$OPT$ed57$ssp2$coop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtmaxmiu18_tendPback18$get__PARAMETER_ty("world_E")
  ,"PBfull18 p344 g05"   = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtendPback18_p344_g05$get__PARAMETER_ty("world_E")
  ,"PBfull10 p344 g025"  = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtendPback10_p344_g025$get__PARAMETER_ty("world_E")
  ,"PBfull10 p550 g025"  = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtendPback10_p550_g025$get__PARAMETER_ty("world_E")
  ,"PBfull10 p550 g025 \n tminMIU14"  = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtendPback10_p550_g025_tminMIU14$get__PARAMETER_ty("world_E")
  ,"PBfull10 p550 g025 \n tminMIU17"  = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtendPback10_p550_g025_tminMIU17$get__PARAMETER_ty("world_E")
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()





MIUdata_nty = CTAXexp$v0x90$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$runCTAX_DIAG_C30_gr5_xxtmaxmiu18_tendPback18$get__VARIABLE_nty("MIU")
expName     =  "tmaxMIU18 PBfull18" 


plotMIU()


## ------------------:   CTAX DIAG 30 const   :---------------------
intermediate = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv

EXPdata   = list(

  "pb344 gb025  \ntminM7  tmaxM28 \nptend28 "  = intermediate$runCTAX_DIAG_C30_const_xxpb344_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend10 "  = intermediate$runCTAX_DIAG_C30_const_xxpb344_gb0.05_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_const_xxpb344_gb0.05_ptend14_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM7  tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_const_xxpb344_gb0.05_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM14 tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_const_xxpb550_gb0.025_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_const_xxpb550_gb0.025_ptend10_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend28 "  = intermediate$runCTAX_DIAG_C30_const_xxpb550_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()


## ------------------:   CTAX DIAG 30 gr5   :---------------------
intermediate = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv

EXPdata   = list(
  
  "pb344 gb025  \ntminM7  tmaxM28 \nptend28 "  = intermediate$runCTAX_DIAG_C30_gr5_xxpb344_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend10 "  = intermediate$runCTAX_DIAG_C30_gr5_xxpb344_gb0.05_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_gr5_xxpb344_gb0.05_ptend14_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM7  tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_gr5_xxpb344_gb0.05_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM14 tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_gr5_xxpb550_gb0.025_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C30_gr5_xxpb550_gb0.025_ptend10_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend28 "  = intermediate$runCTAX_DIAG_C30_gr5_xxpb550_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5

plotCTAX()




MIUdata_nty = intermediate$runCTAX_DIAG_C30_gr5_xxpb550_gb0.025_ptend28_tminM7_tmaxM28$get__VARIABLE_nty("MIU")
expName     =  "pb550 gb025 tminM7  tmaxM28 ptend28 "


plotMIU()



## ------------------:   CTAX DIAG 80 const   :---------------------
intermediate = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv

EXPdata   = list(
  
  "pb344 gb025  \ntminM7  tmaxM28 \nptend28 "  = intermediate$runCTAX_DIAG_C80_const_xxpb344_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend10 "  = intermediate$runCTAX_DIAG_C80_const_xxpb344_gb0.05_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C80_const_xxpb344_gb0.05_ptend14_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM7  tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C80_const_xxpb344_gb0.05_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM14 tmaxM28 \nptend14 "  = as.data.frame(cbind("value"=c(0),"year"=c(2000),"t"=c(0))) #intermediate$runCTAX_DIAG_C80_const_xxpb550_gb0.025_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C80_const_xxpb550_gb0.025_ptend10_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend28 "  = intermediate$runCTAX_DIAG_C80_const_xxpb550_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()

## ---------------:   CTAX 80 gr5   :------------------------------------------- 


intermediate = CTAXexp$v0x90$OPT$ed57$ssp2$noncoop$maccED$clWITCHco2$damOFF$savFXconv

EXPdata   = list(
  
  "pb344 gb025  \ntminM7  tmaxM28 \nptend28 "  = intermediate$runCTAX_DIAG_C80_gr5_xxpb344_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend10 "  = as.data.frame(cbind("value"=c(0),"year"=c(2000),"t"=c(1))) #intermediate$runCTAX_DIAG_C80_gr5_xxpb344_gb0.05_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM14 tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C80_gr5_xxpb344_gb0.05_ptend14_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb344 gb05  \ntminM7  tmaxM28 \nptend14 "  = as.data.frame(cbind("value"=c(0),"year"=c(2000),"t"=c(1))) #intermediate$runCTAX_DIAG_C80_gr5_xxpb344_gb0.05_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM14 tmaxM28 \nptend14 "  = intermediate$runCTAX_DIAG_C80_gr5_xxpb550_gb0.025_ptend10_tminM14_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend14 "  = as.data.frame(cbind("value"=c(0),"year"=c(2000),"t"=c(1))) #intermediate$runCTAX_DIAG_C80_gr5_xxpb550_gb0.025_ptend10_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
  ,"pb550 gb025 \ntminM7  tmaxM28 \nptend28 "  = as.data.frame(cbind("value"=c(0),"year"=c(2000),"t"=c(1)))#intermediate$runCTAX_DIAG_C80_gr5_xxpb550_gb0.025_ptend28_tminM7_tmaxM28$get__PARAMETER_ty("world_E")
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
