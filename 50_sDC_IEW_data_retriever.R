
source("00_environment_setting.R")
source("05_colors_settings.R")
source("15_sDC_class.R")



## Data Load ##------------------------------------------------------------------------------------------



## BAUs ##-------------------------------------------



##enerdata56 


sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                                  region_id = "enerdata56",
                                                                                                  experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                           region_id = "enerdata56",
                                                                                           experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                           region_id = "enerdata56",
                                                                                           experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                           region_id = "enerdata56",
                                                                                           experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                           region_id = "enerdata56",
                                                                                           experiment_id = "IEW")


##enerdata30 
sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                           region_id = "enerdata30",
                                                                                           experiment_id = "IEW")
##witch17 
sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                           region_id = "witch17",
                                                                                           experiment_id = "IEW")
##r5
sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU    =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU", 
                                                                                           region_id = "r5",
                                                                                           experiment_id = "IEW")


## CBA BURKEbase ##-------------------------------------------


## enerdata56 



#ssp1
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                           region_id = "enerdata56",
                                                                                           experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                             region_id = "enerdata56",
                                                                                             experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKEbase__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                             region_id = "enerdata56",
                                                                                             experiment_id = "IEW")
#ssp2
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                             region_id = "enerdata56",
                                                                                             experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "enerdata56",
                                                                                                experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
#ssp3
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKEbase__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
#ssp4
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKEbase__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
#ssp5
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKEbase__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")






## enerdata30 



#ssp1
sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
#ssp2
sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")
#ssp3
sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")
#ssp4
sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")
#ssp5
sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKEbase__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKEbase__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")






## witch17 



#ssp2
sunRC_witch17_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA         =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                              region_id = "witch17",
                                                                                              experiment_id = "IEW")
sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA      =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                              region_id = "witch17",
                                                                                              experiment_id = "IEW")
sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA     =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                              region_id = "witch17",
                                                                                              experiment_id = "IEW")





## witch13 



#ssp2
sunRC_witch13_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA         =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "witch13",
                                                                                                experiment_id = "IEW")
sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA      =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "witch13",
                                                                                                experiment_id = "IEW")
sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA     =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "witch13",
                                                                                                experiment_id = "IEW")


## r5 



#ssp2
sunRC_r5_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA         =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "r5",
                                                                                                experiment_id = "IEW")
sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA      =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "r5",
                                                                                                experiment_id = "IEW")
sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA     =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "r5",
                                                                                                experiment_id = "IEW")




## global 



#ssp2
sunRC_global_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA         =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "global",
                                                                                                experiment_id = "IEW")
sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA      =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "global",
                                                                                                experiment_id = "IEW")
sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA     =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKEbase__polCBA", 
                                                                                                region_id = "global",
                                                                                                experiment_id = "IEW")
    
                                                                                               
                                                                                               
                                                                                               
## CBA DICEreg ##-------------------------------------------
       

                                                                                      
                                                                                                                                                                                          
## enerdata56 



#ssp1
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damDICEreg__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
#ssp2
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
#ssp3
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damDICEreg__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
#ssp4
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damDICEreg__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
#ssp5
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damDICEreg__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata56",
                                                                                                 experiment_id = "IEW")






## enerdata30 



#ssp1
sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")
#ssp2
sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")
#ssp3
sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")
#ssp4
sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")
#ssp5
sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damDICEreg__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                 region_id = "enerdata30",
                                                                                                 experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damDICEreg__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                  region_id = "enerdata30",
                                                                                                  experiment_id = "IEW")






## witch17 



#ssp2
sunRC_witch17_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA         =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                region_id = "witch17",
                                                                                                experiment_id = "IEW")
sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA      =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                region_id = "witch17",
                                                                                                experiment_id = "IEW")
sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA     =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                region_id = "witch17",
                                                                                                experiment_id = "IEW")





## witch13 



#ssp2
sunRC_witch13_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA         =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                region_id = "witch13",
                                                                                                experiment_id = "IEW")
sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA      =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                                region_id = "witch13",
                                                                                                experiment_id = "IEW")
sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA     =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                                region_id = "witch13",
                                                                                                experiment_id = "IEW")


## r5 



#ssp2
sunRC_r5_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA         =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                           region_id = "r5",
                                                                                           experiment_id = "IEW")
sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA      =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                           region_id = "r5",
                                                                                           experiment_id = "IEW")
sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA     =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                           region_id = "r5",
                                                                                           experiment_id = "IEW")




## global 



#ssp2
sunRC_global_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA         =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damDICEreg__polCBA", 
                                                                                               region_id = "global",
                                                                                               experiment_id = "IEW")
sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA      =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damDICEreg__polCBA", 
                                                                                               region_id = "global",
                                                                                               experiment_id = "IEW")
sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA     =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damDICEreg__polCBA", 
                                                                                               region_id = "global",
                                                                                               experiment_id = "IEW")






## CBA BURKELR ##-------------------------------------------




## enerdata56 



#ssp1
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKELR__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
#ssp2
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
#ssp3
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKELR__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
#ssp4
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKELR__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
#ssp5
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKELR__polCBA   =  SuperDICE(gdx_source_file = "sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata56",
                                                                                               experiment_id = "IEW")






## enerdata30 



#ssp1
sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp1_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                                region_id = "enerdata30",
                                                                                                experiment_id = "IEW")
#ssp2
sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                                region_id = "enerdata30",
                                                                                                experiment_id = "IEW")
#ssp3
sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp3_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                                region_id = "enerdata30",
                                                                                                experiment_id = "IEW")
#ssp4
sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp4_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                                region_id = "enerdata30",
                                                                                                experiment_id = "IEW")
#ssp5
sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKELR__polCBA       =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                               region_id = "enerdata30",
                                                                                               experiment_id = "IEW")
sunRC_enerdata56_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKELR__polCBA    =  SuperDICE(gdx_source_file = "sunRC_enerdata30_kaliBASALT_expIEW__ssp5_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                                region_id = "enerdata30",
                                                                                                experiment_id = "IEW")






## witch17 



#ssp2
sunRC_witch17_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA         =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                              region_id = "witch17",
                                                                                              experiment_id = "IEW")
sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA      =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                              region_id = "witch17",
                                                                                              experiment_id = "IEW")
sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA     =  SuperDICE(gdx_source_file = "sunRC_witch17_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                              region_id = "witch17",
                                                                                              experiment_id = "IEW")





## witch13 



#ssp2
sunRC_witch13_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA         =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                              region_id = "witch13",
                                                                                              experiment_id = "IEW")
sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA      =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                              region_id = "witch13",
                                                                                              experiment_id = "IEW")
sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA     =  SuperDICE(gdx_source_file = "sunRC_witch13_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                              region_id = "witch13",
                                                                                              experiment_id = "IEW")


## r5 



#ssp2
sunRC_r5_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA         =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                         region_id = "r5",
                                                                                         experiment_id = "IEW")
sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA      =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                         region_id = "r5",
                                                                                         experiment_id = "IEW")
sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA     =  SuperDICE(gdx_source_file = "sunRC_r5_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                         region_id = "r5",
                                                                                         experiment_id = "IEW")




## global 



#ssp2
sunRC_global_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA         =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_coop_clWITCHco2_damBURKELR__polCBA", 
                                                                                             region_id = "global",
                                                                                             experiment_id = "IEW")
sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA      =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damBURKELR__polCBA", 
                                                                                             region_id = "global",
                                                                                             experiment_id = "IEW")
sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA     =  SuperDICE(gdx_source_file = "sunRC_global_kaliBASALT_expIEW__ssp2_coopngsw_clWITCHco2_damBURKELR__polCBA", 
                                                                                             region_id = "global",
                                                                                             experiment_id = "IEW")