## NAME PARSING




## Dependencies

source("000_package_retriever.R")
source("19_sDC_class.R")
require_package("purrr")
require_package("stringr")






parse_experiment <- function(gdx_name_with_full_path){
  

  # gdx filename isolated
  gdx_filename = sapply(strsplit(gdx_name_with_full_path, "/"), tail, 1)
  gdx_filename_noext =substr(gdx_filename, 1, nchar(gdx_filename)-4)
  
  # gdx infos split
  exp_infos = str_split(gdx_filename_noext, "_")[[1]]
  
  # regex for complex parsing elements
  regex_for_regions = "^enerdata..|witch..|^r5$|^storcap\\w+\\d+|^global$"
  regex_for_coop    = "^coop$|^noncoop$|^coop\\w+"
  
  #info parsing 
  experiment= list() 
  experiment$ssp             = exp_infos[grep( regex("^ssp\\d"),          exp_infos )]
  experiment$regions         = exp_infos[grep( regex(regex_for_regions),   exp_infos )]
  experiment$exp_id          = exp_infos[grep( regex("^exp\\w+"),         exp_infos )]
  experiment$kali            = exp_infos[grep( regex("^kali\\w+"),            exp_infos )]
  experiment$cooperation     = exp_infos[grep( regex(regex_for_coop),           exp_infos )]
  experiment$climateMod      = exp_infos[grep( regex("^cl\\w+"),              exp_infos )]
  experiment$damageFunction  = exp_infos[grep( regex("^dam\\w+"),        exp_infos )]
  experiment$policy          = exp_infos[grep( regex("^pol\\w+")             ,exp_infos )]
  
  #data extracted in SuperDICE S3 class
  experiment$data            = SuperDICE(gdx_name_with_full_path)  
  
  
  
  return(experiment)
  
}





# 
# ## LTPB EXPERIMENTS   #####
# 
# sDC_DIAG_80_gr5_ltpb2150  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_ltpb2150.gdx")
# sDC_DIAG_80_gr5_ltpb2200  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_ltpb2200.gdx")
# sDC_DIAG_80_gr5_ltpb2300  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_ltpb2300.gdx")
# 
# sDC_DIAG_30_gr5_ltpb2150  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_ltpb2150.gdx")
# sDC_DIAG_30_gr5_ltpb2200  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_ltpb2200.gdx")
# sDC_DIAG_30_gr5_ltpb2300  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_ltpb2300.gdx")
# 
# sDC_DIAG_80_const_ltpb2150  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_ltpb2150.gdx")
# sDC_DIAG_80_const_ltpb2200  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_ltpb2200.gdx")
# sDC_DIAG_80_const_ltpb2300  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_ltpb2300.gdx")
# 
# sDC_DIAG_30_const_ltpb2150  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_const_ltpb2150.gdx")
# sDC_DIAG_30_const_ltpb2200  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_const_ltpb2200.gdx")
# sDC_DIAG_30_const_ltpb2300  = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_const_ltpb2300.gdx")
# 
# 
# 
# 
# ## MIU-UP EXPERIMENTS   #####
# 
# sDC_DIAG_80_gr5_70mu12    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_ltpb2200.gdx")
# sDC_DIAG_80_gr5_90mu11    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_90mu11.gdx")
# sDC_DIAG_80_gr5_100mu11   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_100mu11.gdx")
# sDC_DIAG_80_gr5_90mu105   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_90mu105.gdx")
# 
# 
# sDC_DIAG_30_gr5_70mu12    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_70mu12.gdx")
# sDC_DIAG_30_gr5_90mu11    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_90mu11.gdx")
# sDC_DIAG_30_gr5_100mu11   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_100mu11.gdx")
# sDC_DIAG_30_gr5_90mu105   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_90mu105.gdx")
# 
# 
# sDC_DIAG_80_const_70mu12    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_ltpb2200.gdx")
# sDC_DIAG_80_const_90mu11    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_90mu11.gdx")
# sDC_DIAG_80_const_100mu11   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_100mu11.gdx")
# sDC_DIAG_80_const_90mu105   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_const_90mu105.gdx")
# 
# 
# sDC_DIAG_30_const_70mu12    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_const_ltpb2200.gdx")
# sDC_DIAG_30_const_90mu11    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_const_90mu11.gdx")
# sDC_DIAG_30_const_100mu11   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_const_100mu11.gdx")
# sDC_DIAG_30_const_90mu105   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_const_90mu105.gdx")
# 
# 
# 
# 
# 
# 
# ## PBACK/ GBACK experiments ######
# 
# 
# sDCx_Amber_DIAG_30_gr5_p550g02    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_p550g02.gdx")
# sDCx_Amber_DIAG_30_gr5_p550g025   = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_p550g025.gdx")
# sDCx_Amber_DIAG_30_gr5_p550g05    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_p550g05.gdx")
# sDCx_Amber_DIAG_30_gr5_p550g03    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_p550g03.gdx")
# sDCx_Amber_DIAG_30_gr5_p344g025    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_p344g025.gdx")
# sDCx_Amber_DIAG_30_gr5_p750g025    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_p750g025.gdx")
# 
# 
# sDCx_Amber_DIAG_80_gr5_p550g02    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_p550g02.gdx")
# sDCx_Amber_DIAG_80_gr5_p550g025   = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_p550g025.gdx")
# sDCx_Amber_DIAG_80_gr5_p550g05    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_p550g05.gdx")
# sDCx_Amber_DIAG_80_gr5_p550g03    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_p550g03.gdx")
# sDCx_Amber_DIAG_80_gr5_p344g025    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_p344g025.gdx")
# sDCx_Amber_DIAG_80_gr5_p750g025    = SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_p750g025.gdx")
# 
# 
# 
# 
# 
# # 
# # 
# # sDC_DIAG_30_gr5_p344g025    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p344g025.gdx")
# # sDC_DIAG_30_gr5_p550g025    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g025.gdx")
# # sDC_DIAG_30_gr5_p600g025    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p600g025.gdx")
# # sDC_DIAG_30_gr5_p550g02    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g02.gdx")
# # sDC_DIAG_30_gr5_p550g03    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g03.gdx")
# # sDC_DIAG_30_gr5_p550g05    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g05.gdx")
# # 
# # sDC_DIAG_80_gr5_p344g025    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p344g025.gdx")
# # sDC_DIAG_80_gr5_p550g025    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g025.gdx")
# # sDC_DIAG_80_gr5_p600g025    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p600g025.gdx")
# # sDC_DIAG_80_gr5_p550g02    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g02.gdx")
# # sDC_DIAG_80_gr5_p550g03    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g03.gdx")
# # sDC_DIAG_80_gr5_p550g05    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g05.gdx")
# 
# 
# 
# ## ALL COMBINATIONS EXPLICITED
# 
# sDC_DIAG_30_gr5_p550g05_ltpb2100_90mu105progr    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g05_ltpb2100_90mu105progr.gdx")
# sDC_DIAG_80_gr5_p550g05_ltpb2100_90mu105progr    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g05_ltpb2100_90mu105progr.gdx")
# 
# 
# sDC_DIAG_30_gr5_p550g05_ltpb2150_90mu105progr    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g05_ltpb2150_90mu105progr.gdx")
# sDC_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g05_ltpb2150_90mu105progr.gdx")
# 
# 
# sDC_DIAG_80_gr5_p550g05_ltpb2200_90mu105progr   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g05_ltpb2200_90mu105progr.gdx")
# sDC_DIAG_30_gr5_p550g05_ltpb2200_90mu105progr   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g05_ltpb2200_90mu105progr.gdx")
# 
# 
# sDC_DIAG_80_gr5_p550g025_ltpb2200_90mu105progr   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g025_ltpb2200_90mu105progr.gdx")
# sDC_DIAG_30_gr5_p550g025_ltpb2200_90mu105progr   = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g025_ltpb2200_90mu105progr.gdx")
# 
# 
# 
# sDC_DIAG_80_gr5_p334g05_ltpb2150_90mu105progr    = SuperDICE(gdx_source_file = "sDC_noncoop_ssp2__ctax_DIAG_C80_gr5_p334g05_ltpb2150_90mu105progr.gdx")
# 
# 
# 
# 
# sDCx_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g05_ltpb2150_90mu105progr.gdx")
# 
# 
# #powerfit
# # sDCx_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr_powerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g05_ltpb2150_90mu105progr_powerfit.gdx")
# # sDCx_DIAG_30_gr5_p550g05_ltpb2150_90mu105progr_powerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g05_ltpb2150_90mu105progr_powerfit.gdx")
# 
# sDCx_Amber_DIAG_30_gr5_powerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_powerfit.gdx")
# sDCx_Amber_DIAG_80_gr5_powerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_powerfit.gdx")
# 
# 
# 
# 
# #fixed powerfit
# # sDCx_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr_fxpowerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2__ctax_DIAG_C80_gr5_p550g05_ltpb2150_90mu105progr_fxpowerfit.gdx")
# # sDCx_DIAG_30_gr5_p550g05_ltpb2150_90mu105progr_fxpowerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2__ctax_DIAG_C30_gr5_p550g05_ltpb2150_90mu105progr_fxpowerfit.gdx")
# 
# sDCx_Amber_DIAG_30_gr5_fxpowerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C30_gr5_fxpowerfit.gdx")
# sDCx_Amber_DIAG_80_gr5_fxpowerfit  =  SuperDICE(gdx_source_file = "sDCx_noncoop_ssp2_Amber__ctax_DIAG_C80_gr5_fxpowerfit.gdx")
# 
