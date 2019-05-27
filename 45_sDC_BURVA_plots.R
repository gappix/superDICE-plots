



##  WORLD EMISSIONS DICE2016 #####

plottigat= ggplot() +
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "0 BAU DICE2016"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop DICE2016"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop DICE2016"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clDICE2016$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  
  ggtitle("World Emissions under different BURKEs — Climate DICE2016") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat



##  WORLD EMISSIONS WITCHcoop #####

plottigat= ggplot() +
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "0 BAU WITCHcoop"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop WITCHcoop"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop WITCHcoop"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop WITCHcoop"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop WITCHcoop"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop WITCHcoop"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop WITCHcoop"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw WITCHcoop"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw WITCHcoop"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clWITCHcoop$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw WITCHcoop"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  
  ggtitle("World Emissions under different BURKEs — Climate WITCHcoop") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat





##  WORLD EMISSIONS CBsimple #####

plottigat= ggplot() +
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "0 BAU CBsimple"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop CBsimple"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop CBsimple"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop CBsimple"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop CBsimple"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop CBsimple"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop CBsimple"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw CBsimple"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw CBsimple"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clCBsimple$get_WORLDEmissions_ty,
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw CBsimple"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  
  ggtitle("World Emissions under different BURKEs — Climate CBsimple") + 
  xlab("Year") +
  ylab("World Emissions FFI [GtCO2]")  ; plottigat







##  TATM WORLD CBsimple #####

plottigat= ggplot() +
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "0 BAU CBsimple"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop CBsimple"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop CBsimple"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop CBsimple"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop CBsimple"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop CBsimple"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop CBsimple"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw CBsimple"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw CBsimple"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw CBsimple"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  
  ggtitle("World Temperature Increase under different BURKEs — Climate CBsimple") + 
  xlab("Year") +
  ylab("°C")  ; plottigat












##  TATM WORLD WITCHcoop #####

plottigat= ggplot() +
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "0 BAU WITCHcoop"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop WITCHcoop"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop WITCHcoop"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop WITCHcoop"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop WITCHcoop"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop WITCHcoop"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop WITCHcoop"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw WITCHcoop"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw WITCHcoop"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw WITCHcoop"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  
  ggtitle("World Temperature Increase under different BURKEs — Climate WITCHcoop") + 
  xlab("Year") +
  ylab("°C")  ; plottigat





##  TATM WORLD DICE2016 #####

plottigat= ggplot() +
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "0 BAU DICE2016"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop DICE2016"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop DICE2016"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  


  ggtitle("World Temperature Increase under different BURKEs — Climate DICE2016") + 
  xlab("Year") +
  ylab("°C")  ; plottigat






##   MULTIPLE ALIGNED PLOTS: Emissions, T_local, MIU per country ######

library(grid)
library(ggpubr)

regionToCompare = "chn"
regionToCompareDescription = "CHINA"


# Create the 3 plots.
plot1= ggplot() +
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "0 BAU DICE2016"),
            size = 1.0) +
  
  
  #coop


  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop DICE2016"),
            size = 1.0) +


  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop DICE2016"),
            size = 1.0) +

  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop DICE2016"),
            size = 1.0) +



  #noncoop


  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop DICE2016"),
            size = 1.0) +


  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop DICE2016"),
            size = 1.0) +

  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop DICE2016"),
            size = 1.0) +


  #coopngsw

  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw DICE2016"),
            size = 1.0) +


  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw DICE2016"),
            size = 1.0) +

  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clDICE2016$getVariable_nty("E")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw DICE2016"),
            size = 1.0) +

  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  ggtitle("Local Emissions FFI") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]");  




plot2 = ggplot() +
  
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "0 BAU DICE2016"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop DICE2016"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop DICE2016"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clDICE2016$getVariable_nty("T_LOCAL")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  ggtitle("Local Temperature") + 
  xlab("Year") +
  ylab("ºC"); 





plot3 = ggplot() +
  
  
  
  geom_line(data= sDC_SILICA.BURVA.BAU_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "0 BAU DICE2016"),
            size = 1.0) +
  
  
  #coop
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKEBase_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "1 BURKE-Base Coop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKESRdiff_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "2 BURKE-SRdiff Coop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coop_BURKELR_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "3 BURKE-LR Coop DICE2016"),
            size = 1.0) +
  
  
  
  #noncoop
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKEBase_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "4 BURKE-Base NonCoop DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKESRdiff_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "5 BURKE-SRdiff NonCoop DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.noncoop_BURKELR_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "6 BURKE-LR NonCoop DICE2016"),
            size = 1.0) +
  
  
  #coopngsw
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKEBase_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "7 BURKE-Base CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "8 BURKE-SRdiff CoopNgsw DICE2016"),
            size = 1.0) +
  
  geom_line(data= sDC_SILICA.BURVA.coopngsw_BURKELR_clDICE2016$getVariable_nty("MIU")%>% filter(n==regionToCompare),
            aes(x=year, y=value, group=1, color = "9 BURKE-LR CoopNgsw DICE2016"),
            size = 1.0) +
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#4a4a4a",
                                  
                                  #greens
                                  "#32c738",  
                                  "#046918",
                                  "#8232c7", 
                                  
                                  "blue",
                                  "#450094",
                                  "#f77f2f", 
                                  
                                  "orange",
                                  "#c4570e",
                                  "#4cf5d6" , 
                                  
                                  
                                  "#0ccfab",
                                  "#d64cf5", 
                                  "#cf0cb2",
                                  "#9c4317", 
                                  "#9c1717"
                                  
                                  
  )) +
  
  
  ggtitle("Regional Abatement") + 
  xlab("Year") +
  ylab("%"); 


#........... all the plots condensed

boh <- ggarrange(plot1, plot3, plot2, ncol=1, nrow=3, common.legend = TRUE, legend="right")
annotate_figure(boh, top = text_grob(paste0("Details for - ", regionToCompareDescription, "- region"), face="bold"))


