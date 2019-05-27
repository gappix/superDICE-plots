



##  WORLD EMISSIONS #####

plottigat= ggplot() +


  geom_line(data= sDC_SILICA_CMOD__BAU_DICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDC BAU"),
            size = 1.1) +
  
  
  #noncoop
  


  geom_line(data= sDC_SILICA_CMOD__noncoop_BURKE_DICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDC noncoop BURKE"),
            size = 1.1) +

  geom_line(data= sDC_SILICA_CMOD__noncoop_DICEreg_DICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDC noncoop DICEreg"),
            size = 1.1) +


  



  # coop

  
  
  geom_line(data= sDC_SILICA_CMOD__coop_BURKE_DICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDC coop BURKE"),
            size = 1.1) +
  
  geom_line(data= sDC_SILICA_CMOD__coop_DICEreg_DICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDC coop DICEreg"),
            size = 1.1) +
  
  
  
  
  

  # coop Negishi
  


  

  geom_line(data= sDC_SILICA_CMOD__coopngsw_BURKE_DICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDC coopngsw BURKE"),
            size = 1.1) +
  
  geom_line(data= sDC_SILICA_CMOD__coopngsw_DICEreg_DICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDC coopngsw DICEreg"),
            size = 1.1) +
  

  

  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", 
                                  
                                  #greens
                                  "#80df84",
                                 "#32c76b",
                                ##  "#5dc732",
                                #  "#134d16",
                                
                                #blues 
                                "#2e9ee8",
                                "#2e60e8",
                                
                                  
                                  #oranges
                                  
                                  "#e8952e",
                                 "#f2c48a",
                                 # "orange",
                                 # "red",
                                  
                                  #blues 
                                  "#7c2ee8"
                                 # "#938af2"
                                  
                                  
                                  )) +
  
  
  
  ggtitle("superDICE World Emissions") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat











##______________________________________


##  WORLD EMISSIONS WITH SSP IIASA COMPARISON #####


median_sspDB_emi_rcp26 =  iamcDB_ssp2_rcp26_EFFI  %>%
  select(model, year, value) %>%
  group_by(year)    %>%
  summarise(value = mean(value))         %>%
  select( year, value)  %>% filter(year >= 2015)




plottigat= ggplot() +
  
  

  
  
  # IIASA
  
  geom_line(data= iamcDB_ssp2_rcp26_EFFI  %>% filter(year >= 2015),
            aes(x=year, y=value, group=model, color =model),
            size = 0.8) +
  
  geom_line(data= median_sspDB_emi_rcp26,
            aes(x=year, y=value, group=1, color ="__median"),
            linetype="dashed",
            size = 1) +

  
  
  
  
  # CO2 budget
  
  
  # geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in20$get_WORLDEmissions_ty%>%filter(year<= 2125),
  #           aes(x=year, y=value, group=1, color ="_sDC coop LINT"),
  #           size = 1.5) +
  # 
  # geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LIN$get_WORLDEmissions_ty%>%filter(year<= 2125),
  #           aes(x=year, y=value, group=1, color ="_sDC coop LIN"),
  #           size = 1.5) +
  # 
  # geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_EIN13$get_WORLDEmissions_ty%>%filter(year<= 2125),
  #           aes(x=year, y=value, group=1, color ="_sDC coop EIN"),
  #           size = 1.5) +

  #coop
  
  
  geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in20$get_WORLDEmissions_ty%>%filter(year<= 2125),
            aes(x=year, y=value, group=1, color ="_sDC coop LINT sfx03 in20"),
            size = 1.5) +


  geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in15$get_WORLDEmissions_ty%>%filter(year<= 2125),
            aes(x=year, y=value, group=1, color ="_sDC coop LINT sfx03 in15"),
            size = 1.5) +

  geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in25$get_WORLDEmissions_ty%>%filter(year<= 2125),
            aes(x=year, y=value, group=1, color ="_sDC coop LINT sfx03 in25"),
            size = 1.5) +
  
  
  geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LINTsfx001in20$get_WORLDEmissions_ty%>%filter(year<= 2125),
            aes(x=year, y=value, group=1, color ="_sDC coop LINT sfx001 in20"),
            size = 1.5) +
  
  
  geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LINTsfx001in15$get_WORLDEmissions_ty%>%filter(year<= 2125),
            aes(x=year, y=value, group=1, color ="_sDC coop LINT sfx001 in15"),
            size = 1.5) +
  

  
  
  
  
  
  #coopnsgw
  
  # geom_line(data= sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in15$get_WORLDEmissions_ty%>%filter(year<= 2125),
  #           aes(x=year, y=value, group=1, color ="_sDC coopngsw  LINT sfx03 in15"),
  #           size = 1.5) +
  # 
  # geom_line(data= sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in25$get_WORLDEmissions_ty%>%filter(year<= 2125),
  #           aes(x=year, y=value, group=1, color ="_sDC coopngsw LINT sfx03 in25"),
  #           size = 1.5) +
  # 
  # geom_line(data= sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in20$get_WORLDEmissions_ty%>%filter(year<= 2125),
  #           aes(x=year, y=value, group=1, color ="_sDC coopngsw LINT sfx03 in20"),
  #           size = 1.5) +
  
  
  
  #other experiments
  
  # geom_line(data= sDCx_AmberPW_MIU2__coop_OFF_LINTmiumin2070$getVariable_ty("world_E"),
  #           aes(x=year, y=value, group=1, color ="_sDC coopngsw OFF MIU2 LINT001t15 miu >1 from 2070"),
  #           size = 1.1) +



  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c("black", "#0b1c6e", "#0087e0", "blue", "#bd003f" ,"#bd3f00",   "#006b09", brewer.pal(8, "Dark2"))) +
  
  
  
  ggtitle("World Emissions: MIU inertia, carbon budget") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat



#colors





#_______________________________________







##  WORLD EMISSIONS MULTIPLE ALIGNED PLOTS ######

library(grid)


#' Create some data to play with. Two time series with the same timestamp.
df <- data.frame(DateTime = ymd("2010-07-01") + c(0:8760) * hours(2), series1 = rnorm(8761), series2 = rnorm(8761, 100))

#' Create the two plots.
plot1= ggplot() +
  
  
  geom_line(data= sDCx_Amber_BAU$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  
  #noncoop
  
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__damages_BURKE_EIN$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE EIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__damages_BURKE_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE LINT"),
            size = 1.1) +
  
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__damages_BURKE_LIN$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_noncoop_damages_BURKE$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE OFF"),
            size = 1.1) + 
  

  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black","#228B22","brown"  ,"#DAA520" ,   "blue", "#800000", "#888000", gino_rain )) +
  
  
  
  ggtitle("World Emissions noncoop") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ;




plot2 = ggplot() +
  
  
  geom_line(data= sDCx_Amber_BAU$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  

  # coop
  
  geom_line(data= sDCx_coop_ssp2_AmberPW__damages_BURKE_EIN$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE EIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_coop_ssp2_AmberPW__damages_BURKE_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LINT"),
            size = 1.1) +
  
  geom_line(data= sDCx_coop_ssp2_AmberPW__damages_BURKE_LIN$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_coop_damages_BURKE$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE OFF"),
            size = 1.1) +
  

  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black","#228B22","brown"  ,"#DAA520" ,   "blue", "#800000", "#888000", gino_rain )) +
  
  
  
  ggtitle("World Emissions coop ") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ;


plot3 =  ggplot() +
  
  
  geom_line(data= sDCx_Amber_BAU$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "_sDCx BAU"),
            size = 1.1) +
  
  
  #coop Negishi

  geom_line(data= sDCx_coop_AmberPW_MUinertial_damages_DICEreg_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg LINT "),
            size = 1.1) +
  
  
  geom_line(data= sDCx_coop_AmberPW_MUinertial_damages_DICEreg_LINT_NgsW$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg LINT NgsW "),
            size = 1.1) +
  
  geom_line(data= sDCx_noncoop_AmberPW_MUinertial_damages_DICEreg_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg LINT "),
            size = 1.1) +
  
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "blue","#228B22","brown"  ,"#DAA520" , gino_rain )) +
  
  
  
  ggtitle("World Emissions coop Negishi") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ;




#........... all the plots condensed

grid.newpage()
grid.draw(rbind( ggplotGrob(plot3), size = "last"))



##  TATM GLOBAL  #####

plottigat= ggplot() +
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) + 

  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LINT$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LINT"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_DICEreg_LINT$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg LINT "),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LINT"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_DICEreg_LINT$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw DICEreg LINT "),
            size = 1.1) +
  
  
  # geom_line(data= sDCx_Amber_coop_damages_DICEreg$getVariable_ty("TATM"),
  #           aes(x=year, y=value, group=1, color = "sDCx coop DICEreg"),
  #           size = 1.1) + 
  # 
  # geom_line(data= sDCx_Amber_noncoop_damages_DICEreg$getVariable_ty("TATM"),
  #           aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg"),
  #           size = 1.1) + 
  # 
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#228B22" , "brown" ,"#DAA520" ,   "#BC8F8F", "#800000", "#888000", gino_rain )) +
  
  
  
  ggtitle("Atmosphere Temperature Increase over 1900 level") + 
  xlab("Year") +
  ylab("°C")  ; plottigat








##  MIU PLOT   #######

plottigat= ggplot() + 
  
  
  
  geom_line(data= sDC_SILICA_CMOD__noncoop_BURKE_DICE2016$getVariable_nty("DAMAGES"),
            aes(x=year, y=value, group=n, color = n),
            size = 1.2) +
  
  
  # graphic details
  guides(colour=guide_legend(ncol=3)) +
  scale_color_manual(values = c(   "brown", "#BC8F8F", "#800000", "#DAA520", my_colors )) +
  
  
  
  ggtitle("Damages per region") + 
  xlab("Year") +
  ylab("Damages [Trill USD/Year]")  ; plottigat


##  GDP or other nty variable  PLOT   #######

plottigat= ggplot() + 
  
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$getVariable_ty("CCA"),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) + 
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LINT$getVariable_ty("CCA"),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LINT"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_DICEreg_LINT$getVariable_ty("CCA"),
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg LINT "),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$getVariable_ty("CCA"),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LINT"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_DICEreg_LINT$getVariable_ty("CCA"),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw DICEreg LINT "),
            size = 1.1) +
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c(  "#000000", "brown", "#BC8F8F", "#800000", "#DAA520", my_colors )) +
  
  
  
  ggtitle("") + 
  xlab("Year") +
  ylab("Cumulated emissions [GtC] ")  ; plottigat





##  MIU COMPARISON BY REGION   #######

regionToCompare = "chn"
plottigat= ggplot() + 
  
  
  
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__ctax_DIAG_C80_gr5_LIN$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx LIN"),
            size = 1.1) +
  

  geom_line(data= sDCx_noncoop_ssp2_AmberPW__ctax_DIAG_C80_gr5_LINT$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx LINT"),
            size = 1.1) +
  
  
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__ctax_DIAG_C80_gr5_EINe$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx EINe"),
            size = 1.1) +
  
  
  geom_line(data= sDCx_Amber_DIAG_80_gr5_powerfit$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx OFF"),
            size = 1.1) +
  
  
  
  

  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  #scale_color_manual(values = c(    my_colors )) +
  
  
  
  ggtitle("MIUs for BRAZIL region") + 
  xlab("Year") +
  ylab("MIU [%]")  ; plottigat








##  STACKED EMISSIONS   #######

sDCx_AmberPW_MUInertial__coop_BURKE_LIN

plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$get_Emissions_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx BAU total"),
            size = 1.1) +
  
  # graphic details
  scale_fill_manual(values= my_colors ) +
  scale_color_manual(values = "black" ) +
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=3)) +
  
  ggtitle("Emissions Stacked coop Negishi BURKE LINT") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat


# ...if you need to readjust colors.....
#my_colors = sample(my_colors)





##  EMISSIONS COMPARISON BY REGION   #######

regionToCompare = "nde"
plottigat= ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  # coop

  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_OFF$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE No Inertia"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LIN$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LINT$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LINT"),
            size = 1.1) +
  
  
  
  # coop ngsw
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_OFF$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE No Inertia"),
            size = 1.1) +
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LIN$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LINT"),
            size = 1.1) +
  
  
  
  #noncoop
  
  geom_line(data= sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT$get_Emissions_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE LINT"),
            size = 1.1) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff", gino_rain )) +
  
  
  
  ggtitle(paste0("Emissions for ", regionToCompare, " region")) + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat




##  YNET COMPARISON BY REGION   #######

regionToCompare = "chn"
plottigat= ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_Amber_BAU$getVariable_nty("YNET") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  # others
  
  geom_line(data= sDCx_Amber_noncoop_damages_BURKE$getVariable_nty("YNET") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE"),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_coop_damages_BURKE$getVariable_nty("YNET") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_noncoop_damages_BURKE$getVariable_nty("YNET") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE PW"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_coop_damages_BURKE$getVariable_nty("YNET") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE PW"),
            size = 1.1) +
  # 
  # geom_line(data= sDCx_Amber_noncoop_damages_DICEreg$getVariable_nty("YNET") %>% filter(n==regionToCompare),
  #           aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg"),
  #           size = 1.1) +
  # 
  # geom_line(data= sDCx_Amber_coop_damages_DICEreg$getVariable_nty("YNET") %>% filter(n==regionToCompare),
  #           aes(x=year, y=value, group=1, color = "sDCx coop DICEreg"),
  #           size = 1.1) +
  # 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff" )) +
  
  
  
  ggtitle("GDP NET for CHINA region") + 
  xlab("Year") +
  ylab("Trill USD")  ; plottigat






##  TLOCAL COMPARISON BY REGION   #######

regionToCompare = "rus"
plottigat= ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_Amber_BAU$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +

  # others
  
  geom_line(data= sDCx_Amber_noncoop_damages_BURKE$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE"),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_coop_damages_BURKE$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE"),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_noncoop_damages_DICEreg$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg"),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_coop_damages_DICEreg$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg"),
            size = 1.1) +
  
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff" )) +
  
  
  
  ggtitle("TLOCAL for RUSSIA region") + 
  xlab("Year") +
  ylab("°C")  ; plottigat




##  CONSUMPTION COMPARISON BY REGION   #######

regionToCompare = "usa"
plottigat= ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_Amber_BAU$getVariable_nty("C") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  # others
  
  geom_line(data= sDCx_Amber_noncoop_damages_BURKE$getVariable_nty("C") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE"),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_coop_damages_BURKE$getVariable_nty("C") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE"),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_noncoop_damages_DICEreg$getVariable_nty("C") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg"),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_coop_damages_DICEreg$getVariable_nty("C") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg"),
            size = 1.1) +
  
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff" )) +
  
  
  
  ggtitle("Consumption for USA region") + 
  xlab("Year") +
  ylab("Trill USD")  ; plottigat











regionToCompare = "rus"
plotMIU = ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  # coop
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_OFF$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE No Inertia"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LIN$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LINT$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LINT"),
            size = 1.1) +
  
  
  
  # coop ngsw
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_OFF$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE No Inertia"),
            size = 1.1) +
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LIN$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LINT"),
            size = 1.1) +
  
  
  
  #noncoop
  
  geom_line(data= sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT$get_MIU_nty %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE LINT"),
            size = 1.1) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff", gino_rain )) +
  
  
  
  ggtitle(paste0("MIU for ", regionToCompare, " region")) + 
  xlab("Year") +
  ylab("Abatement Decision [%]")  ;


plotDAMAGES = ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  # coop
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_OFF$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE No Inertia"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LIN$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LINT$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LINT"),
            size = 1.1) +
  
  
  
  # coop ngsw
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_OFF$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE No Inertia"),
            size = 1.1) +
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LIN$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LINT"),
            size = 1.1) +
  
  
  
  #noncoop
  
  geom_line(data= sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT$getVariable_nty("DAMAGES") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE LINT"),
            size = 1.1) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff", gino_rain )) +
  
  
  
  ggtitle(paste0("DAMAGES for ", regionToCompare, " region")) + 
  xlab("Year") +
  ylab("Damages [Trill 2005 USD per year]")  ;




plotTATMreg = ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx BAU"),
            size = 1.1) +
  
  # coop
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_OFF$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE No Inertia"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LIN$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LINT$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE LINT"),
            size = 1.1) +
  
  
  
  # coop ngsw
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_OFF$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE No Inertia"),
            size = 1.1) +
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LIN$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LIN"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE LINT"),
            size = 1.1) +
  
  
  
  #noncoop
  
  geom_line(data= sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT$getVariable_nty("T_LOCAL") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE LINT"),
            size = 1.1) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff", gino_rain )) +
  
  
  
  ggtitle(paste0("Local Temperature for ", regionToCompare, " region")) + 
  xlab("Year") +
  ylab("Temperatue [°C]")  ;



grid.newpage()
grid.draw(rbind( ggplotGrob(plotMIU), ggplotGrob(plotDAMAGES), ggplotGrob(plotTATMreg), size = "last"))

