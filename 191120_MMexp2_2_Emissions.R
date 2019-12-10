source("OTHER_datamng/ADVANCE_data_management.R")
source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_plots/RICEx_00_colors_settings.R")
source("OTHER_datamng/HIST_emissions_data.R")
pkgs <- c('tidyr','broom','data.table','docopt','stringr','dplyr','dtplyr','purrr', 'colf', 'gdxtools', "minpack.lm", "crayon")
res <- suppressWarnings(lapply(pkgs,require_package))
suppressWarnings(require_gdxtools())

## -----------------:   EXPERIMENTS   :-----------------------------------------------
# Retrieve experiments

MMexp = list()
MMexp = experiments_load_as_list(MMexp,"MMexp")


MMexp_QUADFIT      = MMexp$UNKvers$UNKruntype$global$UNKssp$noncooppop$maccEDcolfquadfit$UNKclimateModule$UNKdamageModule$UNKsavingRate
MMexp_POWERFIT     = MMexp$UNKvers$UNKruntype$global$UNKssp$noncooppop$maccEDpowerfit$UNKclimateModule$UNKdamageModule$UNKsavingRate
MMexp_FXPOWERFIT   = MMexp$UNKvers$UNKruntype$global$UNKssp$noncooppop$maccEDfxpowerfit$UNKclimateModule$UNKdamageModule$UNKsavingRate


## -----------------: PLOT CTAX FUNCTION :-----------------------------------------------

# run section ad close

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


##-------------------------------- 30 gr5  VANILLAS, changing fittype   :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
    "quadfit vanilla "          =  MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
    ,    "powerfit vanilla "    = MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
    ,    "fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty

)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 VANILLAS"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


#show
plotCTAX()


##-------------------------------- 30 gr5   FREEFIT, changing < fit-model , fitto, variant >  :---------------------

### ALL FREEFIT

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "quadfit freefit adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit freefit adv    \n comfzone "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit adv    \n comfzone2 "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone2  "  =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "powerfit freefit adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "fxpowerfit freefit adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  
)



#### ALL COMFORT ZONE


EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  ##"quadfit freefit adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  #    "quadfit freefit sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
       "quadfit freefit adv    \n comfzone "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit adv    \n comfzone2 "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone2  "  =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  #,    "powerfit freefit adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  #,    "powerfit freefit sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  #,    "fxpowerfit freefit adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  #,    "fxpowerfit freefit sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  
)


### POTENTIALLY OK ONES

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
       "quadfit freefit adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  #,    "quadfit freefit adv    \n comfzone "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  #,    "quadfit freefit sspmk  \n comfzone  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  #,    "quadfit freefit adv    \n comfzone2 "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  #,    "quadfit freefit sspmk  \n comfzone2  "  =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "powerfit freefit adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  #,    "powerfit freefit adv   \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  #,    "powerfit freefit adv   \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "fxpowerfit freefit adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  #,    "fxpowerfit freefit adv   \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  #,    "fxpowerfit freefit adv   \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  #,    "fxpowerfit freefit sspmk \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  
)





### POTENTIALLY OK COMFORT ZONE

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  #"quadfit freefit adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  #,    "quadfit freefit sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  #,    "quadfit freefit adv    \n comfzone "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  #,    "quadfit freefit sspmk  \n comfzone  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  #,    "quadfit freefit adv    \n comfzone2 "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  #,    "quadfit freefit sspmk  \n comfzone2  "  =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  #,    "powerfit freefit adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  #,    "powerfit freefit sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  #,    "powerfit freefit adv   \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
      "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  #,    "powerfit freefit adv   \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  #,    "fxpowerfit freefit adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  #,    "fxpowerfit freefit sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  #,    "fxpowerfit freefit adv   \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  #,    "fxpowerfit freefit adv   \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  #,    "fxpowerfit freefit sspmk \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  
)






EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, FREEFIT changing < fit-MODEL, fit-TO, variant >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()







##-------------------------------- 30 gr5  BACKFX , changing < fit-model , fitto, variant  > :--------------------------------



### ALL BACKFX

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
       "quadfit backfx adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "quadfit backfx sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit backfx adv    \n exprelax "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "quadfit backfx sspmk  \n exprelax  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty

  ,    "powerfit backfx adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit backfx adv   \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
 
  ,    "fxpowerfit backfx adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit backfx adv   \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty

  
)


### ALL BACKFX RELAXED

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  #"quadfit backfx adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  #,    "quadfit backfx sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
       "quadfit backfx adv    \n exprelax "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "quadfit backfx sspmk  \n exprelax  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  #,    "powerfit backfx adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  #,    "powerfit backfx sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit backfx adv   \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  #,    "fxpowerfit backfx adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  #,    "fxpowerfit backfx sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit backfx adv   \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  
)



EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, BACKFX changing < fit-MODEL, fit-TO, variant >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()






######################################################################################################::
######################################################################################################::
######################################################################################################::


## ------------------:   CTAX DIAG 80 gr5   :---------------------


##-------------------------------- 80 gr5  ALL COMFORTZONES   :---------------------


#### ALL COMFORT ZONE


EXPdata   = list(

       "quadfit freefit adv    \n comfzone "    =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone  "   =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit adv    \n comfzone2 "   =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone2  "  =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "powerfit freefit adv   \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "fxpowerfit freefit adv   \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  
)

EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 Comfortzones"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()


##-------------------------------- 80 gr5  ALL BACKFX RELAXED   :---------------------



 

EXPdata   = list(
       "quadfit backfx adv    \n exprelax "    =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "quadfit backfx sspmk  \n exprelax  "   =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  ,    "powerfit backfx adv   \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  ,    "fxpowerfit backfx adv   \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  
)



EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, BACKFX "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()




##-------------------------------- 80 gr5  ALL BEST COMFORTZONES    :---------------------



EXPdata   = list(

       "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty

  
)



EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, Best Comfort zones "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()



##-------------------------------- 80 gr5  ALL BEST FREEFITS    :---------------------




EXPdata   = list(

       "quadfit freefit adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty

  
)


EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, Best freefits"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()



##### ::::::: --------------
######################################################################################################::
######################################################################################################::
######################################################################################################::

## ------------------:   CTAX DIAG 80 CONST   :---------------------

##-------------------------------- 80 const  ALL COMFORTZONES   :---------------------


#### ALL COMFORT ZONE


EXPdata   = list(
  
       "quadfit freefit adv    \n comfzone "    =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone  "   =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit adv    \n comfzone2 "   =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone2  "  =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "powerfit freefit adv   \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "fxpowerfit freefit adv   \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  
)

EXPtitle  = "World Emissions under CTAX DIAG 80 const Comfortzones"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()


##-------------------------------- 80 const  ALL BACKFX RELAXED   :---------------------





EXPdata   = list(
       "quadfit backfx adv    \n exprelax "    =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "quadfit backfx sspmk  \n exprelax  "   =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  ,    "powerfit backfx adv   \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  ,    "fxpowerfit backfx adv   \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  
)



EXPtitle  = "World Emissions under CTAX DIAG 80 const, BACKFX "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()




##-------------------------------- 80 const  ALL BEST COMFORTZONES    :---------------------



EXPdata   = list(
  
       "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  
  
)



EXPtitle  = "World Emissions under CTAX DIAG 80 const, Best Comfort zones "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()



##-------------------------------- 80 const  ALL BEST FREEFITS    :---------------------




EXPdata   = list(
  
       "quadfit freefit adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  
  
)


EXPtitle  = "World Emissions under CTAX DIAG 80 const, Best freefits"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()



##### ::::::: --------------
######################################################################################################::
######################################################################################################::
######################################################################################################::

## ------------------:   CTAX DIAG 30 CONST   :---------------------

##-------------------------------- 30 const  ALL COMFORTZONES   :---------------------


#### ALL COMFORT ZONE


EXPdata   = list(
  
       "quadfit freefit adv    \n comfzone "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "quadfit freefit adv    \n comfzone2 "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n comfzone2  "  =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "powerfit freefit adv   \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  ,    "fxpowerfit freefit adv   \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone2 " = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  
  
)

EXPtitle  = "World Emissions under CTAX DIAG 30 const Comfortzones"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()


##-------------------------------- 30 const  ALL BACKFX RELAXED   :---------------------





EXPdata   = list(
       "quadfit backfx adv    \n exprelax "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "quadfit backfx sspmk  \n exprelax  "   =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  ,    "powerfit backfx adv   \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk \n exprelax "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  ,    "fxpowerfit backfx adv   \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_adv_exprelax$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk \n exprelax "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_ssp2marker_exprelax$get_worldEMIffi_ty
  
  
)



EXPtitle  = "World Emissions under CTAX DIAG 30 const, BACKFX "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()




##-------------------------------- 30 const  ALL BEST COMFORTZONES    :---------------------



EXPdata   = list(
  
       "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  
  
)



EXPtitle  = "World Emissions under CTAX DIAG 30 const, Best Comfort zones "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()



##-------------------------------- 30 const  ALL BEST FREEFITS    :---------------------




EXPdata   = list(
  
       "quadfit freefit adv    \n default "     =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk  \n default  "    =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv   \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n default "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk \n comfzone2 "   =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone2$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv   \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n default "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk \n comfzone "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker_comfortzone$get_worldEMIffi_ty
  
  
)


EXPtitle  = "World Emissions under CTAX DIAG 30 const, Best freefits"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()

