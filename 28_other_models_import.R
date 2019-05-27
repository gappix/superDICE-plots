

#___________________________

#### BASELINE               ---------------------------------------------------
sDC_Kali_SSP2_gdx            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated.gdx"))
sDC_BAU_SSP2_gdx             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2.gdx"))

historical_values_gdx       <- gdx(paste0(dir_sDC_data,"data_historical_values.gdx"))


#___________________________

## SIGMAS DATA POINTS       ######

sigma_2015_gdx.Regr_OECD_BLUE  <- gdx(paste0(dir_sDC_data,"sigma_2015_regression_OECD_BLUE.gdx"))
sigma_2015_gdx.PRIMAP          <- gdx(paste0(dir_sDC_data,"sigma_2015_PRIMAP.gdx"))
sigma_fut_gdx.BROWN            <- gdx(paste0(dir_sDC_data,"sigma_fut_BROWN.gdx"))
sigma_fut_gdx.BLUE             <- gdx(paste0(dir_sDC_data,"sigma_fut_BLUE.gdx"))
sigma_hist_gdx.PRIMAP          <- gdx(paste0(dir_sDC_data,"sigma_hist_PRIMAP.gdx"))
sigma_hist_gdx.OECD            <- gdx(paste0(dir_sDC_data,"sigma_hist_OECD.gdx"))

#___________________________

####   WITCH                ######

data_baseline_WITCH_gdx     <- gdx(paste0(dir_sDC_data,"data_baseline.gdx"))
WITCH_results_bau2_gdx      <- gdx(paste0(dir_data_analysis,"WITCH_results_bau2.gdx"))


#___________________________

####   DICE-Vanillas        ######

DICE123a_BAU_vanilla_gdx     <- gdx(paste0(dir_DICE_Vanillas,"DICE123a_BAU_vanilla_results.gdx"))
DICEdeltaV8_BAU_vanilla_gdx  <- gdx(paste0(dir_DICE_Vanillas,"DICEdeltaV8booka_BAU_vanilla_results.gdx"))
DICE2013R_BAU_vanilla_gdx    <- gdx(paste0(dir_DICE_Vanillas,"DICE2013R_100413_BAU_vanilla_results.gdx"))
DICE2016R_BAU_vanilla_gdx    <- gdx(paste0(dir_DICE_Vanillas,"DICE2016R_091916ap_BAU_vanilla_results.gdx"))

#___________________________

####  ENERDATA BAU          ######

EnerData_Blue_BAU_gdx             = gdx(paste0(dir_sDC_data,"data_emissions_enerdata_blue.gdx"))
EnerData_Brown_BAU_gdx            = gdx(paste0(dir_sDC_data,"data_emissions_enerdata_brown.gdx"))


#___________________________

####  SSP  DATA             ######

ssp_db_pop                  <- read.csv(paste0(dir_data_ssp,"SspDb_country_data_2013-06-12.csv"))
ssp_db_TotEmi                  <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSP2_Emissions_CO2_Total.xlsx"), 1)) %>% select(-Notes)
iamc_ssp2_rcp26_Effi                <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "iamc_ssp2_rcp26_Effi.xlsx"), 1)) %>% select(-Notes)

#___________________________






#ADVANCE 2016 dump !! HEAVY !!
ADVANCE_DB           <- read.csv(paste0(dir_ADVANCE,"advance_native_20160810-141456.csv"))
#much more manageable v v
ADVANCE_DB.CO2ffi    <- read.csv(paste0(dir_ADVANCE,"advance_native_20160810-141456.csv")) %>% filter(VARIABLE=="Emissions|CO2|Fossil Fuels and Industry" )

rm(ADVANCE_DB)



## DICE 
DICE2016R_CTax_DIAG_C30_const_gdx    <- gdx(paste0(dir_DICE_CTax,"DICE2016R_091916ap_ctax_DIAG_C30_const_results.gdx"))
DICE2016R_CTax_DIAG_C30_gr5_gdx      <- gdx(paste0(dir_DICE_CTax,"DICE2016R_091916ap_ctax_DIAG_C30_gr5_results.gdx"))
DICE2016R_CTax_DIAG_C80_const_gdx    <- gdx(paste0(dir_DICE_CTax,"DICE2016R_091916ap_ctax_DIAG_C80_const_results.gdx"))
DICE2016R_CTax_DIAG_C80_gr5_gdx      <- gdx(paste0(dir_DICE_CTax,"DICE2016R_091916ap_ctax_DIAG_C80_gr5_results.gdx"))


#___________________________



#### REFERENCE BASELINE     ######

sDC_Kali_SSP2_gdx            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated.gdx"))
sDC_BAU_SSP2_gdx             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2.gdx"))


#___________________________


#### SOFT CONSTRAINT  EXP    ######

## 300sc1 
sDC_Kali_SSP2_gdx.300sc1            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_sigma_calibrated__300sc1.gdx"))
sDC_BAU_SSP2_gdx.300sc1             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2__300sc1.gdx"))

## 300sc1 EXP  WEIGHTED 0.5   
sDC_Kali_SSP2_gdx.300sc1_weight05            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_sigma_calibrated__300sc1_weight05.gdx"))
sDC_BAU_SSP2_gdx.300sc1_weight05             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2__300sc1_weight05.gdx"))

## 300sc1 EXP  WEIGHTED 0.01 
sDC_Kali_SSP2_gdx.300sc1_weight1e2            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_sigma_calibrated__300sc1_weight1e2.gdx"))
sDC_BAU_SSP2_gdx.300sc1_weight1e2             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2__300sc1_weight1e2.gdx"))

## 300sc1 EXP  WEIGHTED 0.005   
sDC_Kali_SSP2_gdx.300sc1_weight5e3            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_sigma_calibrated__300sc1_weight5e3.gdx"))
sDC_BAU_SSP2_gdx.300sc1_weight5e3             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2__300sc1_weight5e3.gdx"))

## 300sc1 EXP  WEIGHTED 0.001   
sDC_Kali_SSP2_gdx.300sc1_weight1e3            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_sigma_calibrated__300sc1_weight1e3.gdx"))
sDC_BAU_SSP2_gdx.300sc1_weight1e3             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2__300sc1_weight1e3.gdx"))

## 300sc1 EXP  WEIGHTED 0.0005
sDC_Kali_SSP2_gdx.300sc1_weight5e4            <- gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_sigma_calibrated__300sc1_weight5e4.gdx"))
sDC_BAU_SSP2_gdx.300sc1_weight5e4             <- gdx(paste0(dir_sDC_run,"BAU_results_ssp2__300sc1_weight5e4.gdx"))


#___________________________






#### HARD CONSTRAINT  EXP    ######

sDC_Kali_SSP2_gdx.100s4_200s1       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_100s4_200s1.gdx"))
sDC_BAU_SSP2_gdx.100s4_200s1           = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_100s4_200s1.gdx"))

sDC_Kali_SSP2_gdx.100s6_200s1       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_100s6_200s1.gdx"))
sDC_BAU_SSP2_gdx.100s6_200s1           = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_100s6_200s1.gdx"))

sDC_Kali_SSP2_gdx.100s6       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_100s6.gdx"))
sDC_BAU_SSP2_gdx.100s6          = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_100s6.gdx"))

sDC_Kali_SSP2_gdx.300s2       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_300s2.gdx"))
sDC_BAU_SSP2_gdx.300s2           = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_300s2.gdx"))

sDC_Kali_SSP2_gdx.300s3       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_300s3.gdx"))
sDC_BAU_SSP2_gdx.300s3           = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_300s3.gdx"))

sDC_Kali_SSP2_gdx.100s7_200s2       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_100s7_200s2.gdx"))
sDC_BAU_SSP2_gdx.100s7_200s2          = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_100s7_200s2.gdx"))

sDC_Kali_SSP2_gdx.100s7_250s2_300s1       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_100s7_250s2_300s1.gdx"))
sDC_BAU_SSP2_gdx.100s7_250s2_300s1          = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_100s7_250s2_300s1.gdx"))

sDC_Kali_SSP2_gdx.300s1              = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_300s1.gdx"))
sDC_BAU_SSP2_gdx.300s1          = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_300s1.gdx"))

#with constraints on last point forced passage
sDC_Kali_SSP2_gdx.300s1_x       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated_300s1_x.gdx"))
sDC_BAU_SSP2_gdx.300s1_x          = gdx(paste0(dir_sDC_run,"BAU_results_ssp2_300s1_x.gdx"))

#___________________________

#### HISTORICAL-CALIBRATED  + 15sPRIMAP + 3hPRIMAP  EXPERIMENTS ######

#15sPRIMAP_3hPRIMAP
sDC_Kali_SSP2_gdx.15sPRIMAP_3hPRIMAP  = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated__15sPRIMAP_3hPRIMAP.gdx"))
sDC_BAU_SSP2_gdx.15sPRIMAP_3hPRIMAP   = gdx(paste0(dir_sDC_run,"BAU_results_ssp2__15sPRIMAP_3hPRIMAP.gdx"))

#15sPRIMAP_3hPRIMAP_300s1
sDC_Kali_SSP2_gdx.15sPRIMAP_3hPRIMAP_300s1  = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated__15sPRIMAP_3hPRIMAP_300s1.gdx"))
sDC_BAU_SSP2_gdx.15sPRIMAP_3hPRIMAP_300s1   = gdx(paste0(dir_sDC_run,"BAU_results_ssp2__15sPRIMAP_3hPRIMAP_300s1.gdx"))

#15sPRIMAP_3hPRIMAP_300s3
sDC_Kali_SSP2_gdx.15sPRIMAP_3hPRIMAP_300s3  = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated__15sPRIMAP_3hPRIMAP_300s3.gdx"))
sDC_BAU_SSP2_gdx.15sPRIMAP_3hPRIMAP_300s3   = gdx(paste0(dir_sDC_run,"BAU_results_ssp2__15sPRIMAP_3hPRIMAP_300s3.gdx"))


#___________________________









#### EXPERIMENTS ----
sDC_Kali_OECD_SSP2_gdx       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_OECD_calibrated.gdx"))
sDC_BAU_OECD_SSP2_gdx        = gdx(paste0(dir_sDC_run,"BAU_results_OECD_ssp2.gdx"))



#### EnerBrown    -------

sDC_Kali_SSP2_gdx.brown       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated__brown.gdx"))
sDC_BAU_SSP2_gdx.brown        = gdx(paste0(dir_sDC_run,"BAU_results_ssp2__brown.gdx"))






#### EnerBrown  +  15sPRIMAP   -------

sDC_Kali_SSP2_gdx.brown_15sPRIMAP       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated__brown_15sPRIMAP.gdx"))
sDC_BAU_SSP2_gdx.brown_15sPRIMAP        = gdx(paste0(dir_sDC_run,"BAU_results_ssp2__brown_15sPRIMAP.gdx"))


#### EnerBrown + 15sPRIMAP + 3hPRIMAP --------

#brown_15sPRIMAP_3hPRIMAP

sDC_Kali_SSP2_gdx.brown_15sPRIMAP_3hPRIMAP  = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated__brown_15sPRIMAP_3hPRIMAP.gdx"))
sDC_BAU_SSP2_gdx.brown_15sPRIMAP_3hPRIMAP   = gdx(paste0(dir_sDC_run,"BAU_results_ssp2__brown_15sPRIMAP_3hPRIMAP.gdx"))





#### EnerBrown + 15sPRIMAP + 3hPRIMAP + 300s1 --------

#brown_15sPRIMAP_3hPRIMAP_300s1

sDC_Kali_SSP2_gdx.brown_15sPRIMAP_3hPRIMAP_300s1  = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_calibrated__brown_15sPRIMAP_3hPRIMAP_300s1.gdx"))
sDC_BAU_SSP2_gdx.brown_15sPRIMAP_3hPRIMAP_300s1   = gdx(paste0(dir_sDC_run,"BAU_results_ssp2__brown_15sPRIMAP_3hPRIMAP_300s1.gdx"))





#----

sDC_Kali_OECDv6_SSP2_gdx       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_OECDv6_calibrated.gdx"))
sDC_BAU_OECDv6_SSP2_gdx        = gdx(paste0(dir_sDC_run,"BAU_results_OECDv6_ssp2.gdx"))

sDC_Kali_OECDv5_SSP2_gdx       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_OECDv5_calibrated.gdx"))
sDC_BAU_OECDv5_SSP2_gdx        = gdx(paste0(dir_sDC_run,"BAU_results_OECDv5_ssp2.gdx"))

sDC_Kali_OECDv1_SSP2_gdx       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_OECDv1_calibrated.gdx"))
sDC_BAU_OECDv1_SSP2_gdx        = gdx(paste0(dir_sDC_run,"BAU_results_OECDv1_ssp2.gdx"))


sDC_Kali_v1_SSP2_gdx       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_v1_calibrated.gdx"))
sDC_BAU_v1_SSP2_gdx        = gdx(paste0(dir_sDC_run,"BAU_results_v1_ssp2.gdx"))

sDC_Kali_v6_SSP2_gdx       = gdx(paste0(dir_sDC_data,"data_sDC_ssp2_baseline_v6_calibrated.gdx"))
sDC_BAU_v6_SSP2_gdx        = gdx(paste0(dir_sDC_run,"BAU_results_v6_ssp2.gdx"))









#####  <<   DATA PREPARATION  >> -----




#  SIGMA Calibrated
sigma_sDC_nty.300s3  = sDC_BAU_SSP2_gdx.300s3['sigma'] %>% #<<<<<< change this
  mutate(year = t_to_y(as.integer(t))) %>%
  make_year_integer()


#### superRICE EMISSIONS
E_sDC_BAU_nty.300s3 = sDC_BAU_SSP2_gdx.300s3["E"] %>%    #<<<<<< change this
  mutate(year = t_to_y(as.integer(t)) ) %>% 
  make_t_integer()


#### EMISSIONS MERGED
E_sDC_ED_hist.300s2 = {
  
  E_sDC_BAU_nty.variant = E_sDC_BAU_nty.300s2 #<<<<<< change this
  
  E_sDC_ED_hist.variant = merge(E_EnerData_BAU_nty,  
                               E_sDC_BAU_nty.variant,  
                               by=c("n", "year"),
                               all.y = TRUE)           %>% 
    rename(EnerData = value.x, superRICE =value.y)       %>%
    mutate(abs_difference = abs(EnerData - superRICE) )  %>%
    mutate(impact_factor = abs_difference/ mean(c(EnerData, superRICE))) %>%
    mutate(id = row_number())
  
  E_sDC_ED_hist.variant = merge(E_sDC_ED_hist.variant, 
                               E_hist_ny,  
                               by=c("n", "year"),
                               all.y = TRUE, 
                               all.x=TRUE    ) %>%    
    rename(Hist = value) %>% 
    make_year_integer()
  
  E_sDC_ED_hist.variant}





# ykali from ssp
ykali_ssp2_nty = sDC_Kali_SSP2_gdx['ykali']%>% mutate(year= t_to_y(as.integer(t)))
ykali_sDC_nty   = sDC_BAU_SSP2_gdx['ykali']    %>% mutate(year= t_to_y(as.integer(t)))
ssp_ykali     = data_baseline_WITCH_gdx['ssp_ykali']
ppp2mer_nty   = data_baseline_WITCH_gdx['ppp2mer'] %>% mutate(year = wt_to_y(as.integer(t)))



# Y from superRICE
y_sDC_nty      = sDC_BAU_SSP2_gdx ['Y']%>% 
  mutate(year = t_to_y(as.integer(t))) %>% 
  make_t_integer()






#### WITCH emissions
E_WITCH_nty = WITCH_results_bau2_gdx["Q_EMI"]  %>% 
  filter(e=='co2ffi') %>%
  mutate(year = wt_to_y(as.integer(t)))
# !APPLY ONLY ONCE!  conversion 
# from WITCH-time (t1 = 2005) to sR-time (t1 = 2015)
E_WITCH_nty$t = as.integer(E_WITCH_nty$t) - 2
# !APPLY ONLY ONCE!  conversion from Carbon to CO2
E_WITCH_nty$value = E_WITCH_nty$value * 44 /12




  

#### WITCH gdp
y_WITCH_nty   = WITCH_results_bau2_gdx["BAU_Q"] %>% 
  mutate(year = wt_to_y(as.integer(t))) %>%
  filter(iq=="y") %>%
  select(-iq)
# !APPLY ONLY ONCE!  conversion 
# from WITCH-time (t1 = 2005) to sR-time (t1 = 2015)
y_WITCH_nty$t = as.integer(y_WITCH_nty$t) - 2












#### TATM
TATM_ty  = BAU_sDC_results_ssp2_gdx['TATM'] %>% 
  mutate(year = t_to_y(as.integer(t))) %>% 
  make_t_integer()













#### Historical (measured) EMISSIONS
# historical emissions
E_hist_ny   = historical_values_gdx["q_emi_valid_oecd"] %>% 
  filter(V1 == "co2ffi") %>% 
  filter(V2 == "2010") %>% 
  rename(year=V2) 
# !APPLY ONLY ONCE!  conversion from Carbon to CO2 values
E_hist_ny$value = E_hist_ny$value * 44/12






#### EMISSIONS ++ superRICE ++  WORLD -----------------------------------------

E_sDC_WORLD_ty = E_sDC_BAU_nty %>%
  group_by(year, t)%>%
  summarise(superRICE = sum(value)) %>%
  select(t, year, superRICE)




#### WITCH WORLD EMISSIONS
E_WITCH_WORLD_ty = E_WITCH_nty %>%
  group_by(year, t)%>%
  summarise(WITCH = sum(value)) %>%
  select(t, year, WITCH)




#### ENERDATA WORLD EMISSIONS
E_EnerData_WORLD_ty = E_EnerData_BAU_nty %>%
  group_by(year, t)%>%
  summarise(EnerData = sum(value)) %>%
  select(t, year, EnerData)



#### HISTORICAL WORLD EMISSIONS

E_hist_WORLD_y  = E_hist_ny  %>%
  group_by(year)%>%
  summarise(History = sum(value)) %>%
  select( year, History)




#### WORLD GDP  superRICE
y_WORLD_sDC_y = y_sDC_nty %>%
  group_by(year)%>%
  summarise(superRICE = sum(value)) %>%
  select( year, superRICE)



#### WORLD GDP  WITCH
y_WORLD_WITCH_y = y_WITCH_nty %>%
  group_by(year)%>%
  summarise(WITCH = sum(value)) %>%
  select( year, WITCH )





#### WORLD TEMP WITCH
TATM_WITCH_y = WITCH_results_bau2_gdx["TEMP"] %>% 
  filter(m=="atm") %>%
  mutate(year = wt_to_y(as.integer(t))) %>%
  select(year, value) %>% 
  distinct()




















