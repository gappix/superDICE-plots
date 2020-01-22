#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
# Script to evaluate different transitions of the MACCurves and CPrices
# and determine their impact on the overall model
#
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
#+++++++++++++++++++++++++
# Some reference times:
# 2020 -> t = 2
# 2040 -> t = 6
# 2050 -> t = 8
# 2100 -> t = 18
# 2125 -> t = 23
# 2150 -> t = 28
# 2200 -> t = 38
# 2250 -> t = 48
# 2300 -> t = 58
#+++++++++++++++++++++++++




## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

invisible(source("RICEx_plots/RICEx_plots.R"))





## -----------------   EXPERIMENTS   -----------------------------------------------
# Retrieve experiments

MCCmxref_perc = list()
MCCmxref_abs  = list()

MCCmxref_perc = experiments_load_as_list(MCCmxref_perc,"MCCmxppref")
MCCmxref_abs = experiments_load_as_list(MCCmxref_abs,  "MCCmxref")

MX_refs_perc_base = MCCmxref_perc$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging
MX_refs_abs_base  = MCCmxref_abs$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKE57SR$welfare_DICE$savings_fixed_converging






##------------- Additional data needed for plotting --------------------


source("OTHER_datamng/HIST_emissions_data.R")
source("OTHER_datamng/ADVANCE_data_management.R")






### ---------- _______________ PERCENTAGE __________________ -------------



# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    "pb18 | trMU[16-28] | k0.25 | advXT "   =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb18 | trMU[16-28] | k0.4 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence 2100"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 2
  ,colors_per_category = 4

); plottigat + xlim(2015,2125)


# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
     "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    
    
    ,"pb18 | trMU[16-28] | k0.4 | advXT "  =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.4 | adv "    =    MX_refs_perc_base$CTAX80gr5__adv_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.4 | ssp2XT " =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | ssp2 "   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence 2100"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 2
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)










## PB analysis --------------------



# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
     "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb28 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS =  ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 3
  ,colors_per_category = 4
  
); plottigat + xlim(2015,2125)



# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
     "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb28 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 3
  ,colors_per_category = 4
  
); plottigat + xlim(2015,2125)




## MIU UP analysis --------------------



# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
     "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    

    ,"pb18 | trMU[7-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb18 | trMU[7-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb18 | trMU[7-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb18 | trMU[7-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[7-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX30gr5__adv_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX30gr5__sspXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 | trMU[7-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS =  ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 4
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)



# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
     "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    
    
    ,"pb18 | trMU[7-28] | k0.25 | advXT "   =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
   # ,"pb18 | trMU[7-28] | k0.25 | adv "     =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
   # ,"pb18 | trMU[7-28] | k0.25 | ssp2XT"   =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb18 | trMU[7-28] | k0.25 | ssp2 "    =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[7-28] | k0.25 | advXT "   =    MX_refs_perc_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | adv "     =    MX_refs_perc_base$CTAX80gr5__adv_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | ssp2XT"   =    MX_refs_perc_base$CTAX80gr5__sspXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 | trMU[7-28] | k0.25 | ssp2 "    =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 4
  ,colors_per_category = 4
  
); plottigat + xlim(2015,2125)




###--------_______________ ABSOLUTE ________________----------




# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    "pb18 | trMU[16-28] | k0.25 | advXT "   =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb18 | trMU[16-28] | k0.4 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence 2100"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 2
  ,colors_per_category = 4
  
); plottigat + xlim(2015,2125)


# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    
    
    ,"pb18 | trMU[16-28] | k0.4 | advXT "  =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.4 | adv "    =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.4 | ssp2XT " =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.4 | ssp2 "   =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x4_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence 2100"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 2
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)










## PB analysis --------------------



# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb28 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS =  ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 3
  ,colors_per_category = 4
  
); plottigat + xlim(2015,2125)



# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb28 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb28 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb28_MUtrn_16_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 3
  ,colors_per_category = 4
  
); plottigat + xlim(2015,2125)




## MIU UP analysis --------------------



# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    
    
    ,"pb18 | trMU[7-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb18 | trMU[7-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb18 | trMU[7-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb18 | trMU[7-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[7-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 | trMU[7-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS =  ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 4
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)



# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    "pb18 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb18 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb18 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_16_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[16-28] | k0.25 | advXT "  =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    #,"pb23 | trMU[16-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    ,"pb23 | trMU[16-28] | k0.25 | ssp2 "   =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_16_38$get_world_EMIffi_ty
    
    
    ,"pb18 | trMU[7-28] | k0.25 | advXT "   =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    # ,"pb18 | trMU[7-28] | k0.25 | adv "     =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    # ,"pb18 | trMU[7-28] | k0.25 | ssp2XT"   =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb18 | trMU[7-28] | k0.25 | ssp2 "    =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[7-28] | k0.25 | advXT "   =    MX_refs_ABS_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | adv "     =    MX_refs_ABS_base$CTAX80gr5__adv_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | ssp2XT"   =    MX_refs_ABS_base$CTAX80gr5__sspXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 | trMU[7-28] | k0.25 | ssp2 "    =    MX_refs_ABS_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 4
  ,colors_per_category = 4
  
); plottigat + xlim(2015,2125)









## ------ ______________ COMBINED _________________-------





# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  

    
    "pb18 | trMU[7-28] | k0.25 | advXT | ABS "  =    MX_refs_abs_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb18 | trMU[7-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb18 | trMU[7-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb18 | trMU[7-28] | k0.25 | ssp2 | perc"   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[7-28] | k0.25 | advXT | ABS "  =    MX_refs_abs_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | adv "    =    MX_refs_ABS_base$CTAX30gr5__adv_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    #,"pb23 | trMU[7-28] | k0.25 | ssp2XT " =    MX_refs_ABS_base$CTAX30gr5__sspXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 | trMU[7-28] | k0.25 | ssp2 | perc "   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS =  ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 2
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)



# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  

    
    "pb18 | trMU[7-28] | k0.25 | advXT | ABS"   =    MX_refs_abs_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb18 | trMU[7-28] | k0.25 | ssp2 | perc"    =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 | trMU[7-28] | k0.25 | advXT | ABS"   =    MX_refs_abs_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 | trMU[7-28] | k0.25 | ssp2 | perc"    =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence varies"
  ,ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 2
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)





## Presentation outcomes ------



# CTAX 30gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    
    
    "pb18 ADVANCE-ref"   =     MX_refs_abs_base$CTAX30gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
   ,"pb18 SSP2mrk-ref"   =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 ADVANCE-ref"  =     MX_refs_abs_base$CTAX30gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 SSP2mrk-ref"  =    MX_refs_perc_base$CTAX30gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 30 gr5 - Best choices compared"
  ,ADVANCE_MODELS =  ADVANCE_CO2_WORLD$DIAG_C30_gr5
  ,categories = 2
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)

# wanna zoom?
plottigat + coord_cartesian(xlim=c(2085,2110), ylim = c(-5,15))




# CTAX 80gr5  .................

plottigat <- RICEx.plot.lineplot.CTAX(
  EXPdata   = list(  
    
    
     "pb18 ADVANCE-ref"   =     MX_refs_abs_base$CTAX80gr5__advXT_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb18 SSP2mrk-ref"   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb18_MUtrn_7_38$get_world_EMIffi_ty
    
    ,"pb23 ADVANCE-ref"   =     MX_refs_abs_base$CTAX80gr5__advXT_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    ,"pb23 SSP2mrk-ref"   =    MX_refs_perc_base$CTAX80gr5__ssp_logk0x25_pb23_MUtrn_7_38$get_world_EMIffi_ty
    
    
  )
  ,title  = "World Emissions under CTAX DIAG 80 gr5 - Best choices compared"
  ,ADVANCE_MODELS =  ADVANCE_CO2_WORLD$DIAG_C80_gr5
  ,categories = 2
  ,colors_per_category = 2
  
); plottigat + xlim(2015,2125)

# wanna zoom?
plottigat + coord_cartesian(xlim=c(2080,2110), ylim = c(-5,10))

