source("30_sDC_experiments_central_storage.R")


TBDexp = list()
TBDexp = experiments_load_as_list(TBDexp,"TBD")






## < WORLD EMISSIONS LINES > CBA NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "35", "57"),
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
  ggtitle("CBA noncooperative") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat





## < WORLD EMISSIONS LINES > CBA NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "35", "57"),
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
  ggtitle("CBA noncooperative") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat



#save with  cairo in svg

## < WORLD EMISSIONS LINES > CBA COOP-POP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "35", "57"),
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
  ggtitle("CBA cooperative Population-weighted") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat


## < WORLD EMISSIONS LINES > CBA COOP-NEGISHI changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "35", "57"),
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
  ggtitle("CBA cooperative Negishi-weighted") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat


## < WORLD TATM LINES > CBA NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "35", "57"),
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
  ggtitle("CBA noncooperative") + 
  xlab("Year") +
  ylab("Temperature atmosphere increase [ºC]")  ; plottigat


## < WORLD TATM LINES > CBA COOP-NEGISHI changes with regional detail    ------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$coopngsw$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "35", "57"),
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
  ggtitle("CBA cooperative Negishi-weighted") + 
  xlab("Year") +
  ylab("Temperature atmosphere increase [ºC]")  ; plottigat

## < WORLD TATM LINES > CBA COOP-POP changes with regional detail    ----------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "35", "57"),
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
  ggtitle("CBA cooperative Population-weighted") + 
  xlab("Year") +
  ylab("Temperature atmosphere increase [ºC]")  ; plottigat





## < WORLD EMISSIONS LINES > CTAX DIAG 30 const at different regions   ---------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  # ADVANCE
  # geom_line(data= ADVANCE_CO2_WORLD$DIAG_C30_gr5,
  #           aes(x=year, y=value, group=model, color = "ADVANCE models"),
  #           size = 1.2) + 
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) +

  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) +

  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +

  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", 
                              "1",
                              "5",
                              "17", 
                              "35", 
                              "57", 
                              "ADVANCE models"),
                     values =  c( "black", 
                                  "blue",
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
  ggtitle("CTAX DIAG 30 const") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat


## < WORLD EMISSIONS LINES > CTAX DIAG 30 gr5 at different regions   ---------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  # ADVANCE
  # geom_line(data= ADVANCE_CO2_WORLD$DIAG_C30_gr5,
  #           aes(x=year, y=value, group=model, color = "ADVANCE models"),
  #           size = 1.2) + 
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", 
                              "1",
                              "5",
                              "17", 
                              "35", 
                              "57", 
                              "ADVANCE models"),
                     values =  c( "black", 
                                  "blue",
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
  ggtitle("CTAX DIAG 30 gr5") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat

## < WORLD EMISSIONS LINES > CTAX DIAG 80 const at different regions   ---------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  # ADVANCE
  # geom_line(data= ADVANCE_CO2_WORLD$DIAG_C30_gr5,
  #           aes(x=year, y=value, group=model, color = "ADVANCE models"),
  #           size = 1.2) + 
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_const$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", 
                              "1",
                              "5",
                              "17", 
                              "35", 
                              "57", 
                              "ADVANCE models"),
                     values =  c( "black", 
                                  "blue",
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
  ggtitle("CTAX DIAG 80 const") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat


## < WORLD EMISSIONS LINES > CTAX DIAG 80 gr5 at different regions   ---------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  # ADVANCE
  # geom_line(data= ADVANCE_CO2_WORLD$DIAG_C30_gr5,
  #           aes(x=year, y=value, group=model, color = "ADVANCE models"),
  #           size = 1.2) + 
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$coop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", 
                              "1",
                              "5",
                              "17", 
                              "35", 
                              "57", 
                              "ADVANCE models"),
                     values =  c( "black", 
                                  "blue",
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
  ggtitle("CTAX DIAG 80 gr5") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat


## < GENERAL VARIABLE LINES > CBA at different regions   ---------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polBAU$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  # ADVANCE
  # geom_line(data= ADVANCE_CO2_WORLD$DIAG_C30_gr5,
  #           aes(x=year, y=value, group=model, color = "ADVANCE models"),
  #           size = 1.2) + 
  
  # CBA
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata56$ssp2$coop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_Variable_ty()%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$enerdata35$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$witch17$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +
  
  geom_line(data= TBDexp$kaliPUMICE$r5$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= TBDexp$kaliPUMICE$global$ssp2$noncoop$clWITCHco2$damOFF$SRfix$polCTAX_DIAG_C80_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", 
                              "1",
                              "5",
                              "17", 
                              "35", 
                              "57", 
                              "ADVANCE models"),
                     values =  c( "black", 
                                  "blue",
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
  ggtitle("CTAX DIAG 80 gr5") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat










