


ed57_ctax = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
ed30_ctax = IEWexp$kaliBASALT$enerdata30$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
wt17_ctax = IEWexp$kaliBASALT$witch17$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
r5_ctax   = SHITexp$kaliSHIT$r5$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const




g1_ctax   = SHITexp$kaliSHIT$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
g1_30gr5 = SHITexp$kaliSHIT$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_gr5





## BAU: E GLOBAL  SSP-Comparison ## ------------------------------------------------------------------------

plottigat= ggplot() +
  
  
  # 
  # geom_line(data= ed57_ctax$get_WORLD_EmissionsFFI_ty,
  #           aes(x=year, y=value, group=1, color = "57"),
  #           size = 2.1) + 
  # geom_line(data= ed30_ctax$get_WORLD_EmissionsFFI_ty,
  #           aes(x=year, y=value, group=1, color = "30"),
  #           size = 2.1) + 
  # geom_line(data= wt17_ctax$get_WORLD_EmissionsFFI_ty,
  #           aes(x=year, y=value, group=1, color = "17"),
  #           size = 2.1) + 
  geom_line(data= g1_ctax$get_WORLD_EmissionsFFI_ty,
            aes(x=year, y=value, group=1, color = "5"),
            size = 2.1) +
  geom_line(data= g1_30gr5$get_WORLD_EmissionsFFI_ty,
            aes(x=year, y=value, group=1, color = "1"),
            size = 2.1) +
  
  
  geom_line(data= ADV_CO2_WORLD.DIAG_C30_gr5,
            aes(x=year, y=value, group=model, color = model),
            size = 2.1) +
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(name = "Regions",
    values =  c( somecol, "black", 
                                  "#f77f2f", #orange
                                  "#0f86db", #blue
                                  "#8232c7", #violet
                                  "#32c738",  #greens
                                  "#db0f20",
                                  "#c4570e")) +
  

  ggtitle("World Emissions with ctax DIAG_30_const ") + 
  xlab("Year") +
  ylab("GtCO2")  ; plottigat


