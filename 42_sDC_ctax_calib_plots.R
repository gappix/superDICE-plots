




bubba       = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__bubba.gdx")
bubba2_tmp  = SuperDICE(gdx_source_file = "temp_bubba2.gdx")


sDC_DIAG_80_const_ltpb2150  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_ltpb2150.gdx")
sDC_DIAG_80_const_ltpb2200  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_ltpb2200.gdx")
sDC_DIAG_80_const_ltpb2300  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_ltpb2300.gdx")

sDC_DIAG_80_const_90mu11    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_90mu11.gdx")
sDC_DIAG_80_const_100mu11   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_100mu11.gdx")
sDC_DIAG_80_const_90mu105   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_90mu105.gdx")


MEAN =  ADV_CO2_WORLD.DIAG_C80_gr5  %>%
  select(model, year, value) %>%
  group_by(year)    %>%
  summarise(value = mean(value))         %>%
  select( year, value)









plottigat= ggplot() +
  
  ## ADVANCE trends
  geom_line(data= ADV_CO2_WORLD.DIAG_C30_gr5,
            aes(x=year, y=value, group = model, color = "Advance Models"),
            size = 0.7) +
  
  geom_smooth(data= ADV_CO2_WORLD.DIAG_C30_gr5,
              aes(x=year, y=value,  color = "__MEDIAN"),
              size = 1.1, se = F, span = 0.2) +
  
  
  geom_line(data= sDCx_Amber_DIAG_30_gr5_powerfit$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx Amber powerfit "),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_DIAG_30_gr5_p550g025$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx Amber quadfit "),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_DIAG_30_gr5_fxpowerfit$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx Amber fxpowerfit "),
            size = 1.1) +
  

# 
#   
#   geom_line(data= sDC_DIAG_80_gr5_p550g025_ltpb2200_90mu105progr$get_WORLDEmissions_ty,
#             aes(x=year, y=value, group=1, color = "_sDC pback550 gback025 ltpb2200 1.05mu2090progr"),
#             size = 1.1) +
#   
#   
#   geom_line(data= sDC_DIAG_80_gr5_p550g05_ltpb2200_90mu105progr$get_WORLDEmissions_ty,
#             aes(x=year, y=value, group=1, color = "_sDC pback550 gback05 ltpb2200 1.05mu2090progr"),
#             size = 1.1) +
#   
#   
#   geom_line(data= sDC_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr$get_WORLDEmissions_ty,
#             aes(x=year, y=value, group=1, color = "_sDC pback550 gback05 ltpb2150 1.05mu2090progr"),
#             size = 1.1) +
#   
#   geom_line(data= sDC_DIAG_80_gr5_p550g05_ltpb2100_90mu105progr$get_WORLDEmissions_ty,
#             aes(x=year, y=value, group=1, color = "_sDC pback550 gback05 ltpb2100 1.05mu2090progr"),
#             size = 1.1) +
#   
#   geom_line(data= sDC_DIAG_80_gr5_p334g05_ltpb2150_90mu105progr$get_WORLDEmissions_ty,
#             aes(x=year, y=value, group=1, color = "_sDC pback334 gback05 ltpb2150 1.05mu2090progr"),
#             size = 1.1) +
#   
#   
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c(  "black", "#DAA520","brown",  "#BC8F8F", "blue", "#800000", "#888000", gino_rain )) +
  
 
  
  ggtitle("World emissions with different fitting models: DIAG_30_gr5") + 
  xlab("Year") +
  ylab("World Emissions")  ; plottigat

 










###  TATM PLOT    #####

plottigat= ggplot() + 
  
  
  
  geom_line(data= sDC_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "_superDICE"),
            size = 1.1) +
  
  geom_line(data= sDCx_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "_superDICEX"),
            size = 1.1) +
  
  # 
  # geom_line(data= sDC_DIAG_30_const_ltpb2300$getVariable_ty("TATM"),
  #           aes(x=year, y=value, group=1, color = "_superDICE tend=2300"),
  #           size = 1.1) +
  # 
  # geom_line(data= sDC_DIAG_30_const_ltpb2200$getVariable_ty("TATM"),
  #           aes(x=year, y=value, group=1, color = "_superDICE tend=2200"),
  #           size = 1.1) +
  # 
  # geom_line(data= sDC_DIAG_30_const_ltpb2150$getVariable_ty("TATM"),
  #           aes(x=year, y=value, group=1, color = "_superDICE tend=2150"),
  #           size = 1.1) +
  # 
 
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c(  "#000000", "brown", "#BC8F8F", "#800000", "#DAA520", gino_rain )) +
  
  
  
  ggtitle("TATM with different MIU.up: DIAG_30_const") + 
  xlab("Year") +
  ylab("TATM")  ; plottigat



















###  MIU PLOT   #######

plottigat= ggplot() + 
  
  
  
  geom_line(data= sDCx_Amber_DIAG_80_gr5_p550g025$get_MIU_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1.1) +
  

  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c(  "#000000", "brown", "#BC8F8F", "#800000", "#DAA520", my_colors )) +
  
  
  
  ggtitle("MIU for DIAG_80_gr5, Amber (2070=1 -> 2150=1.2) ") + 
  xlab("Year") +
  ylab("TATM")  ; plottigat




########
















scenarioToPlot = sDC_DIAG_80_const_ltpb2150$get_Emissions_nty   #<<<< change this
advanceToCompare = ADV_CO2_WORLD.DIAG_C80_gr5   #<<<< change this


plottigat= ggplot() + 
  
  # Scenario
  geom_area(data=scenarioToPlot, aes(x=year, y=value, group=n, fill =n)) + 
  
  
  # ADVANCE trends
  geom_line(data= advanceToCompare,
            aes(x=year, y=value, group = model, color = model),
            size = 1.2) +
  
  # graphic details
  #scale_color_brewer(palette = "PRGn") +
  scale_color_manual(values = c("purple", "#000000", rainbow(24) )) +
  scale_fill_manual(values= my_colors ) +
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=4)) +
  # ggtitle(plot1title) + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat











