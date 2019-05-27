


## CMOD ####
sDC_SILICA.CMOD.BAU_clDICE2016  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_DICE2016.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.BAU_clWITCHcoop =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_WITCHcoop.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.BAU_clCBsimple  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_clCBsimple_cool8.gdx", gdx_experiment_directory = "CMOD")


sDC_SILICA.CMOD.noncoop_BURKE_clDICE2016  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_BURKE_DICE2016.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.noncoop_BURKE_clWITCHcoop =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_BURKE_WITCHcoop.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.noncoop_BURKE_clCBsimple  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_BURKE_CBsimple_cool8.gdx", gdx_experiment_directory = "CMOD")


sDC_SILICA.CMOD.coop_BURKE_clDICE2016  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coop_BURKE_DICE2016.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.coop_BURKE_clWITCHcoop =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coop_BURKE_WITCHcoop.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.coop_BURKE_clCBsimple  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coop_BURKE_CBsimple_cool8.gdx", gdx_experiment_directory = "CMOD")


sDC_SILICA.CMOD.coopngsw_BURKE_clDICE2016  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coopngsw_BURKE_DICE2016.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.coopngsw_BURKE_clWITCHcoop =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coopngsw_BURKE_WITCHcoop.gdx", gdx_experiment_directory = "CMOD")
sDC_SILICA.CMOD.coopngsw_BURKE_clCBsimple  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coopngsw_BURKE_CBsimple_cool8.gdx", gdx_experiment_directory = "CMOD")





##  TATM GLOBAL  #####

plottigat= ggplot() +
  
  
  
  geom_line(data= sDC_SILICA.CMOD.coopngsw_BURKE_clCBsimple$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "1 CBsimple climate coopngsw"),
            size = 1.1) + 

  geom_line(data= sDC_SILICA.CMOD.coopngsw_BURKE_clDICE2016$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "2 DICE2016 climate coopngsw"),
            size = 1.1) + 
  
  geom_line(data= sDC_SILICA.CMOD.coopngsw_BURKE_clWITCHcoop$getVariable_ty("TATM"),
            aes(x=year, y=value, group=1, color = "3 WITCHcoop climate coopngsw"),
            size = 1.1) + 
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#228B22" , "brown" ,"#DAA520" ,   "#BC8F8F", "#800000", "#888000", gino_rain )) +
  
  
  
  ggtitle("Atmosphere Temperature Increase over 1900 level: coopngsw") + 
  xlab("Year") +
  ylab("°C")  ; plottigat







##  FORC GLOBAL  #####

plottigat= ggplot() +
  
  
  geom_line(data= sDC_SILICA.CMOD.coopngsw_BURKE_clCBsimple$getVariable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "1 CBsimple climate coopngsw"),
            size = 1.1) + 
  
  geom_line(data= sDC_SILICA.CMOD.coopngsw_BURKE_clDICE2016$getVariable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "2 DICE2016 climate coopngsw"),
            size = 1.1) + 
  
  geom_line(data= sDC_SILICA.CMOD.coopngsw_BURKE_clWITCHcoop$getVariable_ty("FORC"),
            aes(x=year, y=value, group=1, color = "3 WITCHcoop climate coopngsw"),
            size = 1.1) + 
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(values =  c( "black", "#228B22" , "brown" ,"#DAA520" ,   "#BC8F8F", "#800000", "#888000", gino_rain )) +
  
  
  
  ggtitle("Increase in radiative forcing [W/m^2]: coopngsw") + 
  xlab("Year") +
  ylab("W/m^2")  ; plottigat
