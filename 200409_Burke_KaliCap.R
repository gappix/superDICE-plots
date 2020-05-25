
## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")
invisible(source("RICEx_plots/RICEx_plots.R"))




## -----------------   EXPERIMENTS   -----------------------------------

# Retrieve experiments fom automated procedure


BKaliCap = list()
BKaliCap = experiments_load_as_list(BKaliCap,"BKaliCap")



# shortcuts
BKaliCap_2_noncoop = BKaliCap$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging
BKaliCap_2_coop    = BKaliCap$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging

BKaliCap_5_noncoop = BKaliCap$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging
BKaliCap_5_coop    = BKaliCap$v1x00$OPTIM$ed57$ssp5$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging






##------------- Additional data needed for plotting --------------------


source("OTHER_datamng/HIST_emissions_data.R")
# DICE values 
source("OTHER_datamng/DICE_results_management.R")
# (available in "DICEresults" list)



## Add today values to historical for continuity
E_hist_PRIMAP_world_y = rbind(E_hist_PRIMAP_world_y, data.frame(year=2015, value= 35.04)) 


BAU_ssp2 = BKaliCap$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__kali_cap_BDE
BAU_ssp5 = BKaliCap$v1x00$OPTIM$ed57$ssp5$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU__kali_cap_BDE




## -----------------   FUNCTIONS   -----------------------------------






nty_plotter <- function(myexp, mytitle, myylab){
  
  p= ggplot() + 
    
    
    geom_line(data= myexp,
              aes(x=year, y=value, group=n, color =n),
              size = 1.1) + 
    
    # graphic details
    scale_color_manual(values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
    
    theme( legend.position=if(no_legend){"none"} else {"right"} ,
           plot.title = element_text(size=12),
           axis.title.x = element_text(size = 12),
           axis.text.x = element_text(size = 12),
           axis.title.y = element_text(size = 12)) +  
    
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myylab)  ; 
  
  return(p)
}


custom_save <- function(plottigat, x=500, y=270){
  
  windows(x, y, pointsize = 12) #opens a separate window with the size you want 
  print(plottigat)#draw to this (active) window
  savePlot("clipboard", type="wmf") #saves plot to WMF
  
}

#=============================================================================#
####       _______ NONCOOP   ♦  GLOBAL   __________                ####
#=============================================================================#


#----  W EMI  .. SSP2  ..  #Cap    -------------------------


#......... (1) first wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "Kali cap - High"       = BKaliCap_2_noncoop$CBA__kali_cap_AAC$get_world_EMIffi_ty
    ,"Kali cap - Low"        = BKaliCap_2_noncoop$CBA__kali_cap_BDE$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_PP$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_PQ$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"   = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_RP$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_SP$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_2_noncoop$CBA__no_cap$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"  = BAU_ssp2$get_world_EMIffi_ty
  )

  
  ,title  = "World FFI Emissions - SSP2, Non cooperative"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat




# Wanna copy? 
custom_save(plottigat)





#......... (2) second wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali halfcap - up"           = BKaliCap_2_noncoop$CBA__kali_mixedcap_BDEup$get_world_EMIffi_ty
    ,"Kali halfcap - low"        = BKaliCap_2_noncoop$CBA__kali_mixedcap_BDElow$get_world_EMIffi_ty
    ,"Kali cap - Low"        = BKaliCap_2_noncoop$CBA__kali_cap_BDE$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2, 0.0001\\]$"   = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_world_EMIffi_ty
   # ,"Strong cap $\\[5, 0.0001\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_RR$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.0001\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_SR$get_world_EMIffi_ty
    
 
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"  = BAU_ssp2$get_world_EMIffi_ty
  )
  
  
  ,title  = "World FFI Emissions - SSP2, Non cooperative"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat







# Wanna copy? 
custom_save(plottigat)

  



#--------------  W EMI  .. SSP2 ..  #STRONG #Cap    -------------------------




plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    # "Kali cap - AAC"     = BKaliCap_2_noncoop$CBA__kali_L_cap_AAC$get_world_EMIffi_ty
    # ,"Kali cap - BDE"     = BKaliCap_2_noncoop$CBA__kali_L_cap_BDE$get_world_EMIffi_ty
    
    "Strong cap PP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_PP$get_world_EMIffi_ty
    ,"Strong cap PQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_PQ$get_world_EMIffi_ty
    ,"Strong cap QP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_QP$get_world_EMIffi_ty
    ,"Strong cap QQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_QQ$get_world_EMIffi_ty
    ,"Strong cap RP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_RP$get_world_EMIffi_ty
    ,"Strong cap RQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_RQ$get_world_EMIffi_ty
    ,"Strong cap SP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_SP$get_world_EMIffi_ty
    ,"Strong cap SQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_SQ$get_world_EMIffi_ty
    ,"Strong cap PR"      = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_world_EMIffi_ty
    
    #,"No cap "            = BKaliCap_2_noncoop$CBA__no_cap$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKaliCap_2_noncoop$BAU__kali_L_cap_BDE$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 Burke SR - Damages Discounted - different Inequality Aversion ($\\gamma$)"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat



#----  W TATM  .. SSP2 ..  #Cap    -------------------------




plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"     = BKaliCap_2_noncoop$CBA__kali_L_cap_AAC$get_TATM_ty
    ,"Kali cap - BDE"     = BKaliCap_2_noncoop$CBA__kali_L_cap_BDE$get_TATM_ty
    
    ,"Strong cap PP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_PP$get_TATM_ty
    ,"Strong cap SQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_SQ$get_TATM_ty
    ,"Strong cap PR"      = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_TATM_ty
    
    ,"No cap "            = BKaliCap_2_noncoop$CBA__no_cap$get_TATM_ty
    
    ,"BAU no-dmg"  = BKaliCap_2_noncoop$BAU__kali_L_cap_BDE$get_TATM_ty
  )
  ,title  = "Atmospheic temperature increase"
  ,yLabel = "ºC "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat










#----  W EMI  .. SSP5 ..  #Cap    -------------------------




plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - High"       = BKaliCap_5_noncoop$CBA__kali_cap_AAC$get_world_EMIffi_ty
    ,"Kali cap - Low"        = BKaliCap_5_noncoop$CBA__kali_cap_BDE$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"      = BKaliCap_5_noncoop$CBA__strong_cap_PP$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"      = BKaliCap_5_noncoop$CBA__strong_cap_PQ$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"   = BKaliCap_5_noncoop$CBA__strong_cap_PR$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"      = BKaliCap_5_noncoop$CBA__strong_cap_RP$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"      = BKaliCap_5_noncoop$CBA__strong_cap_SP$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_5_noncoop$CBA__no_cap$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"  = BAU_ssp5$get_world_EMIffi_ty
  )
  
  
  ,title  = "World FFI Emissions - SSP5, Non cooperative"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





# Wanna copy? 
custom_save(plottigat)







#=============================================================================#
####      _______ NONCOOP ♦ REGIONS   _________                ####
#==== alt + 4 ================================================================#





# ---- MIU - specific region - # Cap ----------

myreg = "usa"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"     = BKaliCap_2_noncoop$CBA__kali_L_cap_AAC$get_MIU_nty     %>% filter(n==myreg)
    ,"Kali cap - BDE"     = BKaliCap_2_noncoop$CBA__kali_L_cap_BDE$get_MIU_nty    %>% filter(n==myreg)
    
    ,"Strong cap PP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_PP$get_MIU_nty   %>% filter(n==myreg)
    ,"Strong cap SQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_SQ$get_MIU_nty   %>% filter(n==myreg)
    ,"Strong cap PR"      = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_MIU_nty     %>% filter(n==myreg)
    
    ,"No cap "            = BKaliCap_2_noncoop$CBA__no_cap$get_MIU_nty            %>% filter(n==myreg)
    
  )
  ,title  = paste0("Mitigation for region: ", myreg)
  ,yLabel = "Mitigation [%BAU]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
) + ylim(0,120) ; plottigat


# ---- YNET - specific region - # Cap ----------

myreg = "bra"


{ plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"      = BKaliCap_2_noncoop$CBA__kali_L_cap_AAC$get_VARIABLE_nty("YNET", year_limit = 2300)        %>% filter(n==myreg)
    ,"Kali cap - BDE"     = BKaliCap_2_noncoop$CBA__kali_L_cap_BDE$get_VARIABLE_nty("YNET", year_limit = 2300)        %>% filter(n==myreg)
    
    ,"Strong cap PP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_PP$get_VARIABLE_nty("YNET", year_limit = 2300)       %>% filter(n==myreg)
    ,"Strong cap SQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_SQ$get_VARIABLE_nty("YNET", year_limit = 2300)       %>% filter(n==myreg)
    ,"Strong cap PR"      = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_VARIABLE_nty("YNET", year_limit = 2300)         %>% filter(n==myreg)
    
    ,"No cap "            = BKaliCap_2_noncoop$CBA__no_cap$get_VARIABLE_nty("YNET", year_limit = 2300)                %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP NET for region: ", myreg)
  ,yLabel = "Trill USD "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
) #+ ylim(0,1000)
  
}; plottigat




# ---- YGROSS -  specific region - # Cap ----------

myreg = "usa"


{ plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"      = BKaliCap_2_noncoop$CBA__kali_L_cap_AAC$get_VARIABLE_nty("YGROSS", year_limit = 2300)        %>% filter(n==myreg)
    ,"Kali cap - BDE"     = BKaliCap_2_noncoop$CBA__kali_L_cap_BDE$get_VARIABLE_nty("YGROSS", year_limit = 2300)        %>% filter(n==myreg)
    
    ,"Strong cap PP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_PP$get_VARIABLE_nty("YGROSS", year_limit = 2300)       %>% filter(n==myreg)
    ,"Strong cap SQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_SQ$get_VARIABLE_nty("YGROSS", year_limit = 2300)       %>% filter(n==myreg)
    ,"Strong cap PR"      = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_VARIABLE_nty("YGROSS", year_limit = 2300)         %>% filter(n==myreg)
    
    ,"No cap "            = BKaliCap_2_noncoop$CBA__no_cap$get_VARIABLE_nty("YGROSS", year_limit = 2300)                %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP GROSS for region: ", myreg)
  ,yLabel = "Trill USD "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
) #+ ylim(0,1000)
  
}; plottigat


# ---- C - specific region - # Cap ----------

myreg = "nde"


{ plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"      = BKaliCap_2_noncoop$CBA__kali_L_cap_AAC$get_VARIABLE_nty("C", year_limit = 2300)        %>% filter(n==myreg)
    ,"Kali cap - BDE"     = BKaliCap_2_noncoop$CBA__kali_L_cap_BDE$get_VARIABLE_nty("C", year_limit = 2300)        %>% filter(n==myreg)
    
    ,"Strong cap PP"      = BKaliCap_2_noncoop$CBA__strong_L_cap_PP$get_VARIABLE_nty("C", year_limit = 2300)       %>% filter(n==myreg)
    ,"Strong cap SQ"      = BKaliCap_2_noncoop$CBA__strong_L_cap_SQ$get_VARIABLE_nty("C", year_limit = 2300)       %>% filter(n==myreg)
    ,"Strong cap PR"      = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_VARIABLE_nty("C", year_limit = 2300)         %>% filter(n==myreg)
    
    ,"No cap "            = BKaliCap_2_noncoop$CBA__no_cap$get_VARIABLE_nty("C", year_limit = 2300)                %>% filter(n==myreg)
    
  )
  ,title  = paste0("Consumption for region: ", myreg)
  ,yLabel = "Trill USD "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = FALSE
  
) #+ ylim(0,1000)
  
}; plottigat















#----  W EMI  -  SSP2 SR - Damages Discounted -  # DISGamma    -------------------------




plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
     "AAC $\\gamma = 0$"     = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_world_EMIffi_ty
    ,"AAC $\\gamma = 0.5$"  = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_world_EMIffi_ty
    ,"AAC $\\gamma = 1.45$" = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_world_EMIffi_ty
    ,"AAC $\\gamma = 2$"    = BKaliCap_2_coop$CBA__kali_cap_AAC_g2$get_world_EMIffi_ty
    ,"AAC non-coop" = BKaliCap_2_noncoop$CBA__kali_cap_AAC$get_world_EMIffi_ty
    
    ,"BDE $\\gamma = 0$"    = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_world_EMIffi_ty
    ,"BDE $\\gamma = 0.5$"  = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_world_EMIffi_ty
    ,"BDE $\\gamma = 1.45$" = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_world_EMIffi_ty
    ,"BDE $\\gamma = 2$"    = BKaliCap_2_coop$CBA__kali_cap_BDE_g2$get_world_EMIffi_ty
    ,"BDE non-coop" = BKaliCap_2_noncoop$CBA__kali_cap_BDE$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKaliCap_2_noncoop$BAU__kali_cap_BDE$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 Burke SR - Damages Discounted - different Inequality Aversion ($\\gamma$)"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat




#----  W EMI  -  SSP5 SR - Damages Discounted -  # DISGamma    -------------------------




plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
   # "AAC $\\gamma = 0$"     = BKaliCap_5_coop$CBA__kali_cap_AAC_g0$get_world_EMIffi_ty
   # ,"AAC $\\gamma = 0.5$"  = BKaliCap_5_coop$CBA__kali_cap_AAC_g0x5$get_world_EMIffi_ty
   # ,"AAC $\\gamma = 1.45$" = BKaliCap_5_coop$CBA__kali_cap_AAC_g1x45$get_world_EMIffi_ty
   # ,"AAC $\\gamma = 2$"    = BKaliCap_5_coop$CBA__kali_cap_AAC_g2$get_world_EMIffi_ty
    "AAC non-coop" = BKaliCap_5_noncoop$CBA__kali_cap_AAC$get_world_EMIffi_ty
    
    ,"BDE $\\gamma = 0$"    = BKaliCap_5_coop$CBA__kali_cap_BDE_g0$get_world_EMIffi_ty
    ,"BDE $\\gamma = 0.5$"  = BKaliCap_5_coop$CBA__kali_cap_BDE_g0x5$get_world_EMIffi_ty
    ,"BDE $\\gamma = 1.45$" = BKaliCap_5_coop$CBA__kali_cap_BDE_g1x45$get_world_EMIffi_ty
    ,"BDE $\\gamma = 2$"    = BKaliCap_5_coop$CBA__kali_cap_BDE_g2$get_world_EMIffi_ty
    ,"BDE non-coop" = BKaliCap_5_noncoop$CBA__kali_cap_BDE$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
   # ,"BAU no-dmg"  = BKaliCap_5_noncoop$BAU__kali_cap_BDE$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 Burke SR - Damages Discounted - different Inequality Aversion ($\\gamma$)"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat


#----- n EMI - Stacked -----------------------
no_legend = FALSE

my_exp = BKaliCap_2_noncoop$BAU__kali_cap_BDE$get_VARIABLE_nty("EIND",year_limit = 2300)




# stacked ...................


plottigat= ggplot() + 
  
  # Scenario
  geom_area(data= my_exp,
            aes(x=year, y=value, group=n, fill =n)) + 
  

  
  
  # graphic details
  scale_fill_manual(values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  
  theme( legend.position=if(no_legend){"none"} else {"right"} ,
         plot.title = element_text(size=22),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle(paste0("Emissions Stacked ")) + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat


# multilines  ...................



plottigat= ggplot() + 
  
  # Scenario
  geom_line(data= my_exp,
            aes(x=year, y=value, group=n, color =n),
            size = 1.1) + 

  
  # graphic details
  scale_color_manual(values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  
  theme( legend.position=if(no_legend){"none"} else {"right"} ,
         plot.title = element_text(size=22),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle(paste0("")) + 
  xlab("Year") +
  ylab("")  ; plottigat





### [C] Damfrac ----------------

EXPdata   = list(
  
  "Kali cap - High"                  = BKaliCap_2_noncoop$CBA__kali_cap_AAC$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Kali cap - Low"                  = BKaliCap_2_noncoop$CBA__kali_cap_BDE$get_VARIABLE_nty("damfrac_estim_ykali")
  
  ,"Strong cap $\\[2 ,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_PP$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Strong cap $\\[2 ,0.1\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_PQ$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Strong cap $\\[2 ,0.0001\\]$"   = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Strong cap $\\[5 ,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_RP$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Strong cap $\\[10,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_SP$get_VARIABLE_nty("damfrac_estim_ykali")
  
  ,"No cap "                               = BKaliCap_2_noncoop$CBA__no_cap$get_VARIABLE_nty("damfrac_estim_ykali")
)


plotlist    = list()
for(p in c(1:length(EXPdata))){
  
  
  message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
  
  plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                            ,mytitle     = TeX(names(EXPdata)[p])
                            ,myylab = "Damages [%GDPssp]") 
  
  plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
  
}


nRow = 2
nCol = 4

plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                            ,top =  text_grob("Damages [%GDPssp] overview", face = "bold", size = 16)
)


plottigat

# save
custom_save(plottigat)



#=============================================================================#
####          _______   NONCOOP g0  ♦  MAPS ________________                  ####
#=============================================================================#



## -----------------  MIU >>  Year << # CAP -----------

myyear = 2050


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_noncoop$CBA__kali_cap_AAC$get_MIU_nty   %>% filter(year==myyear)
    ,"Kali cap - low"      = BKaliCap_2_noncoop$CBA__kali_cap_BDE$get_MIU_nty   %>% filter(year==myyear)
    
    ,"Strong cap [2 , 0.2]"      = BKaliCap_2_noncoop$CBA__strong_cap_PP$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap [2 , 0.1]"      = BKaliCap_2_noncoop$CBA__strong_cap_PQ$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap [5 , 0.2]"      = BKaliCap_2_noncoop$CBA__strong_cap_RP$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap [2 , 0.0001]"   = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap [10, 0.2]"      = BKaliCap_2_noncoop$CBA__strong_cap_SP$get_MIU_nty   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_noncoop$CBA__no_cap$get_MIU_nty   %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," ")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = FALSE
  
) 
plottigat


# wanna save?
ggsave(filename = "./plots/mapMIU_2050_diffGamma.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)


## -----------------  YNET >> Year << # CAP -----------

myyear = 2200


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    
  )
  ,legend_symmetric = FALSE
  ,title  = paste0("GDP in ",myyear,", net of damages (no mitigation costs). ")
  ,legend = " \n[Trill USD]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdPu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,LaTeX_text = TRUE
  
) 
plottigat



## -----------------  Y >  Year < # CAP -----------

myyear = 2200


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    
  )
  ,legend_symmetric = FALSE
  ,title  = paste0("GDP in ",myyear,", net of damages and mitigation costs. ")
  ,legend = " \n[Trill USD]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdPu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,LaTeX_text = TRUE
  
) 
plottigat



## ------------------ COMBO MIU NONCOOP ---------------------


myyear = 2100

plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    
    "Kali cap - High"                  = BKaliCap_2_noncoop$CBA__kali_cap_AAC$get_MIU_nty   %>% filter(year==myyear)
    ,"Kali cap - Low"                  = BKaliCap_2_noncoop$CBA__kali_cap_BDE$get_MIU_nty   %>% filter(year==myyear)
    
    ,"Strong cap $\\[2 ,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_PP$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.1\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_PQ$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.0001\\]$"   = BKaliCap_2_noncoop$CBA__strong_cap_PR$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[5 ,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_RP$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[10,0.2\\]$"      = BKaliCap_2_noncoop$CBA__strong_cap_SP$get_MIU_nty   %>% filter(year==myyear)
    
    ,"No cap "                               = BKaliCap_2_noncoop$CBA__no_cap$get_MIU_nty   %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," different experiments ")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = TRUE
  ,columns = 4
  
) 

plottigat

# save
custom_save(plottigat)




#=============================================================================#
####          _______ COOP g0   ♦   GLOBAL   ______________                ####
#=============================================================================#




#----  W EMI  ..  SSP2  ..  # Cap    -------------------------


#......... (1) first wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_world_EMIffi_ty
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BKaliCap_2_noncoop$BAU__no_cap$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2  $\\gamma = 0$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat



# Wanna copy? 
custom_save(plottigat)



#......... (2) second wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali halfcap - $\\[up, 0.0001\\]$"            = BKaliCap_2_coop$CBA__kali_mixedcap_BDEup_g0$get_world_EMIffi_ty
    ,"Kali halfcap - $\\[2, low\\]$"         = BKaliCap_2_coop$CBA__kali_mixedcap_BDElow_g0$get_world_EMIffi_ty
    ,"Kali cap - Low"                     = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[5, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RR_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SR_g0$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"  = BAU_ssp2$get_world_EMIffi_ty
  )
  
  
  ,title  = "World FFI Emissions - SSP2, Cooperative  $\\gamma = 0$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 3
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





# Wanna copy? 
custom_save(plottigat)




#----  W TATM  ..  SSP2   ..  # Cap    -------------------------

#......... (1) first wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_TATM_ty
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_TATM_ty
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_TATM_ty
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_TATM_ty
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_TATM_ty
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_TATM_ty
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_TATM_ty
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_TATM_ty
    
  ,"BAU no-dmg"  = BKaliCap_2_noncoop$BAU__no_cap$get_TATM_ty
  )
  ,title  = "Atmospheric temperature increase"
  ,yLabel = "ºC "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat

#......... (2) second wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali halfcap - $\\[up, 0.0001\\]$"    = BKaliCap_2_coop$CBA__kali_mixedcap_BDEup_g0$get_TATM_ty
    ,"Kali halfcap - $\\[2, low\\]$"      = BKaliCap_2_coop$CBA__kali_mixedcap_BDElow_g0$get_TATM_ty
    ,"Kali cap - Low"                             = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_TATM_ty
    
    ,"Strong cap $\\[2, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_TATM_ty
    ,"Strong cap $\\[5, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RR_g0$get_TATM_ty
    ,"Strong cap $\\[10,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SR_g0$get_TATM_ty
    
    ,"BAU"  = BAU_ssp2$get_TATM_ty
  )
  
  
  ,title  = "Atmospheric temperature increase"
  ,yLabel = "ºC "
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 3
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat


# Wanna copy? 
custom_save(plottigat)













#----  W EMI  ..  SSP5  ..  # Cap    -------------------------



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - High"       = BKaliCap_5_coop$CBA__kali_cap_AAC_g0$get_world_EMIffi_ty
    ,"Kali cap - Low"      = BKaliCap_5_coop$CBA__kali_cap_BDE_g0$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"      = BKaliCap_5_coop$CBA__strong_cap_PP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"      = BKaliCap_5_coop$CBA__strong_cap_PQ_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"   = BKaliCap_5_coop$CBA__strong_cap_PR_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"      = BKaliCap_5_coop$CBA__strong_cap_RP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"      = BKaliCap_5_coop$CBA__strong_cap_SP_g0$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_5_coop$CBA__no_cap_g0$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU no-dmg"  = BAU_ssp5$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP5  $\\gamma = 0$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





# Wanna copy? 
custom_save(plottigat)





#=============================================================================#
####          _______ COOP g0   ♦ ALL  REGIONS   __________                ####
#=============================================================================#




# ---- MIU .. All Regions .. # Cap ----------

myexp =  BKaliCap_2_coop$CBA__no_cap_g0


plottigat= ggplot() + 
  
  
  geom_line(data= myexp$get_MIU_nty,
            aes(x=year, y=value, group=n, color =n),
            size = 1.1) + 
  
  
  # graphic details
  scale_color_manual(values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  
  theme( legend.position=if(no_legend){"none"} else {"right"} ,
         plot.title = element_text(size=22),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle(paste0("Mitigation over time for all the regions")) + 
  xlab("Year") +
  ylab("Mitigation [%BAU]")  ; plottigat


# ---- EIND .. All Regions .. # Cap ----------

myexp =  BKaliCap_2_coop$CBA__no_cap_g0


plottigat= ggplot() + 
  
  
  geom_line(data= myexp$get_EIND_nty,
            aes(x=year, y=value, group=n, color =n),
            size = 1.1) + 
  
  
  # graphic details
  scale_color_manual(values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  
  theme( legend.position=if(no_legend){"none"} else {"right"} ,
         plot.title = element_text(size=22),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle(paste0("Industrial emissions over time for all the regions")) + 
  xlab("Year") +
  ylab("Emissions [GtCO2]")  ; plottigat




# ---- YNET .. All Regions .. # Cap ----------

# select scenario
myexp =  BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET", year_limit = 2300)


plottigat= ggplot(data= myexp,
                  aes(x=year, y=value, group=n, label = n, color =n)) + 
  
  
  geom_line(size = 1.1) + 
  
  geom_label(
            stat = 'identity', position = 'identity'
            , hjust = -.1) +
  
  
  
  # graphic details
  scale_color_manual(values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  
  theme( legend.position=if(no_legend){"none"} else {"right"} ,
         plot.title = element_text(size=22),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle(paste0("GDP net of damages for all the regions")) + 
  xlab("Year") +
  ylab("Trill USD") + ylim(0,100)  ; plottigat




# ---- DAMFRAC .. All Regions .. # Cap ----------

myexp =  BKaliCap_2_coop$CBA__strong_cap_PR_g0


plottigat= ggplot() + 
  
  
  geom_line(data= myexp$get_VARIABLE_nty("DAMFRAC", year_limit = 2300),
            aes(x=year, y=value, group=n, color =n),
            size = 1.1) + 
  
  
  # graphic details
  scale_color_manual(values= colorize_regions("ed57") ) + 
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  
  theme( legend.position=if(no_legend){"none"} else {"right"} ,
         plot.title = element_text(size=22),
         axis.title.x = element_text(size = 16),
         axis.text.x = element_text(size = 14),
         axis.title.y = element_text(size = 16)) +  
  
  ggtitle(paste0("GDP net of damages for all the regions")) + 
  xlab("Year") +
  ylab("Trill USD")  ; plottigat


# ------ (C) YNET .. All Regions .. # CAP # Variables  --------



p1 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET", year_limit = 2300) 
  ,mytitle =  paste0("Kali Cap - High")
  ,myylab  = "Trill USD"
) 


p2 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET", year_limit = 2300) 
  ,mytitle =  paste0("Kali Cap - Low")
  ,myylab  = "Trill USD"
) 


p3 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET", year_limit = 2300) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.2 ]")
  ,myylab  = "Trill USD"
  
) 

p4 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET", year_limit = 2300) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.1 ]")
  ,myylab  = "Trill USD"
  
)


p5 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET", year_limit = 2300) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.0001 ]")
  ,myylab  = "Trill USD"
) 


p6 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
  ,mytitle =  paste0("Strong Cap [ 5,  0.2 ]")
  ,myylab  = "Trill USD"
) 


p7 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
  ,mytitle =  paste0("Strong Cap [ 10,  0.2 ]")
  ,myylab  = "Trill USD"
) 



p8 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
  ,mytitle =  paste0("No Cap")
  ,myylab  = "Trill USD"
) 



#..... gather ......

mylist = list(p1,p2,p3,p4,p5,p6,p7,p8)
nCol = 2
nRow = 4
myTitle = TeX("GDP net of damages for all the regions, $\\gamma =0$")

#..... combine .....

plottigat <- annotate_figure(do.call("ggarrange", c(mylist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 14)); 
plottigat

# Wanna copy? 
custom_save(plottigat )



#......... (2) second wave .....



plottigat = RICEx.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Kali halfcap - $\\[up, 0.0001\\]$"    = BKaliCap_2_coop$CBA__kali_mixedcap_BDEup_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
    ,"Kali halfcap - $\\[2, low\\]$"      = BKaliCap_2_coop$CBA__kali_mixedcap_BDElow_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
    ,"Kali cap - Low"                             = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
    
    ,"Strong cap $\\[2, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
    ,"Strong cap $\\[5, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RR_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
    ,"Strong cap $\\[10,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SR_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
    
  )
  
  
  , title = "GDP net of damages for all the regions, $\\gamma =0$"
  , y_label = "Trill USD"
  , legend_columns = 2
  , columns = 3
  , LaTeX_text = TRUE
  
); plottigat






# Wanna copy? 
custom_save(plottigat)

















# ------ *COMBO* YNET .. subset regions .. # CAP # Variables  --------

ncheck = c("can","rus","fin","nor","swe","blt","rfa")
no_legend = FALSE

p1 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Kali Cap - High")
  ,myylab  = "Trill USD"
) 


p2 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Kali Cap - Low")
  ,myylab  = "Trill USD"
) 


p3 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.2 ]")
  ,myylab  = "Trill USD"
             
  ) 

p4 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.1 ]")
  ,myylab  = "Trill USD"
  
)


p5 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.0001 ]")
  ,myylab  = "Trill USD"
  ) 


p6 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 5,  0.2 ]")
  ,myylab  = "Trill USD"
) 


p7 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 10,  0.2 ]")
  ,myylab  = "Trill USD"
) 



p8 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET", year_limit = 2300)
  ,mytitle =  paste0("No Cap")
  ,myylab  = "Trill USD"
) 



#..... gather ......

mylist = list(p1,p2,p3,p4,p5,p6,p7,p8)
nCol = 3
nRow = 3
myTitle = TeX("GDP net of damages for selected regions, $\\gamma =0$")

#..... combine .....

plottigat <- annotate_figure(do.call("ggarrange", c(mylist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 14)); 
plottigat

# Wanna copy? 
custom_save(plottigat )




# ------ *COMBO* DAMFRAC .. All Regions .. # CAP # Variables  --------





p1 = nty_plotter(myexp   =  BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300) %>% mutate(value =value *(-1))
                 ,mytitle =  paste0("Strong Cap | 2 | 0.0001 |")
                 ,myylab  = "Trill USD"
) + ylim(-1,2)


p2 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300) %>% mutate(value =value *(-1))
  ,mytitle =  paste0("Strong Cap | 2 | 0.1 |")
  ,myylab  = "Trill USD"
  
)+ ylim(-1,2)



p3 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300) %>% mutate(value =value *(-1))
  ,mytitle =  paste0("Strong Cap | 2 | 0.2 |")
  ,myylab  = "Trill USD"
  
) + ylim(-1,2)


p4 = nty_plotter(myexp   =  BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300) %>% mutate(value =value *(-1))
                 ,mytitle =  paste0("Strong Cap | 10 | 0.2 |")
                 ,myylab  = "Trill USD"
) + ylim(-1,2)


#..... gather ......

mylist = list(p1,p2,p3,p4)
nCol = 2
nRow = 2
myTitle = TeX("GDP net of damages for all the regions, $\\gamma =0$")

#..... combine .....

plottigat <- annotate_figure(do.call("ggarrange", c(mylist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat



# ------ (C) DAMFRACykali .. subset regions .. # CAP # Variables  --------

ncheck = c("can","rus","fin","nor","swe","blt","rfa")


p1 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Kali Cap - High")
  ,myylab  = "[%Ykali]"
) 


p2 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Kali Cap - Low")
  ,myylab  = "[%Ykali]"
) 


p3 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.2 ]")
  ,myylab  = "[%Ykali]"
  
) 

p4 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.1 ]")
  ,myylab  = "[%Ykali]"
  
)


p5 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 2, 0.0001 ]")
  ,myylab  = "[%Ykali]"
) 


p6 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 5,  0.2 ]")
  ,myylab  = "[%Ykali]"
) 


p7 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300) %>% filter(n %in% ncheck ) 
  ,mytitle =  paste0("Strong Cap [ 10,  0.2 ]")
  ,myylab  = "[%Ykali]"
) 



p8 = nty_plotter(
  myexp   =  BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300)
  ,mytitle =  paste0("No Cap")
  ,myylab  = "[%Ykali]"
) 



#..... gather ......

mylist = list(p1,p2,p3,p4,p5,p6,p7,p8)
nCol = 2
nRow = 4
myTitle = TeX("DAMFRAC (over ykali) for selected regions, $\\gamma =0$")

#..... combine .....

plottigat <- annotate_figure(do.call("ggarrange", c(mylist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 14)); 
plottigat



#......... (2) second wave .....



plottigat = RICEx.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Kali halfcap - $\\[up, 0.0001\\]$"    = BKaliCap_2_coop$CBA__kali_mixedcap_BDEup_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300)
    ,"Kali halfcap - $\\[2, low\\]$"      = BKaliCap_2_coop$CBA__kali_mixedcap_BDElow_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300)
    ,"Kali cap - Low"                             = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300)
    
    ,"Strong cap $\\[2, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300)
    ,"Strong cap $\\[5, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RR_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300)
    ,"Strong cap $\\[10,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SR_g0$get_VARIABLE_nty("damfrac_estim_ykali", year_limit = 2300)
    
  )
  
  
  , title = "DAMFRAC (over ykali) for selected regions, $\\gamma =0$"
  , y_label = "[%Ykali]"
  , legend_columns = 2
  , columns = 3
  , LaTeX_text = TRUE
  
); plottigat






# Wanna copy? 
custom_save(plottigat)









#=============================================================================#
####          _______ COOP ♦ g0  ♦ ONE  REGION   _________                 ####
#=============================================================================#



# ---- MIU .. one region .. # Cap ----------

myreg = "rus"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_MIU_nty    %>% filter(n==myreg)
    
  )
  ,title  = paste0("Mitigation for region < ", myreg, " > under COOP $ \\gamma = 0 $")
  ,yLabel = "Mitigation [%BAU]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,120) ; plottigat


custom_save(plottigat )

# ------ *COMBO* MIU .. one region .. # CAP  --------



#.... AFRICA
myreg = "rsaf"

p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_MIU_nty    %>% filter(n==myreg)
    
  )
  ,title  = paste0("Mitigation for region < ", myreg, " > under COOP $ \\gamma = 0 $")
  ,yLabel = "Mitigation [%BAU]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,120) ; p1


#.... USA
myreg = "usa"

p2 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_MIU_nty    %>% filter(n==myreg)
    
  )
  ,title  = paste0("Mitigation for region < ", myreg, " > under COOP $ \\gamma = 0 $")
  ,yLabel = "Mitigation [%BAU]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,120) ; p2


#.... CHINA
myreg = "chn"

p3 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_MIU_nty    %>% filter(n==myreg)
    
  )
  ,title  = paste0("Mitigation for region < ", myreg, " > under COOP $ \\gamma = 0 $")
  ,yLabel = "Mitigation [%BAU]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,120) ; p3

#.... INDIA
myreg = "nde"

p4 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_MIU_nty    %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_MIU_nty    %>% filter(n==myreg)
    
  )
  ,title  = paste0("Mitigation for region < ", myreg, " > under COOP $ \\gamma = 0 $")
  ,yLabel = "Mitigation [%BAU]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,120) ; p4

#..... gather ......

mylist = list(p1,p2,p3,p4)
nCol = 2
nRow = 2
myTitle = TeX("Mitigation for some specific regions -  $\\gamma =0$")

#..... combine .....

plottigat <- annotate_figure(do.call("ggarrange", c(mylist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat

#..... copy ........

custom_save(plottigat)




# ---- YNET ..  one region  .. # Cap ----------


myreg = "nde"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"    = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP NET for region < ", myreg, " > under COOP $ \\gamma = 0 $")
  ,yLabel = "Trill USD "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
)  ; plottigat



# ------ *COMBO* YNET .. one region .. # CAP  --------



#.... AFRICA
myreg = "rsaf"

p1 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")    %>% filter(n==myreg)
    ,"Kali cap - Low"       = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP net of damages for region < ", myreg, " > ")
  ,yLabel = "Trill USD"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,100) ; p1


#.... USA
myreg = "usa"

p2 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP net of damages for region < ", myreg, " > ")
  ,yLabel = "Trill USD"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,100) ; p2



#.... CHINA
myreg = "chn"

p3 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP net of damages for region < ", myreg, " >")
  ,yLabel = "Trill USD"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
)  + ylim(0,100) ; p3

#.... INDIA
myreg = "nde"

p4 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP net of damages for region < ", myreg, " >")
  ,yLabel = "Trill USD"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,100) ; p4


#.... RUSSIA
myreg = "rus"

p5 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP net of damages for region < ", myreg, " > ")
  ,yLabel = "Trill USD"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
)  + ylim(0,100) ; p5


#.... BRAZIL
myreg = "bra"

p6 <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"Strong cap $\\[2 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.1\\]$"     = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[2 ,0.0001\\]$"  = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[5 ,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    ,"Strong cap $\\[10,0.2\\]$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(n==myreg)
    
  )
  ,title  = paste0("GDP net of damages for region < ", myreg, " >")
  ,yLabel = "Trill USD"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,100) ; p6

#..... gather ......

mylist = list(p1,p2,p3,p4,p5,p6)
nCol = 2
nRow = 3
myTitle = TeX("GDP net of damages fo some specific regions -  $\\gamma =0$ - uniform scale")

#..... combine .....

plottigat <- annotate_figure(do.call("ggarrange", c(mylist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                             ,top =  text_grob(myTitle, face = "bold", size = 18)); 
plottigat

#..... copy ........

custom_save(plottigat)



# ---- DAMFRAC .. specific region .. # Cap ----------

myreg = "rsaf"


{
  plottigat <- RICEx.plot.lineplot(
    
    
    EXPdata   = list(
      
      
      "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      
      ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      
      ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("DAMFRAC", year_limit = 2300)    %>% filter(n==myreg) %>% mutate(value = value *(-1))
      
    )
    ,title  = paste0("DAMFRAC for region < ", myreg, " > under COOP $ \\gamma = 0 $")
    ,yLabel = "[%YGROSS] "
    ,legend = "Scenarios"
    ,categories = 1
    ,colors_per_category = 12
    ,LaTeX_text = TRUE
    
  ) #+ ylim(0,1000)
  
}; plottigat





# ---- YGROSS ..  specific region .. # Cap ----------

myreg = "usa"


{
  plottigat <- RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      
    )
    ,title  = paste0("GDP GROSS for region < ", myreg, " > under COOP $ \\gamma = 0 $")
    ,yLabel = "Trill USD "
    ,legend = "Scenarios"
    ,categories = 1
    ,colors_per_category = 12
    ,LaTeX_text = TRUE
    
  ) #+ ylim(0,1000)
  
}; plottigat




# ---- C .. specific region .. # Cap ----------

myreg = "usa"


{
  plottigat <- RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      
    )
    ,title  = paste0("Consumption for region < ", myreg, " > under COOP $ \\gamma = 0 $")
    ,yLabel = "Trill USD "
    ,legend = "Scenarios"
    ,categories = 1
    ,colors_per_category = 12
    ,LaTeX_text = TRUE
    
  ) #+ ylim(0,1000)
  
}; plottigat

#=============================================================================#
####          _______   COOP ♦ g0  ♦  MAPS ______________                  ####
#=============================================================================#



## -----------------  MIU .. year .. # CAP -----------

myyear = 2080


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_MIU_nty   %>% filter(year==myyear)
    
    ,"Strong cap $\\[2 ,0.2\\]$"         = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.1\\]$"         = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[5 ,0.2\\]$"         = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[10,0.2\\]$"         = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_MIU_nty   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_MIU_nty   %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," ")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = TRUE
  
) 
plottigat

# wanna save?


## -----------------  EIND  .. year .. # CAP -----------

myyear = 2080


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_EIND_nty  %>% filter(year==myyear)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_EIND_nty  %>% filter(year==myyear)
    
    ,"Strong cap $\\[2 ,0.2\\]$"         = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_EIND_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.1\\]$"         = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_EIND_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_EIND_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[5 ,0.2\\]$"         = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_EIND_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[10,0.2\\]$"         = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_EIND_nty   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_EIND_nty   %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Emissions in ",myyear," ")
  ,legend = "[GtCO2]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = FALSE
  ,LaTeX_text = TRUE
  
) 
plottigat



## -----------------  YNET .. Year .. # CAP -----------

myyear = 2200


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("YNET")   %>% filter(year==myyear)
    
  )
  ,legend_symmetric = FALSE
  ,title  = paste0("GDP in ",myyear,", net of damages (no mitigation costs). ")
  ,legend = " \n[Trill USD]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdPu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,LaTeX_text = TRUE
  
) 
plottigat



## -----------------  Y ..  Year .. # CAP -----------

myyear = 2200


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("Y")   %>% filter(year==myyear)
    
  )
  ,legend_symmetric = FALSE
  ,title  = paste0("GDP in ",myyear,", net of damages and mitigation costs. ")
  ,legend = " \n[Trill USD]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdPu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,LaTeX_text = TRUE
  
) 
plottigat





## -----------------  C ..  year .. # CAP -----------

myyear = 2200


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    
    ,"Strong cap $\\[2 ,0.2\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.1\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.0001\\]$"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    ,"Strong cap $\\[5 ,0.2\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    ,"Strong cap $\\[10,0.2\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("C")   %>% filter(year==myyear)
    
  )
  ,legend_symmetric = FALSE
  ,title  = paste0("Consumption in ",myyear," ")
  ,legend = " \n[Trill USD]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdPu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,LaTeX_text = TRUE
  
) 
plottigat


#=============================================================================#
####          _________  GLOBAL COOP g0.5  __________                ####
#=============================================================================#




#----  W EMI  .. SSP2 ..  # Cap    -------------------------



#......... (1) first wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_world_EMIffi_ty
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"    = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0x5$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU        "  = BAU_ssp2$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2  $\\gamma = 0.5$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat


# Wanna copy? 
custom_save(plottigat)



#......... (2) second wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali halfcap - $\\[up, 0.0001\\]$"  = BKaliCap_2_coop$CBA__kali_mixedcap_BDEup_g0x5$get_world_EMIffi_ty
    ,"Kali halfcap - $\\[2, low\\]$"    = BKaliCap_2_coop$CBA__kali_mixedcap_BDElow_g0x5$get_world_EMIffi_ty
    ,"Kali cap - Low"                           = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[5, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RR_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SR_g0x5$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"  = BAU_ssp2$get_world_EMIffi_ty
  )
  
  
  ,title  = "World FFI Emissions - SSP2, Cooperative  $\\gamma = 0.5$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 3
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





# Wanna copy? 
custom_save(plottigat)



#----  W TATM  - SSP2 NOCOOP -  # Cap    -------------------------



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_TATM_ty
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_TATM_ty
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_TATM_ty
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_TATM_ty
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_TATM_ty
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_TATM_ty
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_TATM_ty
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0x5$get_TATM_ty
    
    ,"BAU no-dmg"  = BKaliCap_2_noncoop$BAU__no_cap$get_TATM_ty
  )
  ,title  = "Atmospheic temperature increase"
  ,yLabel = "ºC "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat








#----  W EMI  .. SSP5 ..  # Cap    -------------------------



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - High"       = BKaliCap_5_coop$CBA__kali_cap_AAC_g0x5$get_world_EMIffi_ty
    ,"Kali cap - Low"       = BKaliCap_5_coop$CBA__kali_cap_BDE_g0x5$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"       = BKaliCap_5_coop$CBA__strong_cap_PP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"       = BKaliCap_5_coop$CBA__strong_cap_PQ_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"    = BKaliCap_5_coop$CBA__strong_cap_PR_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"       = BKaliCap_5_coop$CBA__strong_cap_RP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"       = BKaliCap_5_coop$CBA__strong_cap_SP_g0x5$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_5_coop$CBA__no_cap_g0x5$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU        "  = BAU_ssp5$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP5  $\\gamma = 0.5$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





# Wanna copy? 
custom_save(plottigat)






#=============================================================================#
####          _________  REGIONS COOP g0.5  __________                ####
#=============================================================================#






# ---- MIU > specific region < # Cap ----------

myreg = "rus"


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_MIU_nty    %>% filter(n==myreg)
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_MIU_nty    %>% filter(n==myreg)
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_MIU_nty    %>% filter(n==myreg)
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_MIU_nty    %>% filter(n==myreg)
   
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0x5$get_MIU_nty    %>% filter(n==myreg)
    
  )
  ,title  = paste0("Mitigation for region < ", myreg, " > under COOP $ \\gamma = 0.5 $")
  ,yLabel = "Mitigation [%BAU]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 12
  ,LaTeX_text = TRUE
  
) + ylim(0,120) ; plottigat




# ---- YNET >  specific region  < # Cap ----------


myreg = "fin"


{
  plottigat <- RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0x5get_VARIABLE_nty("YNET", year_limit = 2300)    %>% filter(n==myreg)
      
    )
    ,title  = paste0("GDP NET for region < ", myreg, " > under COOP $ \\gamma = 0 $")
    ,yLabel = "Trill USD "
    ,legend = "Scenarios"
    ,categories = 1
    ,colors_per_category = 12
    ,LaTeX_text = TRUE
    
  ) + ylim(0,100)
  
}; plottigat




# ---- YGROSS >  specific region < # Cap ----------

myreg = "usa"


{
  plottigat <- RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0x5get_VARIABLE_nty("YGROSS", year_limit = 2300)    %>% filter(n==myreg)
      
    )
    ,title  = paste0("GDP GROSS for region < ", myreg, " > under COOP $ \\gamma = 0 $")
    ,yLabel = "Trill USD "
    ,legend = "Scenarios"
    ,categories = 1
    ,colors_per_category = 12
    ,LaTeX_text = TRUE
    
  ) #+ ylim(0,1000)
  
}; plottigat




# ---- C > specific region < # Cap ----------

myreg = "usa"


{
  plottigat <- RICEx.plot.lineplot(
    
    EXPdata   = list(
      
      
      "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      
      ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g0x5get_VARIABLE_nty("C", year_limit = 2300)    %>% filter(n==myreg)
      
    )
    ,title  = paste0("Consumption for region < ", myreg, " > under COOP $ \\gamma = 0 $")
    ,yLabel = "Trill USD "
    ,legend = "Scenarios"
    ,categories = 1
    ,colors_per_category = 12
    ,LaTeX_text = TRUE
    
  ) #+ ylim(0,1000)
  
}; plottigat


#=============================================================================#
####          _________  GLOBAL COOP g1.45  __________                ####
#=============================================================================#




#----  W EMI  .. SSP2 .. # Cap    -------------------------




#......... (1) first wave .....
 
plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - High"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_world_EMIffi_ty
    ,"Kali cap - Low"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"    = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g1x45$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g1x45$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU        "  = BAU_ssp2$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2  $\\gamma = 1.45$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat



#......... (2) second wave .....

plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali halfcap - $\\[up, 0.0001\\]$"  = BKaliCap_2_coop$CBA__kali_mixedcap_BDEup_g1x45$get_world_EMIffi_ty
    ,"Kali halfcap - $\\[2, low\\]$"    = BKaliCap_2_coop$CBA__kali_mixedcap_BDElow_g1x45$get_world_EMIffi_ty
    ,"Kali cap - Low"                           = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[5, 0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_RR_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.0001\\]$"      = BKaliCap_2_coop$CBA__strong_cap_SR_g1x45$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"  = BAU_ssp2$get_world_EMIffi_ty
  )
  
  
  ,title  = "World FFI Emissions - SSP2, Cooperative  $\\gamma = 1.45$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 3
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat





# Wanna copy? 
custom_save(plottigat)





#----  W TATM  .. SSP2 ..  # Cap    -------------------------



plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - AAC"       = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_TATM_ty
    ,"Kali cap - BDE"      = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_TATM_ty
    
    ,"Strong cap PP"      = BKaliCap_2_coop$CBA__strong_cap_PP_g1x45$get_TATM_ty
    ,"Strong cap PQ"      = BKaliCap_2_coop$CBA__strong_cap_PQ_g1x45$get_TATM_ty
    ,"Strong cap PR"      = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_TATM_ty
    ,"Strong cap RP"      = BKaliCap_2_coop$CBA__strong_cap_RP_g1x45$get_TATM_ty
    ,"Strong cap SP"      = BKaliCap_2_coop$CBA__strong_cap_SP_g1x45$get_TATM_ty
    
    ,"No cap "                   = BKaliCap_2_coop$CBA__no_cap_g1x45$get_TATM_ty
    
    ,"BAU no-dmg"  = BKaliCap_2_noncoop$BAU__no_cap$get_TATM_ty
  )
  ,title  = "Atmospheic temperature increase"
  ,yLabel = "ºC "
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat










#----  W EMI  .. SSP5 .. # Cap    -------------------------




plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Kali cap - High"       = BKaliCap_5_coop$CBA__kali_cap_AAC_g1x45$get_world_EMIffi_ty
    ,"Kali cap - Low"       = BKaliCap_5_coop$CBA__kali_cap_BDE_g1x45$get_world_EMIffi_ty
    
    ,"Strong cap $\\[2 ,0.2\\]$"       = BKaliCap_5_coop$CBA__strong_cap_PP_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\]$"       = BKaliCap_5_coop$CBA__strong_cap_PQ_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\]$"    = BKaliCap_5_coop$CBA__strong_cap_PR_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\]$"       = BKaliCap_5_coop$CBA__strong_cap_RP_g1x45$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\]$"       = BKaliCap_5_coop$CBA__strong_cap_SP_g1x45$get_world_EMIffi_ty
    
    ,"No cap "                   = BKaliCap_5_coop$CBA__no_cap_g1x45$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU        "  = BAU_ssp5$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP5  $\\gamma = 1.45$"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 7
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat











#=============================================================================#
####          _______   COMPARISON ♦ MAPS _____________                    ####
#=============================================================================#

## ----------------- *COMBO* MIU .. COOP year .. # CAP # Gamma -----------



myyear = 2100


# ...... First series .........

plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    # g0
    "Kali cap - High, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Kali cap - Low, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"No cap, $\\gamma = 0$ "                       = BKaliCap_2_coop$CBA__no_cap_g0$get_MIU_nty   %>% filter(year==myyear)
    
    # g0.5
    ,"Kali cap - High, $\\gamma = 0.5$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"Kali cap - Low, $\\gamma = 0.5$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0.5 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"No cap, $\\gamma = 0.5$ "                              = BKaliCap_2_coop$CBA__no_cap_g0x5$get_MIU_nty   %>% filter(year==myyear)
    
    # g1.45
    ,"Kali cap - High, $\\gamma = 1.45$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_MIU_nty   %>% filter(year==myyear)
    ,"Kali cap - Low, $\\gamma = 1.45$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 1.45 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_MIU_nty   %>% filter(year==myyear)
    ,"No cap, $\\gamma = 1.45$ "                              = BKaliCap_2_coop$CBA__no_cap_g1x45$get_MIU_nty   %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," different experiments (1/2)")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = TRUE
  ,columns = 4
  
) 

plottigat

# save
custom_save(plottigat)


# ...... second series .........

plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    # g0
     "Strong cap $\\[2 ,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_MIU_nty   %>% filter(year==myyear)
    
    # g0.5
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_MIU_nty   %>% filter(year==myyear)
    # g 1.45
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g1x45$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g1x45$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g1x45$get_MIU_nty   %>% filter(year==myyear)
    ,"Strong cap $\\[10,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g1x45$get_MIU_nty   %>% filter(year==myyear)
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," different experiments (2/2)")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = TRUE
  ,columns = 4  
) 

plottigat


# save
custom_save(plottigat)


## -----------------  DMGykali .. COOP year .. # CAP # Gamma -----------



myyear = 2100


# ...... First series .........

  EXPdata   = list(
    
    # g0
    "Kali cap - High, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_VARIABLE_nty("damfrac_estim_ykali")   
    ,"Kali cap - Low, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_VARIABLE_nty("damfrac_estim_ykali")   
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_VARIABLE_nty("damfrac_estim_ykali")  
    ,"No cap, $\\gamma = 0$ "                       = BKaliCap_2_coop$CBA__no_cap_g0$get_VARIABLE_nty("damfrac_estim_ykali")         
    
    # g0.5
    ,"Kali cap - High, $\\gamma = 0.5$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")  
    ,"Kali cap - Low, $\\gamma = 0.5$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")  
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0.5 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")  
    ,"No cap, $\\gamma = 0.5$ "                              = BKaliCap_2_coop$CBA__no_cap_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")  
    
    # g1.45
    ,"Kali cap - High, $\\gamma = 1.45$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_VARIABLE_nty("damfrac_estim_ykali")  
    ,"Kali cap - Low, $\\gamma = 1.45$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_VARIABLE_nty("damfrac_estim_ykali")  
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 1.45 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_VARIABLE_nty("damfrac_estim_ykali")  
    ,"No cap, $\\gamma = 1.45$ "                              = BKaliCap_2_coop$CBA__no_cap_g1x45$get_VARIABLE_nty("damfrac_estim_ykali")  
    
  )

  
  plotlist    = list()
  for(p in c(1:length(EXPdata))){
    
    
    message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
    
    plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                                ,mytitle     = TeX(names(EXPdata)[p])
                                  ,myylab = "Damages [%GDPssp]") + ylim(-100, 100)
    
    plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
 
  }
  

  nRow = 3
  nCol = 4

  plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                  ,top =  text_grob("Damages [%GDPssp] overview (1/2)", face = "bold", size = 16)
  )
  

plottigat

# save
custom_save(plottigat)


# ...... second series .........


  EXPdata   = list(
    
    # g0
    "Strong cap $\\[2 ,0.2\\], \\gamma = 0$"        = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_VARIABLE_nty("damfrac_estim_ykali") 
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_VARIABLE_nty("damfrac_estim_ykali")
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_VARIABLE_nty("damfrac_estim_ykali")
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_VARIABLE_nty("damfrac_estim_ykali")
    
    # g0.5
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")   
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")   
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")   
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_VARIABLE_nty("damfrac_estim_ykali")   
    # g 1.45
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g1x45$get_VARIABLE_nty("damfrac_estim_ykali") 
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g1x45$get_VARIABLE_nty("damfrac_estim_ykali") 
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g1x45$get_VARIABLE_nty("damfrac_estim_ykali") 
    ,"Strong cap $\\[10,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g1x45$get_VARIABLE_nty("damfrac_estim_ykali") 
    
  )
  
  
  
  plotlist    = list()
  for(p in c(1:length(EXPdata))){
    
    
    message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
    
    plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                              ,mytitle     = TeX(names(EXPdata)[p])
                              ,myylab = "Damages [%GDPssp]")
    
    plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none") ))
    
  }
  
  
  nRow = 3
  nCol = 4
  
  plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                              ,top =  text_grob("Damages [%GDPssp] overview (2/2)", face = "bold", size = 16)
  )
  
  
  plottigat
  
  # save
  custom_save(plottigat)


#=============================================================================#
####          _______   COMPARISON ♦ WORLD _____________                    ####
#=============================================================================#

## -----------------  W EMI .. ssp2  .. # CAP # Gamma -----------




# ...... First series .........

plottigat = RICEx.plot.lineplot(
  EXPdata   = list(
    
    # 
    "Kali cap - High, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_world_EMIffi_ty
    ,"Kali cap - High, $\\gamma = 0.5$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_world_EMIffi_ty   
    ,"Kali cap - High, $\\gamma = 1.45$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_world_EMIffi_ty
    
    #
    ,"Kali cap - Low, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_world_EMIffi_ty
    ,"Kali cap - Low, $\\gamma = 0.5$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_world_EMIffi_ty   
    ,"Kali cap - Low, $\\gamma = 1.45$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_world_EMIffi_ty    
    
    #
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0.5 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_world_EMIffi_ty    
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 1.45 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_world_EMIffi_ty    
    
    #
    ,"No cap, $\\gamma = 0$ "                       = BKaliCap_2_coop$CBA__no_cap_g0$get_world_EMIffi_ty
    ,"No cap, $\\gamma = 0.5$ "                              = BKaliCap_2_coop$CBA__no_cap_g0x5$get_world_EMIffi_ty
    ,"No cap, $\\gamma = 1.45$ "                              = BKaliCap_2_coop$CBA__no_cap_g1x45$get_world_EMIffi_ty
    
    #
    ,"BAU" = BAU_ssp2$get_world_EMIffi_ty
    
  )
  
  ,title  = paste0("World FFI Emissions, different experiments (1/2)")
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
 , yLabel = "Emissions [GtCO2]"
 ,categories = 4
 ,colors_per_category = 3
 ,legend_columns = 1
  
) ;plottigat

# save
custom_save(plottigat)




# ...... Second series .........

plottigat = RICEx.plot.lineplot(
  EXPdata   = list(
    
     # 
     "Strong cap $\\[2 ,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_world_EMIffi_ty
     ,"Strong cap $\\[2 ,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_world_EMIffi_ty     
     ,"Strong cap $\\[2 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g1x45$get_world_EMIffi_ty
     
    #
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_world_EMIffi_ty    
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g1x45$get_world_EMIffi_ty
    
    #
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0$"             = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0.5$"         = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g1x45$get_world_EMIffi_ty    
    
    #
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g1x45$get_world_EMIffi_ty
    #
    ,"BAU" = BAU_ssp2$get_world_EMIffi_ty
  )
  
  ,title  = paste0("World FFI Emissions, different experiments (2/2)")
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  , yLabel = "Emissions [GtCO2]"
  ,categories = 4
  ,colors_per_category = 3
  ,legend_columns = 1
  
) ;plottigat

# save
custom_save(plottigat)



## -----------------  W EMI .. ssp2  .. # CAP # Gamma -----------




# ...... First series .........

plottigat = RICEx.plot.lineplot(
  EXPdata   = list(
    
    # 
    "Kali cap - High, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_world_EMIffi_ty
    ,"Kali cap - High, $\\gamma = 0.5$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_world_EMIffi_ty   
    ,"Kali cap - High, $\\gamma = 1.45$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_world_EMIffi_ty
    
    #
    ,"Kali cap - Low, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_world_EMIffi_ty
    ,"Kali cap - Low, $\\gamma = 0.5$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_world_EMIffi_ty   
    ,"Kali cap - Low, $\\gamma = 1.45$"                 = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_world_EMIffi_ty    
    
    #
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0.5 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_world_EMIffi_ty    
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 1.45 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_world_EMIffi_ty    
    
    #
    ,"No cap, $\\gamma = 0$ "                       = BKaliCap_2_coop$CBA__no_cap_g0$get_world_EMIffi_ty
    ,"No cap, $\\gamma = 0.5$ "                              = BKaliCap_2_coop$CBA__no_cap_g0x5$get_world_EMIffi_ty
    ,"No cap, $\\gamma = 1.45$ "                              = BKaliCap_2_coop$CBA__no_cap_g1x45$get_world_EMIffi_ty
    
    #
    ,"BAU" = BAU_ssp2$get_world_EMIffi_ty
    
  )
  
  ,title  = paste0("World FFI Emissions, different experiments (1/2)")
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  , yLabel = "Emissions [GtCO2]"
  ,categories = 4
  ,colors_per_category = 3
  ,legend_columns = 1
  
) ;plottigat

# save
custom_save(plottigat)




# ...... Second series .........

plottigat = RICEx.plot.lineplot(
  EXPdata   = list(
    
    # 
    "Strong cap $\\[2 ,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_world_EMIffi_ty     
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g1x45$get_world_EMIffi_ty
    
    #
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_world_EMIffi_ty    
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g1x45$get_world_EMIffi_ty
    
    #
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0$"             = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0.5$"         = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g1x45$get_world_EMIffi_ty    
    
    #
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_world_EMIffi_ty
    ,"Strong cap $\\[10,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g1x45$get_world_EMIffi_ty
    #
    ,"BAU" = BAU_ssp2$get_world_EMIffi_ty
  )
  
  ,title  = paste0("World FFI Emissions, different experiments (2/2)")
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  , yLabel = "Emissions [GtCO2]"
  ,categories = 4
  ,colors_per_category = 3
  ,legend_columns = 1
  
) ;plottigat

# save
custom_save(plottigat)




## -----------------  TATM .. ssp2  .. # CAP # Gamma -----------




# ...... First series .........

plottigat = RICEx.plot.lineplot(
  EXPdata   = list(
    
    # 
    "Kali cap - High, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_AAC_g0$get_TATM_ty
    ,"Kali cap - High, $\\gamma = 0.5$"           = BKaliCap_2_coop$CBA__kali_cap_AAC_g0x5$get_TATM_ty   
    ,"Kali cap - High, $\\gamma = 1.45$"         = BKaliCap_2_coop$CBA__kali_cap_AAC_g1x45$get_TATM_ty
    
    #
    ,"Kali cap - Low, $\\gamma = 0$"                = BKaliCap_2_coop$CBA__kali_cap_BDE_g0$get_TATM_ty
    ,"Kali cap - Low, $\\gamma = 0.5$"            = BKaliCap_2_coop$CBA__kali_cap_BDE_g0x5$get_TATM_ty  
    ,"Kali cap - Low, $\\gamma = 1.45$"          = BKaliCap_2_coop$CBA__kali_cap_BDE_g1x45$get_TATM_ty   
    
    #
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0 $"       = BKaliCap_2_coop$CBA__strong_cap_PR_g0$get_TATM_ty
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 0.5 $"   = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5$get_TATM_ty   
    ,"Strong cap $\\[2 ,0.0001\\], \\gamma = 1.45 $"  = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45$get_TATM_ty   
    
    #
    ,"No cap, $\\gamma = 0$ "                       = BKaliCap_2_coop$CBA__no_cap_g0$get_TATM_ty
    ,"No cap, $\\gamma = 0.5$ "                   = BKaliCap_2_coop$CBA__no_cap_g0x5$get_TATM_ty
    ,"No cap, $\\gamma = 1.45$ "                 = BKaliCap_2_coop$CBA__no_cap_g1x45$get_TATM_ty
    
    #
    ,"BAU" = BAU_ssp2$get_TATM_ty
    
  )
  
  ,title  = paste0("Atmospheric temperature increase, different experiments (1/2)")
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  , yLabel = " [+ºC]"
  ,categories = 4
  ,colors_per_category = 3
  ,legend_columns = 1
  
) ;plottigat

# save
custom_save(plottigat)




# ...... Second series .........

plottigat = RICEx.plot.lineplot(
  EXPdata   = list(
    
    # 
    "Strong cap $\\[2 ,0.2\\], \\gamma = 0$"              = BKaliCap_2_coop$CBA__strong_cap_PP_g0$get_TATM_ty
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 0.5$"         = BKaliCap_2_coop$CBA__strong_cap_PP_g0x5$get_TATM_ty     
    ,"Strong cap $\\[2 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PP_g1x45$get_TATM_ty
    
    #
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0$"             = BKaliCap_2_coop$CBA__strong_cap_PQ_g0$get_TATM_ty
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 0.5$"         = BKaliCap_2_coop$CBA__strong_cap_PQ_g0x5$get_TATM_ty   
    ,"Strong cap $\\[2 ,0.1\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_PQ_g1x45$get_TATM_ty
    
    #
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0$"             = BKaliCap_2_coop$CBA__strong_cap_RP_g0$get_TATM_ty
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 0.5$"         = BKaliCap_2_coop$CBA__strong_cap_RP_g0x5$get_TATM_ty
    ,"Strong cap $\\[5 ,0.2\\], \\gamma = 1.45$"       = BKaliCap_2_coop$CBA__strong_cap_RP_g1x45$get_TATM_ty    
    
    #
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0$"           = BKaliCap_2_coop$CBA__strong_cap_SP_g0$get_TATM_ty
    ,"Strong cap $\\[10,0.2\\], \\gamma = 0.5$"       = BKaliCap_2_coop$CBA__strong_cap_SP_g0x5$get_TATM_ty
    ,"Strong cap $\\[10,0.2\\], \\gamma = 1.45$"     = BKaliCap_2_coop$CBA__strong_cap_SP_g1x45$get_TATM_ty
    #
    ,"BAU" = BAU_ssp2$get_TATM_ty
  )
  
  ,title  = paste0("Atmospheric temperature increase, different experiments (2/2)")
  ,legend = "Scenarios"
  ,LaTeX_text = TRUE
  , yLabel = " [+ºC]"
  ,categories = 4
  ,colors_per_category = 3
  ,legend_columns = 1
  
) ;plottigat

# save
custom_save(plottigat)






