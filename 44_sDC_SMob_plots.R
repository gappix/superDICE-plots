



##  WORLD EMISSIONS #####

plottigat= ggplot() +
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx BAU SFX"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPWLINT_SMob__BAU$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx BAU SMob"),
            size = 1.1) +
  
  
  #noncoop
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT$get_WORLDEmissions_ty,
           aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE SFX"),
           size = 1.1) +

  geom_line(data= sDCx_AmberPW_MUInertial__noncoop_DICEreg_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg SFX"),
            size = 1.1) +

  geom_line(data= sDCx_AmberPWLINT_SMob__noncoop_BURKE$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE SMob"),
            size = 1.1) +

  geom_line(data= sDCx_AmberPWLINT_SMob__noncoop_DICEreg$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg SMob"),
            size = 1.1) +
  

# coop


  geom_line(data= sDCx_AmberPW_MUInertial__coop_BURKE_LINT$get_WORLDEmissions_ty,
          aes(x=year, y=value, group=1, color = "sDCx coop BURKE SFX"),
          size = 1.1) +
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coop_DICEreg_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg SFX"),
            size = 1.1) +

  
  
  geom_line(data= sDCx_AmberPWLINT_SMob__coop_BURKE$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE SMob"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPWLINT_SMob__coop_DICEreg$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg SMob"),
            size = 1.1) +
  
  
  
  
  # coop Negishi
  
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE SFX"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_DICEreg_LINT$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coopngsw DICEreg SFX"),
            size = 1.1) +
  
  
  geom_line(data= sDCx_AmberPWLINT_SMob__coopngsw_BURKE$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE SMob"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPWLINT_SMob__coopngsw_DICEreg$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "sDCx coopngsw DICEreg SMob"),
            size = 1.1) +
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                               "#32c738",  "#046918",
                                  
                               "#8232c7", "#450094",
                               
                               "#f77f2f", "#c4570e",
                               
                               "#4cf5d6" , "#0ccfab",
                               
                               "#d64cf5", "#cf0cb2",
                               
                               "#9c4317", "#9c1717"
                                  
                                  
  )) +
  
  
  
  ggtitle("World Emissions: Sfix and Smob") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat















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
  
  
  
  geom_line(data= sDCx_AmberPW_MUInertial__coopngsw_BURKE_OFF$get_MIU_nty,
            aes(x=year, y=value, group=n, color = n),
            size = 1.1) +
  
  
  # graphic details
  guides(colour=guide_legend(ncol=3)) +
  scale_color_manual(values = c(  "#000000", "brown", "#BC8F8F", "#800000", "#DAA520", my_colors )) +
  
  
  
  ggtitle("MIUs coop negishi, BURKE, No Inertia") + 
  xlab("Year") +
  ylab("MIU [%]")  ; plottigat


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
  geom_area(data= sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT$get_Emissions_nty,
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





















regionToCompare = "rus"
plotSreg = ggplot() + 
  
  
  #BAU
  
  geom_line(data= sDCx_AmberPWLINT_SMob__BAU$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx  BAU"),
            size = 1.1) +
  
  geom_line(data= sDCx_AmberPW_MUInertial__BAU$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx  SFX"),
            size = 1.1) +


  # coop

  geom_line(data= sDCx_AmberPWLINT_SMob__coop_BURKE$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop BURKE "),
            size = 1.1) +

  geom_line(data= sDCx_AmberPWLINT_SMob__coop_DICEreg$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coop DICEreg "),
            size = 1.1) +

  # coop ngsw
  geom_line(data= sDCx_AmberPWLINT_SMob__coopngsw_BURKE$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw BURKE "),
            size = 1.1) +

  geom_line(data= sDCx_AmberPWLINT_SMob__coopngsw_DICEreg$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx coopngsw DICEreg "),
            size = 1.1) +


  #noncoop
  geom_line(data= sDCx_AmberPWLINT_SMob__noncoop_BURKE$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop BURKE "),
            size = 1.1) +

  geom_line(data= sDCx_AmberPWLINT_SMob__noncoop_DICEreg$getVariable_nty("S") %>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "sDCx noncoop DICEreg "),
            size = 1.1) +

  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values = c( "black", "#f0883a", "#79a341", "#3aa2f0", "#b76eff", gino_rain )) +
  
  
  
  ggtitle(paste0("Saving rate for ", regionToCompare, " region")) + 
  xlab("Year") +
  ylab(" [%]")  ; plotSreg;



grid.newpage()
grid.draw(rbind( ggplotGrob(plotMIU), ggplotGrob(plotDAMAGES), ggplotGrob(plotSreg), size = "last"))

