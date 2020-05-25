
require_package("purrr")
require_package("stringr")
require_package("xlsx")
require_package("tidyr")

# CEA 
fullCEA = list()
fullCEA = experiments_load_as_list(fullCEA,"Paper_CEA")

CEA =flatTreeRec( fullCEA )


# -------


xlsx_ssp2_tatm_rcp26   <- tbl_df(read.xlsx(file.path("./OTHER_datamng/", "", "SSP2_TATM_rcp26.xlsx"), 1))  %>% as.data.frame()

ssp2_tatm_rcp26 = cleanIIASAdata(xlsx_ssp2_tatm_rcp26) %>% mutate(value=value*1000)


#=============================================================================#
####          _______   WORLD ♦ LINES ______________                    ####
#=============================================================================#



# ---------------  W RF .. ssp2  .. #CEA ---------------------------


cbudg_rf <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "800"       = CEA$v1x00$CEA__co2bdg_800$get_VARIABLE_ty("FORC")
    ,"900"        = CEA$v1x00$CEA__co2bdg_900$get_VARIABLE_ty("FORC")
    ,"1000"       = CEA$v1x00$CEA__co2bdg_1000$get_VARIABLE_ty("FORC")
    ,"1100"       = CEA$v1x00$CEA__co2bdg_1100$get_VARIABLE_ty("FORC")
    ,"1200"       = CEA$v1x00$CEA__co2bdg_1200$get_VARIABLE_ty("FORC")
    ,"1300"       = CEA$v1x00$CEA__co2bdg_1300$get_VARIABLE_ty("FORC")
    ,"1400"       = CEA$v1x00$CEA__co2bdg_1400$get_VARIABLE_ty("FORC")
    ,"1500"       = CEA$v1x00$CEA__co2bdg_1500$get_VARIABLE_ty("FORC")
  )
  ,title  = " Forcing"
  ,yLabel = " [W/m2]"
  ,legend = "CO2 Budget"
  ,categories = 1
  ,colors_per_category = 8
  ,LaTeX_text = FALSE
  
) + xlim(2000,2100) + ylim(2,4); cbudg_rf


# save ......





# ---------------  W TATM .. ssp2  .. #CEA ---------------------------

cbudg_tatm <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "800"       = CEA$v1x00$CEA__co2bdg_800$get_VARIABLE_ty("TATM")
    ,"900"        = CEA$v1x00$CEA__co2bdg_900$get_VARIABLE_ty("TATM")
    ,"1000"       = CEA$v1x00$CEA__co2bdg_1000$get_VARIABLE_ty("TATM")
    ,"1100"       = CEA$v1x00$CEA__co2bdg_1100$get_VARIABLE_ty("TATM")
    ,"1200"       = CEA$v1x00$CEA__co2bdg_1200$get_VARIABLE_ty("TATM")
    ,"1300"       = CEA$v1x00$CEA__co2bdg_1300$get_VARIABLE_ty("TATM")
    ,"1400"       = CEA$v1x00$CEA__co2bdg_1400$get_VARIABLE_ty("TATM")
    ,"1500"       = CEA$v1x00$CEA__co2bdg_1500$get_VARIABLE_ty("TATM")
  )
  ,title  = "Atmospheric temperature increase"
  ,yLabel = " [+ºC]"
  ,legend = "CO2 Budget"
  ,categories = 1
  ,colors_per_category = 9
  ,LaTeX_text = FALSE
  
) + xlim(2000,2100) + ylim(0.8, 2.5); cbudg_tatm





## combine ----------------

RICExplot.combo.fast_combine(plotlist=list("Forcing" = cbudg_rf,
                                            "TATM"  = cbudg_tatm),
                                title = "Carbon Budget - Cost-Effective",columns = 2, common_legend = TRUE)








plottigat <-   RICExplot.lineplot(
  
  EXPdata   = list(
    
    "1000"       = CEA$v1x00$CEA__co2bdg_1000$get_VARIABLE_ty("TATM")
    ,"1100"       = CEA$v1x00$CEA__co2bdg_1100$get_VARIABLE_ty("TATM")

  )
  ,title  = "World Forcing — Cost-Effective Analysis"
  ,yLabel = "Atmospheric Temperature increaase [+ºC]"
  ,legend = "CO2 Budget/RCP2.5"
  ,categories = 1
  ,colors_per_category = 9
  ,LaTeX_text = FALSE
  
) + geom_line( data= ssp2_tatm_rcp26 %>% select(model,year,value), 
               aes(x=year, y=value, group=model, linetype=model, color="SSPdb models" ), size=1) +

scale_color_manual( labels = c("1000","1100","SSPdb models"),
                    values = c("#F2AD00"
                               ,"#F98400","#696969")) +
  
  xlim(2000,2100) + ylim(0,2.5)

plottigat

ssp2_tatm_rcp26
