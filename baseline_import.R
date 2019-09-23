
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
ssplist$m_A_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__XMX_A.gdx"))
ssplist$m_B_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_XMX_test__XMX_B.gdx"))





ssplist$m_B_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_B.gdx"))
ssplist$m_C_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_C.gdx"))
ssplist$m_D_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_D.gdx"))

ssplist$m_E_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__MG_E.gdx"))



ssplist$m_A_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_A.gdx"))
ssplist$m_B_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_B.gdx"))
ssplist$m_C_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_C.gdx"))

ssplist$m_F_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_F.gdx"))
ssplist$m_G_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_G.gdx"))
ssplist$m_H_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_H.gdx"))
ssplist$m_I_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_I.gdx"))
ssplist$m_J_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_J.gdx"))
ssplist$m_K_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_K.gdx"))
ssplist$m_L_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_L.gdx"))
ssplist$m_M_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_M.gdx"))
ssplist$m_N_m = GDXclass(paste0(resuts_path,"sigma_baseline_kali_test__mgnorm_N.gdx"))
