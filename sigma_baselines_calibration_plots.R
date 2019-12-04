source("RICEx_datamng/RICEx_00_global_settings.R")
source("RICEx_datamng/RICEx_01_data_basic_functions.R")
source("RICEx_datamng/RICEx_21_GDXclass.R")
source("18_gdx_class.R")


# Experiments datapath

data_path   = here("../RICEx-Main-Production/RICExdata_ed57_t58//")
resuts_path = here("../RICEx-Main-Production/baselines/baselines_results//")





##---------------:  EXPERIMENTS DATA  :---------------------------------


# All experiments raw data 

ssplist = list()


# first stage
ssplist$sspa_A_x = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test_ALPHA.gdx"))






##---------------:  OTHER DATA MANAGEMENT  :---------------------------------

## IIASA SSP DATA
source("OTHER_datamng/SSP_IIASA_data_management.R")


## ENERDATA BAU Emissions
source("OTHER_datamng/EnerData_baselines.R")


## HISTORICAL EMISSIONS
source("OTHER_datamng/HIST_emissions_data.R")


## REFERENCE SSP2 BASELINE
SSP2_referencebaseline = GDXclass("../RICEx-Data/baselines/RICExdata_ssp_baseline_sigma_calibrated_ed57_t58_reference.gdx")


## SIGMA Soft Costraints
ykali_gdx = gdx(paste0(data_path,"RICExdata_baseline_ssp_pop_ykali.gdx")) 
ssp_ykali = ykali_gdx["ssp_ykali"] %>% mutate(year= 2010 + (as.numeric(t) * 5)) %>% rename(ssp = V1) %>% select(-t)

soft_constraints_2300s01 = ssp_ykali %>% mutate(softUC_emi = 0.01 * value) %>% select(-value)  %>% dplyr::group_by(ssp,year) %>% summarise(softUC_Wemi = sum(softUC_emi)) %>% filter(year == 2300) %>% as.data.frame()
soft_constraints_2300s1  = ssp_ykali %>% mutate(softUC_emi = 0.1 * value) %>% select(-value)  %>% dplyr::group_by(ssp,year) %>% summarise(softUC_Wemi = sum(softUC_emi)) %>% filter(year == 2300) %>% as.data.frame()






## Mapping ED57 -> R5
#
# aggregating ed57 regions into r5 ones 
# by exploiting RICE50+ inner mapping.
# Output is a table  | ED57 | R5 |

# gdxr5   = GDXclass(paste0("C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-results/SIMtest/r5/","sunRC__SIM__r5__kaliPUMICE__expSIMtest__ssp2__noncoop__clWITCHco2__damBURKESR__SRfix__polBAU_xxBurkeEsteem_iso3_omega0.gdx"))
# gdxed57 = GDXclass(paste0("C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sDC-results/SIMtest/enerdata56/","sunRC__SIM__enerdata56__kaliPUMICE__expSIMtest__ssp2__noncoop__clWITCHco2__damBURKESR__SRfix__polBAU_xxBurkeEsteem.gdx"))
# map_ed57_iso3      = gdxed57$get_Parameter("map_n_iso3")
# map_ed57_iso3$iso3 = toupper(map_ed57_iso3$iso3)
# map_r5_iso3      = gdxr5$get_Parameter("map_n_iso3")
# map_r5_iso3$iso3 = toupper(map_r5_iso3$iso3)
# map_r5_ed57      = merge(map_ed57_iso3,map_r5_iso3, by = c("iso3")) %>% rename(ed57 = n.x, r5 = n.y) %>% select(-iso3) %>% distinct() %>% filter(!(ed57=="rjan57" & r5 =="r5asia"))  %>% filter(!(ed57=="oeu" & r5 =="r5ref"))










##--------------------:   SSP< 1 >  WORLD ALL EXPERIMENTS   :-------------------------------------------- 
my_ssp = "ssp1"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == paste0(toupper(my_ssp),"-Baseline"))
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))
 

plottigat= ggplot() +
  
  
  
  # Historical emissions
  geom_line(data= E_hist_PRIMAP_world_y %>% filter(year >= 2000) ,
            aes(x=year, y=value, group=1, color = "Hist emissions"),
            size = 1.2)  + 
  

  
  # SSP model
  geom_line(data= my_sspIIASA ,
            aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
            size = 1.2)  + 
  

  
  # Baseline calibrated (world emissions from sigma kali)
  geom_line(data= ssplist$sspa_A_x$get_VARIABLE_ty("world_emi",year_limit = 2300) %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +


  
  
  # Enerdata emissions
  geom_point(data= EnerData_World_CO2_BAU,
           aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
           
           shape = 19,
           size = 2.4) + 
  
  
  
  # Soft  constraint
  # geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
  #            aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
  #            shape= 18,  #diamond
  #            size = 3) + 
  

  
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
                                 "Hist emissions"      = "blue",
                                  
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
  

  
#    guides(colour=guide_legend(  ncol=1,
#                                 override.aes = list(linetype = c(
#                                                                  "sUC <.01"           = "blank",
#                                                                  "sUC <.1"            = "blank",
#                                                                  "IIASA SSP Baselines"= "solid",
#                                                                  "IIASA SSP Marker"   = "solid",
#                                                                  "EnerData Blue BAU"  = "blank",
#                                                                  "Hist emissions"     = "solid",
#                                                                
#                                                                  "test_A"  =  "solid" #yellow
#                                                                  ,"test_B"  =  "solid" #orange
#                                                                  ,"test_C"  =  "solid"
#                                                                  ,"test_D"  =  "solid"      # red
#                                                                  ,"test_E"  =  "solid" # pink
#                                                                  ,"test_F"  =  "solid" #violet
#                                                                  ,"test_G"  =  "solid"
#                                                                  ,"test_H"  =  "solid"   #blue
#                                                                  ,"test_I"  =  "solid"
#                                                                  ,"test_J"  =  "solid"
#                                                                  ,"test_K"  =  "solid"
#                                                                  ,"test_L"  =  "solid"  
#                                                                  ,"test_M"  =  "solid"
#                                                                  ,"test_N"  =  "solid"
#                                                                  ,"test_O"  =  "solid"
#)))) + 


  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 26),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +

  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp)) + 
  xlab("Year") +
  ylab("World Emissions [GtCO2]")  ; plottigat









##--------------------:   SSP< 2 >  WORLD ALL EXPERIMENTS   :-------------------------------------------- 
my_ssp = "ssp2"
my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == paste0(toupper(my_ssp),"-Baseline"))
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))


plottigat= ggplot() +
  
  
  
  # Historical emissions
  geom_line(data= E_hist_PRIMAP_world_y %>% filter(year >= 2000) ,
            aes(x=year, y=value, group=1, color = "Hist emissions"),
            size = 1.2)  + 
  
  
  
  # SSP model
  geom_line(data= my_sspIIASA ,
            aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
            size = 1.2)  + 
  
  
  
  # Baseline calibrated (world emissions from sigma kali)
  geom_line(data= ssplist$sspa_A_x$get_VARIABLE_ty("world_emi",year_limit = 2300) %>% filter(ssp == my_ssp),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
  
  
  
  
  # Enerdata emissions
  geom_point(data= EnerData_World_CO2_BAU,
             aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  
  
  
  # Soft  constraint
  # geom_point(data= sigma_constraints_2300s01 %>% filter(ssp == my_ssp),
  #            aes(x=year, y=softUC_Wemi, group=1, color = "sUC <.01"),
  #            shape= 18,  #diamond
  #            size = 3) + 
  
  
  
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
                                   "Hist emissions"      = "blue",
                                   
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
  
  
  
  #    guides(colour=guide_legend(  ncol=1,
  #                                 override.aes = list(linetype = c(
  #                                                                  "sUC <.01"           = "blank",
  #                                                                  "sUC <.1"            = "blank",
  #                                                                  "IIASA SSP Baselines"= "solid",
  #                                                                  "IIASA SSP Marker"   = "solid",
  #                                                                  "EnerData Blue BAU"  = "blank",
  #                                                                  "Hist emissions"     = "solid",
#                                                                
#                                                                  "test_A"  =  "solid" #yellow
#                                                                  ,"test_B"  =  "solid" #orange
#                                                                  ,"test_C"  =  "solid"
#                                                                  ,"test_D"  =  "solid"      # red
#                                                                  ,"test_E"  =  "solid" # pink
#                                                                  ,"test_F"  =  "solid" #violet
#                                                                  ,"test_G"  =  "solid"
#                                                                  ,"test_H"  =  "solid"   #blue
#                                                                  ,"test_I"  =  "solid"
#                                                                  ,"test_J"  =  "solid"
#                                                                  ,"test_K"  =  "solid"
#                                                                  ,"test_L"  =  "solid"  
#                                                                  ,"test_M"  =  "solid"
#                                                                  ,"test_N"  =  "solid"
#                                                                  ,"test_O"  =  "solid"
#)))) + 


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
