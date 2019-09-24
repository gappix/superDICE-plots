source("RICEx_data/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")


# Retrieve experiments

PAPexp = list()
PAPexp = experiments_load_as_list(PAPexp,"PAP")


PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXfix$polCBA$get_Variable_nty("E")




 
## -------------------:  TEMPERATURES COMPARED : --------------------------------


## Varying cooperation

EXPdata = list(
  "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
  "Coop Pop"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Coop Negishi" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Non Coop"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM")
)

EXPtitle  = "Temperature increase with Burke SR by varying cooperation"
EXPylabel = "Temperature atmosphere increase [ºC]"
EXPlegend = "Experiments"



plottigat <- RICEx.plot.lineplot(EXPdata, EXPtitle, EXPylabel, EXPlegend)
# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
plottigat
savePlot("clipboard", type="wmf") #saves plot to WMF







## Varying Burke type

EXPdata = list(
  "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
  "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
)

EXPtitle  = "Temperature increase in cooperation (pop) by varying Burke function-type"
EXPylabel = "Temperature atmosphere increase [ºC]"
EXPlegend = "Experiments"



plottigat <- RICEx.plot.lineplot(EXPdata, EXPtitle, EXPylabel, EXPlegend)
# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
plottigat
savePlot("clipboard", type="wmf") #saves plot to WMF






## Varying Burke type coopngsw

EXPdata = list(
  "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
  "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
)

EXPtitle  = "Temperature increase in cooperation (Negishi) by varying Burke function-type"
EXPylabel = "Temperature atmosphere increase [ºC]"
EXPlegend = "Experiments"



plottigat <- RICEx.plot.lineplot(EXPdata, EXPtitle, EXPylabel, EXPlegend)
# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
plottigat
savePlot("clipboard", type="wmf") #saves plot to WMF




## Varying Burke type noncoop

EXPdata = list(
  "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
  "Burke SR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke SRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSRdiff$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke LR"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke LRdiff" = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnLRdiff$savFXconv$polCBA$get_Variable_ty("TATM")
)

EXPtitle  = "Temperature increase in noncooperation by varying Burke function-type"
EXPylabel = "Temperature atmosphere increase [ºC]"
EXPlegend = "Experiments"



plottigat <- RICEx.plot.lineplot(EXPdata, EXPtitle, EXPylabel, EXPlegend)
# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
plottigat
savePlot("clipboard", type="wmf") #saves plot to WMF







## Varying impact function and cooperation

EXPdata = list(
  "BAU"          = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_ty("TATM"),
  "Burke SR coop"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "DICEreg coop"      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damDICEreg$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke SR coopngsw"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "DICEreg coopngsw"      = PAPexp$kaliJOJO$OPT$ed57$ssp2$coopngsw$clWITCHco2$damDICEreg$savFXconv$polCBA$get_Variable_ty("TATM"),
  "Burke SR noncoop"     = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damBURKEnSR$savFXconv$polCBA$get_Variable_ty("TATM"),
  "DICEreg noncoop"      = PAPexp$kaliJOJO$OPT$ed57$ssp2$noncoop$clWITCHco2$damDICEreg$savFXconv$polCBA$get_Variable_ty("TATM")
)

EXPtitle  = "Temperature increase by varying both cooperation and impact function"
EXPylabel = "Temperature atmosphere increase [ºC]"
EXPlegend = "Experiments"



plottigat <- RICEx.plot.lineplot(EXPdata, EXPtitle, EXPylabel, EXPlegend)
# copy
windows(1150, 600, pointsize = 10) #opens a separate window with the size you want 
plottigat
savePlot("clipboard", type="wmf") #saves plot to WMF







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





## --------------------- :  TEMPERATURE COMPARE  :---------------------------------
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













## ------------------------:   STACKED EMISSIONS   :-------------------------------------- 



plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= PAPexp$kaliJOJO$OPT$ed57$ssp2$coop$clWITCHco2$damOFF$savFXconv$polBAU$get_Variable_nty("E"),
            aes(x=year, y=value, group=n, fill =n)) + 
  
  

  # graphic details
  scale_fill_manual(values= colorize_regions("ed57") ) +
  scale_color_manual(values = "black" ) +
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  
  labs(fill='Regions')+
  theme( legend.text   = element_text(size = 13),
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 26),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  
  ggtitle("Emissions Stacked in Business as Usual ssp2 scenario") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2/year]")  ; plottigat


# ...if you need to readjust colors.....
#my_colors = sample(my_colors)















