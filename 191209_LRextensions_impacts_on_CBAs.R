source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("OTHER_datamng/ADVANCE_data_management.R")
source("OTHER_datamng/HIST_emissions_data.R")

## -----------------   EXPERIMENTS   -----------------------------------------------
# Retrieve experiments

LRexp = list()

LRexp = experiments_load_as_list(LRexp,"LRexp")
BAUdam_base =  LRexp$v0x9$SIMUL$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging
GEN_noncoop_base    =  LRexp$v0x9$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging
GEN_cooppop_base    =  LRexp$v0x9$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging
GEN_coopngsw_base   =  LRexp$v0x9$OPTIM$ed57$ssp2$coop_negishi$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging



##--------------- Additional data needed for plotting --------------------------------



## Add today values to historical for continuity
E_hist_PRIMAP_world_y = rbind(E_hist_PRIMAP_world_y, data.frame(year=2015, value= 35.04)) 




# -------------- PLOT CBA::  World Emissions  :: changing LR extension  -------------------



RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
 
    ,"BAU nodmg | 38 | sig_Ls | extmed "    = GEN_noncoop_base$BAU__ppp_exmed_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    ,"BAU nodmg | 38 | sig_Ls | extshort "  = GEN_noncoop_base$BAU__ppp_exshort_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    ,"BAU nodmg | 38 | sig_Ls | extlong "   = GEN_noncoop_base$BAU__ppp_exlong_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    
    ,"CBAnoncoop | 38 | sig_Ls | extmed "    = GEN_noncoop_base$CBA__ppp_exmed_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    ,"CBAnoncoop | 38 | sig_Ls | extshort "  = GEN_noncoop_base$CBA__ppp_exshort_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    ,"CBAnoncoop | 38 | sig_Ls | extlong "   = GEN_noncoop_base$CBA__ppp_exlong_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    
    ,"CBAcoop_pop | 38 | sig_Ls | extmed "    = GEN_cooppop_base$CBA__ppp_exmed_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    ,"CBAcoop_pop | 38 | sig_Ls | extshort "  = GEN_cooppop_base$CBA__ppp_exshort_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    ,"CBAcoop_pop | 38 | sig_Ls | extlong "   = GEN_cooppop_base$CBA__ppp_exlong_38_Ls_disc_discrt1x5$get_worldEMIffi_ty
    
    
    # ,"BAUdam | 38 | sig_Ls | extmed "    = BAUdam_base$BAUdam__ppp_exmed_38_Ls_disc$get_worldEMItot_ty
    # ,"BAUdam | 38 | sig_Ls | extshort "  = BAUdam_base$BAUdam__ppp_exshort_38_Ls_disc$get_worldEMItot_ty
    # ,"BAUdam | 38 | sig_Ls | extlong "   = BAUdam_base$BAUdam__ppp_exlong_38_Ls_disc$get_worldEMItot_ty
    # 
    # 
     )
  ,EXPtitle  = "World FFI Emissions SSP2 - Discount Rate 1.5% (default)"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "LR-scenarios"
)



# -------------- PLOT CBA::  World Emissions  :: changing LR extension  -------------------



RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"BAU nodmg | 38 | sig_Ls | extmed "    = GEN_noncoop_base$BAU__ppp_exmed_38_Ls_disc_discrt001$get_worldEMIffi_ty
    ,"BAU nodmg | 38 | sig_Ls | extshort "  = GEN_noncoop_base$BAU__ppp_exshort_38_Ls_disc_discrt001$get_worldEMIffi_ty
    ,"BAU nodmg | 38 | sig_Ls | extlong "   = GEN_noncoop_base$BAU__ppp_exlong_38_Ls_disc_discrt001$get_worldEMIffi_ty
    
    ,"CBAnoncoop | 38 | sig_Ls | extmed "    = GEN_noncoop_base$CBA__ppp_exmed_38_Ls_disc_discrt001$get_worldEMIffi_ty
    ,"CBAnoncoop | 38 | sig_Ls | extshort "  = GEN_noncoop_base$CBA__ppp_exshort_38_Ls_disc_discrt001$get_worldEMIffi_ty
    ,"CBAnoncoop | 38 | sig_Ls | extlong "   = GEN_noncoop_base$CBA__ppp_exlong_38_Ls_disc_discrt001$get_worldEMIffi_ty
    
    ,"CBAcoop_pop | 38 | sig_Ls | extmed "    = GEN_cooppop_base$CBA__ppp_exmed_38_Ls_disc_discrt0015$get_worldEMIffi_ty
    ,"CBAcoop_pop | 38 | sig_Ls | extshort "  = GEN_cooppop_base$CBA__ppp_exshort_38_Ls_disc_discrt0015$get_worldEMIffi_ty
    ,"CBAcoop_pop | 38 | sig_Ls | extlong "   = GEN_cooppop_base$CBA__ppp_exmed_38_Ls_disc_discrt0015$get_worldEMIffi_ty %>% filter(year==2015)
    
    
    # ,"BAUdam | 38 | sig_Ls | extmed "    = BAUdam_base$BAUdam__ppp_exmed_38_Ls_disc$get_worldEMItot_ty
    # ,"BAUdam | 38 | sig_Ls | extshort "  = BAUdam_base$BAUdam__ppp_exshort_38_Ls_disc$get_worldEMItot_ty
    # ,"BAUdam | 38 | sig_Ls | extlong "   = BAUdam_base$BAUdam__ppp_exlong_38_Ls_disc$get_worldEMItot_ty
    # 
    # 
  )
  ,EXPtitle  = "World FFI Emissions SSP2 - Discount Rate ~0.1%"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "LR-scenarios"
)







# -------------- PLOT CBA::  World Emissions  :: changing LR extension  -------------------



RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"BAU nodmg | 38 | sig_Ls | extmed "    = GEN_noncoop_base$BAU__ppp_exmed_38_Ls_disc_discrt03$get_worldEMIffi_ty
    ,"BAU nodmg | 38 | sig_Ls | extshort "  = GEN_noncoop_base$BAU__ppp_exshort_38_Ls_disc_discrt03$get_worldEMIffi_ty
    ,"BAU nodmg | 38 | sig_Ls | extlong "   = GEN_noncoop_base$BAU__ppp_exlong_38_Ls_disc_discrt03$get_worldEMIffi_ty
    
    ,"CBAnoncoop | 38 | sig_Ls | extmed "    = GEN_noncoop_base$CBA__ppp_exmed_38_Ls_disc_discrt03$get_worldEMIffi_ty
    ,"CBAnoncoop | 38 | sig_Ls | extshort "  = GEN_noncoop_base$CBA__ppp_exshort_38_Ls_disc_discrt03$get_worldEMIffi_ty
    ,"CBAnoncoop | 38 | sig_Ls | extlong "   = GEN_noncoop_base$CBA__ppp_exlong_38_Ls_disc_discrt03$get_worldEMIffi_ty
    
    ,"CBAcoop_pop | 38 | sig_Ls | extmed "    = GEN_cooppop_base$CBA__ppp_exmed_38_Ls_disc_discrt03$get_worldEMIffi_ty
    ,"CBAcoop_pop | 38 | sig_Ls | extshort "  = GEN_cooppop_base$CBA__ppp_exshort_38_Ls_disc_discrt03$get_worldEMIffi_ty
    ,"CBAcoop_pop | 38 | sig_Ls | extlong "   = GEN_cooppop_base$CBA__ppp_exlong_38_Ls_disc_discrt03$get_worldEMIffi_ty
    

  )
  ,EXPtitle  = "World FFI Emissions SSP2 - Discount Rate 3%"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "LR-scenarios"
)








# -------------- PLOT CBA::  World Emissions  :: changing LR extension  -------------------


RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"BAU nodmg | 48 | sig_Ls | extmed "    = GEN_noncoop_base$BAU__ppp_exmed_48_Ls_disc$get_worldEMIffi_ty
    
    ,"CBAnoncoop | 48 | sig_Ls | extmed "    = GEN_noncoop_base$CBA__ppp_exmed_38_Ls_disc$get_worldEMIffi_ty

    ,"CBAcoop_NGSW | 48 | sig_Ls | extmed "    = GEN_coopngsw_base$CBA__ppp_exmed_38_Ls_disc$get_worldEMIffi_ty
    
    ,"CBAcoop_pop | 48 | sig_Ls | extmed "    = GEN_cooppop_base$CBA__ppp_exmed_38_Ls_disc$get_worldEMIffi_ty

    
    
  )
  ,EXPtitle  = "World FFI Emissions SSP2 - GDP PPP"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "LR-scenarios"
)






RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"BAU nodmg | 48 | sig_Ls | extmed "    = GEN_noncoop_base$BAU__ppp_exlong_48_Ls_disc$get_worldEMIffi_ty
    
    ,"CBAnoncoop | 48 | sig_Ls | extmed "    = GEN_noncoop_base$CBA__mer_exmed_48_Ls_disc$get_worldEMIffi_ty
    
    ,"CBAcoop_NGSW | 48 | sig_Ls | extmed "    = GEN_coopngsw_base$CBA__mer_exmed_48_Ls_disc$get_worldEMIffi_ty
    
    ,"CBAcoop_pop | 48 | sig_Ls | extmed "    = GEN_cooppop_base$CBA__mer_exmed_48_Ls_disc$get_worldEMIffi_ty
    
    
    
  )
  ,EXPtitle  = "World FFI Emissions SSP2 - GDP MER"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "LR-scenarios"
)








# -------------- PLOT CBA::  World Emissions  :: changing LR extension  -------------------


# With Extshot setting (which should be very similar)

RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"BAU "    = GEN_noncoop_base$BAU__mer_exmed_48_Ls_disc$get_worldEMIffi_ty
  
    
    ,"CBAcoop NGSW "    = GEN_coopngsw_base$CBA__mer_exshort_linear_48_disc$get_worldEMIffi_ty
    
    ,"CBAcoop pop "    = GEN_cooppop_base$CBA__mer_exshort_linear_48_disc$get_worldEMIffi_ty
    
    
    
  )
  ,EXPtitle  = "World FFI Emissions SSP2 - GDP MER"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "Extshort scenarios"
)






RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"BAU "    = GEN_noncoop_base$BAU__mer_exmed_48_Ls_disc$get_worldEMIffi_ty
    
    
    ,"CBAcoop NGSW "    = GEN_coopngsw_base$CBA__ppp_exshort_linear_48_disc$get_worldEMIffi_ty
    
    ,"CBAcoop pop "    = GEN_cooppop_base$CBA__ppp_exshort_linear_48_disc$get_worldEMIffi_ty
    
    
    
  )
  ,EXPtitle  = "World FFI Emissions SSP2 - GDP PPP"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "Extshort scenarios"
)



#dfskfjsdkjfhsjhfkjshdfk











RICEx.plot.lineplot(
  EXPdata   = list(
    "_Historical" = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000)
    
    ,"BAU | 48 | sig_Ls | extmed "    = GEN_noncoop_base$BAU__ppp_exmed_48_Ls_disc$get_worldEMIffi_ty
    ,"BAU | 48 | sig_Ls | extshort "  = GEN_noncoop_base$BAU__ppp_exshort_48_Ls_disc$get_worldEMIffi_ty
    #,"BAU | 48 | sig_Ls | extlong "   = GEN_noncoop_base$BAU__ppp_exlong_48_Ls_disc$get_worldEMIffi_ty
    
    ,"BAU | 28 | sig_Ls | extmed "    = GEN_noncoop_base$BAU__ppp_exmed_28_Ls_disc$get_worldEMIffi_ty
    ,"BAU | 28 | sig_Ls | extshort "  = GEN_noncoop_base$BAU__ppp_exshort_28_Ls_disc$get_worldEMIffi_ty
    ,"BAU | 28 | sig_Ls | extlong "   = GEN_noncoop_base$BAU__ppp_exlong_28_Ls_disc$get_worldEMIffi_ty
    
    
    ,"CBAnoncoop | 48 | sig_Ls | extmed "    = GEN_noncoop_base$CBA__ppp_exmed_48_Ls_disc$get_worldEMIffi_ty
    ,"CBAnoncoop | 48 | sig_Ls | extshort "  = GEN_noncoop_base$CBA__ppp_exshort_48_Ls_disc$get_worldEMIffi_ty
    ,"CBAnoncoop | 48 | sig_Ls | extlong "   = GEN_noncoop_base$CBA__ppp_exlong_48_Ls_disc$get_worldEMIffi_ty
    
    ,"CBAcoop_pop | 48 | sig_Ls | extmed "    = GEN_cooppop_base$CBA__ppp_exmed_48_Ls_disc$get_worldEMIffi_ty
    ,"CBAcoop_pop | 48 | sig_Ls | extshort "  = GEN_cooppop_base$CBA__ppp_exshort_48_Ls_disc$get_worldEMIffi_ty
    ,"CBAcoop_pop | 48 | sig_Ls | extlong "   = GEN_cooppop_base$CBA__ppp_exlong_48_Ls_disc$get_worldEMIffi_ty
    
    
    # ,"BAUdam | 38 | sig_Ls | extmed "    = BAUdam_base$BAUdam__ppp_exmed_38_Ls_disc$get_worldEMItot_ty
    # ,"BAUdam | 38 | sig_Ls | extshort "  = BAUdam_base$BAUdam__ppp_exshort_38_Ls_disc$get_worldEMItot_ty
    # ,"BAUdam | 38 | sig_Ls | extlong "   = BAUdam_base$BAUdam__ppp_exlong_38_Ls_disc$get_worldEMItot_ty
    # 
    # 
  )
  ,EXPtitle  = "World FFI Emissions SSP2 under different LR-scenarios"
  ,EXPylabel = "Emissions [GtCO2/year]"
  ,EXPlegend = "LR-scenarios"
)







# stacked ------------------

my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == paste0(toupper("ssp2"),"-Baseline"))
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == "ssp2")  %>% mutate(year = 2010 + (t*5))



  plottigat= ggplot() + 
    
    # Scenario
    geom_area(data= BAUdam_base$BAUdam__ppp_exmed_38_Ls_disc$get_VARIABLE_nty("DAMAGES") ,
              aes(x=year, y=value, group=n, fill =n)) + 
    
    # ssp IIASA
    geom_line(data= my_sspIIASA ,
              aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
              size = 0.2)  + 
    
    # Marker
    geom_line(data= my_marker ,
              aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
              size = 1.2,
              linetype = 4)  + 
    
    
    
    # graphic details
    
    scale_color_manual(  values =  c( "sUC <.01"            = "black",
                                      "IIASA SSP Baselines" = "#8585ad", #dark grey
                                      "IIASA SSP Marker"    = "black",
                                      "EnerData Blue BAU"   = "black"))  +
    
    scale_fill_manual(values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=1), fill=guide_legend(ncol=2)) +
    
    theme( legend.position=if(no_legend){"none"} else {"right"} ,
           plot.title = element_text(size=18),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle(paste0("Emissions Stacked  ",my_exp_descrp, "  ", my_ssp,"  <",my_dice_curve,",",my_extension,", ",my_transition_type,", ",my_transition_end,"> at country level")) + 
    xlab("Year") +
    ylab("Emissions FFI [GtCO2]")  ; plottigat
  
  
  

#..........  //   AUTORUN  // ...................

# ?!?!?!?!  ?!?!?!?!?  !?!?!??!  ?!?!?!?!  ?!?!?!?!?
# ?!?!?!?!  ?!?!?!?!?  !?!?!??!  ?!?!?!?!  ?!?!?!?!?

#            wanna change any setting?  

# ?!?!?!?!  ?!?!?!?!?  !?!?!??!  ?!?!?!?!  ?!?!?!?!?
# ?!?!?!?!  ?!?!?!?!?  !?!?!??!  ?!?!?!?!  ?!?!?!?!?


# ||||  Short-run settings  |||

my_experiment = ssplist$ssp_xxA_yyB 
my_exp_descrp = "Test_xxA_yyB"

my_ssp        = "ssp5" 


#...........................................
# here you have to select the 
# SPECIFIC scenario to plot in detal
#...........................................



# ||||  Long-run settings  |||


# | extshort | extmed | extlong |
my_extension       = "extshort