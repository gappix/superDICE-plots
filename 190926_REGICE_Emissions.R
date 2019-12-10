source("30_sDC_experiments_central_storage.R")


REGICEexp = list()
REGICEexp = load_experiments(REGICEexp,"REGICE")



## CBA EMISSIONS: NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata30$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$r5$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$global$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
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


## CBA EMISSIONS: COOP POP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata30$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$witch17$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$r5$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$global$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
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


## CBA EMISSIONS: COOP NGSW changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata30$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$witch17$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$r5$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$global$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_WORLD_EmissionsTOT_ty%>% filter(year <=2200),
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


## CBA TATM: NONCOOP changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata30$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$witch17$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$r5$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$global$ssp2$noncoop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
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


## CBA TATM: COOP NGSW changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata30$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$witch17$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$r5$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$global$ssp2$coopngsw$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
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

## CBA TATM: COOP NGSW changes with regional detail    ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata30$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$witch17$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$r5$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$global$ssp2$coop$clWITCHco2$damBURKESR$polCBA$get_TATM_ty%>% filter(year <=2200),
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





##    CTAX WORLD EMISSIONS: DIAG 30 gr5     ----------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polBAU$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "BAU"),
            size = 1.2) + 
  
  # ADVANCE
  # geom_line(data= ADVANCE_CO2_WORLD$DIAG_C30_gr5,
  #           aes(x=year, y=value, group=model, color = "ADVANCE models"),
  #           size = 1.2) + 
  
  # CBA
  
  geom_line(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$coop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "57"),
            size = 1.2) +

  geom_line(data= REGICEexp$kaliQUARTZ$enerdata30$ssp2$coop$clDICE2016$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "35"),
            size = 1.2) +

  geom_line(data= REGICEexp$kaliQUARTZ$witch17$ssp2$coop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "17"),
            size = 1.2) +

  geom_line(data= REGICEexp$kaliQUARTZ$r5$ssp2$coop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
            aes(x=year, y=value, group=1, color = "5"),
            size = 1.2) + 
  
  geom_line(data= REGICEexp$kaliQUARTZ$global$ssp2$coop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5$get_WORLD_EmissionsFFI_ty%>% filter(year <=2200),
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




## STACKED EMISSIONS   ----------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
source("05_colors_settings.R")

plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= REGICEexp$kaliQUARTZ$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5_kchgsolveV2$get_Emissions_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  

  # graphic details
  scale_fill_manual(values= my_colors ) +
  scale_color_manual(values = "black" ) +
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=3)) +
  
  labs(fill='Regions')+
  #ggtitle("Emissions Stacked in Business as Usual") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2/year]")  ; plottigat


# ...if you need to readjust colors.....
#my_colors = sample(my_colors)


