##--------------- Packages and dependencies  ---------------------------------

source("RICEx_datamng/RICEx_00_global_settings.R")
source("RICEx_datamng/RICEx_01_data_basic_functions.R")
source("RICEx_datamng/RICEx_21_GDXclass.R")

source("RICEx_plots/RICEx_00_colors_settings.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")


require_package("xlsx")

pkgs <- c('ggplot2',
          'tidyr',
          'broom',
          'data.table',
          'docopt',
          'stringr',
          'dplyr',
          'dtplyr',
          'purrr', 
          'colf', 
          'gdxtools', 
          "minpack.lm", 
          "crayon")
res <- suppressWarnings(lapply(pkgs,require_package))
suppressWarnings(require_gdxtools())


# +++++++++++++++++++++++++++
## PROJECT FOLDER 
prj_fold = "RICEx-Main-FIX"
# +++++++++++++++++++++++++++


# Experiments datapath
data_path   = here(paste0("../",prj_fold,"/RICExdata_ed57_t58//"))
resuts_path = here(paste0("../",prj_fold,"/kali_baselines/baselines_results//"))





##--------------- EXPERIMENTS data loaded  ---------------------------------


# All experiments raw data 

ssplist = list()


# ultra-detailed 
ssplist$ssp2_A_xxx  = GDXclass(paste0(resuts_path,"sigma_baseline_kali_SSP2only_xxxA.gdx"))
ssplist$ssp2_B_xxx  = GDXclass(paste0(resuts_path,"sigma_baseline_kali_SSP2only_xxxB.gdx"))
ssplist$ssp2_C_xxx  = GDXclass(paste0(resuts_path,"sigma_baseline_kali_SSP2only_xxxC.gdx"))
ssplist$ssp2_D_xxx  = GDXclass(paste0(resuts_path,"sigma_baseline_kali_SSP2only_xxxD.gdx"))
ssplist$ssp2_E_xxx  = GDXclass(paste0(resuts_path,"sigma_baseline_kali_SSP2only_xxxE.gdx"))
ssplist$ssp2_F_xxx  = GDXclass(paste0(resuts_path,"sigma_baseline_kali_SSP2only_xxxF.gdx"))







##--------------- Additional data needed for plotting --------------------------------


## IIASA SSP DATA
#  makes available CO2ffi + CO2ffi normalized for every SSP
#  - global level, 
#  - R5 regions 
#  - MARKER NATIVE regions
source("OTHER_datamng/SSP_IIASA_data_management.R")



## ENERDATA BAU Emissions
# both world and ed57 detail
source("OTHER_datamng/EnerData_baselines.R")


## HISTORICAL EMISSIONS
# both world and ed57 detail
source("OTHER_datamng/HIST_emissions_data.R")


## DICE SIGMA
dice2016gdx  = gdx(paste0(here("../DICE Vanillas//"), "DICE2016R_091916ap_BAU_vanilla_results.gdx"))
dicesigma =  dice2016gdx["sigma"] %>% mutate(year= 2010 + (as.numeric(t) * 5))
dicepop   =  dice2016gdx["l"] %>% mutate(year= 2010 + (as.numeric(t) * 5))
diceykali =  dice2016gdx["YGROSS"] %>% mutate(year= 2010 + (as.numeric(t) * 5))



## GDP under different SSP-scenarios
# (it includes MER/PPP and long-run alternative assumptions)
ykali_gdx = gdx(paste0(data_path,"RICExdata_baseline_ssp_pop_ykali.gdx")) 

ssp_ykali_nty = ykali_gdx["ssp_ykali"] %>% 
  mutate(year= 2010 + (as.numeric(t) * 5)) 

ssp_pop_nty = ykali_gdx["ssp_pop"] %>% 
  mutate(year= 2010 + (as.numeric(t) * 5)) 



world_ssp_ykali_ty = ssp_ykali_nty %>% 
  group_by(ssp,extension,gdpadj,year,t) %>% 
  summarise(value = sum(value)) %>% 
  as.data.frame()

world_ssp_pop_ty = ssp_pop_nty %>% 
  group_by(ssp,extension,year,t) %>% 
  summarise(value = sum(value)) %>% 
  as.data.frame()


##--------------- FUNCTIONS to transform easycode  --------------------------------


## ____ FUNCTION ____
# to evaluate world sigma
#
evaluate_sigmaWorld_from_nty <- function(experiment){
  
  experiment$get_PARAMETER_ty("world_emi_exp", year_limit = 2300) %>% 
      mutate(ssp = "ssp2") %>% 
      select(-"t") %>%
      merge( world_ssp_ykali_ty %>% 
               filter(gdpadj =="PPP"), 
             by = c("year","ssp","extension"))   %>% 
      rename(  "emi" = value.x , "gdp_PPP" =  value.y  ) %>%
      mutate(sigma_PPP = emi/gdp_PPP )

  
}






## ____ FUNCTION ____
# to return marker-model codename
# in gdx according to ssp
#
get_model_code <- function(my_ssp){
  if(tolower(my_ssp) == "ssp1") return("img")
  if(tolower(my_ssp) == "ssp2") return("mglo")
  if(tolower(my_ssp) == "ssp3") return("acg")
  if(tolower(my_ssp) == "ssp4") return("gcam")
  if(tolower(my_ssp) == "ssp5") return("rmag")
}





## ____ FUNCTION ____
# to extract mapping_region values
# from a nty dataset
#
extract_region_value <- function(nty_value, 
                                 mapping_XX_ed57, 
                                 model_name_in_mapping,
                                 mapping_XX_n = NULL ){
  
  
  
  
  
  if(is.null(mapping_XX_ed57 )){ my_mapping = mapping_XX_n 
  }else{
    my_mapping = mapping_XX_ed57 %>% mutate(n = ed57) %>% select(-ed57)
  }
  
  nty_value %>% merge(my_mapping, by = c("n")) %>% 
    group_by_at(vars(-c("n","value"))) %>%
    summarise(value = sum(value)) %>%
    as.data.frame()
  
}





## -------------- CODE WAREHOUSE (dunno if useful)   -------------------


map_mglo_ed57 <- ssplist$ssp2_A_xxx$get_PARAMETER("map_message_globiom11_ed57")




## -------------- PLOT ::  Sigma World  :: Specific Comparison   -------------------




my_experiment = ssplist$ssp2_F_xxx 
my_exp_descrp = "Test_A"

#...........................................
# here you have to select the 
# SPECIFIC scenario to compare with DICE
#...........................................



# | extshort | extmed | extlong |
my_extension       = "extshort"

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_transition_type = "sigmoid_Ms"

# | 28 | 38 | 48 | 58 |
my_transition_end   = 28 



# ................. AUTORUN .................

plottigat= ggplot() +
  
  # Dice Sigma
  geom_line(data= dicesigma ,
            aes(x=year, y=value, group=1, color = "DICE sigma"),
            size = 1.2)  + 
  
  
  # Experiment World Sigma
  geom_line(data= evaluate_sigmaWorld_from_nty(my_experiment) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=sigma_PPP, group=1, color = "World Sigma"),
            size = 1.2)  + 
  
  
  # Plot appearance 
  scale_color_manual(  values = pollo_20) + 
  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Lines") + 
  ggtitle(paste0("Sigma <",my_exp_descrp,", ",my_extension,", ",my_transition_type,", ",my_transition_end,"> compared to DICE one" )) + 
  xlab("Year") +
  ylab("Carbon Intensity [GtCO2/Trill USD]")  ; plottigat





## -------------- PLOT ::  Sigma World  :: LR-Scenarios Comparison   -------------------





my_experiment = ssplist$ssp2_A_xxx 
my_exp_descrp = "Test_A"

#...........................................
# here you can MODIFY FILTER LOGIC to compare
# many scenarios alltogether
#...........................................




# Those filters are not used but maybe useful


# | extshort | extmed | extlong |
my_extension       = "extshort"

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_transition_type = "sigmoid_Ls"

# | 28 | 38 | 48 | 58 |
my_transition_end   = 28 


#...........................................


# change filter :: V :: ^ ::


plottigat= ggplot() +
  
  # Dice Sigma
  geom_line(data= dicesigma %>% filter(year <= 2300) ,
            aes(x=year, y=value, group=1, color = "DICE sigma"),
            size = 1.2)  + 
  
  
  # Experiment World Sigma
  geom_line(data= evaluate_sigmaWorld_from_nty(ssplist$ssp2_A_xxx) %>% mutate(key = paste0(extension,"//",trns_type,"//",trns_end)) %>%
              filter(
                # obvious, always active
                key == key
                # optional, activate if desired
                #        ,extension == my_extension
                ,trns_type == my_transition_type
                #        ,trns_end  == my_transition_end
              )
            ,aes(x=year, y=sigma_PPP, group=key, color = key)
            ,size = 1.2)  + 
  
  # Plot appearance 
  scale_color_manual(  values = pollo_20) + 
  guides(colour=guide_legend(ncol=1), fill=guide_legend(ncol=2)) +
  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Scenarios") + 
  ggtitle(paste0("Sigma alternative scenarios compared to DICE one" )) + 
  xlab("Year") +
  ylab("Carbon Intensity [GtCO2/Trill USD]")  ; plottigat






## -------------- PLOT ::  Sigma Countries  :: Specific Comparison   -------------------





my_experiment = ssplist$ssp2_A_xxx 
my_exp_descrp = "Test_A"

#...........................................
# here you have to select the 
# SPECIFIC scenario to compare with DICE
#...........................................


# | extshort | extmed | extlong |
my_extension       = "extmed"

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_transition_type = "sigmoid_Ls"

# | 28 | 38 | 48 | 58 |
my_transition_end   = 38 






# ................. AUTORUN .................

plottigat= ggplot() +
  
  
  
  
  # Experiment World Sigma
  geom_line(data= my_experiment$get_PARAMETER_nty("sigma_ppp_exp", year_limit = 2300) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=value, group=n, color = n),
            size = 1.2)  + 
  
  # Dice Sigma
  geom_line(data= dicesigma %>% filter(year <= 2300) ,
            aes(x=year, y=value, group=1, color = "_DICE sigma"),
            size = 1.2,
            linetype = "dotted")  + 
  
  # Plot appearance 
  scale_color_manual(  values = c(colorize_regions("ed57"), "_DICE sigma" = "black" ))  + 
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Regions") + 
  ggtitle(paste0("Sigma <",my_exp_descrp,", ",my_extension,", ",my_transition_type,", ",my_transition_end,"> at country level" )) + 
  xlab("Year") +
  ylab("Carbon Intensity [GtCO2/Trill USD]")  ; plottigat











## -------------- PLOT ::  Emissions Stacked Countries  :: Specific Comparison   -------------------


s

my_experiment = ssplist$ssp2_A_xxx 
my_exp_descrp = "Test_A"
my_ssp        = "ssp2" 

#...........................................
# here you have to select the 
# SPECIFIC scenario to plot in detal
#...........................................


# | extshort | extmed | extlong |
my_extension       = "extshort"

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_transition_type = "sigmoid_LLs"

# | 28 | 38 | 48 | 58 |
my_transition_end   = 48 



# extra setting 
no_legend = FALSE  # | TRUE | FALSE |  


# ................. AUTORUN .................
{

my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == paste0(toupper(my_ssp),"-Baseline"))
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))

  

plottigat= ggplot() + 
    
    # Scenario
    geom_area(data= my_experiment$get_PARAMETER_nty("emi_bau_exp", year_limit = 2300) %>% 
                filter(extension == my_extension,
                       trns_type == my_transition_type,
                       trns_end  == my_transition_end
                ),
              aes(x=year, y=value, group=n, fill =n)) + 
    
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
    
    geom_point(data= EnerData_World_CO2_BAU,
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
    
    ggtitle(paste0("Emissions Stacked  ",my_exp_descrp,", my_ssp", " <",my_extension,", ",my_transition_type,", ",my_transition_end,"> at country level")) + 
    xlab("Year") +
    ylab("Emissions FFI [GtCO2]")  ; plottigat
  
} 
# ................. AUTORUN .................









# | extshort | extmed | extlong |
my_extension       = "extmed"

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_transition_type = "linear_pure"

# | 28 | 38 | 48 | 58 |
my_transition_end   = 38 



# extra setting 
no_legend = FALSE  # | TRUE | FALSE |  

















## -------------- PLOT ::  World Emissions  :: Kali Comparison   -------------------




my_ssp        = "ssp2" 

#...........................................
# here you have to select the 
# SPECIFIC scenario to plot across 
# different experiments
#...........................................


# | extshort | extmed | extlong |
my_extension       = "extmed"

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_transition_type = "sigmoid_Ms"

# | 28 | 38 | 48 | 58 |
my_transition_end   = 38 



# extra setting 
no_legend = FALSE  # | TRUE | FALSE |  



# ................. AUTORUN .................
{
  
  my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == paste0(toupper(my_ssp),"-Baseline"))
  my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))
  
  

plottigat= ggplot() +
  
  # SSP model
  geom_line(data= my_sspIIASA ,
            aes(x=year, y=value, group=model, color = "IIASA SSP Baselines"),
            size = 1)  + 
  
  # Historical emissions
  geom_line(data= E_hist_PRIMAP_world_y %>% filter(year >= 2000) ,
            aes(x=year, y=value, group=1, color = "Hist emissions"),
            size = 1.2)  +   
  
  # Baseline world-calibrated (world emissions from sigma kali)
  
  geom_line(data= ssplist$ssp2_A_xxx$get_PARAMETER_nty("world_emi_exp", year_limit = 2300) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +
  

  geom_line(data= ssplist$ssp2_B_xxx$get_PARAMETER_nty("world_emi_exp", year_limit = 2300) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  
  geom_line(data= ssplist$ssp2_C_xxx$get_PARAMETER_nty("world_emi_exp", year_limit = 2300) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  
  
  geom_line(data= ssplist$ssp2_D_xxx$get_PARAMETER_nty("world_emi_exp", year_limit = 2300) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=value, group=1, color = "test_D"),
            size = 1.1) +
  
  
  geom_line(data= ssplist$ssp2_E_xxx$get_PARAMETER_nty("world_emi_exp", year_limit = 2300) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=value, group=1, color = "test_E"),
            size = 1.1) +
  
  
  geom_line(data= ssplist$ssp2_F_xxx$get_PARAMETER_nty("world_emi_exp", year_limit = 2300) %>% 
              filter(extension == my_extension,
                     trns_type == my_transition_type,
                     trns_end  == my_transition_end
              ),
            aes(x=year, y=value, group=1, color = "test_F"),
            size = 1.1) +
  
  
  
  
  # Enerdata emissions
  geom_point(data= EnerData_World_CO2_BAU,
             aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  
  
  # SSP marker
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
  
  
  
  # graphic details
  scale_color_manual(  values =  c("sUC <.1"             = "black",
                                   "sUC <.01"            = "black",
                                   "IIASA SSP Baselines" = "#8585ad", #dark grey
                                   "IIASA SSP Marker"    = "black",
                                   "EnerData Blue BAU"   = "black",
                                   "Hist emissions"      = "blue",
                                   
                                   "test_A"  =  "#32c738",
                                   "test_B"  =  "#f77f2f", #orange
                                   "test_C"  =  "#db0f20", 
                                   "test_D"  =  "#c4570e",  # brown
                                   "test_E"  =  "#007c82", # petroleum
                                   "test_F"  =  "#8232c7", #violet
                                   "test_G"  =  "#450094",
                                   "test_H"  =  "blue",   #blue
                                   "test_I"  =  "#0f86db",
                                   "test_J"  =  "#0ccfab",
                                   "test_K"  =  "green",  #greens
                                   "test_L"  =  "#fff100", #yellow
                                   "test_M"  =  "#046918",
                                   "test_N"  =  "red",      # red
                                   "test_O"  =  "#9c4317"
  )) +

## Use this only on final chart!   
#    guides(colour=guide_legend(  ncol=1,
#                                 override.aes = list(linetype = c(
#                                                                  "sUC <.01"           = "blank",
#                                                                  "sUC <.1"            = "blank",
#                                                                  "IIASA SSP Baselines"= "solid",
#                                                                  "IIASA SSP Marker"   = "solid",
#                                                                  "EnerData Blue BAU"  = "blank",
#                                                                  "Hist emissions"     = "solid",
#                                                                   "test_A"  =  "solid" #yellow
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
#                                                                                           )))) + 
theme( legend.text   = element_text(size = 13),
       plot.title    = element_text(size = 18),
       axis.title.x  = element_text(size = 16),
       axis.text.x   = element_text(size = 14),
       axis.title.y  = element_text(size = 16)  ) +
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp, " <",my_extension,", ",my_transition_type,", ",my_transition_end, "> across different calibrations")) + 
  xlab("Year") +
  xlim(2000,2150)+
  ylab("World Emissions [GtCO2]")  ; plottigat

}














## -------------- PLOT ::  World Emissions  :: LR-Scenario Comparison   -------------------



my_experiment = ssplist$ssp2_A_xxx 
my_exp_descrp = "Test_A"
my_ssp = "ssp2"
#...........................................
# here you can MODIFY FILTER LOGIC to compare
# many scenarios alltogether
#...........................................




# Those filters are not all necessarily used 


# | extshort | extmed | extlong |
my_acc_extensions  = c("extshort",
                       "extmed",
                       "extlong")

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_acc_transition_type  = c("#sigmoid_Ms",
                            "sigmoid_Ls",
                            "#sigmoid_Hs", 
                            "#sigmoid_HHs", 
                            "#sigmoid_LLs", 
                            "#linear_pure", 
                            "#linear_soft" )

# | 28 | 38 | 48 | 58 |
my_acc_transition_end  = c("#28",
                           "38",
                           "48",
                           "#58")

#...........................................


# change filter :: V :: ^ ::


my_sspIIASA =  sspDB_all_baseline_CO2_ffi   %>% filter(scenario == paste0(toupper(my_ssp),"-Baseline"))
my_marker   =  ssp_world_markers_CO2_ffi    %>% filter(ssp == my_ssp)  %>% mutate(year = 2010 + (t*5))


plottigat= ggplot() +
  
  
  # SSP model
  geom_line(data= my_sspIIASA ,
            aes(x=year, y=value, group=model, color = "_IIASA SSP Baselines"),
            size = 1.2)  + 
  
  # Historical emissions
  geom_line(data= E_hist_PRIMAP_world_y %>% filter(year >= 2000) ,
            aes(x=year, y=value, group=1, color = "_Hist emissions"),
            size = 1.2)  +   
  
  
  # Experiment World Sigma
  geom_line(data= my_experiment$get_PARAMETER_ty("world_emi_exp", year_limit = 2300) %>% 
              mutate(key = paste0(extension," / ",trns_end," / ",trns_type)) %>%
              filter(
                
                # obvious, always active
                key == key
                
                # optional, DEACTIVATE what you wanna plot
                ,extension %in% my_acc_extensions
                ,trns_type %in% my_acc_transition_type
                ,trns_end  %in% my_acc_transition_end
              )
            
            ,aes(x=year, y=value, group=key, color = key)
            ,size = 1.2)  + 
  
  # Enerdata emissions
  geom_point(data= EnerData_World_CO2_BAU,
             aes(x=year, y=value, group=1, color = "_EnerData Blue BAU"),
             
             shape = 19,
             size = 2.4) + 
  
  
  # SSP marker
  geom_line(data= my_marker ,
            aes(x=year, y=value, group=1, color = "_IIASA SSP Marker"),
            size = 1.2,
            linetype = 4)  + 
  

  
  # Plot appearance 
  scale_color_manual(  values = c("black", "black", "grey", "black" ,pollo_20 )) + 
  guides(colour=guide_legend(ncol=1), fill=guide_legend(ncol=2)) +
  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Scenarios") + 
  ggtitle(paste0("World Emissions LR-scenarios for <",my_exp_descrp,">" )) + 
  xlab("Year") +
  ylab("Emissions [GtCO2/Year]")  ; plottigat















## -------------- PLOT ::  REGION Emissions  :: Kali Comparison   -------------------


my_ssp        = "ssp2" 

#...........................................
# here you have to select the 
# SPECIFIC scenario and marker REGION to 
# be plotted across different experiments
#...........................................


# | extshort | extmed | extlong |
my_extension       = "extmed"

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_transition_type = "sigmoid_Ms"

# | 28 | 38 | 48 | 58 |
my_transition_end   = 38 



# access data and view regions
marker_ssp_regional = get(paste0("sspDB_",my_ssp,"_native_regions_CO2_ffi")) %>% mutate(year = (t *5)+ 2010 )
marker_ssp_regional %>% select(paste0("n",my_ssp)) %>% distinct()



# select region
my_region = "afr"
my_reg_description = (get(my_ssp, regions_markers) %>% 
                        filter(!!as.symbol(get_model_code(my_ssp)) == my_region)  %>% 
                        select(paste0(get_model_code(my_ssp),"_description")))[1,1]

# ................. AUTORUN .................
{
  
  plottigat= ggplot() +
    

    # Baseline region-calibrated 
    
    geom_line(data= ssplist$ssp2_A_xxx$get_PARAMETER_nty(paste0("emi_reg_",my_ssp), year_limit = 2300) %>% 
                filter(get(get_model_code(my_ssp))  == my_region,
                       extension == my_extension,
                       trns_type == my_transition_type,
                       trns_end  == my_transition_end
                ),
              aes(x=year, y=value, group=1, color = "test_A"),
              size = 1.1) +
    
    
    geom_line(data= ssplist$ssp2_B_xxx$get_PARAMETER_nty(paste0("emi_reg_",my_ssp), year_limit = 2300) %>% 
                filter(get(get_model_code(my_ssp))  == my_region,
                       extension == my_extension,
                       trns_type == my_transition_type,
                       trns_end  == my_transition_end
                ),
              aes(x=year, y=value, group=1, color = "test_B"),
              size = 1.1) +
    
    
    geom_line(data= ssplist$ssp2_C_xxx$get_PARAMETER_nty(paste0("emi_reg_",my_ssp), year_limit = 2300) %>% 
                filter(get(get_model_code(my_ssp))  == my_region,
                       extension == my_extension,
                       trns_type == my_transition_type,
                       trns_end  == my_transition_end
                ),
              aes(x=year, y=value, group=1, color = "test_C"),
              size = 1.1) +
    
    
    geom_line(data= ssplist$ssp2_D_xxx$get_PARAMETER_nty(paste0("emi_reg_",my_ssp), year_limit = 2300) %>% 
                filter(get(get_model_code(my_ssp))  == my_region,
                       extension == my_extension,
                       trns_type == my_transition_type,
                       trns_end  == my_transition_end
                ),
              aes(x=year, y=value, group=1, color = "test_D"),
              size = 1.1) +
    
    
    geom_line(data= ssplist$ssp2_E_xxx$get_PARAMETER_nty(paste0("emi_reg_",my_ssp), year_limit = 2300) %>% 
                filter(get(get_model_code(my_ssp))  == my_region,
                       extension == my_extension,
                       trns_type == my_transition_type,
                       trns_end  == my_transition_end
                ),
              aes(x=year, y=value, group=1, color = "test_E"),
              size = 1.1) +
    
    
    geom_line(data= ssplist$ssp2_F_xxx$get_PARAMETER_nty(paste0("emi_reg_",my_ssp), year_limit = 2300) %>% 
                filter(get(get_model_code(my_ssp))  == my_region,
                       extension == my_extension,
                       trns_type == my_transition_type,
                       trns_end  == my_transition_end
                ),
              aes(x=year, y=value, group=1, color = "test_F"),
              size = 1.1) +
    
    
    # Historical emissions
    geom_line(data= ssplist$ssp2_E_xxx$get_PARAMETER(paste0("hist_emi_reg_",my_ssp)) %>% 
                mutate(year = (as.numeric(t)*5) +2010) %>% 
                filter(get(get_model_code(my_ssp))  == my_region),
              aes(x=year, y=value, group=1, color = "Hist emissions"),
              size = 1.2)  +   
    
    
    # Enerdata emissions
    geom_point(data= extract_region_value( EnerData_n_CO2_BAU, map_mglo_ed57, "message_globiom11") %>% 
                 filter( message_globiom11  == my_region),
               aes(x=year, y=value, group=1, color = "EnerData Blue BAU"),
               
               shape = 19,
               size = 2.4) +
    
    
    
    
    # SSP marker
    geom_line(data= marker_ssp_regional %>% filter(get(paste0("n",my_ssp)) == my_region)  ,
              aes(x=year, y=value, group=1, color = "IIASA SSP Marker"),
              size = 1.2,
              linetype = 4)  + 
    
    
    
    # graphic details
    scale_color_manual(  values =  c("sUC <.1"             = "black",
                                     "sUC <.01"            = "black",
                                     "IIASA SSP Baselines" = "#8585ad", #dark grey
                                     "IIASA SSP Marker"    = "black",
                                     "EnerData Blue BAU"   = "black",
                                     "Hist emissions"      = "blue",
                                     
                                     "test_A"  =  "#32c738",
                                     "test_B"  =  "#f77f2f", #orange
                                     "test_C"  =  "#db0f20", 
                                     "test_D"  =  "#c4570e",  # brown
                                     "test_E"  =  "#007c82", # petroleum
                                     "test_F"  =  "#8232c7", #violet
                                     "test_G"  =  "#450094",
                                     "test_H"  =  "blue",   #blue
                                     "test_I"  =  "#0f86db",
                                     "test_J"  =  "#0ccfab",
                                     "test_K"  =  "green",  #greens
                                     "test_L"  =  "#fff100", #yellow
                                     "test_M"  =  "#046918",
                                     "test_N"  =  "red",      # red
                                     "test_O"  =  "#9c4317"
    )) +
    ## Use this only on final chart!   
    #    guides(colour=guide_legend(  ncol=1,
    #                                 override.aes = list(linetype = c(
    #                                                                  "sUC <.01"           = "blank",
    #                                                                  "sUC <.1"            = "blank",
    #                                                                  "IIASA SSP Baselines"= "solid",
    #                                                                  "IIASA SSP Marker"   = "solid",
    #                                                                  "EnerData Blue BAU"  = "blank",
    #                                                                  "Hist emissions"     = "solid",
    #                                                                   "test_A"  =  "solid" #yellow
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
    #                                                                                           )))) + 
  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
    labs (color = "Tests") + 
    ggtitle(paste0("Baselines ", 
                   my_ssp, " - ", my_reg_description)) +  
    #<",my_reg_description,", ",my_extension,", ",my_transition_type,", ",my_transition_end, "> across different calibrations")) + 
    xlab("Year") +
    xlim(2000,2150)+
    ylab("Region Emissions [GtCO2]")  ; plottigat
  
}
#................ // AUTORUN // ................

# select region
marker_ssp_regional %>% select(paste0("n",my_ssp)) %>% distinct()
# select region
my_region = "mea"
my_reg_description = (get(my_ssp, regions_markers) %>% 
                        filter(!!as.symbol(get_model_code(my_ssp)) == my_region)  %>% 
                        select(paste0(get_model_code(my_ssp),"_description")))[1,1]














## -------------- PLOT ::  REGION Emissions  :: LR-Scenario Comparison   -------------------



my_ssp        = "ssp2" 
my_experiment = ssplist$ssp2_A_xxx 
my_exp_descrp = "Test_A"


#...........................................
# here you can MODIFY FILTER LOGIC to compare
# many scenarios alltogether
#...........................................


# Those filters are not all necessarily used (# deactivates option)


# | extshort | extmed | extlong |
my_acc_extensions  = c("extshort",
                       "extmed",
                       "extlong")

# | sigmoid_HHs | sigmoid_Hs | sigmoid_Ms | sigmoid_Ls | sigmoid_LLs | linear_pure | linear_soft |
my_acc_transition_type  = c("sigmoid_Ms",
                            "sigmoid_Ls",
                            "#sigmoid_Hs", 
                            "#sigmoid_HHs", 
                            "sigmoid_LLs", 
                            "#linear_pure", 
                            "#linear_soft" )

# | 28 | 38 | 48 | 58 |
my_acc_transition_end  = c("#28",
                           "38",
                           "48",
                           "#58")




# access data and view regions
marker_ssp_regional = get(paste0("sspDB_",my_ssp,"_native_regions_CO2_ffi")) %>% mutate(year = (t *5)+ 2010 )
marker_ssp_regional %>% select(paste0("n",my_ssp)) %>% distinct()


# select region
my_region = "afr"
my_reg_description = (get(my_ssp, regions_markers) %>% 
                        filter(!!as.symbol(get_model_code(my_ssp)) == my_region)  %>% 
                        select(paste0(get_model_code(my_ssp),"_description")))[1,1]




#................ // AUTORUN // ................
{
  plottigat= ggplot() +
  
    
  # Baseline region-calibrated 
    geom_line(data= my_experiment$get_PARAMETER_nty(paste0("emi_reg_",my_ssp), year_limit = 2300) %>% 
                mutate(key = paste0(extension," / ",trns_end," / ",trns_type)) %>%
                filter(
                  
                  # >> obvious, always active
                  key == key
                  ,get(get_model_code(my_ssp))  == my_region
                  
                  # >> optional, DEACTIVATE what you wanna plot
                  ,extension %in% my_acc_extensions
                  ,trns_type %in% my_acc_transition_type
                  ,trns_end  %in% my_acc_transition_end
                )
              
              ,aes(x=year, y=value, group=key, color = key)
              ,size = 1.2)  + 
    

    
    # Enerdata emissions
    geom_point(data= extract_region_value( EnerData_n_CO2_BAU, map_mglo_ed57, "message_globiom11") %>% 
                 filter( mglo  == my_region),
               aes(x=year, y=value, group=1, color = "_EnerData Blue BAU"),

               shape = 19,
               size = 2.4) +
  
    # Historical emissions
    geom_line(data= my_experiment$get_PARAMETER(paste0("hist_emi_reg_",my_ssp)) %>% 
                mutate(year = (as.numeric(t)*5) +2010) %>% 
                filter(get(get_model_code(my_ssp))  == my_region),
              aes(x=year, y=value, group=1, color = "_Hist emissions"),
              size = 1.2)  +  
    
    # SSP marker
    geom_line(data= marker_ssp_regional %>% filter(get(paste0("n",my_ssp)) == my_region)  ,
              aes(x=year, y=value, group=1, color = "_IIASA SSP Marker"),
              size = 1.2,
              linetype = 4)  + 
  
    
    # Plot appearance 
    scale_color_manual(  values = c("black", "blue", "black" ,pollo_20 )) + 
    guides(colour=guide_legend(ncol=1), fill=guide_legend(ncol=2)) +
    theme( legend.text   = element_text(size = 13),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = "Scenarios") + 
    ggtitle(paste0("Baselines <", my_exp_descrp,"> ", 
                   my_ssp, " - ", my_reg_description)) +  
    xlab("Year") +
    ylab("Region Emissions [GtCO2]")  ; plottigat

  
  }
  #................ // AUTORUN // ................
  
  
  # access data and view regions
  marker_ssp_regional %>% select(paste0("n",my_ssp)) %>% distinct()


  
  # select region
  my_region = "afr"
  my_reg_description = (get(my_ssp, regions_markers) %>% 
                          filter(!!as.symbol(get_model_code(my_ssp)) == my_region)  %>% 
                          select(paste0(get_model_code(my_ssp),"_description")))[1,1]
  
  


  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  ## -------------- PLOT ::  BASELINE scenarios   -------------------
  

 
  plottigat= ggplot() +
    
    
    
    # Baseline region-calibrated 
    geom_line(data= world_ssp_ykali_ty %>% filter(ssp == "ssp2", gdpadj =="PPP") 
              ,aes(x=year, y=value, group=extension, color = extension)
              ,size = 1.2)  + 

    
    # Plot appearance 
    scale_color_manual( values= pollo_20  ) + 
    guides(colour=guide_legend(ncol=1), fill=guide_legend(ncol=2)) +
    theme( legend.text   = element_text(size = 13),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = "Scenarios") + 
    ggtitle(paste0("GDP LR scenarios compared" )) + 
    xlab("Year") +
    ylab("Trill 2005 USD")  ; plottigat
  
  
  
  
  plottigat= ggplot() +
    
    
    
    # Baseline region-calibrated 

    
    geom_line(data= world_ssp_pop_ty %>% filter(ssp == "ssp2") 
              ,aes(x=year, y=value, group=extension, color = extension)
              ,size = 1.2
    )  + 
    
    
    
    # Plot appearance 
    scale_color_manual( values= pollo_20  ) + 
    guides(colour=guide_legend(ncol=1), fill=guide_legend(ncol=2)) +
    theme( legend.text   = element_text(size = 13),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = "Scenarios") + 
    ggtitle(paste0("Pop LR scenarios compared" )) + 
    xlab("Year") +
    ylab("Millions people")  ; plottigat
  
  
  
  ## -------------- PLOT ::  BASELINE scenarios STACKED   -------------------
  

  # | extshort | extmed | extlong |
  my_extension       = "extshort"
  
  # | TRUE | FALSE |
  no_legend = TRUE
  
  
  my_ssp = "ssp2"
  
  
  
  # ................. AUTORUN GDP .................
  
  plottigat= ggplot() + 
    
    
    # Scenario
    geom_area(data= ssp_ykali_nty %>% filter( ssp == my_ssp, gdpadj =="PPP", extension == my_extension),
              aes(x=year, y=value, group=n, fill =n)) + 
    
    # DICE
    geom_line(data= diceykali %>% filter(year <= 2300) 
              ,aes(x=year, y=value, group=1, color = "dice2016")
              ,size = 1.2
              ,linetype = "dashed"
    )  + 
    
    
    # graphic details
    scale_color_manual( values= c("black")  ) + 
    scale_fill_manual(values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
    
    theme( legend.position=if(no_legend){"none"} else {"right"} ,
           plot.title = element_text(size=18),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle(paste0("GDP stacked under -",my_extension, "- assumption")) + 
    
    
    
     ylim(0,max(max((world_ssp_ykali_ty%>%filter(ssp == my_ssp))$value),
                max((diceykali%>% filter(year <= 2300))$value))) + 
    
    xlab("Year") +
    ylab("Trill 2005 USD")  ; plottigat
  
  
  
  # ................. AUTORUN POP .................
  
  plottigat= ggplot() + 
    
    
    # Scenario
    geom_area(data= ssp_pop_nty %>% filter( ssp == my_ssp,  extension == my_extension),
              aes(x=year, y=value, group=n, fill =n)) + 
    
    
    # DICE
    geom_line(data= dicepop %>% filter(year <= 2300) 
              ,aes(x=year, y=value, group=1, color = "dice2016")
              ,size = 1.2
              ,linetype = "dashed"
    )  + 
    
    
    # graphic details
    scale_color_manual( values= c("black")  ) + 
    scale_fill_manual(values= colorize_regions("ed57") ) + 
    
    guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=2)) +
    
    theme( legend.position=if(no_legend){"none"} else {"right"} ,
           plot.title = element_text(size=18),
           axis.title.x = element_text(size = 16),
           axis.text.x = element_text(size = 14),
           axis.title.y = element_text(size = 16)) +  
    
    ggtitle(paste0("POP stacked under -",my_extension, "- assumption")) +
    ylim(0,max(max((world_ssp_pop_ty%>%filter(ssp == my_ssp))$value),
               max((dicepop%>% filter(year <= 2300))$value))) + 
    xlab("Year") +
    ylab("Million people")  ; plottigat
  