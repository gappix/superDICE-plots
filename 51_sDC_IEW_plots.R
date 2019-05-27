
## BAU: STACKED EMISSIONS  ED56 SSP2   ------------------------------------------------------------------------



plottigat= ggplot() + 
  
  
  # Scenario
    geom_area(data= sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$get_Emissions_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  
  
  
  # graphic details
  scale_fill_manual(values= my_colors ) +
  scale_color_manual(values = "black" ) +
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=)) +
  
  labs(fill='r5 Regions')+
  ggtitle("Emissions Stacked in BAU noncoop - ssp2 - r5 regionalization") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2/year]")  ; plottigat


# ...if you need to readjust colors.....
my_colors = sample(my_colors)




file_name = "E_Stacked_BAU"
savePlotLARGE()



## BAU: STACKED EMISSIONS  ED30 SSP2 ------------------------------------------------------------------------



plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$get_Emissions_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  
  
  
  # graphic details
  scale_fill_manual(values= my_colors ) +
  scale_color_manual(values = "black" ) +
  guides(colour=guide_legend(ncol=3), fill=guide_legend(ncol=3)) +
  
  labs(fill='Enerdata56 Regions')+
  ggtitle("Emissions Stacked in BAU noncoop - ssp2 - Enerdata30 ") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2/year]")  ; plottigat


# ...if you need to readjust colors.....
#my_colors = sample(my_colors)




file_name = "E_Stacked_BAU"
savePlotLARGE()



## BAU: E GLOBAL  SSP-Comparison ## ------------------------------------------------------------------------

plottigat= ggplot() +
  
  
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "ssp1"),
            size = 2.1) + 
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "ssp2"),
            size = 2.1) + 
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "ssp3"),
            size = 2.1) + 
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "ssp4"),
            size = 2.1) + 
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "ssp5"),
            size = 2.1) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e")) +
  
  
  ggtitle("World Emissions BAU according to ssp scenarios") + 
  xlab("Year") +
  ylab("°C")  ; plottigat




## CBA EMISSIONS: coop changes with regional detail   ####################################################################################################################

plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "0 - BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "1 - enerdata57"),
            size = 1.2) + 

  geom_line(data= sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "2 - enerdata30"),
            size = 1.2) + 
  
  geom_line(data= sunRC_witch17_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "3 - witch17"),
            size = 1.2) + 

  
  # geom_line(data= sunRC_witch13_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
  #           aes(x=year, y=value, group=1, color = "4 - witch13"),
  #           size = 1.2) + 
  
  geom_line(data= sunRC_r5_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "5 - r5"),
            size = 1.2) + 
  
  geom_line(data= sunRC_global_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "6 - global"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
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
  
  
  
  ggtitle("World Emissions in CBA ssp2 cooperative varying regional detail") + 
  xlab("Year") +
  ylab("GtCO2")  ; plottigat









## CBA EMISSIONS: noncoop changes with regional detail   ####################################################################################################################

plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "0 - BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "1 - enerdata57"),
            size = 1.2) + 
  
  geom_line(data= sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "2 - enerdata30"),
            size = 1.2) + 
  
  geom_line(data= sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "3 - witch17"),
            size = 1.2) + 
  
  
  # geom_line(data= sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
  #           aes(x=year, y=value, group=1, color = "4 - witch13"),
  #           size = 1.2) + 
  
  geom_line(data= sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "5 - r5"),
            size = 1.2) + 
  
  geom_line(data= sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "6 - global"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
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
  
  
  
  ggtitle("World Emissions in CBA ssp2 noncooperative varying regional detail") + 
  xlab("Year") +
  ylab("GtCO2")  ; plottigat


## CBA EMISSIONS: coopngsw changes with regional detail   ####################################################################################################################

plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "0 - BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "1 - enerdata57"),
            size = 1.2) + 
  
  geom_line(data= sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "2 - enerdata30"),
            size = 1.2) + 
  
  geom_line(data= sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "3 - witch17"),
            size = 1.2) + 
  
  
  # geom_line(data= sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
  #           aes(x=year, y=value, group=1, color = "4 - witch13"),
  #           size = 1.2) + 
  
  geom_line(data= sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "5 - r5"),
            size = 1.2) + 
  
  geom_line(data= sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "6 - global"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
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
  
  
  
  ggtitle("World Emissions in CBA ssp2 cooperative-negishi at different regional detail") + 
  xlab("Year") +
  ylab("GtCO2")  ; plottigat





## CBA TEMPERATURE: coop changes with regional detail   ####################################################################################################################

plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "0 - BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "1 - enerdata57"),
            size = 1.2) + 
  
  geom_line(data= sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "2 - enerdata30"),
            size = 1.2) + 
  
  geom_line(data= sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "3 - witch17"),
            size = 1.2) + 
  
  
  geom_line(data= sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "4 - witch13"),
            size = 1.2) + 
  
  geom_line(data= sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "5 - r5"),
            size = 1.2) + 
  
  geom_line(data= sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "6 - global"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
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
  
  
  
  ggtitle("World Emissions in CBA ssp2 noncooperative varying regional detail") + 
  xlab("Year") +
  ylab("°C")  ; plottigat









## CBA TEMPERATURE: noncoop changes with regional detail   ####################################################################################################################


plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "0 - BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "1 - enerdata57"),
            size = 1.2) + 
  
  geom_line(data= sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "2 - enerdata30"),
            size = 1.2) + 
  
  geom_line(data= sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "3 - witch17"),
            size = 1.2) + 
  
  # 
  # geom_line(data= sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("TATM"),
  #           aes(x=year, y=value, group=1, color = "4 - witch13"),
  #           size = 1.2) + 
  # 
  geom_line(data= sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "5 - r5"),
            size = 1.2) + 
  
  geom_line(data= sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "6 - global"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
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
  
  
  
  ggtitle("Temperature increase in CBA ssp2 cooperative-negishi varying regional detail") + 
  xlab("Year") +
  ylab("°C")  ; plottigat

## CBA EMISSIONS: coopngsw changes with regional detail   ####################################################################################################################

plottigat= ggplot() +
  
  
  # BAU
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "0 - BAU"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "1 - enerdata57"),
            size = 1.2) + 
  
  geom_line(data= sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "2 - enerdata30"),
            size = 1.2) + 
  
  geom_line(data= sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "3 - witch17"),
            size = 1.2) + 
  
  
  geom_line(data= sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "4 - witch13"),
            size = 1.2) + 
  
  geom_line(data= sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "5 - r5"),
            size = 1.2) + 
  
  geom_line(data= sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA$getVariable_ty("world_E"),
            aes(x=year, y=value, group=1, color = "6 - global"),
            size = 1.2) + 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
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
  
  
  
  ggtitle("World Emissions in CBA ssp2 cooperative-negishi at different regional detail") + 
  xlab("Year") +
  ylab("°C")  ; plottigat









####  BAU SSP compared with IIASA Baselines  -------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




plottigat= ggplot() +
  
  
  #  RICE++
  
  geom_line(data= sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damOFF__polBAU$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "_RICE50+"),
            size = 1.2) + 
  
  
  # CBA
  
  geom_line(data= sspDB_all_baseline_CO2_total%>% filter(grepl("SSP5",scenario)),
            aes(x=year, y=value, group=model, color = model),
            size = 1.2) + 
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20", 
                                  "#d64cf5",
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
  
  
  
  ggtitle("World Emissions BAU ssp5 compared") + 
  xlab("Year") +
  ylab("GtCO2")  ; plottigat














