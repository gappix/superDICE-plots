# IMPORT NEW RESULTS


# Dependencies

source("01_output_crayon_colouring.R")
source("20_sDC_gdx_experiment_parser.R") 
source("21_sDC_new_results_detector.R") 
source("22_sDC_results_structure_builder.R")







import_new_results <- function(experiment_id,    #current experiment codename
                               my_experiments,   #list-structure for experiments
                               last_import_time  #sys time of last import (to detect new files)
                               ){
  
  
  # Step1: find new results
  gdx_with_path_list  =  find_new_results(experiment_id, last_import_time)
  
  if (length(gdx_with_path_list) > 0){ 
  
    
    cat(orange$bold("Importing << ", length(gdx_with_path_list) ," >> new gdxfile experiments \n"))
    i = 1
    
    # Step2: extract and organize each new data-experiment
    for(gdx_path_element in gdx_with_path_list){ 
      
      
      cat(green(i, " Parsing: ", gdx_path_element ," \n"))
      
      
      # 2a: parse gdx data and experiment info automatically
      exp_data_and_info =  parse_experiment(gdx_path_element)
      
      # 2b: tide infos and data in nested list structure
      my_experiments    =  tide_new_experiment(exp_data_and_info, my_experiments)
      
      
      
      i= i+1
      
    }
  }
  
  
  cat(orange$bold("Done! << ", length(gdx_with_path_list) ," >> gdxfiles correctly imported \n"))
  
  return(my_experiments)
  
}











# ## BURVA ####
# 
# 
# 
# #CBsimple
# sDC_SILICA.BURVA.BAU_clCBsimple                   =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__BAU_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# 
# 
# sDC_SILICA.BURVA.coop_BURKELR_clCBsimple          =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKELR_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coop_BURKESRdiff_clCBsimple      =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKESRdiff_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coop_BURKEBase_clCBsimple        =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKEBase_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.coopngsw_BURKELR_clCBsimple      =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKELR_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clCBsimple  =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKESRdiff_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coopngsw_BURKEBase_clCBsimple    =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKEBase_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.noncoop_BURKELR_clCBsimple       =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKELR_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.noncoop_BURKESRdiff_clCBsimple   =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKESRdiff_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.noncoop_BURKEBase_clCBsimple     =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKEBase_clCBsimple_cool8.gdx", gdx_experiment_directory = "BURVA")
# 
# #DICE2016
# sDC_SILICA.BURVA.BAU_clDICE2016                   =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__BAU_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.coop_BURKELR_clDICE2016          =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKELR_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coop_BURKESRdiff_clDICE2016      =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKESRdiff_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coop_BURKEBase_clDICE2016        =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKEBase_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.coopngsw_BURKELR_clDICE2016      =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKELR_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clDICE2016  =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKESRdiff_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coopngsw_BURKEBase_clDICE2016    =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKEBase_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.noncoop_BURKELR_clDICE2016       =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKELR_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.noncoop_BURKESRdiff_clDICE2016   =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKESRdiff_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.noncoop_BURKEBase_clDICE2016     =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKEBase_clDICE2016.gdx", gdx_experiment_directory = "BURVA")
# 
# #WITCHcoop
# sDC_SILICA.BURVA.BAU_clWITCHcoop                  =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__BAU_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.coop_BURKELR_clWITCHcoop         =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKELR_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coop_BURKESRdiff_clWITCHcoop     =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKESRdiff_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coop_BURKEBase_clWITCHcoop       =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coop_BURKEBase_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.coopngsw_BURKELR_clWITCHcoop     =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKELR_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coopngsw_BURKESRdiff_clWITCHcoop =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKESRdiff_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.coopngsw_BURKEBase_clWITCHcoop   =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__coopngsw_BURKEBase_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# 
# sDC_SILICA.BURVA.noncoop_BURKELR_clWITCHcoop      =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKELR_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.noncoop_BURKESRdiff_clWITCHcoop  =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKESRdiff_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# sDC_SILICA.BURVA.noncoop_BURKEBase_clWITCHcoop    =  SuperDICE(gdx_source_file = "sDC_SILICA_BURVA__noncoop_BURKEBase_clWITCHcoop.gdx", gdx_experiment_directory = "BURVA")
# 
# 
# 
# 
# 
# #noncoop
# 
# sDC_SILICA_CMOD__BAU_clCBsimple  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_CBsimple.gdx", gdx_experiment_directory = "CMOD")
# 
# 
# #simpleClimate corrections
# sDC_SILICA_CMOD__BAU_clCBsimple_nocorr  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_CBsimple_nocorr.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__BAU_clCBsimple_tcre10fcorr  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_CBsimple_tcre10fcorr.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__BAU_clCBsimple_tcre10  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_CBsimple_tcre10.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__BAU_clCBsimple_tcre24  =  SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_CBsimple_tcre24.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__BAU_clCBsimple_tcre08 = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_CBsimple_tcre08.gdx", gdx_experiment_directory = "CMOD")
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# ## MUInertial  ####
# 
# sDCx_AmberPW_MUInertial__BAU  = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__BAU.gdx", gdx_experiment_directory = "MUInertial")
# 
# 
# sDCx_AmberPW_MUInertial__coop_BURKE_EIN     = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coop_BURKE_EIN.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coop_BURKE_EINe    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coop_BURKE_EINe.gdx", gdx_experiment_directory = "MUInertial")
# 
# sDCx_AmberPW_MUInertial__coop_BURKE_LIN     = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coop_BURKE_LIN.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coop_BURKE_LINT    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coop_BURKE_LINT.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coop_BURKE_OFF    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coop_BURKE_OFF.gdx", gdx_experiment_directory = "MUInertial")
# 
# sDCx_AmberPW_MUInertial__coop_DICEreg_LINT  = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coop_DICEreg_LINT.gdx", gdx_experiment_directory = "MUInertial")
# 
# 
# sDCx_AmberPW_MUInertial__coopngsw_BURKE_EIN     = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coopngsw_BURKE_EIN.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coopngsw_BURKE_EINe    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coopngsw_BURKE_EINe.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coopngsw_BURKE_EINX    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coopngsw_BURKE_EINX.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coopngsw_BURKE_LIN     = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coopngsw_BURKE_LIN.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coopngsw_BURKE_LINT.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__coopngsw_BURKE_OFF     = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coopngsw_BURKE_OFF.gdx", gdx_experiment_directory = "MUInertial")
# 
# sDCx_AmberPW_MUInertial__coopngsw_DICEreg_LINT  = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__coopngsw_DICEreg_LINT.gdx", gdx_experiment_directory = "MUInertial")
# 
# 
# sDCx_AmberPW_MUInertial__noncoop_BURKE_EIN     = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__noncoop_BURKE_EIN.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__noncoop_BURKE_LIN     = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__noncoop_BURKE_LIN.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__noncoop_BURKE_LINT.gdx", gdx_experiment_directory = "MUInertial")
# sDCx_AmberPW_MUInertial__noncoop_BURKE_OFF    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__noncoop_BURKE_OFF.gdx", gdx_experiment_directory = "MUInertial")
# 
# sDCx_AmberPW_MUInertial__noncoop_DICEreg_LINT    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MUInertial__noncoop_DICEreg_LINT.gdx", gdx_experiment_directory = "MUInertial")
# 
# 
# 
# 
# 
# ##  MIU2  ####
# 
# 
# sDCx_AmberPW_MIU2__coop_OFF_LINT   = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINT.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coopngsw_OFF_LINT  = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coopngsw_OFF_LINT.gdx", gdx_experiment_directory = "MIU2")
# 
# sDCx_AmberPW_MIU2__coop_OFF_LIN    = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LIN.gdx", gdx_experiment_directory = "MIU2")
# 
# sDCx_AmberPW_MIU2__coop_OFF_LINT01 = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINT01.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coop_OFF_LINTs001t15 = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINTs001t15.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coopngsw_OFF_LINTs001t15  = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coopngsw_OFF_LINTs001t15.gdx", gdx_experiment_directory = "MIU2")
# 
# sDCx_AmberPW_MIU2__coopngsw_OFF_LINTELANDs001t15 = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coopngsw_OFF_LINTELANDs001t15.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coop_OFF_LINTmiumin2070   = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINTmiumin2070.gdx", gdx_experiment_directory = "MIU2")
# 
# 
# # series 
# 
# 
# sDCx_AmberPW_MIU2__coop_OFF_LINTsfx001in15 =  SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINTsfx001in15.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in15  =  SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in15.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coop_OFF_LINTsfx001in20 =  SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINTsfx001in20.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in20  =  SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in20.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in25  =  SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_LINTsfx03in25.gdx", gdx_experiment_directory = "MIU2")
# 
# sDCx_AmberPW_MIU2__coop_OFF_EIN13  =  SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coop_OFF_EIN13.gdx", gdx_experiment_directory = "MIU2")
# 
# 
# 
# sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in20  = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coopngsw_OFF_LINT.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in25   = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in25.gdx", gdx_experiment_directory = "MIU2")
# sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in15   = SuperDICE(gdx_source_file = "sDCx_AmberPW_MIU2__coopngsw_OFF_LINTsfx03in15.gdx", gdx_experiment_directory = "MIU2")
# 
# 
# ##  SMob  ####
# 
# sDC_AmberPWLINT_SMob__BAU     = SuperDICE(gdx_source_file = "sDCx_AmberPWLINT_SMob__BAU.gdx", gdx_experiment_directory = "SMob")
# 
# 
# sDC_AmberPWLINT_SMob__coop_BURKE     = SuperDICE(gdx_source_file = "sDCx_AmberPWLINT_SMob__coop_BURKE.gdx", gdx_experiment_directory = "SMob")
# sDC_AmberPWLINT_SMob__noncoop_BURKE  = SuperDICE(gdx_source_file = "sDCx_AmberPWLINT_SMob__noncoop_BURKE.gdx", gdx_experiment_directory = "SMob")
# sDCx_AmberPWLINT_SMob__coopngsw_BURKE = SuperDICE(gdx_source_file = "sDCx_AmberPWLINT_SMob__coopngsw_BURKE.gdx", gdx_experiment_directory = "SMob")
# 
# 
# sDC_AmberPWLINT_SMob__coop_DICEreg     = SuperDICE(gdx_source_file = "sDCx_AmberPWLINT_SMob__coop_DICEreg.gdx", gdx_experiment_directory = "SMob")
# sDC_AmberPWLINT_SMob__noncoop_DICEreg  = SuperDICE(gdx_source_file = "sDCx_AmberPWLINT_SMob__noncoop_DICEreg.gdx", gdx_experiment_directory = "SMob")
# sDC_AmberPWLINT_SMob__coopngsw_DICEreg = SuperDICE(gdx_source_file = "sDCx_AmberPWLINT_SMob__coopngsw_DICEreg.gdx", gdx_experiment_directory = "SMob")
# 
# 
# 
# 
# ## CMOD series ######
# 
# sDC_SILICA_CMOD__BAU_DICE2016              = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_OFF_DICE2016.gdx", gdx_experiment_directory = "CMOD")
# 
# sDC_SILICA_CMOD__coop_DICEreg_DICE2016     = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coop_DICEreg_DICE2016.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__coop_BURKE_DICE2016       = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coop_BURKE_DICE2016.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__coopngsw_DICEreg_DICE2016 = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coopngsw_DICEreg_DICE2016.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__coopngsw_BURKE_DICE2016   = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__coopngsw_BURKE_DICE2016.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__noncoop_DICEreg_DICE2016  = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_DICEreg_DICE2016.gdx", gdx_experiment_directory = "CMOD")
# sDC_SILICA_CMOD__noncoop_BURKE_DICE2016    = SuperDICE(gdx_source_file = "sDC_SILICA_CMOD__noncoop_BURKE_DICE2016.gdx", gdx_experiment_directory = "CMOD")
# 
# 
# 
# 




