source("00_environment_setting.R")
source("10_data_basic_functions.R")
source("18_gdx_class.R")


## EXPERIMENTS DATA    --------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


# Experiments datapath

data_path   = "C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sunRICE-development/sDCdata_enerdata56_t58/"
resuts_path = "C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sunRICE-development/baselines/baselines_results/"


# All experiments raw data 

ssplist = list()

# first stage
ssplist$m_A_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_A.gdx"))
ssplist$m_B_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_B.gdx"))
ssplist$m_C_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_C.gdx"))
ssplist$m_D_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_D.gdx"))

ssplist$m_E_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_E.gdx"))


ssplist$m_F_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_F.gdx"))
ssplist$m_G_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_G.gdx"))
ssplist$m_H_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_H.gdx"))
ssplist$m_I_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_I.gdx"))
ssplist$m_J_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_J.gdx"))
ssplist$m_K_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_K.gdx"))
ssplist$m_L_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_L.gdx"))
ssplist$m_M_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_M.gdx"))
ssplist$m_N_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_N.gdx"))







ssplist$y_B_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__Ky__By.gdx"))
ssplist$y_C_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Cy.gdx"))
ssplist$y_D_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Dy.gdx"))
ssplist$y_E_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ey.gdx"))
ssplist$y_F_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Fy.gdx"))
ssplist$y_G_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Gy.gdx"))
ssplist$y_H_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Hy.gdx"))
ssplist$y_I_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Iy.gdx"))
ssplist$y_J_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Jy.gdx"))
ssplist$y_K_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ky.gdx"))
ssplist$y_L_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ly.gdx"))
ssplist$y_M_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__My.gdx"))
ssplist$y_N_y = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ny.gdx"))



#...
ssplist$n_B_n = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ny_B.gdx"))
ssplist$n_C_n = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ny_C.gdx"))
ssplist$n_D_n = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ny_D.gdx"))
ssplist$n_E_n = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ny_E.gdx"))


## OTHER DATA MANAGEMENT  ------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


## IIASA SSP DATA
source("35_SSP_IIASA_data_management.R")


## ENERDATA BAU Emissions
source("34_EnerData_BAU.R")




## SIGMA Soft Costraints
#
# to evaluate tem are needed 
#  - ykali(ssp)



ykali_gdx = gdx(paste0(data_path,"sDCdata_baseline_ssp_pop_ykali.gdx")) 

ssp_ykali = ykali_gdx["ssp_ykali"] %>% mutate(year= 2010 + (as.numeric(t) * 5)) %>% rename(ssp = V1) %>% select(-t)

sigma_constraints_2300s01 = ssp_ykali %>% mutate(softUC_emi = 0.01 * value) %>% select(-value)  %>% dplyr::group_by(ssp,year) %>% summarise(softUC_Wemi = sum(softUC_emi)) %>% filter(year == 2300) %>% as.data.frame()
sigma_constraints_2300s1 = ssp_ykali %>% mutate(softUC_emi = 0.1 * value) %>% select(-value)  %>% dplyr::group_by(ssp,year) %>% summarise(softUC_Wemi = sum(softUC_emi)) %>% filter(year == 2300) %>% as.data.frame()



## HISTORICAL DATA
hist_gdx  <- gdx(paste0(data_path,"sDCdata_historical_values.gdx"))
hist_world_emi = hist_gdx["q_emi_valid_primap"] %>% 
  rename(year = V2) %>% 
  #mutate(value = value*44/12 ) %>% 
  filter(year %in% c("2000","2005","2010")) %>% 
  mutate(year = as.numeric(year)) %>%
  select(-V1) %>%
  group_by(year) %>%
  summarise(value = sum(value)) %>%
  as.data.frame()


## Mapping ED57 -> R5
#
# aggregating ed57 regions into r5 ones 
# by exploiting RICE50+ inner mapping.
# Output is a table  | ED57 | R5 |

gdxr5   = GDXclass(paste0("C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-results/SIMtest/r5/","sunRC__SIM__r5__kaliPUMICE__expSIMtest__ssp2__noncoop__clWITCHco2__damBURKESR__SRfix__polBAU_xxBurkeEsteem_iso3_omega0.gdx"))
gdxed57 = GDXclass(paste0("C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-results/SIMtest/enerdata56/","sunRC__SIM__enerdata56__kaliPUMICE__expSIMtest__ssp2__noncoop__clWITCHco2__damBURKESR__SRfix__polBAU_xxBurkeEsteem.gdx"))
map_ed57_iso3      = gdxed57$get_Parameter("map_n_iso3")
map_ed57_iso3$iso3 = toupper(map_ed57_iso3$iso3)
map_r5_iso3      = gdxr5$get_Parameter("map_n_iso3")
map_r5_iso3$iso3 = toupper(map_r5_iso3$iso3)
map_r5_ed57      = merge(map_ed57_iso3,map_r5_iso3, by = c("iso3")) %>% rename(ed57 = n.x, r5 = n.y) %>% select(-iso3) %>% distinct() %>% filter(!(ed57=="rjan57" & r5 =="r5asia"))  %>% filter(!(ed57=="oeu" & r5 =="r5ref"))


## Loading original BAU for SSP2

gdxBAU =  GDXclass(paste0("C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-results/TBD/enerdata56/","sunRC__enerdata56__kaliPUMICE__expTBD__ssp2__noncoop__clWITCHco2__damOFF__SRfix__polBAU.gdx"))





##  SSP< 1 > FULL      --------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp1"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP1-Baseline")
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))
 



plottigat= ggplot() +
  
  
  
  # Historical emissions

  
  

  
  # SSP model
  
  geom_line(data= my_sspIIASA ,
            aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
            size = 1.2)  + 
  

  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  geom_line(data= ssplist$m_A_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +

  # geom_line(data= ssplist$y_B_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_B"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_C_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_C"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_D_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_D"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_E_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_E"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_F_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_F"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_G_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_G"),
  #           size = 1.1) +
  # 
  # 
  # geom_line(data= ssplist$y_H_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_H"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_I_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_I"),
  #           size = 1.1) +
  # 
  # 
  # geom_line(data= ssplist$y_J_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_J"),
  #           size = 1.1) +
  # 
  # 
  # geom_line(data= ssplist$y_J_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_K"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_L_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_L"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_M_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_M"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$y_N_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_N"),
  #           size = 1.1) +
  # 
  # 
  # 
  # 
  # 
  # 
  # Enerdata emissions
  
  
  # geom_point(data= EnerData_World_BAU,
  #           aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
  #           
  #           shape = 19,
  #           size = 2.4) + 
  
  
  
  # Soft  constraint
  
  geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
             aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
             shape= 18,  #diamond
             size = 3) + 
  

  
  # SSP marker
  
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
  
  


  # graphic details
  scale_color_manual(  values =  c("sUC <.1"           = "black",
                                 "sUC <.01"            = "black",
                                 "IIASA SSP Baselines" = "#8585ad", #dark grey
                                 "IIASA SSP Marker"    = "black",
                                 "EnerData Blue BAU"   = "black",
                                  
                                 "test_A"  =  "#fff100", #yellow
                                  
                                 "test_B"  =  "#f77f2f", #orange
                                 "test_C"  =  "#db0f20", 
                                 "test_D"  =  "red",      # red
                                 
                                 "test_E"  =  "#d64cf5", # pink
                                  
                                 "test_F"  =  "#8232c7", #violet
                                 "test_G"  =  "#450094",
                                   
                                 "test_H"  =  "blue",   #blue
                                 "test_I"  =  "#0f86db",
                                 "test_J"  =  "#0ccfab",
                                  
                                 "test_K"  =  "green",  #greens
                          
                                 "test_L"  =  "#32c738",  
                                 "test_M"  =  "#046918",
                                  
                                  
                                  
                                 "test_N"  =  "#c4570e",  # brown
                                 "test_O"  =  "#9c4317"
                                 )) +
  

  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
  #                                                               "test_C"  =  "solid",
  #                                                               "test_D"  =  "solid",      # red
  #                                                               "test_E"  =  "solid", # pink
  #                                                               "test_F"  =  "solid", #violet
  #                                                               "test_G"  =  "solid",
  #                                                               "test_H"  =  "solid",   #blue
  #                                                               "test_I"  =  "solid",
  #                                                               "test_J"  =  "solid",
  #                                                               "test_K"  =  "solid",
  #                                                               "test_L"  =  "solid",  
  #                                                               "test_M"  =  "solid",
  #                                                               "test_N"  =  "solid")))) + 


  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 26),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +

  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat






##  SSP< 1 >   SELECTION       ---------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp1"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP1-Baseline")
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))




plottigat= ggplot() +
  
  
  
  # Historical emissions
  
  
  
  
  
  # SSP model
  
geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  
  geom_line(data= ssplist$y_A_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
  
  
  geom_line(data= ssplist$y_C_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  

  geom_line(data= ssplist$y_E_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_E"),
            size = 1.1) +
  
  geom_line(data= ssplist$y_F_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_F"),
            size = 1.1) +
  

  
  geom_line(data= ssplist$y_H_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_H"),
            size = 1.1) +
  
  geom_line(data= ssplist$y_I_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_I"),
            size = 1.1) +
  
  
  geom_line(data= ssplist$y_J_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_J"),
            size = 1.1) +
  

  geom_line(data= ssplist$y_L_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_L"),
            size = 1.1) +
  
  geom_line(data= ssplist$y_M_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_M"),
            size = 1.1) +
  
  geom_line(data= ssplist$y_N_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_N"),
            size = 1.1) +
  
  
  



# Enerdata emissions


# geom_point(data= EnerData_World_BAU,
#           aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
#           
#           shape = 19,
#           size = 2.4) + 



# Soft  constraint

geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
           aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
           shape= 18,  #diamond
           size = 3) + 
  
  
  
  # SSP marker
  
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"           = "black",
                                   "sUC <.01"            = "black",
                                   "IIASA SSP Baselines" = "#8585ad", #dark grey
                                   "IIASA SSP Marker"    = "black",
                                   "EnerData Blue BAU"   = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat







##  SSP< 2 >   FULL     -------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp2"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP2-Baseline")


plottigat= ggplot() +
  
  
  
  # SSP model

geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  geom_line(data= ssplist$m_A_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +

  geom_line(data= ssplist$m_B_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  geom_line(data= ssplist$m_C_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  
  geom_line(data= ssplist$m_D_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_D"),
            size = 1.1) +

  geom_line(data= ssplist$m_E_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_E"),
            size = 1.1) +

  

  geom_line(data= ssplist$m_F_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_F"),
            size = 1.1) +
  geom_line(data= ssplist$m_H_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_H"),
            size = 1.1) +
  
  
  
  
  
  
  # Enerdata emissions
  
  
  geom_point(data= EnerData_World_BAU,
             aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  


  
# SSP Marker

  geom_line(data= ssp_world_markers_CO2_ffi %>%
              filter(ssp == my_ssp) %>%
              mutate(year = 2010 + (5 * t)) ,
            aes(x=year, y=value, color = "Marker"),
            linetype = 2,
            size = 1.5) +
  
  # Soft  constraint
  
  geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
             aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
             shape= 18,  #diamond
             size = 3) + 
  
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"            = "black",
                                   "sUC <.01"           = "black",
                                   "IIASA SSP Baselines"= "#8585ad", #dark grey
                                   "EnerData Blue BAU"  = "black",
                                   "Historical Emi"     = "black",
                                   "Marker"     = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat








##  SSP< 2 >   SELECTION     -------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp2"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP2-Baseline")


plottigat= ggplot() +
  
  
  
  # SSP model
  
  geom_line(data= my_sspIIASA ,
            aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
            size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  geom_line(data= ssplist$m_A_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
  
  geom_line(data= ssplist$m_B_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  geom_line(data= ssplist$m_C_m$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +

  
  
  
  # Enerdata emissions
  
  
  geom_point(data= EnerData_World_BAU,
             aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  
  
  
  
  # SSP Marker
  
  geom_line(data= ssp_world_markers_CO2_ffi %>%
              filter(ssp == my_ssp) %>%
              mutate(year = 2010 + (5 * t)) ,
            aes(x=year, y=value, color = "Marker"),
            linetype = 2,
            size = 1.5) +
  
  # Soft  constraint
  
  geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
             aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
             shape= 18,  #diamond
             size = 3) + 
  
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"            = "black",
                                   "sUC <.01"           = "black",
                                   "IIASA SSP Baselines"= "#8585ad", #dark grey
                                   "EnerData Blue BAU"  = "black",
                                   "Historical Emi"     = "black",
                                   "Marker"     = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat












##  SSP< 3 >   FULL     -------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp3"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP3-Baseline")


plottigat= ggplot() +
  
  
  
  
  # Historical emissions
  
  
  
  
  
  # SSP model

geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  geom_line(data= ssplist$y_A_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
  # 
  # geom_line(data= ssplist$Bx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_B"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$Cx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_C"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$Dx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_D"),
  #           size = 1.1) + 
  # geom_line(data= ssplist$Ex$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_E"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Fx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_F"),
  #           size = 1.1) +
  # 
  # geom_line(data= ssplist$Gx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_G"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Hx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_H"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Ix$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_I"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Jx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_J"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Kx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_K"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Lx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_L"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Mx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_M"),
  #           size = 1.1) + 
  # 
  # geom_line(data= ssplist$Nx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
  #           aes(x=year, y=value, group=1, color = "test_N"),
  #           size = 1.1) + 
  # 
  
  
  
  
  
  # Enerdata emissions
  
  
  geom_point(data= EnerData_World_BAU,
             aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  
  
  
  # Soft  constraint
  
  geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
             aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
             shape= 18,  #diamond
             size = 3) + 
  
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"            = "black",
                                   "sUC <.01"           = "black",
                                   "IIASA SSP Baselines"= "#8585ad", #dark grey
                                   "EnerData Blue BAU"  = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat




##  SSP< 3 >   SELECTION     -------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ssplist$n_E_n = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__Ky__Ny_E.gdx"))

my_ssp = "ssp3"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP3-Baseline")
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))




plottigat= ggplot() +
  
  
  
  # Historical emissions
  
  
  
  
  
  # SSP model
  
geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  
  geom_line(data= ssplist$n_B_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  geom_line(data= ssplist$n_C_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  
  geom_line(data= ssplist$n_D_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_D"),
            size = 1.1) +
  
  geom_line(data= ssplist$n_E_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_E"),
            size = 1.1) +
  
  
  
  
  
  
  geom_line(data= ssplist$y_N_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_N"),
            size = 1.1) +
  
  
  
  
  
  
  # Enerdata emissions
  
  
  # geom_point(data= EnerData_World_BAU,
  #           aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
#           
#           shape = 19,
#           size = 2.4) + 



# Soft  constraint

geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
           aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
           shape= 18,  #diamond
           size = 3) + 
  
  
  
  # SSP marker
  
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"           = "black",
                                   "sUC <.01"            = "black",
                                   "IIASA SSP Baselines" = "#8585ad", #dark grey
                                   "IIASA SSP Marker"    = "black",
                                   "EnerData Blue BAU"   = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat







##  SSP< 4 >   FULL     -------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp4"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP4-Baseline")







plottigat= ggplot() +
  
  
  
  
  # Historical emissions
  
  
  
  
  
  # SSP model

geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  geom_line(data= ssplist$Ax$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
  
  geom_line(data= ssplist$Bx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  geom_line(data= ssplist$Cx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  
  geom_line(data= ssplist$Dx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_D"),
            size = 1.1) + 
  geom_line(data= ssplist$Ex$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_E"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Fx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_F"),
            size = 1.1) +
  
  geom_line(data= ssplist$Gx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_G"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Hx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_H"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Ix$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_I"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Jx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_J"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Kx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_K"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Lx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_L"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Mx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_M"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Nx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_N"),
            size = 1.1) + 
  
  
  
  
  
  
  # Enerdata emissions
  
  
  geom_point(data= EnerData_World_BAU,
             aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  
  
  
  # Soft  constraint
  
  geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
             aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
             shape= 18,  #diamond
             size = 3) + 
  
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"            = "black",
                                   "sUC <.01"           = "black",
                                   "IIASA SSP Baselines"= "#8585ad", #dark grey
                                   "EnerData Blue BAU"  = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat




##  SSP< 4 >   SELECTION     -------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp4"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP4-Baseline")
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))




plottigat= ggplot() +
  
  
  
  # Historical emissions
  
  
  
  
  
  # SSP model
  
geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  
  geom_line(data= ssplist$n_B_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  
  
  
  geom_line(data= ssplist$y_N_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_N"),
            size = 1.1) +
  
  
  
  
  
  
  # Enerdata emissions
  
  
  # geom_point(data= EnerData_World_BAU,
  #           aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
#           
#           shape = 19,
#           size = 2.4) + 



# Soft  constraint

geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
           aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
           shape= 18,  #diamond
           size = 3) + 
  
  
  
  # SSP marker
  
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"           = "black",
                                   "sUC <.01"            = "black",
                                   "IIASA SSP Baselines" = "#8585ad", #dark grey
                                   "IIASA SSP Marker"    = "black",
                                   "EnerData Blue BAU"   = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat





##  SSP< 5 >   FULL     -------------------------------------------------------------------------------------------------------- 
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp5"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP5-Baseline")







plottigat= ggplot() +
  
  
  
  
  # Historical emissions
  
  
  
  
  
  # SSP model

geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  geom_line(data= ssplist$Ax$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
  
  geom_line(data= ssplist$Bx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  geom_line(data= ssplist$Cx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  
  geom_line(data= ssplist$Dx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_D"),
            size = 1.1) + 
  geom_line(data= ssplist$Ex$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_E"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Fx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_F"),
            size = 1.1) +
  
  geom_line(data= ssplist$Gx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_G"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Hx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_H"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Ix$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_I"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Jx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_J"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Kx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_K"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Lx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_L"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Mx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_M"),
            size = 1.1) + 
  
  geom_line(data= ssplist$Nx$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_N"),
            size = 1.1) + 
  
  
  
  
  
  
  # Enerdata emissions
  
  
  geom_point(data= EnerData_World_BAU,
             aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  
  
  
  # Soft  constraint
  
  geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
             aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
             shape= 18,  #diamond
             size = 3) + 
  
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"            = "black",
                                   "sUC <.01"           = "black",
                                   "IIASA SSP Baselines"= "#8585ad", #dark grey
                                   "EnerData Blue BAU"  = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat







##  SSP< 5 >   SELECTION      --------------------------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
my_ssp = "ssp5"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP5-Baseline")
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))




plottigat= ggplot() +
  
  
  
  # Historical emissions
  
  
  
  
  
  # SSP model
  
geom_line(data= my_sspIIASA ,
          aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
          size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  
  
  
  geom_line(data= ssplist$n_B_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  geom_line(data= ssplist$n_C_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  
  geom_line(data= ssplist$n_D_n$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_D"),
            size = 1.1) +
  
  
  
  
  
  
  geom_line(data= ssplist$y_N_y$get_Variable_GENERAL_ty("world_emi") %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_N"),
            size = 1.1) +
  
  
  
  
  
  
  # Enerdata emissions
  
  
  # geom_point(data= EnerData_World_BAU,
  #           aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
#           
#           shape = 19,
#           size = 2.4) + 



# Soft  constraint

geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
           aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
           shape= 18,  #diamond
           size = 3) + 
  
  
  
  # SSP marker
  
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
  
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"           = "black",
                                   "sUC <.01"            = "black",
                                   "IIASA SSP Baselines" = "#8585ad", #dark grey
                                   "IIASA SSP Marker"    = "black",
                                   "EnerData Blue BAU"   = "black",
                                   
                                   "test_A"  =  "#fff100", #yellow
                                   
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "red",      # red
                                   
                                   "test_E"  =  "#d64cf5", # pink
                                   
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   
                                   "test_K"  =  "green",  #greens
                                   
                                   "test_L"  =  "#32c738",  
                                   "test_M"  =  "#046918",
                                   
                                   
                                   
                                   "test_N"  =  "#c4570e",  # brown
                                   "test_O"  =  "#9c4317"
  )) +
  
  
  
  # guides(colour=guide_legend(  ncol=1,
  #                              override.aes = list(linetype = c(
  #                                                               "sUC <.01"           = "blank",
  #                                                               "IIASA SSP Baselines"= "solid",
  #                                                               "EnerData Blue BAU"  = "blank",
  #                                                             
  #                                                               "test_A"  =  "solid", #yellow
  #                                                               "test_B"  =  "solid", #orange
#                                                               "test_C"  =  "solid",
#                                                               "test_D"  =  "solid",      # red
#                                                               "test_E"  =  "solid", # pink
#                                                               "test_F"  =  "solid", #violet
#                                                               "test_G"  =  "solid",
#                                                               "test_H"  =  "solid",   #blue
#                                                               "test_I"  =  "solid",
#                                                               "test_J"  =  "solid",
#                                                               "test_K"  =  "solid",
#                                                               "test_L"  =  "solid",  
#                                                               "test_M"  =  "solid",
#                                                               "test_N"  =  "solid")))) + 


theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 26),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat









##  EMISSIONS AREA STACKED    --------------------------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
source("05_colors_settings.R")

# TIDE AND EVALUATE EMISSIONS nty :::::::::::::::

#Extrator
extract_exp_emi <- function(df){
  
  df$get_Variable_GENERAL_nty("sigma") %>%
    select(-t)  %>%
    rename(sigma = value) %>%
    merge(ssp_ykali,by= c("ssp", "n",  "year")) %>%
    rename(ykali = value) %>%
    mutate(emissions = sigma * ykali)
}







# PLOT EXPERIMENT AND SSP  :::::::::::::::::::::
 
 # Plot function

 plot_stacked_fun <- function(my_exp_code,
                              my_exp_emissions,
                              my_sspIIASA,
                              my_marker, 
                              no_legend=FALSE){
   
   plottigat= ggplot() + 
  
  # Scenario
  geom_area(data= my_exp_emissions,
            aes(x=year, y=emissions, group=n, fill =n)) + 
     
  # ssp IIASA
  geom_line(data= my_sspIIASA ,
            aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
            size = 0.2)  + 
 
  # Marker
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
     
   
   # Enerdata emissions
   
   
   geom_point(data= EnerData_World_BAU,
              aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
              
              shape = 19,
              size = 2.4) + 
     
   
   

  # graphic details
     
  scale_color_manual(  values =  c( "sUC <.01"            = "black",
                                    "IIASA SSP Baselines" = "#8585ad", #dark grey
                                    "IIASA SSP Marker"    = "black",
                                    "EnerData Blue BAU"   = "black"))  +

  scale_fill_manual(values= colorize_regions("ed57") ) + 
    
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
    
  theme( legend.position=if(no_legend){"none"} else {"right"} ,
           plot.title = element_text(size=22),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
  ggtitle(paste0("Emissions Stacked ",my_ssp, " - Experiment ", my_exp_code)) + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat

 } 
 
 
 ## Plot sequence
 my_ssp      = "ssp3"  # <<<<<  select SSP and baseline   >>>>>>>>>>>>vvvvvvv
 my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == "SSP3-Baseline")
 my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))
 
 

 plot_stacked_fun(my_exp_code      = "A",
                  my_exp_emissions = extract_exp_emi(ssplist$m_A_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 
 
 plot_stacked_fun(my_exp_code      = "B",
                  my_exp_emissions = extract_exp_emi(ssplist$m_B_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "C",
                  my_exp_emissions = extract_exp_emi(ssplist$m_C_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 
 
 
 plot_stacked_fun(my_exp_code      = "D",
                  my_exp_emissions = extract_exp_emi(ssplist$m_D_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 
 plot_stacked_fun(my_exp_code      = "E",
                  my_exp_emissions = extract_exp_emi(ssplist$m_E_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "F",
                  my_exp_emissions = extract_exp_emi(ssplist$m_F_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 
 plot_stacked_fun(my_exp_code      = "G",
                  my_exp_emissions = extract_exp_emi(ssplist$m_G_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "H",
                  my_exp_emissions = extract_exp_emi(ssplist$m_H_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "I",
                  my_exp_emissions = extract_exp_emi(ssplist$m_I_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "J",
                  my_exp_emissions = extract_exp_emi(ssplist$m_J_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "K",
                  my_exp_emissions = extract_exp_emi(ssplist$m_K_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "L",
                  my_exp_emissions = extract_exp_emi(ssplist$m_L_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "M",
                  my_exp_emissions = extract_exp_emi(ssplist$m_M_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 plot_stacked_fun(my_exp_code      = "N",
                  my_exp_emissions = extract_exp_emi(ssplist$m_N_m) %>%  filter(ssp == my_ssp) ,
                  my_sspIIASA,
                  my_marker,
                  no_legend = FALSE
 )
 
 
 
 
 
 
 
 # original plot
 plot_stacked_fun(my_exp_code = "Original",
                  my_sspIIASA,
                  my_marker,
                  my_exp_emissions = gdxBAU$get_Variable_GENERAL_nty("EIND") %>% rename(emissions= value) )










##  REGIONAL EMISSIONS COMPARED R5    ------------------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# function
 extract_r5region <- function(experiment){
  
   experiment$get_Variable_GENERAL_ty("sigma") %>% 
    filter(ssp == my_ssp)%>% 
    rename( sigma = value) %>% 
    merge(ssp_ykali, by = c("ssp", "n", "year")) %>% 
    rename( ykali = value) %>%
    mutate(emi_reg = sigma * ykali)%>% 
    rename( ed57 = n) %>% 
    merge(map_r5_ed57, by = c("ed57"))  %>% 
    group_by(ssp,year,r5) %>% 
    summarise(emi_reg = sum(emi_reg)) %>%  
    as.data.frame() %>% 
    filter(r5 == my_region) %>%
    rename(value = emi_reg)
}


extract_r5region_normalized <- function(experiment){
  
  
 mydf = extract_r5region(experiment)

 r5_2015_emi = mydf %>% filter(year == 2015) %>% rename(emi2015 = value) %>% select(-year)
 
 mydf %>%
   merge(r5_2015_emi,by = c("ssp", "r5")) %>%
   mutate(value = emi_reg/emi2015)        %>% 
   select(-emi2015) 
 
}
 

#....................
 
my_ssp = "ssp3"      # |  ssp1  |  ssp2  |  ssp3 |  ssp4 |  ssp5 |
my_sspIIASA =  ssp_r5_markers_CO2_ffi   %>% filter(ssp == my_ssp) %>% mutate (year = 2010+(t*5))


my_region = "r5oecd" # | r5oecd | r5asia | r5ref | r5maf | r5lam |
my_region = "r5asia"
my_region = "r5ref"
my_region = "r5maf"
my_region = "r5lam"
# test: verificare accrocchio anche con popuation
# vengono fuori risultati consistenti across R5 regions? 
#..................

plottigat= ggplot() +
  
  
  
  # SSP model
  
  geom_line(data= my_sspIIASA %>%
              filter(r5 == tolower(my_region)) ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Baselines"),
            size = 1) + 
  



  # Baseline calibrated (world emissions from sigma kali)
  
  geom_line(data= extract_r5region(ssplist$n_E_n),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
# 
#   geom_line(data= extract_r5region_normalized(ssplist$y_B_y),
#             aes(x=year, y=value, group=1, color = "test_B"),
#             size = 1.1) +
#   geom_line(data= extract_r5region_normalized(ssplist$y_C_y),
#             aes(x=year, y=value, group=1, color = "test_C"),
#             size = 1.1) +
#   geom_line(data= extract_r5region_normalized(ssplist$y_D_y),
#             aes(x=year, y=value, group=1, color = "test_D"),
#             size = 1.1) +
#   geom_line(data= extract_r5region_normalized(ssplist$y_E_y),
#             aes(x=year, y=value, group=1, color = "test_E"),
#             size = 1.1) +
#   geom_line(data= extract_r5region_normalized(ssplist$y_F_y),
#             aes(x=year, y=value, group=1, color = "test_F"),
#             size = 1.1) +
#   geom_line(data= extract_r5region_normalized(ssplist$y_G_y),
#             aes(x=year, y=value, group=1, color = "test_G"),
#             size = 1.1) +

  
  # SSP median
  
  # geom_line(data= sspDB_r5regions_normalized_median_CO2_ffi %>%
  #             filter(r5 == tolower(my_region), ssp == my_ssp) %>% 
  #             mutate(year = 2010 + (5 * t)) ,
  #           aes(x=year, y=value, color = "median"),
  #           linetype = 4,
  #           size = 1.2) + 
  
  
  
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(
    values =  c("soft_constraint" = "black",
                "IIASA SSP Baselines"= "#8585ad", #dark blue
                "median" = "black",
                
                "test_A"  =  "#fff100", #yellow
                
                "test_B"  =  "#f77f2f", #orange
                "test_C"  =  "#db0f20", 
                "test_D"  =  "red",      # red
                
                "test_E"  =  "#d64cf5", # pink
                
                "test_F"  =  "#8232c7", #violet
                "test_G"  =  "#450094",
                
                "test_H"  =  "blue",   #blue
                "test_I"  =  "#0f86db",
                "test_J"  =  "#0ccfab",
                
                "test_K"  =  "green",  #greens
                
                "test_L"  =  "#32c738",  
                "test_M"  =  "#046918",
                
                
                
                "test_N"  =  "#c4570e",  # brown
                "test_O"  =  "#9c4317")) +
  
  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp, ", region ", my_region, ", normalized ")) + 
  xlab("Year") +
  ylab("FFI Emissions [GtCO2]")  ; plottigat



my_region = "r5oecd" # | r5oecd | r5asia | r5ref | r5maf | r5lam |
my_region = "r5asia"
my_region = "r5ref"
my_region = "r5maf"
my_region = "r5lam"
