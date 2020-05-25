

#------ EXPERIMENTS -------------

mySC_ssp2_NONCOOP = BKaliCap_2_noncoop$CBA__strong_cap_PR
  
mySC_ssp2_COOP_0    = BKaliCap_2_coop$CBA__strong_cap_PR_g0
mySC_ssp2_COOP_0x5  = BKaliCap_2_coop$CBA__strong_cap_PR_g0x5 
mySC_ssp2_COOP_1x45 = BKaliCap_2_coop$CBA__strong_cap_PR_g1x45 



#=============================================================================#
####          _______   SCENARIO ♦ WORLD _____________                    ####
#=============================================================================#



# --------------- W EMI .. SSP2 .. #COOP ---------------------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Noncoop"       = mySC_ssp2_NONCOOP$get_world_EMIffi_ty
   
    ,"Coop $\\gamma = 0$"       = mySC_ssp2_COOP_0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = mySC_ssp2_COOP_0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU        "  = BAU_ssp2$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat




# --------------- W TATM .. SSP2 .. #COOP ---------------------------


plottigat <- RICEx.plot.lineplot(
  
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_TATM_ty
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_TATM_ty

    ,"BAU        "  = BAU_ssp2$get_TATM_ty
  )
  ,title  = "Atmospheric Temperature Increase - SSP2"
  ,yLabel = " [+ºC]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
) + xlim(2000,2200); plottigat






#=============================================================================#
####          _______   SCENARIO ♦ REGIONS ____________                    ####
#=============================================================================#

###-------------  (C)  MIU .. SSP2 .. #COOP ----------------


plottigat = RICEx.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_MIU_nty
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_MIU_nty
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_MIU_nty
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_MIU_nty
    
  )
  
  , title = "Regional mitigation \\[%BAU\\] over time"
  , y_label = "Mitigation \\[%BAU\\]"
  , legend_columns = 2
  , columns = 2
  , LaTeX_text = TRUE
  
); plottigat




###-------------  (C)  DAMFRAC(ykali) .. SSP2 .. #COOP ----------------


EXPdata   = list(
  
  "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("damfrac_estim_ykali")
  
  ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("damfrac_estim_ykali")

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
nCol = 2

plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                            ,top =  text_grob("Regional Damages [%GDPssp] over time", face = "bold", size = 16)
)


plottigat


###-------------  (C)  YNET .. SSP2 .. #COOP ----------------


EXPdata   = list(
  
  "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("YNET")
  
  ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("YNET")
  ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("YNET")
  ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("YNET")
  
)


plotlist    = list()
for(p in c(1:length(EXPdata))){
  
  
  message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
  
  plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                            ,mytitle     = TeX(names(EXPdata)[p])
                            ,myylab = "GDP Net of damages [Trill USD]") 
  
  plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
  
}


nRow = 2
nCol = 2

plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                            ,top =  text_grob("Regions GDP Net of damages [Trill USD] over time", face = "bold", size = 16)
)


plottigat

###-------------  (C) Y .. SSP2 .. #COOP ----------------


EXPdata   = list(
  
  "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("Y")
  
  ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("Y")
  ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("Y")
  ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("Y")
  
)


plotlist    = list()
for(p in c(1:length(EXPdata))){
  
  
  message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
  
  plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                            ,mytitle     = TeX(names(EXPdata)[p])
                            ,myylab = "GDP Net [Trill USD]") 
  
  plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
  
}


nRow = 2
nCol = 2

plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                            ,top =  text_grob("Regions GDP Net of both damages and abatecosts [Trill USD] over time", face = "bold", size = 16)
)


plottigat




#=============================================================================#
####          _______   SCENARIO ♦ MAPS ______________                    ####
#=============================================================================#



## ----------------- (C)  MIU .. COOP +year .. #COOP -----------



myyear = 2100


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_MIU_nty   %>% filter(year==myyear)
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_MIU_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_MIU_nty   %>% filter(year==myyear)
  )
  
  ,title  = paste0("Mitigation in ",myyear," ")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = TRUE
  ,columns = 2
  
) 

plottigat

# save
custom_save(plottigat)



## ----------------- (C)  EIND .. COOP +year .. #COOP -----------



myyear = 2100


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_EMI_nty   %>% filter(year==myyear)
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_EMI_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_EMI_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_EMI_nty   %>% filter(year==myyear)
  )
  
  ,title  = paste0("Emissions in ",myyear," ")
  ,legend = "Emissions \n[GtCO2/year]"
  ,palette =  rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = TRUE
  ,LaTeX_text = TRUE
  ,columns = 2
  
) 

plottigat

# save
custom_save(plottigat)



## ----------------- (C)  DAMFRAC(ykali) .. COOP +year .. #COOP -----------



myyear = 2100


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
  )
  
  ,title  = paste0("Damages in ",myyear," (compared to SSP levels")
  ,legend = "Damages \n[%GDPssp]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = TRUE
  ,LaTeX_text = TRUE
  ,columns = 2
  
) 

plottigat

# save
custom_save(plottigat)