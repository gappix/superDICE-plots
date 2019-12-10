

# TODO: sistemare subscriptout of bound see il nome dell'esperimento è sbagliato

# TODO: sistemare 30_sdc_experiments in modo da avere una funzioe generica e un lastimport per ogni exp 



## CBA EMISSIONS: NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata30$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "30"),
            size = 1.2) +   
  geom_line(data= POSTPOWERexp$kaliQUARTZ$witch17$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +   
  geom_line(data= POSTPOWERexp$kaliQUARTZ$r5$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) +   
  geom_line(data= POSTPOWERexp$kaliQUARTZ$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "30", "57"),
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
  ggtitle("CTAX 30 const - POSTPOWER") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat




## CBA EMISSIONS: NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$enerdata30$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "30"),
            size = 1.2) +   
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$witch17$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +  
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$r5$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) +  
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "30", "57"),
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
  ggtitle("CTAX 30 const - FXPOWER") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat


## CBA EMISSIONS: NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata30$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "30"),
            size = 1.2) +   
  geom_line(data= POSTPOWERexp$kaliQUARTZ$witch17$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +   
  geom_line(data= POSTPOWERexp$kaliQUARTZ$r5$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) +   
  geom_line(data= POSTPOWERexp$kaliQUARTZ$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "30", "57"),
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
  ggtitle("CTAX 30 gr5 - POSTPOWER") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat




## CBA EMISSIONS: NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= POSTPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  # geom_line(data= FXPOWERexp$kaliQUARTZ$enerdata30$ssp2$noncoop$clWITCHco2$damOFF$pol$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
  #           aes(x=year, y=value, group=1, color = "30"),
  #           size = 1.2) +   
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$witch17$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +  
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$r5$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) +  
  
  geom_line(data= FXPOWERexp$kaliQUARTZ$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "1"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=c("BAU", "1","5","17", "30", "57"),
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
  ggtitle("CTAX 30 gr5 - FXPOWER") + 
  xlab("Year") +
  ylab("World emissions [GtCO2]")  ; plottigat



