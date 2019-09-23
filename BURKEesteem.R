source("30_sDC_experiments_central_storage.R")


BURKESTEEMexp = list()
BURKESTEEMexp = experiments_load_as_list(BURKESTEEMexp,"SIMtest")









## < SIM WORLD > GDP GROSS changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "BAU no damages"),
            size = 1.2) + 

  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  # 
  # 
  # geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
  #           aes(x=year, y=value, group=1, color = "35"),
  #           size = 1.2) + 
  # 
  # 
  # geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
  #           aes(x=year, y=value, group=1, color = "17"),
  #           size = 1.2) + 
  # 
  # 
  # geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
  #           aes(x=year, y=value, group=1, color = "5"),
  #           size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  

  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "BAU no damages","1","5","17", "35", "57" ),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP GROSS changes - iso3 ykali fixed") + 
  xlab("Year") +
  ylab("GDP GROSS [Trill USD]")  ; plottigat



## < SIM WORLD > EMI changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "BAU no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "BAU no damages","1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("Emissions World - changes with regional detail") + 
  xlab("Year") +
  ylab("Emissions World [GtCO2]")  ; plottigat



## < SIM WORLD > GDP NET changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_ed7$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  
  # 
  # geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"),
  #           aes(x=year, y=value, group=1, color = "35"),
  #           size = 1.2) + 
  # 
  # 
  # geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"),
  #           aes(x=year, y=value, group=1, color = "17"),
  #           size = 1.2) + 
  # 
  # 
  # geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"),
  #           aes(x=year, y=value, group=1, color = "5"),
  #           size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_ed7$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "BAU no damages" , "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP NET - changes with regional detail - ed57") + 
  xlab("Year") +
  ylab("GDP NET [Trill USD]")  ; plottigat





## < SIM WORLD > DAMAGES ABSOLUTE changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +

  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "BAU no damages" , "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("WORLD damages - changes with regional detail") + 
  xlab("Year") +
  ylab("WORLD DAMAGES [Trill USD]")  ; plottigat





## < SIM WORLD > FORCE changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  #EXPERIMENTS
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages","1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("FORC -  changes with regional detail") + 
  xlab("Year") +
  ylab("FORC [W/m2]")  ; plottigat





## < SIM WORLD > OMEGA_world_equivalent changes with regional detail    -------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



eval_OMEGA <- function(YGROSSdf, YNETdf){
  
  OMEGAdf = merge(YGROSSdf, YNETdf, by = c("t", "year")) %>% rename(ygross = value.x, ynet = value.y) %>% mutate(value = (ygross/ynet)-1 )
  return(OMEGAdf)
}



OMEGAlist = list()

OMEGAlist$enerdata56  = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"))
                                   
OMEGAlist$enerdata35  = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"))

OMEGAlist$witch17     = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"))

OMEGAlist$r5          = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"))

OMEGAlist$global      = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("YNET"))


                                   
plottigat= ggplot() +
  
  
  
  
  geom_line(data= OMEGAlist$enerdata56,
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  
  
  geom_line(data= OMEGAlist$enerdata35,
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  
  geom_line(data= OMEGAlist$witch17,
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  
  geom_line(data= OMEGAlist$r5,
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  
  geom_line(data= OMEGAlist$global,
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("OMEGA world changes with regional detail") + 
  xlab("Year") +
  ylab("OMEGA world equivalent ")  ; plottigat




## < SIM WORLD > OMEGA_world_equivalent changes with regional detail    -------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



eval_GDPloss <- function(YKALI, DAMAGESABS){
  
  df = merge(YKALI, DAMAGESABS, by = c("t", "year")) %>% rename(ykali = value.x, dam_abs = value.y) %>% mutate(value = - (dam_abs/ykali) )
  return(df)
}



GDPloss = list()

GDPloss$enerdata56  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
                                   YKALI =   BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$enerdata35  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
                                   YKALI =   BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$witch17  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
                                   YKALI =   BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$r5  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
                                   YKALI =   BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$global  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_ykalifix$get_WORLDagg_VARnty_ty("DAMAGES"),
                                   YKALI =   BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))




plottigat= ggplot() +
  
  
  
  
  geom_line(data= GDPloss$enerdata56,
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  
  
  geom_line(data= GDPloss$enerdata35,
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  
  geom_line(data= GDPloss$witch17,
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  
  geom_line(data= GDPloss$r5,
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  
  geom_line(data= GDPloss$global,
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP loss world - changes with regional detail") + 
  xlab("Year") +
  ylab("GDPloss world [%]")  ; plottigat








## < SIM WORLD > Tworld aggregated vs Tworld downscaler    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem$get_Variable_ty("T_GLOBAL_WEIGHTED"),
            aes(x=year, y=value, group=1, color = "T weight aggregation"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem$get_Variable_ty("T_LOCAL"),
            aes(x=year, y=value, group=1, color = "T global downscaler"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("Tglobal from local aggregation compared with Tglobal from downscaler") + 
  xlab("Year") +
  ylab("Average Temperature [°C]")  ; plottigat















#### *************** ISO3 IMPLEMENTED ********************* ####












## < ISO3 SIM WORLD > GDP GROSS changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "5 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "1 iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages","1","5","17", "35", "57" ),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP GROSS changes with ISO3 process") + 
  xlab("Year") +
  ylab("GDP GROSS [Trill USD]")  ; plottigat



## < ISO3 SIM WORLD > EMI changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "BAU\nno_damages"),
            size = 1.2) + 
  

  # ISO3-EXPERIMENTS
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "5 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("E"),
            aes(x=year, y=value, group=1, color = "1 iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU\nno damages","1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("Emissions World - changes with regional detail  with ISO3 process") + 
  xlab("Year") +
  ylab("Emissions World [GtCO2]")  ; plottigat



## < ISO3 SIM WORLD > GDP NET changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "5  iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "1  iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages" , "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP NET - changes with regional detail with ISO3 process") + 
  xlab("Year") +
  ylab("GDP NET [Trill USD]")  ; plottigat





## < ISO3 SIM WORLD > DAMAGES ABSOLUTE changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "BAU no damages" , "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("WORLD damages - changes with regional detail") + 
  xlab("Year") +
  ylab("WORLD DAMAGES [Trill USD]")  ; plottigat





## < ISO3 SIM WORLD > FORCE changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  #EXPERIMENTS
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "5  iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_Variable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "1  iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages","1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("FORC -  changes with regional detail with ISO3 process") + 
  xlab("Year") +
  ylab("FORC [W/m2]")  ; plottigat





## < ISO SIM WORLD > OMEGA_world_equivalent changes with regional detail    -------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



eval_OMEGA <- function(YGROSSdf, YNETdf){
  
  OMEGAdf = merge(YGROSSdf, YNETdf, by = c("t", "year")) %>% rename(ygross = value.x, ynet = value.y) %>% mutate(value = (ygross/ynet)-1 )
  return(OMEGAdf)
}



OMEGAlist = list()

OMEGAlist$enerdata56  = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"))

OMEGAlist$enerdata35  = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"))

OMEGAlist$witch17     = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"))

OMEGAlist$r5          = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"))

OMEGAlist$global      = eval_OMEGA(YGROSSdf = BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YGROSS"),
                                   YNETdf =   BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("YNET"))



plottigat= ggplot() +
  
  
  
  
  geom_line(data= OMEGAlist$enerdata56,
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= OMEGAlist$enerdata35,
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= OMEGAlist$witch17,
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= OMEGAlist$r5,
            aes(x=year, y=value, group=1, color = "5  iso3"),
            size = 1.2) + 
  
  
  geom_line(data= OMEGAlist$global,
            aes(x=year, y=value, group=1, color = "1  iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("OMEGA world changes with regional detail with ISO3 process") + 
  xlab("Year") +
  ylim(0,1.7)+
  ylab("OMEGA world equivalent ")  ; plottigat




## < ISO3 SIM WORLD > OMEGA_world_equivalent changes with regional detail    -------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



eval_GDPloss <- function(YKALI, DAMAGESABS){
  
  df = merge(YKALI, DAMAGESABS, by = c("t", "year")) %>% rename(ykali = value.x, dam_abs = value.y) %>% mutate(value = - (dam_abs/ykali) )
  return(df)
}



GDPloss = list()

GDPloss$enerdata56  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
                                   YKALI =   BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$enerdata35  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
                                   YKALI =   BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$witch17  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
                                YKALI =   BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$r5  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
                           YKALI =   BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))

GDPloss$global  = eval_GDPloss(DAMAGESABS = BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3$get_WORLDagg_VARnty_ty("DAMAGES"),
                               YKALI =   BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"))




plottigat= ggplot() +
  
  
  
  
  geom_line(data= GDPloss$enerdata56,
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= GDPloss$enerdata35,
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= GDPloss$witch17,
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= GDPloss$r5,
            aes(x=year, y=value, group=1, color = "5  iso3"),
            size = 1.2) + 
  
  
  geom_line(data= GDPloss$global,
            aes(x=year, y=value, group=1, color = "1  iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c( "1","5","17", "35", "57"),
                     values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e",
                                  
                                  
                                  
                                  "#9c4317",
                                  "#9c1717",
                                  "blue",
                                  "#4a4a4a",
                                  "#d64cf5",
                                  "#0ccfab",
                                  "#046918",
                                  "#450094",
                                  "orange",
                                  "#4cf5d6" , 
                                  
                                  "#d64cf5", 
                                  "#cf0cb2"
                     )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP loss world - changes with regional detail with ISO3 process") + 
  xlab("Year") +
  ylim(-0.44,0) +
  ylab("GDPloss world [%]")  ; plottigat











#### *************** ISO3 OMEGA FIXED ********************* ####












## < ISO3 OMEGAFX 0 SIM WORLD > GDP GROSS changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "5 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "1 iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages","1","5","17", "35", "57" ),
    values =  c( "black", 
                 "#f77f2f", #orange
                 "#0f86db", #blue
                 "#8232c7", #violet
                 "#32c738",  #greens
                 "#db0f20",
                 "#c4570e",
                 
                 
                 
                 "#9c4317",
                 "#9c1717",
                 "blue",
                 "#4a4a4a",
                 "#d64cf5",
                 "#0ccfab",
                 "#046918",
                 "#450094",
                 "orange",
                 "#4cf5d6" , 
                 
                 "#d64cf5", 
                 "#cf0cb2"
    )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP GROSS changes with ISO3 process") + 
  xlab("Year") +
  ylab("GDP GROSS [Trill USD]")  ; plottigat



## < ISO3 OMEGAFX 0 SIM WORLD > GDP NET changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "5  iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega0$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "1  iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages" , "1","5","17", "35", "57"),
    values =  c( "black", 
                 "#f77f2f", #orange
                 "#0f86db", #blue
                 "#8232c7", #violet
                 "#32c738",  #greens
                 "#db0f20",
                 "#c4570e",
                 
                 
                 
                 "#9c4317",
                 "#9c1717",
                 "blue",
                 "#4a4a4a",
                 "#d64cf5",
                 "#0ccfab",
                 "#046918",
                 "#450094",
                 "orange",
                 "#4cf5d6" , 
                 
                 "#d64cf5", 
                 "#cf0cb2"
    )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP NET - changes with regional detail with ISO3 process") + 
  xlab("Year") +
  ylab("GDP NET [Trill USD]")  ; plottigat








## < ISO3 OMEGAFX NON-0 SIM WORLD > GDP GROSS changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "5 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YGROSS"),
            aes(x=year, y=value, group=1, color = "1 iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages","1","5","17", "35", "57" ),
    values =  c( "black", 
                 "#f77f2f", #orange
                 "#0f86db", #blue
                 "#8232c7", #violet
                 "#32c738",  #greens
                 "#db0f20",
                 "#c4570e",
                 
                 
                 
                 "#9c4317",
                 "#9c1717",
                 "blue",
                 "#4a4a4a",
                 "#d64cf5",
                 "#0ccfab",
                 "#046918",
                 "#450094",
                 "orange",
                 "#4cf5d6" , 
                 
                 "#d64cf5", 
                 "#cf0cb2"
    )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP GROSS changes with ISO3 - OMEGA FIXED") + 
  xlab("Year") +
  ylab("GDP GROSS [Trill USD]")  ; plottigat



## < ISO3 OMEGAFX NON-0 SIM WORLD > GDP NET changes with regional detail    --------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  #BAU no damages
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU_xx$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "BAU\n no damages"),
            size = 1.2) + 
  
  # EXPERIMENTS
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "57 iso3"),
            size = 1.2) + 
  
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "35 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "17 iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "5  iso3"),
            size = 1.2) + 
  
  
  geom_line(data= BURKESTEEMexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polBAU_xxBurkeEsteem_iso3_omega2$get_WORLDagg_VARnty_ty("YNET"),
            aes(x=year, y=value, group=1, color = "1  iso3"),
            size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(#breaks=c( "BAU no damages" , "1","5","17", "35", "57"),
    values =  c( "black", 
                 "#f77f2f", #orange
                 "#0f86db", #blue
                 "#8232c7", #violet
                 "#32c738",  #greens
                 "#db0f20",
                 "#c4570e",
                 
                 
                 
                 "#9c4317",
                 "#9c1717",
                 "blue",
                 "#4a4a4a",
                 "#d64cf5",
                 "#0ccfab",
                 "#046918",
                 "#450094",
                 "orange",
                 "#4cf5d6" , 
                 
                 "#d64cf5", 
                 "#cf0cb2"
    )) +
  
  
  labs (color = "Regions") + 
  ggtitle("GDP NET - changes with regional detail with ISO3 - OMEGA FIXED") + 
  xlab("Year") +
  ylab("GDP NET [Trill USD]")  ; plottigat



