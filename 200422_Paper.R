
## -----------------   Source files   ---------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")
invisible(source("RICEx_plots/RICEx_plots.R"))




## -----------------   EXPERIMENTS   -----------------------------------

# Retrieve experiments fom automated procedure



isLeaf <- function(x){
  
  thisIsLeaf = FALSE
  
  # Check class of object
  # a leaf object CAN be a list but it is also a S3 custom class 
  # (usually RICEx-class)
  for(el in class(x)){if(el!="list"){thisIsLeaf = TRUE}}
  
  return(thisIsLeaf)
}

hasLeaves <- function(x){
  
  thisHasLeaves = FALSE
  
  # Check is x elements are leaves
  # if at least one leaf is present, return TRUE
  for(status in sapply(x, isLeaf)){if(status==TRUE){thisHasLeaves = TRUE}}
  
  return(thisHasLeaves)
  
}

flatTreeRec <- function( x ){
  if( !isLeaf(x) ){
    # recursion
    x <- lapply( x, flatTreeRec )
    # remove empty branches
    x <- x[ sapply( x, length ) > 0 ]
    # flat branches with only child (unless child is a leaf)
    if( !hasLeaves(x) & length(x) == 1 ){
      x <- x[[1]]
    }
  }
  return(x)
}

fullXPX = list()
fullXPX = experiments_load_as_list(fullXPX,"Paper")


XPX =flatTreeRec( fullXPX )

INTRM = list()
INTRM = experiments_load_as_list(INTRM, "SensGamma")
INTRM = flatTreeRec(INTRM$v1x00)


##------------- Additional data: Emissions --------------------


source("OTHER_datamng/HIST_emissions_data.R")
# DICE values 
source("OTHER_datamng/DICE_results_management.R")
# (available in "DICEresults" list)



## Add today values to historical for continuity
E_hist_PRIMAP_world_y = rbind(E_hist_PRIMAP_world_y, data.frame(year=2015, value= 35.04)) 




##------------- Additional data: PBL NDCS --------------------

# if it is present a gdx in plot folder
ndcs_iso3_gdx = gdx("./OTHER_datamng/data_ndcs_ed57.gdx")
# view content
ndcs_iso3_gdx$parameters

## PBLs 
ndcs_iso3_pbl_2030_uncond = ndcs_iso3_gdx["pbl_uncond_2030"]  %>% rename(iso3 = V1)
ndcs_iso3_pbl_2030_cond   = ndcs_iso3_gdx["pbl_cond_2030"] %>% rename(iso3 = V1)
ndcs_iso3_pbl_2025_uncond = ndcs_iso3_gdx["pbl_uncond_2025"] %>% rename(iso3 = V1)
ndcs_iso3_pbl_2025_cond   = ndcs_iso3_gdx["pbl_cond_2025"] %>% rename(iso3 = V1)


library(witchtools)
convert_witchtools_co2 <- function(df){
return( witchtools::convert_region(.x = df, 
                                from_reg ="iso3", 
                                to_reg = "enerdata56",
                                agg_weight = witchtools::default_weights$co2,
                                agg_operator = "mean", 
                                agg_missing = "zero" 
                                
) %>% rename(n=enerdata56) %>% mutate(value = value * 100)

)
}


convert_witchtools_sum <- function(df){
  return( witchtools::convert_region(.x = df, 
                                     from_reg ="iso3", 
                                     to_reg = "enerdata56",
                                     agg_weight = witchtools::default_weights$cst,
                                     agg_operator = "sum", 
                                     agg_missing = "zero" 
                                     
  ) %>% rename(n=enerdata56)
  
  )
}

ed57regions = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_MIU_nty %>%  select("n") %>% distinct()

  ndcs_ed57_pbl_2030_uncond =  merge(convert_witchtools_co2(ndcs_iso3_pbl_2030_uncond ), ed57regions  , by = "n", all=TRUE) %>% mutate(t = 4, year = 2030) 
  ndcs_ed57_pbl_2030_cond   =  merge(convert_witchtools_co2(ndcs_iso3_pbl_2030_cond   ), ed57regions  , by = "n", all=TRUE) %>% mutate(t = 4, year = 2030)
  ndcs_ed57_pbl_2025_uncond =  merge(convert_witchtools_co2(ndcs_iso3_pbl_2025_uncond ), ed57regions  , by = "n", all=TRUE) %>% mutate(t = 3, year = 2025)
  ndcs_ed57_pbl_2025_cond   =  merge(convert_witchtools_co2(ndcs_iso3_pbl_2025_cond   ), ed57regions  , by = "n", all=TRUE) %>% mutate(t = 3, year = 2025)


  ndcs_ed57_pbl_2030_uncond[is.na(ndcs_ed57_pbl_2030_uncond)]  = 0
  ndcs_ed57_pbl_2030_cond[is.na(ndcs_ed57_pbl_2030_cond)]  = 0   
  ndcs_ed57_pbl_2025_uncond[is.na(ndcs_ed57_pbl_2025_uncond)]  = 0 
  ndcs_ed57_pbl_2025_cond[is.na(ndcs_ed57_pbl_2025_cond)]  = 0   


  
  
##------------- Additional data: WITCH NDCS --------------------
  
  
  
  
  #  Import
  ndcs_witch_xslx = readxl::read_xlsx("./OTHER_datamng/indc_db.xlsx") %>% as.data.frame()

  # Clean
  ndcs_witch_absolutel_emi_2030_iso3 = ndcs_witch_xslx %>% select("iso3", "absolutel_emissions_2030")  %>% rename(value = absolutel_emissions_2030)
  ndcs_witch_absoluteh_emi_2030_iso3 = ndcs_witch_xslx %>% select("iso3", "absoluteh_emissions_2030")  %>% rename(value = absoluteh_emissions_2030)
  
  ndcs_witch_absolutel_emi_2030_iso3[is.na(ndcs_witch_absolutel_emi_2030_iso3)] = 0
  ndcs_witch_absoluteh_emi_2030_iso3[is.na(ndcs_witch_absoluteh_emi_2030_iso3)] = 0
  
   
  # View(ndcs_witch_absolutel_emi_2030_iso3)
  # View(ndcs_witch_absoluteh_emi_2030_iso3)
   
  
  ndcs_witch_absolutel_emi_2030_n = merge(convert_witchtools_sum(ndcs_witch_absolutel_emi_2030_iso3   ), ed57regions  , by = "n", all=TRUE) %>% mutate(t = 4, year = 2030)
  ndcs_witch_absoluteh_emi_2030_n = merge(convert_witchtools_sum(ndcs_witch_absoluteh_emi_2030_iso3   ), ed57regions  , by = "n", all=TRUE) %>% mutate(t = 4, year = 2030)
  
  
  ssp2_bau_n_2030 = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_VARIABLE_nty("E") %>% filter(year == 2030)
  
  
  ndcs_witch_l_miu_2030_n =   merge(   ssp2_bau_n_2030 %>% rename(bau = value),
                                       ndcs_witch_absoluteh_emi_2030_n %>% rename( reduced  = value), 
                                       by = c("n","t","year")
                                    )  %>% mutate(value =(reduced )/bau * 100) 
  
  ndcs_witch_h_miu_2030_n =   merge(   ssp2_bau_n_2030 %>% rename(bau = value),
                                       ndcs_witch_absoluteh_emi_2030_n %>% rename( reduced  = value), 
                                       by = c("n","t","year") 
                                    ) %>% mutate(value =(reduced )/bau * 100)  
   
  
  
  
  
## -----------------  ► FUNCTIONS   -----------------------------------

RICExplot.export.default_wide <- function(filename, plot = plottigat){     
ggsave(filename = paste0("./plots/",filename), plot , dpi="retina",device = "png", width=10, height=6)}


  
RICEx.export.dimensions = list()
RICEx.export.dimensions$default$x = 10
RICEx.export.dimensions$default$y = 6  

RICExplot.export.quick_copy_clipboard  <- function(plottigat
                                                   #, RICEx.export.dimensions = RICEx.export.dimensions$default
                                                   ,x = NULL
                                                   , y = NULL){
  
  if((!is.null(x)) & (!is.null(y))){ mywidth = x; myheight = y}
  else{
    
    mywidth  = 10
    myheight = 6
    #mywidth  = RICEx.export.dimensions$x
    #myheight = RICEx.export.dimensions$y
  }
  
    windows(width= mywidth, height = myheight, rescale = "fixed") #opens a separate window with the size you want 
    print(plottigat)#draw to this (active) window
    savePlot("clipboard", type="wmf") #saves plot to WMF
    
  }

custom_save(plottigat, 10 ,6)



  
  
  
  
  
  
add_confidence_from_data_ty <- function(main_exp, rbinded_other_exp){
  
  conf_df = rbind(main_exp,rbinded_other_exp) %>%
               group_by(t,year) %>%
               summarize(conf_max = max(value), conf_min = min(value)) %>% 
               as.data.frame()
  
  final_df = merge(main_exp, conf_df, by=c("t","year"))
  
  return(final_df)
  
}






#=============================================================================#
####          _______ ☻ PAPER ☻ BEST ☻ _________________                    ####
#=============================================================================#

# ---------------  W TATM .. ssp2 + bhmSR .. #COOP ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
  
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_TATM_ty
    
     ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_TATM_ty
     
    ,"BAU"     =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAUdam"  =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_TATM_ty
  )
  ,title  = "Atmospheric Temperature Increase - Burke SR"
  ,yLabel = " [+ºC]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat




#=============================================================================#
####          _______   WORLD ♦ LINES ______________                    ####
#=============================================================================#



# ---------------  W EMI .. ssp2 / bhmSR .. #COOP ◄---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    

    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"         =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAUdam"      =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 - Burke SR"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat


# save ......

RICExplot.export.default_wide(filename = "worldEMI_diff_Gammas.png", plot = plottigat)






# ---------------  W EMI .. ssp2 / DJO .. #COOP ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"         =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAUdam"      =  XPX$SIM$ssp2$dmgDJOn$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 - DJO"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat





# ---------------  W EMI .. ssp2 / DJO .. #COOP + Gintrm ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_world_EMIffi_ty
    
    ,"Coop $\\gamma = 0.1$"     = INTRM$dmgDJOn$CBA__gamma0x1$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.2$"     = INTRM$dmgDJOn$CBA__gamma0x2$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.3$"     = INTRM$dmgDJOn$CBA__gamma0x3$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.4$"     = INTRM$dmgDJOn$CBA__gamma0x4$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"         =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAUdam"      =  XPX$SIM$ssp2$dmgDJOn$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 - DJO"
  ,yLabel = "Emissions $\\[GtCO2/year\\]$"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); plottigat


RICExplot.export.quick_copy_clipboard(plottigat)




# ---------------  W EMI .. ssp2 / kahn .. #COOP ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_world_EMIffi_ty
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU"         =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAUdam"      =  XPX$SIM$ssp2$dmgKAHNn$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "World FFI Emissions - SSP2 - KAHN"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat


# save ......





# ---------------  W EMI .. BAU .. #SSP ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
     "SSP1"    = XPX$OPT$ssp1$noncoop_pop$BAU$get_world_EMItot_ty
    ,"SSP2"    = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMItot_ty
    ,"SSP3"    = XPX$OPT$ssp3$noncoop_pop$BAU$get_world_EMItot_ty
    ,"SSP4"    = XPX$OPT$ssp4$noncoop_pop$BAU$get_world_EMItot_ty
    ,"SSP5"    = XPX$OPT$ssp5$noncoop_pop$BAU$get_world_EMItot_ty

  )
  ,title  = "World FFI Emissions - SSP2 - KAHN"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2020,2035); plottigat





# ---------------  W TATM .. ssp2 / bhmSR .. #COOP  ◄---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    

    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_TATM_ty
  )
  ,title  = "Atmospheric Temperature Increase - Burke SR"
  ,yLabel = "[+ºC]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat



# ---------------  W TATM .. ssp2 / DJO .. #COOP + Gintrm ---------------------------



plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_TATM_ty
    
    ,"Coop $\\gamma = 0.1$"     = INTRM$dmgDJOn$CBA__gamma0x1$get_TATM_ty
    ,"Coop $\\gamma = 0.2$"     = INTRM$dmgDJOn$CBA__gamma0x2$get_TATM_ty
    ,"Coop $\\gamma = 0.3$"     = INTRM$dmgDJOn$CBA__gamma0x3$get_TATM_ty
    ,"Coop $\\gamma = 0.4$"     = INTRM$dmgDJOn$CBA__gamma0x4$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$dmgDJOn$BAUdam$get_TATM_ty
  )
  ,title  = "Atmospheric Temperature Increase - Burke SR"
  ,yLabel = "$\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); plottigat




# copy

RICExplot.export.quick_copy_clipboard(plottigat)



# ---------------  W FORC .. ssp2 / bhmSR .. #COOP  ◄---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_VARIABLE_ty("FORC")
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_VARIABLE_ty("FORC")
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_VARIABLE_ty("FORC")
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_VARIABLE_ty("FORC")
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_VARIABLE_ty("FORC")
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_VARIABLE_ty("FORC")
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_VARIABLE_ty("FORC")
  )
  ,title  = "Forcings - Burke SR"
  ,yLabel = "$\\[W/m2\\]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat





# ---------------  W TATM .. ssp2 / DJO  .. #COOP  ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_TATM_ty
  )
  ,title  = "Atmospheric Temperature Increase - Burke SR"
  ,yLabel = "[+ºC]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat
















# ---------------  W TATM .. ssp2 / KAHN .. #COOP  ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_TATM_ty
  )
  ,title  = "Atmospheric Temperature Increase - Burke SR"
  ,yLabel = "[+ºC]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat








# ---------------  W CINTESITY .. ssp2 + bhmSR .. #COOP ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_world_CIntensity_ty
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_world_CIntensity_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_CIntensity_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_world_CIntensity_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_world_CIntensity_ty
    
    ,"BAU"         =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_CIntensity_ty
    ,"BAUdam"      =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_world_CIntensity_ty
  )
  ,title  = "Carbon Intensity - SSP2 - Burke SR"
  ,yLabel = "Value"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat




###-------------  W SCC .. g0 / bhmSR .. #SSP ----------------





plottigat = RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"    = XPX$OPT$ssp1$coop_pop$CBA__gamma0$get_SCC_nty  %>% filter(n == "usa", year <= 2150)
    ,"SSP2"   = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_SCC_nty  %>% filter(n == "usa", year <= 2150)
    ,"SSP3"   = XPX$OPT$ssp3$coop_pop$CBA__gamma0$get_SCC_nty  %>% filter(n == "usa", year <= 2150)
    ,"SSP4"   = XPX$OPT$ssp4$coop_pop$CBA__gamma0$get_SCC_nty  %>% filter(n == "usa", year <= 2150)
    ,"SSP5"   = XPX$OPT$ssp5$coop_pop$CBA__gamma0$get_SCC_nty  %>% filter(n == "usa", year <= 2150)
    
  )
  
  , title = "Social Cost of Carbon for different SSPs"
  , y_label = "SCC [$/tCo2] "
  ,legend = "SSP"
  , LaTeX_text = FALSE
  
) + xlim(2000,2150); 

plottigat 

# wanna save?
ggsave(filename = "./plots/SCC_diff_SSPs.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)








# ---------------  W Y ... bhmSR  bhmSR / BAU / BAUdam ...  #SSP ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1_nodmg"     = XPX$OPT$ssp1$noncoop_pop$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP2_nodmg"   = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP3_nodmg"   = XPX$OPT$ssp3$noncoop_pop$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP4_nodmg"   = XPX$OPT$ssp4$noncoop_pop$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP5_nodmg"   = XPX$OPT$ssp5$noncoop_pop$BAU$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    
    ,"SSP1_dmg"       = XPX$SIM$ssp1$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP2_dmg"      = XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP3_dmg"      = XPX$SIM$ssp3$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP4_dmg"      = XPX$SIM$ssp4$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"SSP5_dmg"      = XPX$SIM$ssp5$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
  )
  ,title  = "World GDPnet (Y) - BHMSR - Different SSP baselines"
  ,yLabel = "[Trill USD/year]"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 5
  ,LaTeX_text = FALSE
  
) + xlim(2000,2200); plottigat







# ---------------  W C ... bhmSR / ssp3 ... #COOP ---------------------------


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "BAUdam"                  = XPX$SIM$ssp3$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "C")
    ,"Non-coop"              = XPX$OPT$ssp3$noncoop_pop$CBA$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "C")
    ,"Coop $\\gamma = 0$"    =    XPX$OPT$ssp3$coop_pop$CBA__gamma0$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "C")
    ,"Coop $\\gamma = 0.5$"  = XPX$OPT$ssp3$coop_pop$CBA__gamma0x5$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "C")
    ,"Coop $\\gamma = 1.45$" = XPX$OPT$ssp3$coop_pop$CBA__gamma1x45$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "C")
    ,"Coop $\\gamma = 2$"    = XPX$OPT$ssp3$coop_pop$CBA__gamma2$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "C")
    
  )
  ,title  = "World Consumption - BHMSR - Different Cooperation"
  ,yLabel = "$\\[Trill USD / year\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2200); plottigat


RICExplot.export.quick_copy_clipboard(plottigat)


### ------------- (c) W DAMFRAC .. SSP2 .. #G #BHM ----------------



#.........................
p1 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_world_DAMAGEperc_ty 
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Reference"      =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "Burke SR"
  ,yLabel = "Damages $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2080,2125) + ylim(-50,0); p1


#.........................
p2 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Noncoop"                = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLR$CBA$get_world_DAMAGEperc_ty
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Reference"                        =  XPX$SIM$ssp2$damages_BURKEnLR$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "Burke LR"
  ,yLabel = "Damages $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(-50,0); p2


#.........................
p3 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Noncoop"                = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_DAMAGEperc_ty
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Reference"                        =  XPX$SIM$ssp2$damages_BURKEnSRdiff$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "Burke SRdiff"
  ,yLabel = "Damages $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(-50,0); p3

#.........................
p4 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Noncoop"                = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_DAMAGEperc_ty
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Reference"                        =  XPX$SIM$ssp2$damages_BURKEnLRdiff$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "Burke LRdiff"
  ,yLabel = "Damages $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(-50,0); p4


#............................
plottigat = RICExplot.combo.fast_combine( plotlist = list(
  
  "Burke SR"      = p1
  ,"Burke LR"     = p2
  ,"Burke SRdiff" = p3
  ,"Burke LRdiff" = p4
)
,title = "Aggregated damages - SSP2"
,columns = 2
,common_legend = TRUE
)

plottigat




#............ wanna save?
ggsave(filename = "./plots/Damages_4Burkes_DifferGamma.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)














### ------------- (c) W Y .. bhmSR .. #SSP #COOP ----------------



#....SSP1..................... 

p1 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
     "Reference"   = XPX$SIM$ssp1$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")

     ,"Noncoop"    = XPX$OPT$ssp1$noncoop_pop$CBA$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")

     
     ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp1$coop_pop$CBA__gamma0$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
     ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp1$coop_pop$CBA__gamma0x5$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
     ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp1$coop_pop$CBA__gamma1x45$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
     ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp1$coop_pop$CBA__gamma2$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
     
  )
  ,title  = "SSP1"
  ,yLabel = "\\[Trill  USD/year \\]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p1




#......SSP2...................
p2 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Reference"   = XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    ,"Noncoop"    = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
  )
  ,title  = "SSP2"
  ,yLabel = "\\[Trill  USD/year \\]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p2


#....SSP3.....................
p3 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Reference"   = XPX$SIM$ssp3$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    ,"Noncoop"    = XPX$OPT$ssp3$noncoop_pop$CBA$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp3$coop_pop$CBA__gamma0$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp3$coop_pop$CBA__gamma0x5$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp3$coop_pop$CBA__gamma1x45$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp3$coop_pop$CBA__gamma2$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
  )
  ,title  = "SSP3"
  ,yLabel = "\\[Trill  USD/year \\]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p3


#.....SSP4.........................
p4 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Reference"   = XPX$SIM$ssp4$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    ,"Noncoop"    = XPX$OPT$ssp4$noncoop_pop$CBA$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp4$coop_pop$CBA__gamma0$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp4$coop_pop$CBA__gamma0x5$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp4$coop_pop$CBA__gamma1x45$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp4$coop_pop$CBA__gamma2$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
  )
  ,title  = "SSP4"
  ,yLabel = "\\[Trill  USD/year \\]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p4


#.....SSP5.........................
p5 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Reference"   = XPX$SIM$ssp5$damages_BURKEnSR$BAUdam$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    ,"Noncoop"    = XPX$OPT$ssp5$noncoop_pop$CBA$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
    
    ,"Coop $\\gamma = 0$"       = XPX$OPT$ssp5$coop_pop$CBA__gamma0$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp5$coop_pop$CBA__gamma0x5$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp5$coop_pop$CBA__gamma1x45$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp5$coop_pop$CBA__gamma2$get_VARIABLE_WORLDagg_ntyTOty(variable_name = "Y")
    
  )
  ,title  = "SSP5"
  ,yLabel = "\\[Trill  USD/year \\]"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p5



#............................
plottigat = RICExplot.combo.fast_combine( plotlist = list(
  
  "SSP1"  = p1
  ,"SSP2" = p2
  ,"SSP3" = p3
  ,"SSP4" = p4
  ,"SSP5" = p5
)
,title = "Aggregated GDPnet (Y) - Different SSPs and Cooperation scenarios"
,columns = 3
,common_legend = TRUE
)

plottigat




#............ wanna save?
ggsave(filename = "./plots/Damages_4Burkes_DifferGamma.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)














### ------------- (c) W DAMFRAC _ bhmSR _ #G #SSP ----------------



#.........................
p1 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$OPT$ssp1$noncoop_pop$CBA$get_world_DAMAGEperc_ty
    ,"SSP2"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_world_DAMAGEperc_ty
    ,"SSP3"       = XPX$OPT$ssp3$noncoop_pop$CBA$get_world_DAMAGEperc_ty
    ,"SSP4"       = XPX$OPT$ssp4$noncoop_pop$CBA$get_world_DAMAGEperc_ty
    ,"SSP5"       = XPX$OPT$ssp5$noncoop_pop$CBA$get_world_DAMAGEperc_ty

  )
  ,title  = "Noncoop"
  ,yLabel = " $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(-80,0) ; plottigat


#.........................
p2 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$OPT$ssp1$coop_pop$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP2"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP3"       = XPX$OPT$ssp3$coop_pop$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP4"       = XPX$OPT$ssp4$coop_pop$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"SSP5"       = XPX$OPT$ssp5$coop_pop$CBA__gamma0$get_world_DAMAGEperc_ty
    
  )
  ,title  = "Coop $\\gamma = 0$"
  ,yLabel = " $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(-80,0) ; p2

#.........................
p3 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$OPT$ssp1$coop_pop$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP2"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP3"       = XPX$OPT$ssp3$coop_pop$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP4"       = XPX$OPT$ssp4$coop_pop$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"SSP5"       = XPX$OPT$ssp5$coop_pop$CBA__gamma1x45$get_world_DAMAGEperc_ty
    
  )
  ,title  = "Coop $\\gamma = 1.45$"
  ,yLabel = " $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(-80,0) ; p3

#.........................
p4 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$SIM$ssp1$damages_BURKEnSR$BAUdam$get_world_DAMAGEperc_ty
    ,"SSP2"       = XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_world_DAMAGEperc_ty
    ,"SSP3"       = XPX$SIM$ssp3$damages_BURKEnSR$BAUdam$get_world_DAMAGEperc_ty
    ,"SSP4"       = XPX$SIM$ssp4$damages_BURKEnSR$BAUdam$get_world_DAMAGEperc_ty
    ,"SSP5"       = XPX$SIM$ssp5$damages_BURKEnSR$BAUdam$get_world_DAMAGEperc_ty
    
  )
  ,title  = "Reference"
  ,yLabel = " $\\[%baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(-80,0) ; p4



#............................
plottigat = RICExplot.combo.fast_combine( plotlist = list(
  
  "Noncoop"      = p1
  ,"Coop $\\gamma = 0$"     = p2
  ,"Coop $\\gamma = 1.45$"  = p3
  ,"Reference" = p4
)
,title = "Aggregated damages - BurkeSR"
,columns = 2
,common_legend = TRUE
)

plottigat




#............ wanna save?
ggsave(filename = "./plots/worldDMG_diff_Gammas_SSPs.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)




















# --------------- (c) W TATM .. bhmSR .. #COOP #SSP ◄---------------------------


#.........................
p1 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$OPT$ssp1$noncoop_pop$CBA$get_TATM_ty
    ,"SSP2"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_TATM_ty
    ,"SSP3"       = XPX$OPT$ssp3$noncoop_pop$CBA$get_TATM_ty
    ,"SSP4"       = XPX$OPT$ssp4$noncoop_pop$CBA$get_TATM_ty
    ,"SSP5"       = XPX$OPT$ssp5$noncoop_pop$CBA$get_TATM_ty
    
  )
  ,title  = "Noncoop"
  ,yLabel = "Temp. increase $\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150)  + ylim(0,6.2) ; p1

#.........................
p2 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$OPT$ssp1$coop_pop$CBA__gamma0$get_TATM_ty
    ,"SSP2"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_TATM_ty
    ,"SSP3"       = XPX$OPT$ssp3$coop_pop$CBA__gamma0$get_TATM_ty
    ,"SSP4"       = XPX$OPT$ssp4$coop_pop$CBA__gamma0$get_TATM_ty
    ,"SSP5"       = XPX$OPT$ssp5$coop_pop$CBA__gamma0$get_TATM_ty
    
  )
  ,title  = "Coop $\\gamma = 0$"
  ,yLabel = "Temp. increase $\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150)  + ylim(0,6.2) ; p2
#.........................
p3 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$OPT$ssp1$coop_pop$CBA__gamma1x45$get_TATM_ty
    ,"SSP2"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_TATM_ty
    ,"SSP3"       = XPX$OPT$ssp3$coop_pop$CBA__gamma1x45$get_TATM_ty
    ,"SSP4"       = XPX$OPT$ssp4$coop_pop$CBA__gamma1x45$get_TATM_ty
    ,"SSP5"       = XPX$OPT$ssp5$coop_pop$CBA__gamma1x45$get_TATM_ty
    
  )
  ,title  = "Coop $\\gamma = 1.45$"
  ,yLabel = "Temp. increase $\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(0,6.2)  ; p3


#.........................
p4 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "SSP1"        = XPX$SIM$ssp1$damages_BURKEnSR$BAUdam$get_TATM_ty
    ,"SSP2"       = XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_TATM_ty
    ,"SSP3"       = XPX$SIM$ssp3$damages_BURKEnSR$BAUdam$get_TATM_ty
    ,"SSP4"       = XPX$SIM$ssp4$damages_BURKEnSR$BAUdam$get_TATM_ty
    ,"SSP5"       = XPX$SIM$ssp5$damages_BURKEnSR$BAUdam$get_TATM_ty
    
  )
  ,title  = "Reference"
  ,yLabel = "Temp. increase $\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 1
  ,colors_per_category = 5
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150) + ylim(0,6.2) ; p4




#............................
plottigat = RICExplot.combo.fast_combine( plotlist = list(
  
  "Noncoop"      = p1
  ,"Coop $\\gamma = 0$"     = p2
  ,"Coop $\\gamma = 1.45$"  = p3
  ,"Reference" = p4
)
,title = "Atmospheric temperature increase - BurkeSR"
,columns = 2
,common_legend = TRUE
)

plottigat




#............ wanna save?
ggsave(filename = "./plots/worldTATM_diff_Gammas_SSPs.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)















# --------------- (c) W EMI .. SSP2  .. #COOP #IMPACT ◄---------------------------


#.....BHM SR....................

p1 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_world_EMIffi_ty
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "BHM-SR"
  ,yLabel = "$\\[GtCO_2/Year\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p1

#.....BHM LR....................

p2 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLR$CBA$get_world_EMIffi_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnLR$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "BHM-LR"
  ,yLabel = "$\\[GtCO_2/Year\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p2


#.....DJO....................

p3 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$dmgDJOn$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "DJO"
  ,yLabel = "$\\[GtCO_2/Year\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p3




#.....KAHN ....................

p4 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_world_EMIffi_ty
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year")
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$dmgKAHNn$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "KAHN"
  ,yLabel = "$\\[GtCO_2/Year\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p4



#.....BHM SRdiff....................

p5 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_EMIffi_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSRdiff$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "BHM-SRdiff"
  ,yLabel = "$\\[GtCO_2/Year\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p5



#.....BHM SRdiff....................

p6 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       =  XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0$get_world_EMIffi_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_EMIffi_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma1x45$get_world_EMIffi_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma2$get_world_EMIffi_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_EMIffi_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_EMIffi_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnLRdiff$BAUdam$get_world_EMIffi_ty
  )
  ,title  = "BHM-LRdiff"
  ,yLabel = "$\\[GtCO_2/Year\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p6


#.....COMBINE.......................
plottigat = RICExplot.combo.fast_combine( plotlist = list(
  
  "BHM-SR"     = p1
  ,"BHM-SR"    = p2
  ,"DJO"       = p3
  ,"KAHN"      = p4
  ,"BHM-SRdiff"= p5
  ,"BHM-LRdiff"= p6
)
,title = "World FFI Emissions - Different Cooperation and Impacts"
,columns = 2
,common_legend = TRUE
)

plottigat












# --------------- (c) W TATM .. SSP2  .. #COOP #IMPACT ◄---------------------------


#.....BHM SR....................

p1 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_TATM_ty
  )
  ,title  = "BHM-SR"
  ,yLabel = "$\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p1

#.....BHM LR....................

p2 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
     "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLR$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnLR$BAUdam$get_TATM_ty
  )
  ,title  = "BHM-LR"
  ,yLabel = "$\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p2


#.....DJO....................

p3 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$dmgDJOn$BAUdam$get_TATM_ty
  )
  ,title  = "DJO"
  ,yLabel = "$\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p3




#.....KAHN ....................

p4 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$dmgKAHNn$BAUdam$get_TATM_ty
  )
  ,title  = "KAHN"
  ,yLabel = "$\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p4


#.....BHM SRdiff....................

p5 <- RICExplot.lineplot(
  
  EXPdata   = list(
  
    "Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSRdiff$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSRdiff$BAUdam$get_TATM_ty
  )
  ,title  = "BHM-SRdiff"
  ,yLabel = "$\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p5



#.....BHM SRdiff....................

p6 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       =  XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0$get_TATM_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_TATM_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma1x45$get_TATM_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma2$get_TATM_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLRdiff$CBA$get_TATM_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_TATM_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnLRdiff$BAUdam$get_TATM_ty
  )
  ,title  = "BHM-LRdiff"
  ,yLabel = "$\\[+ºC\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p6

#.....COMBINE.......................
plottigat = RICExplot.combo.fast_combine( plotlist = list(
  
  "BHM-SR"     = p1
  ,"BHM-SR"    = p2
  ,"DJO"       = p3
  ,"KAHN"      = p4
  ,"BHM-SRdiff"= p5
  ,"BHM-LRdiff"= p6
)
,title = "Atmospheric temperature increase - Different Cooperation and Impacts"
,columns = 2
,common_legend = TRUE
)

plottigat











# --------------- (c) W DAMFRACagg .. SSP2  .. #COOP #IMPACT ◄---------------------------


#.....BHM SR....................

p1 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_world_DAMAGEperc_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_DAMAGEperc_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "BHM-SR"
  ,yLabel = "$\\[% baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2080,2120); p1

#.....BHM LR....................

p2 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLR$CBA$get_world_DAMAGEperc_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_DAMAGEperc_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnLR$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "BHM-LR"
  ,yLabel = "$\\[% baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p2


#.....DJO....................

p3 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_world_DAMAGEperc_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_DAMAGEperc_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$dmgDJOn$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "DJO"
  ,yLabel = "$\\[% baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p3




#.....KAHN ....................

p4 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_world_DAMAGEperc_ty
 
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_DAMAGEperc_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$dmgKAHNn$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "KAHN"
  ,yLabel = "$\\[% baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p4



#.....BHM SRdiff....................

p5 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    "Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_DAMAGEperc_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_DAMAGEperc_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnSRdiff$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "BHM-SRdiff"
  ,yLabel = "$\\[% baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p5



#.....BHM SRdiff....................

p6 <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       =  XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma1x45$get_world_DAMAGEperc_ty
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma2$get_world_DAMAGEperc_ty
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_DAMAGEperc_ty
    
    ,"BAU nodmg"  =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_world_DAMAGEperc_ty
    ,"BAU dmg"    =  XPX$SIM$ssp2$damages_BURKEnLRdiff$BAUdam$get_world_DAMAGEperc_ty
  )
  ,title  = "BHM-LRdiff"
  ,yLabel = "$\\[% baseline\\]$"
  ,legend = "Scenarios"
  ,categories = 2
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  
) + xlim(2000,2150); p6


#.....COMBINE.......................
plottigat = RICExplot.combo.fast_combine( plotlist = list(
  
  "BHM-SR"     = p1
  ,"BHM-SR"    = p2
  ,"DJO"       = p3
  ,"KAHN"      = p4
  ,"BHM-SRdiff"= p5
  ,"BHM-LRdiff"= p6
)
,title = "World Aggregated Damage - Different Cooperation and Impacts"
,columns = 2
,common_legend = TRUE
)

plottigat




#=============================================================================#
####          _______ AGGREGATED ♦ STATS  __________                    ####
#=============================================================================#


# ---------------  DAMAGES .. ssp2 / bhmSR .. #COOP ◄---------------------------

myyear = 2100

plottigat <- RICExplot.boxplot( 
  
  EXPdata   = list(
    
    
    "Coop $\\gamma = 0$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_DAMAGEperc_nty %>% filter(year==myyear) 
    ,"Coop $\\gamma = 0.5$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_DAMAGEperc_nty %>% filter(year==myyear)
    ,"Coop $\\gamma = 1.45$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_DAMAGEperc_nty %>% filter(year==myyear) 
    ,"Coop $\\gamma = 2$"       = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_DAMAGEperc_nty %>% filter(year==myyear)
    
    ,"Noncoop"       = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_DAMAGEperc_nty %>% filter(year==myyear) 
    
    ,"BAU"         =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_DAMAGEperc_nty %>% filter(year==myyear)
    ,"BAUdam"      =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_DAMAGEperc_nty %>% filter(year==myyear) 
  )
    ,title  = "Damage distribution in 2100 - SSP2 - Burke SR"
    ,yLabel = "[% baseline]"
  ,LaTeX_text = TRUE
  ,xLabel = "scenario"
  
   ,legend = "Scenarios"
    ,categories = 1
    ,colors_per_category = 9
  
) ; plottigat

  


# ---------------  W EMI .. ssp2 / bhmSR .. #COOP ◄---------------------------



coop_gamma0x5 <- add_confidence_from_data_ty( main_exp = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_EMIffi_ty,
                                              rbinded_other_exp = rbind(
                                                
                                                 XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp1$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp1$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp1$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp1$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp3$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp3$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp3$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp3$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp4$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp4$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp4$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp4$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp5$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp5$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp5$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp5$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_world_EMIffi_ty
                                              ))

noncoop <-       add_confidence_from_data_ty( main_exp = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_world_EMIffi_ty,
                                              rbinded_other_exp = rbind(
                                                
                                                 XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp1$noncoop_pop$damages_BURKEnSR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp1$noncoop_pop$damages_BURKEnLR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp1$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp1$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp3$noncoop_pop$damages_BURKEnSR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp3$noncoop_pop$damages_BURKEnLR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp3$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp3$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp4$noncoop_pop$damages_BURKEnSR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp4$noncoop_pop$damages_BURKEnLR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp4$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp4$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_EMIffi_ty
                                                
                                                ,XPX$OPT$ssp5$noncoop_pop$damages_BURKEnSR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp5$noncoop_pop$damages_BURKEnLR$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp5$noncoop_pop$damages_BURKEnLRdiff$CBA$get_world_EMIffi_ty
                                                ,XPX$OPT$ssp5$noncoop_pop$damages_BURKEnSRdiff$CBA$get_world_EMIffi_ty
                                              ))

baudam <-       add_confidence_from_data_ty( main_exp = XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_world_EMIffi_ty,
                                              rbinded_other_exp = rbind(
                                                
                                                XPX$SIM$ssp2$damages_BURKEnLR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp2$damages_BURKEnLRdiff$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp2$damages_BURKEnSRdiff$BAUdam$get_world_EMIffi_ty
                                                
                                                ,XPX$SIM$ssp1$damages_BURKEnSR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp1$damages_BURKEnLR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp1$damages_BURKEnLRdiff$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp1$damages_BURKEnSRdiff$BAUdam$get_world_EMIffi_ty
                                                
                                                ,XPX$SIM$ssp3$damages_BURKEnSR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp3$damages_BURKEnLR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp3$damages_BURKEnLRdiff$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp3$damages_BURKEnSRdiff$BAUdam$get_world_EMIffi_ty
                                                
                                                ,XPX$SIM$ssp4$damages_BURKEnSR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp4$damages_BURKEnLR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp4$damages_BURKEnLRdiff$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp4$damages_BURKEnSRdiff$BAUdam$get_world_EMIffi_ty
                                                
                                                ,XPX$SIM$ssp5$damages_BURKEnSR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp5$damages_BURKEnLR$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp5$damages_BURKEnLRdiff$BAUdam$get_world_EMIffi_ty
                                                ,XPX$SIM$ssp5$damages_BURKEnSRdiff$BAUdam$get_world_EMIffi_ty
                                              ))


plottigat <- RICExplot.lineplot(
  
  EXPdata   = list(
    
    

     "Coop $\\gamma = 0.5$"     = coop_gamma0x5

    ,"Noncoop"       = noncoop
    
    
    ,"Historical"  = E_hist_PRIMAP_world_y %>% mutate(t=(year-2010)/5) %>% filter(year >=2000) %>% mutate(unit = "GtCO2/year", conf_max=value, conf_min=value) 
    ,"BAUdam"      =  baudam
  )
  ,title  = "World FFI Emissions"
  ,yLabel = "Emissions [GtCO2/year]"
  ,legend = "Scenarios"
  ,categories = 3
  ,colors_per_category = 4
  ,LaTeX_text = TRUE
  ,show_confidence = TRUE
  
  
) + xlim(2000,2150) 





 plottigat


# save ......

RICExplot.export.default_wide(filename = "worldEMI_diff_Gammas.png", plot = plottigat)




















#=============================================================================#
####          _______   REGIONS ♦ LINES ______________                    ####
#=============================================================================#


###-------------  (c)  MIU .. ssp2 + bhmSR .. #COOP ----------------


plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop"                     = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_MIU_nty
    
    ,"Coop $\\gamma = 0$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_MIU_nty
    ,"Coop $\\gamma = 0.5$"   = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_MIU_nty
    ,"Coop $\\gamma = 1.45$"  = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_MIU_nty
    ,"Coop $\\gamma = 2$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_MIU_nty
    
  )
  
  , title = "Regional mitigation \\[%BAU\\] over time"
  , y_label = "Mitigation \\[%BAU\\]"
  , legend_columns = 2
  , columns = 2
  , LaTeX_text = TRUE
  , y_lim = c(0,125)
  
); 

plottigat 

###-------------  (c)  DAMFRAC .. ssp2 + bhmSR .. #COOP ----------------


plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop"                         = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_VARIABLE_nty("DAMFRAC")
    
    ,"Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_VARIABLE_nty("DAMFRAC")
    ,"Coop $\\gamma = 0.5$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_VARIABLE_nty("DAMFRAC")
    ,"Coop $\\gamma = 1.45$"  = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_VARIABLE_nty("DAMFRAC")
    ,"Coop $\\gamma = 2$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_VARIABLE_nty("DAMFRAC")
    
  )
  
  , title = "Damages"
  , y_label = "$\\[\\% YGROSS\\]$"
  , legend_columns = 2
  , columns = 2
  , LaTeX_text = TRUE
  
); 

plottigat


###------------- (c) C .. ssp3 / bhmSR .. #GAMMA ----------------


# BAUdam 

p1 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$SIM$ssp3$damages_BURKEnSR$BAUdam$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption - BAUdam"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); p1



# Noncoop 

p2 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$noncoop_pop$CBA$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption - Noncoop"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); p2



# Gamma0 

p3 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$coop_pop$CBA__gamma0$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, $\\gamma = 0$"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); p3




# Gamma0.5 

p4 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$coop_pop$CBA__gamma0x5$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, $\\gamma = 0.5$"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); p4


# Gamma 1.45 

p5 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$coop_pop$CBA__gamma1x45$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, $\\gamma = 1.45$"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); p5


# Gamma2 

p6 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$coop_pop$CBA__gamma2$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, $\\gamma = 2$"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); p6




plotlist = list(
  
  "bau" = p1,
  "noncoop" = p2,
  "g0" = p3,
  "go.5" = p4,
  "g1.45" = p5,
  "g2" = p6
)


plottigat = RICExplot.combo.fast_combine(
                              plotlist = plotlist
                             , title = "Regional Consumption — BHM-SR — Different COOP"
                             , columns = 2
                             , common_legend = TRUE
                              )

plottigat



RICExplot.export.quick_copy_clipboard(plottigat, 10,15)

###------------- (c) C .. g0.5 / bhmSR .. #SSP ----------------



# SSP2 

p5 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, Baseline No-CC, SSP2"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 3
  , LaTeX_text = TRUE
  
); p5




# SSP3

p6 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$noncoop_pop$BAU$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, Baseline No-CC, SSP3"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 3
  , LaTeX_text = TRUE
  
); p6



# SSP2 

p1 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, $\\gamma = 0.5$, SSP2"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 3
  , LaTeX_text = TRUE
  
); p1




# SSP3

p2 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$coop_pop$CBA__gamma0x5$get_VARIABLE_nty("C")
  
  
  
  , title = "Consumption, $\\gamma = 0.5$, SSP3"
  , y_label = "$\\[\\Trill USD /Year\\]$"
  , legend_columns = 3
  , LaTeX_text = TRUE
  
); p2


# DAMAGES SSP2 

p3 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_VARIABLE_nty("damfrac_estim_ykali")
  
  
  
  , title = "Damages, $\\gamma = 0.5$, SSP2"
  , y_label = "$\\[ %baseline\\]$"
  , legend_columns = 3
  , LaTeX_text = TRUE
  
); p3




# SSP3
p4 = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$coop_pop$CBA__gamma0x5$get_VARIABLE_nty("damfrac_estim_ykali")
  
  
  
  , title = "Damages, $\\gamma = 0.5$, SSP3"
  , y_label = "$\\[ %baseline\\]$"
  , legend_columns = 3
  , LaTeX_text = TRUE
  
); p4





plotlist = list(
  
  "b2"= p5,
  "b3" = p6,
  "2" = p1,
  "3" = p2,
  "d2"=p3,
  "d3"=p4

)


plottigat = RICExplot.combo.fast_combine(
  plotlist = plotlist
  , title = "Regional Consumption/Damages — BHM-SR — SSP2/SSP3 comparison"
  , columns = 2
  , common_legend = TRUE
)

plottigat



RICExplot.export.quick_copy_clipboard(plottigat)
###-------------  DAMFRAC .. ssp2 / bhmLRDIFF .. #COOP ----------------


plottigat = RICExplot.lineplot_nty(
      

  EXPdata   =  XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0$get_VARIABLE_nty("DAMFRAC")


  
  , title = "Damages"
  , y_label = "$\\[\\% YGROSS\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); 

plottigat



###-------------  DAMFRAC .. ssp2 / bhmSR / COOP /  G0 ----------------


plottigat = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_VARIABLE_nty("DAMFRAC")
  
  
  
  , title = "Damages"
  , y_label = "$\\[\\% YGROSS\\]$"
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); 

plottigat


###-------------  MIU .. ssp3 / bhmSR / COOP /  G0.5 ----------------


plottigat = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$OPT$ssp3$coop_pop$CBA__gamma0x5$get_VARIABLE_nty("MIU")
  
  
  
  , title = "Regions Mitigation for SSP3 - $\\gamma = 0.5$"
  , y_label = "$\\[\\% BAU\\]$"
  , legend_columns = 3
  , LaTeX_text = TRUE
  
) + xlim(2000,2150); 

plottigat



###-------------  ♦ DAMFRAC _ ssp2 / bhmSR / BAUdam ----------------


plottigat = RICExplot.lineplot_nty(
  
  
  EXPdata   =  XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_VARIABLE_nty("damfrac_estim_ykali")
  
  
  
  , title = "Damage fraction in SSP2 reference (no mitigation)"
  , y_label = "[% SSP-gdp baseline]"
  , legend_columns = 2
  , LaTeX_text = FALSE
  
) + xlim(2015, 2150); 

plottigat


# wanna save?
ggsave(filename = "./plots/BurkeCap_damfrac_ykali.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)


###-------------  (c)  DAMAGES .. ssp2 + bhmSR .. #COOP ----------------


plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop"                = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_VARIABLE_nty("DAMAGES")
    
    ,"Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_VARIABLE_nty("DAMAGES")
    ,"Coop $\\gamma = 0.5$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_VARIABLE_nty("DAMAGES")
    ,"Coop $\\gamma = 1.45$"  = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_VARIABLE_nty("DAMAGES")
    ,"Coop $\\gamma = 2$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_VARIABLE_nty("DAMAGES")
    
  )
  
  , title = "Damages"
  , y_label = "Trill USD"
  , legend_columns = 2
  , columns = 2
  , LaTeX_text = TRUE
  , y_lim = c(0,125)
  
); 

plottigat 


###-------------  (c)  SCC .. ssp2 + bhmSR .. #COOP ----------------


plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop"                     = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_SCC_nty    %>% filter(t < 23)
   ,"Coop $\\gamma = 0.5$"   = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_SCC_nty  %>% filter(t < 23)
   ,"Coop $\\gamma = 1.45$"  = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_SCC_nty %>% filter(t < 23)
   ,"Coop $\\gamma = 2$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_SCC_nty    %>% filter(t < 23)   
   ,"Coop $\\gamma = 0$"     = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_SCC_nty    %>% filter(t < 23)
    
  )
  
  , title = "Regions Social Cost of Carbon over time"
  , y_label = "SCC "
  , legend_columns = 2
  , columns = 2
  , LaTeX_text = TRUE
  
); 

plottigat 



###-------------  (c)  CINTENSITY .. ssp2 + bhmSR .. #COOP ----------------


plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop"                         = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_CIntensity_nty 
    ,"Coop $\\gamma = 0.5$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_CIntensity_nty 
    ,"Coop $\\gamma = 1.45$"  = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_CIntensity_nty 
    ,"Coop $\\gamma = 2$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_CIntensity_nty 
    ,"Coop $\\gamma = 0$"        = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_CIntensity_nty 
    
  )
  
  , title = "Regions Carbon Intensity over time"
  , y_label = "Value "
  , legend_columns = 2
  , columns = 2
  , LaTeX_text = TRUE
  
); 

plottigat 

###-------------    CINTENSITY .. ssp2 + bhmSR .. BAU ----------------


plottigat = RICExplot.lineplot_nty(
  
  EXPdata     = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$BAU$get_CIntensity_nty 
  
  , title = "Regions Carbon Intensity over time - BAU"
  , y_label = "Value "
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); plottigat

###-------------    CINTENSITY .. ssp2 + bhmSR .. BAUdam ----------------


plottigat = RICExplot.lineplot_nty(
  
  EXPdata     = XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_CIntensity_nty 
  
  , title = "Regions Carbon Intensity over time - BAU"
  , y_label = "Value "
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); plottigat

###-------------    CINTENSITY .. ssp2 + bhmSR .. NONCOOP ----------------


plottigat = RICExplot.lineplot_nty(

  EXPdata     = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_CIntensity_nty 
  
  , title = "Regions Carbon Intensity over time - NONCOOP"
  , y_label = "Value "
  , legend_columns = 2
  , LaTeX_text = TRUE
  
); plottigat

#=============================================================================#
####          _______  SPECIFIC REGION ♦ LINES _______                    ####
#=============================================================================#

###-------------  (c)  #VARS .. SSP2 .. #BHM ----------------


# Tested several variables which contributes
# to EMISSIONS shape over time


# SR..............
myexperiment = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA

myreg = c("can","golf57","nde","rsas","usa","rsaf")




plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "EIND"                = myexperiment$get_EIND_nty                     %>% filter(n %in% myreg)
    ,"MIU"                = myexperiment$get_MIU_nty                      %>% filter(n %in% myreg)
    ,"Carbon Intensity"   = myexperiment$get_VARIABLE_nty("sigma")        %>% filter(n %in% myreg)
    ,"bau eind"           = myexperiment$get_VARIABLE_nty("emi_bau_co2")  %>% filter(n %in% myreg)
    ,"YGROSS"             = myexperiment$get_VARIABLE_nty("YGROSS")       %>% filter(n %in% myreg)
    ,"ykali"              = myexperiment$get_VARIABLE_nty("ykali")        %>% filter(n %in% myreg)
    ,"YNET"               = myexperiment$get_VARIABLE_nty("YNET")         %>% filter(n %in% myreg)
    ,"DAMFRAC"            = myexperiment$get_VARIABLE_nty("DAMFRAC")      %>% filter(n %in% myreg)
    ,"CPRICE"             = myexperiment$get_VARIABLE_nty("CPRICE")       %>% filter(n %in% myreg)
    ,"ABATECOST"          = myexperiment$get_VARIABLE_nty("ABATECOST")    %>% filter(n %in% myreg)
  )
  
  , title = "Comparison of variables - NONCOOP BURKE SR"
  , columns = 2
  , LaTeX_text = TRUE
  
  
); 
plottigat



# LR..............
myexperiment = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLR$CBA

myreg = c("can","golf57","nde","rsas","usa","rsaf")




plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "EIND"                = myexperiment$get_EIND_nty                     %>% filter(n %in% myreg)
    ,"MIU"                = myexperiment$get_MIU_nty                      %>% filter(n %in% myreg)
    ,"Carbon Intensity"   = myexperiment$get_VARIABLE_nty("sigma")        %>% filter(n %in% myreg)
    ,"bau eind"           = myexperiment$get_VARIABLE_nty("emi_bau_co2")  %>% filter(n %in% myreg)
    ,"YGROSS"             = myexperiment$get_VARIABLE_nty("YGROSS")       %>% filter(n %in% myreg)
    ,"ykali"              = myexperiment$get_VARIABLE_nty("ykali")        %>% filter(n %in% myreg)
    ,"YNET"               = myexperiment$get_VARIABLE_nty("YNET")         %>% filter(n %in% myreg)
    ,"DAMFRAC"            = myexperiment$get_VARIABLE_nty("DAMFRAC")      %>% filter(n %in% myreg)
    ,"CPRICE"             = myexperiment$get_VARIABLE_nty("CPRICE")       %>% filter(n %in% myreg)
    ,"ABATECOST"          = myexperiment$get_VARIABLE_nty("ABATECOST")    %>% filter(n %in% myreg)
  )
  
  , title = "Comparison of variables - NONCOOP BURKE LR"
  , columns = 2
  , LaTeX_text = TRUE
  
  
); 
plottigat





# SRdiff..............
myexperiment = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSRdiff$CBA

myreg = c("can","golf57","nde","rsas","usa","rsaf")




plottigat = RICExplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "EIND"                = myexperiment$get_EIND_nty                     %>% filter(n %in% myreg)
    ,"MIU"                = myexperiment$get_MIU_nty                      %>% filter(n %in% myreg)
    ,"Carbon Intensity"   = myexperiment$get_VARIABLE_nty("sigma")        %>% filter(n %in% myreg)
    ,"bau eind"           = myexperiment$get_VARIABLE_nty("emi_bau_co2")  %>% filter(n %in% myreg)
    ,"YGROSS"             = myexperiment$get_VARIABLE_nty("YGROSS")       %>% filter(n %in% myreg)
    ,"ykali"              = myexperiment$get_VARIABLE_nty("ykali")        %>% filter(n %in% myreg)
    ,"YNET"               = myexperiment$get_VARIABLE_nty("YNET")         %>% filter(n %in% myreg)
    ,"DAMFRAC"            = myexperiment$get_VARIABLE_nty("DAMFRAC")      %>% filter(n %in% myreg)
    ,"CPRICE"             = myexperiment$get_VARIABLE_nty("CPRICE")       %>% filter(n %in% myreg)
    ,"ABATECOST"          = myexperiment$get_VARIABLE_nty("ABATECOST")    %>% filter(n %in% myreg)
  )
  
  , title = "Comparison of variables - NONCOOP BURKE SRdiff"
  , columns = 2
  , LaTeX_text = TRUE
  
  
); 
plottigat





# LRdiff..............
myexperiment = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLRdiff$CBA

myreg = c("can","golf57","nde","rsas","usa","rsaf")




plottigat = RICExlineplot.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "EIND"                = myexperiment$get_EIND_nty                     %>% filter(n %in% myreg)
    ,"MIU"                = myexperiment$get_MIU_nty                      %>% filter(n %in% myreg)
    ,"Carbon Intensity"   = myexperiment$get_VARIABLE_nty("sigma")        %>% filter(n %in% myreg)
    ,"bau eind"           = myexperiment$get_VARIABLE_nty("emi_bau_co2")  %>% filter(n %in% myreg)
    ,"YGROSS"             = myexperiment$get_VARIABLE_nty("YGROSS")       %>% filter(n %in% myreg)
    ,"ykali"              = myexperiment$get_VARIABLE_nty("ykali")        %>% filter(n %in% myreg)
    ,"YNET"               = myexperiment$get_VARIABLE_nty("YNET")         %>% filter(n %in% myreg)
    ,"DAMFRAC"            = myexperiment$get_VARIABLE_nty("DAMFRAC")      %>% filter(n %in% myreg)
    ,"CPRICE"             = myexperiment$get_VARIABLE_nty("CPRICE")       %>% filter(n %in% myreg)
    ,"ABATECOST"          = myexperiment$get_VARIABLE_nty("ABATECOST")    %>% filter(n %in% myreg)
  )
  
  , title = "Comparison of variables - NONCOOP BURKE LRdiff"
  , columns = 2
  , LaTeX_text = TRUE
  
  
); 
plottigat


#=============================================================================#
####          _______   WORLD ♦ MAPS ______________                    ####
#=============================================================================#


## ----------------- ♦ (c) DAMFRAC .. ssp2 #year .. #G #BHM #COOP -----------

myyear = 2100


# Gamma 0 .........

plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR g0"      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SR g2 "    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SR noncoop "     =     XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SR BAUdam " = XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," - SSP2 - different Burke's specifications"))
  ,legend = "Damages \n[% GDPgross]"
  , palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat


## ----------------- ♦ (c) DAMperc .. ssp2 / G0 / #year ..  #IMPACT  -----------

myyear = 2100


plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LR "     =     XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"DJO"                        = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"KAHN"                      = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0$, SSP2 - different impact funtions"))
  ,legend = "Damages \n[% baseline]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat


## ----------------- ♦ (c) DAMperc .. ssp2 / BAUdam / #year ..  #IMPACT  -----------

myyear = 2100


plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR "      =     XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke SRdiff " = XPX$SIM$ssp2$damages_BURKEnSRdiff$BAUdam$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LR "     =    XPX$SIM$ssp2$damages_BURKEnLR$BAUdam$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LRdiff " = XPX$SIM$ssp2$damages_BURKEnLRdiff$BAUdam$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"DJO"           = XPX$SIM$ssp2$dmgDJOn$BAUdam$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"KAHN"          = XPX$SIM$ssp2$dmgKAHNn$BAUdam$get_DAMAGEperc_nty  %>% filter(year == myyear)
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\BAUdam$, SSP2 - different impact functions"))
  ,legend = "Damages \n[% baseline]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat

## ----------------- ♦ (c) DAMperc .. ssp2 / NOCOOP / #year ..  #IMPACT  -----------

myyear = 2100


plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSRdiff$CBA$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LR "     =     XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLR$CBA$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnLRdiff$CBA$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"DJO"                        = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"KAHN"                      = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_DAMAGEperc_nty  %>% filter(year == myyear)
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\NONCOOP$, SSP2 - different impact functions"))
  ,legend = "Damages \n[% baseline]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat

## ----------------- ♦ (c) DAMperc .. ssp2 / G0 / #year ..  #IMPACT  -----------

myyear = 2100


plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LR "     =     XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"DJO"                        = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"KAHN"                      = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_DAMAGEperc_nty  %>% filter(year == myyear)
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0$, SSP2 - different impact functions"))
  ,legend = "Damages \n[% baseline]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat




## ----------------- ♦ (c) DAMperc .. ssp2 / G0.5 / #year ..  #IMPACT  -----------

myyear = 2100


plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LR "     =     XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"DJO"                        = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"KAHN"                      = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0.5$, SSP2 - different impact functions"))
  ,legend = "Damages \n[% baseline]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat

## ----------------- ♦ (c) DAMperc .. ssp2 / G2 / #year ..  #IMPACT  -----------

myyear = 2100


plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma2$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LR "     =     XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma2$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma2$get_DAMAGEperc_nty  %>% filter(year == myyear)   
    ,"DJO"                        = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma2$get_DAMAGEperc_nty  %>% filter(year == myyear)
    ,"KAHN"                      = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma2$get_DAMAGEperc_nty  %>% filter(year == myyear)
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 2$, SSP2 - different impact functions"))
  ,legend = "Damages \n[% baseline]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat



## ----------------- ♦ (c) DAMperc .. ssp2 / G0.5 / #year ..  #BHM  -----------


# wanna save?
ggsave(filename = "./plots/mapDMG_gamma0_diffBurke.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)


# Gamma 0.5 .........

plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma0x5$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     =     XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma0x5$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma0x5$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 0.5$, SSP2 - different Burke's specifications"))
  ,legend = "Damages \n[% GDPgross]"
  , palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat


# Gamma 1.45 .........

plottigat = RICExplot.combo.map(
  
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma1x45$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     =     XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma1x45$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma1x45$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 1.45$, SSP2 - different Burke's specifications"))
  ,legend = "Damages \n[% GDPgross]"
  , palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat


# Gamma 2 .........

plottigat = RICExplot.combo.map(
  
  EXPdata   = list(
    
    "Burke SR "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke SRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnSRdiff$CBA__gamma2$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LR "     =     XPX$OPT$ssp2$coop_pop$damages_BURKEnLR$CBA__gamma2$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    ,"Burke LRdiff " = XPX$OPT$ssp2$coop_pop$damages_BURKEnLRdiff$CBA__gamma2$get_VARIABLE_nty("DAMFRAC")   %>% filter(year == myyear)  %>% mutate(value = value *100)   
    
  )
  
  ,title  = TeX(paste0("Damages in ",myyear," -  $\\gamma = 2$, SSP2 - different Burke's specifications"))
  ,legend = "Damages \n[% GDPgross]"
  , palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
  , max_data = 100
  , min_data = -100
)

plottigat
















## ----------------- ♦ MIU .. bhmSR  ssp2 #year .. #G -----------

myyear = 2050



plottigat = RICExplot.combo.map(
  EXPdata   = list(
    
    "CBA, $\\gamma = 0$"    = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_MIU_nty    %>% filter(year == myyear)
    ,"CBA, $\\gamma = 0.5$" = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_MIU_nty  %>% filter(year == myyear)
    ,"CBA, $\\gamma = 1.45$"= XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_MIU_nty %>% filter(year == myyear)
    ,"CBA, $\\gamma = 2$"   = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_MIU_nty    %>% filter(year == myyear)
    
  )
  
  ,title  = paste0("Mitigation in ",myyear," - BHM SR, SSP2 - Different Inequality Aversion")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = TRUE
  
) 

plottigat

# wanna save?
ggsave(filename = "./plots/mapMIU_2050_diffGamma.png",plot = plottigat, dpi="retina",device = "png", width=10, height=6)






















## ----------------- (c) DMG% / MIU / DMGdiff .. 2100/2030/2050 .. #COOP -----------



saved_damages <- function(DFBAU, DFpolicy){
  
  
  return(merge(   DFBAU %>% rename(bau = value),
           DFpolicy %>% rename(policy   = value), 
           by = c("n","t","year")
  )  %>% mutate(value = policy - bau) %>% dplyr::select(n,t,year,value) %>% mutate(unit = "% baseline"))
  
  
}


baudamages = XPX$SIM$ssp2$dmgKAHNn$BAUdam$get_DAMAGEperc_nty    %>% filter(year == 2100) 



# BAU DMG%
p00 = RICEx.plot.map(   data = XPX$SIM$ssp2$dmgKAHNn$BAUdam$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                       ,title       = "Reference (no mitigation) KAHN Damages - 2100" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "[% baseline]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                       ,min_data    = -100
                       ,max_data    = 100
                       ,centre_data = 0 
); p00





# ---------------- Damages 

{

# NONCOOP
p11 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                        ,title       = "Noncoop Damages - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[% baseline]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                        ,min_data    = -100
                        ,max_data    = 100
                        ,centre_data = 0 
); p11

# COOP G0%
p12 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                       ,title       = "Coop $\\gamma = 0$ Damages - 2100" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "[% baseline]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                       ,min_data    = -100
                       ,max_data    = 100
                       ,centre_data = 0 
); p12



# COOP G0.5%
p13 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                        ,title       = "Coop $\\gamma = 0.5$ Damages - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[% baseline]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                        ,min_data    = -100
                        ,max_data    = 100
                        ,centre_data = 0 
); p13

# COOP G1.45%
p14 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                        ,title       = "Coop $\\gamma = 1.45$ Damages - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[% baseline]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                        ,min_data    = -100
                        ,max_data    = 100
                        ,centre_data = 0 
); p14




#-------------- Mitigation 2030 

# NONCOOP
p21 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_MIU_nty    %>% filter(year == 2030) 
                        ,title       = "Noncoop Mitigation - 2030" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p21

# COOP G0%
p22 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_MIU_nty    %>% filter(year == 2030) 
                        ,title       = "Coop $\\gamma = 0$ Mitigation - 2030" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p22



# COOP G0.5%
p23 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_MIU_nty    %>% filter(year == 2030) 
                        ,title       = "Coop $\\gamma = 0.5$ Mitigation - 2030" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p23

# COOP G1.45%
p24 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_MIU_nty    %>% filter(year == 2030) 
                        ,title       = "Coop $\\gamma = 1.45$ Mitigation - 2030" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p24





#-------------- Mitigation 2050 

# NONCOOP
p31 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_MIU_nty    %>% filter(year == 2050) 
                        ,title       = "Noncoop Mitigation - 2050" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p31

# COOP G0%
p32 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_MIU_nty    %>% filter(year == 2050) 
                        ,title       = "Coop $\\gamma = 0$ Mitigation - 2050" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p32



# COOP G0.5%
p33 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_MIU_nty    %>% filter(year == 2050) 
                        ,title       = "Coop $\\gamma = 0.5$ Mitigation - 2050" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p33

# COOP G1.45%
p34 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_MIU_nty    %>% filter(year == 2050) 
                        ,title       = "Coop $\\gamma = 1.45$ Mitigation - 2050" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 100
                        ,centre_data = 50 
); p34







#-------------- Saved damages 

# NONCOOP
p41 = RICEx.plot.map(   data = saved_damages(baudamages,  XPX$OPT$ssp2$noncoop_pop$dmgKAHNn$CBA$get_DAMAGEperc_nty  %>% filter(year == 2100) )
                        ,title       = "Noncoop Damages Reduction - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                        ,min_data    = -50
                        ,max_data    = 50
                        ,centre_data = 0 
); p41



# COOP G0%
p42 = RICEx.plot.map(   data = saved_damages(baudamages, XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0$get_DAMAGEperc_nty    %>% filter(year == 2100) )
                        ,title       = "Coop $\\gamma = 0$ Damages Reduction - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                        ,min_data    = -50
                        ,max_data    = 50
                        ,centre_data = 0 
); p42



# COOP G0.5%
p43 = RICEx.plot.map(   data = saved_damages(baudamages, XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma0x5$get_DAMAGEperc_nty    %>% filter(year == 2100) )
                        ,title       = "Coop $\\gamma = 0.5$ Damages Reduction - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                        ,min_data    = -50
                        ,max_data    = 50
                        ,centre_data = 0 
); p43

# COOP G1.45%
p44 = RICEx.plot.map(   data = saved_damages(baudamages,XPX$OPT$ssp2$coop_pop$dmgKAHNn$CBA__gamma1x45$get_DAMAGEperc_nty    %>% filter(year == 2100) )
                        ,title       = "Coop $\\gamma = 1.45$ Damages Reduction - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[%]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                        ,min_data    = -50
                        ,max_data    = 50
                        ,centre_data = 0 
); p44


}

# combo ---


plottigat = RICExplot.combo.fast_combine( 
  
  plotlist = list(   p11 = p11 ,p21 = p21 ,p31 = p31 ,p41 = p41
                    ,p12 = p12 ,p22 = p22 ,p32 = p32 ,p42 = p42
                    ,p13 = p13 ,p23 = p23 ,p33 = p33 ,p43 = p43
                    ,p14 = p14 ,p24 = p24 ,p34 = p34 ,p44 = p44

  )
                                                          
, title = paste0("Distribution of Damages and mitigation in KAHN, SSP2")
, columns = 4
, common_legend = FALSE
)


plottigat








## ----------------- (c) DMG% / MIU / DMGdiff .. 2100/2030/2050 .. #COOP -----------



saved_damages <- function(DFBAU, DFpolicy){
  
  
  return(merge(   DFBAU %>% rename(bau = value),
                  DFpolicy %>% rename(policy   = value), 
                  by = c("n","t","year")
  )  %>% mutate(value = policy - bau) %>% dplyr::select(n,t,year,value) %>% mutate(unit = "% baseline"))
  
  
}


baudamages = XPX$SIM$ssp2$dmgDJOn$BAUdam$get_DAMAGEperc_nty    %>% filter(year == 2100) 

max(data$value)

# BAU DMG%
p11 = RICEx.plot.map(   data = XPX$SIM$ssp2$dmgDJOn$BAUdam$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                        ,title       = "Reference (no mitigation) DJO Damages - 2100" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "[% baseline]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                        ,min_data    = -100
                        ,max_data    = 100
                        ,centre_data = 0 
); p11





# ---------------- Damages 

{
  
  # NONCOOP
  p11 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                          ,title       = "Noncoop Damages - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[% baseline]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                          ,min_data    = -100
                          ,max_data    = 100
                          ,centre_data = 0 
  ); p11
  
  # COOP G0%
  p12 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                          ,title       = "Coop $\\gamma = 0$ Damages - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[% baseline]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                          ,min_data    = -100
                          ,max_data    = 100
                          ,centre_data = 0 
  ); p12
  
  
  
  # COOP G0.5%
  p13 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                          ,title       = "Coop $\\gamma = 0.5$ Damages - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[% baseline]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                          ,min_data    = -100
                          ,max_data    = 100
                          ,centre_data = 0 
  ); p13
  
  # COOP G1.45%
  p14 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_DAMAGEperc_nty    %>% filter(year == 2100) 
                          ,title       = "Coop $\\gamma = 1.45$ Damages - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[% baseline]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                          ,min_data    = -100
                          ,max_data    = 100
                          ,centre_data = 0 
  ); p14
  
  
  
  
  #-------------- Mitigation 2030 
  
  # NONCOOP
  p21 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_MIU_nty    %>% filter(year == 2030) 
                          ,title       = "Noncoop Mitigation - 2030" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p21
  
  # COOP G0%
  p22 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_MIU_nty    %>% filter(year == 2030) 
                          ,title       = "Coop $\\gamma = 0$ Mitigation - 2030" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p22
  
  
  
  # COOP G0.5%
  p23 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_MIU_nty    %>% filter(year == 2030) 
                          ,title       = "Coop $\\gamma = 0.5$ Mitigation - 2030" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p23
  
  # COOP G1.45%
  p24 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_MIU_nty    %>% filter(year == 2030) 
                          ,title       = "Coop $\\gamma = 1.45$ Mitigation - 2030" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p24
  
  
  
  
  
  #-------------- Mitigation 2050 
  
  # NONCOOP
  p31 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_MIU_nty    %>% filter(year == 2050) 
                          ,title       = "Noncoop Mitigation - 2050" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p31
  
  # COOP G0%
  p32 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_MIU_nty    %>% filter(year == 2050) 
                          ,title       = "Coop $\\gamma = 0$ Mitigation - 2050" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p32
  
  
  
  # COOP G0.5%
  p33 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_MIU_nty    %>% filter(year == 2050) 
                          ,title       = "Coop $\\gamma = 0.5$ Mitigation - 2050" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p33
  
  # COOP G1.45%
  p34 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_MIU_nty    %>% filter(year == 2050) 
                          ,title       = "Coop $\\gamma = 1.45$ Mitigation - 2050" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                          ,min_data    = 0
                          ,max_data    = 100
                          ,centre_data = 50 
  ); p34
  
  
  
  
  
  
  
  #-------------- Saved damages 
  
  # NONCOOP
  p41 = RICEx.plot.map(   data = saved_damages(baudamages,  XPX$OPT$ssp2$noncoop_pop$dmgDJOn$CBA$get_DAMAGEperc_nty  %>% filter(year == 2100) )
                          ,title       = "Noncoop Damages Reduction - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                          ,min_data    = -50
                          ,max_data    = 50
                          ,centre_data = 0 
  ); p41
  
  
  
  # COOP G0%
  p42 = RICEx.plot.map(   data = saved_damages(baudamages, XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0$get_DAMAGEperc_nty    %>% filter(year == 2100) )
                          ,title       = "Coop $\\gamma = 0$ Damages Reduction - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                          ,min_data    = -50
                          ,max_data    = 50
                          ,centre_data = 0 
  ); p42
  
  
  
  # COOP G0.5%
  p43 = RICEx.plot.map(   data = saved_damages(baudamages, XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma0x5$get_DAMAGEperc_nty    %>% filter(year == 2100) )
                          ,title       = "Coop $\\gamma = 0.5$ Damages Reduction - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                          ,min_data    = -50
                          ,max_data    = 50
                          ,centre_data = 0 
  ); p43
  
  # COOP G1.45%
  p44 = RICEx.plot.map(   data = saved_damages(baudamages,XPX$OPT$ssp2$coop_pop$dmgDJOn$CBA__gamma1x45$get_DAMAGEperc_nty    %>% filter(year == 2100) )
                          ,title       = "Coop $\\gamma = 1.45$ Damages Reduction - 2100" 
                          ,LaTeX_text  = TRUE
                          ,shape       = ed57shp
                          ,legend      = "[%]" 
                          ,palette     = RColorBrewer::brewer.pal(9, "Spectral")                   
                          ,min_data    = -50
                          ,max_data    = 50
                          ,centre_data = 0 
  ); p44
  
  
}

# combo ---


plottigat = RICExplot.combo.fast_combine( 
  
  plotlist = list(   p11 = p11 ,p21 = p21 ,p31 = p31 ,p41 = p41
                     ,p12 = p12 ,p22 = p22 ,p32 = p32 ,p42 = p42
                     ,p13 = p13 ,p23 = p23 ,p33 = p33 ,p43 = p43
                     ,p14 = p14 ,p24 = p24 ,p34 = p34 ,p44 = p44
                     
  )
  
  , title = paste0("Distribution of Damages and mitigation in DJO, SSP2")
  , columns = 4
  , common_legend = FALSE
)


plottigat







## ----------------- (c) ABATECOSTS / MIU / DMGdiff .. bhmSR / ssp2 / 2100 .. #G -----------




# prepare data

avoided_noncoop = merge(# policy damages
                          XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_DAMAGEperc_nty %>% 
                          rename(policydam = value),
                        # no policy damages
                        XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_DAMAGEperc_nty %>% 
                          rename(fulldam = value)  ,
                        # merge
                        by = c("n","t","year", "unit"), 
                        all= TRUE
                        
                      )  %>% 
  mutate(fulldam = ifelse(is.na(fulldam), 0, fulldam)) %>%
  mutate(value = (-1)*(fulldam - policydam ))



avoided_coop_g0x5 = merge(# policy damages
                        XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_DAMAGEperc_nty %>% 
                          rename(policydam = value),
                        # no policy damages
                        XPX$SIM$ssp2$damages_BURKEnSR$BAUdam$get_DAMAGEperc_nty %>% 
                          rename(fulldam = value)  ,
                        # merge
                        by = c("n","t","year", "unit"), 
                        all= TRUE
                        
                  )  %>% 
  mutate(fulldam = ifelse(is.na(fulldam), 0, fulldam)) %>%
  mutate(value = (-1)*(fulldam - policydam ))


#

myyear = 2100


# NONCOOp MIU
p1 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_MIU_nty    %>% filter(year == myyear) 
                       ,title       = "NONCOOP Mitigation" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "[% BAU]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                       ,min_data    = 0
                       ,max_data    = 120
                       ,centre_data = 60 
)


# G0.5 MIU
p2 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_MIU_nty    %>% filter(year == myyear) 
                       ,title       = "COOP Mitigation, $\\gamma = 0.5$" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = " [% BAU]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                       ,min_data    = 0
                       ,max_data    = 120
                       ,centre_data = 60 
) ;p2


# NONCOOp MIU
p3 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_ABATECOSTperc_nty    %>% filter(year == myyear) 
                       ,title       = "NONCOOP Abatement Costs" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "[% baseline]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "RdPu")    
                       ,min_data = 0
                       ,max_data    = 11
                       ,centre_data = 5.5 

) ;p3


# G0.5 Costs
p4 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_ABATECOSTperc_nty    %>% filter(year == myyear) 
                       ,title       = "COOP Abatement Costs, $\\gamma = 0.5$" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "[% baseline]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "RdPu")                   
                       ,min_data    = 0
                       ,max_data    = 11
                       ,centre_data = 5.5 
) ;p4


# NONCOOp Avoided DMG
p5 = RICEx.plot.map(   data = avoided_noncoop    %>% filter(year == myyear) 
                       ,title       = "NONCOOP Avoided Damages" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "[% baseline]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "RdBu")    
                       ,min_data = -35
                       ,max_data    = 35
                       ,centre_data = 0
                       
) ;p5


# G0.5 Avoided DMG
p6 = RICEx.plot.map(   data = avoided_coop_g0x5    %>% filter(year == myyear) 
                       ,title       = "COOP Avoided Damages, $\\gamma = 0.5$" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "[% baseline]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "RdBu")                   
                       ,min_data    = -35
                       ,max_data    = 35
                       ,centre_data = 0
) ;p6


# COMBO

ppp1 = RICExplot.combo.fast_combine( plotlist = list(  "NONCOOP"       = p1
                                                       ,"COOP"         = p2  )
  , title = ""
  , columns = 2
  , common_legend = TRUE
  )

ppp2 = RICExplot.combo.fast_combine( plotlist = list(  "NONCOOP"       = p3
                                                       ,"COOP"         = p4  )
                                     , title = ""
                                     , columns = 2
                                     , common_legend = TRUE
)

ppp3 = RICExplot.combo.fast_combine( plotlist = list(  "NONCOOP"       = p5
                                                       ,"COOP"         = p6  )
                                     , title = ""
                                     , columns = 2
                                     , common_legend = TRUE
)

  
  
plottigat = RICExplot.combo.fast_combine( plotlist = list(  a    = ppp1
                                                            ,b   = ppp2
                                                            ,c   = ppp3

)
, title = paste0("Distribution in ",myyear," - BHM-SR, SSP2")
, columns = 1
, common_legend = FALSE
)


plottigat












## -----------------  (c) MIU .. bhmSR ssp2 2030 .. #COOP + NDCS  -----------

myyear = 2030

 # NONCOOp
  p1 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_MIU_nty    %>% filter(year == myyear) 
                         ,title       = "NONCOOP" 
                         ,LaTeX_text  = TRUE
                         ,shape       = ed57shp
                         ,legend      = "Mitigation \n[% BAU]" 
                         ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                         ,min_data    = 0
                         ,max_data    = 120
                         ,centre_data = 60 
  )
  

  # NDCs
  p2 = RICEx.plot.map(   data = ndcs_data_ISO3(year = myyear)
                         ,title       = "NDCS Conditioned" 
                         ,LaTeX_text  = TRUE
                         ,shape       = iso3shp
                         ,legend      = "Mitigation \n[% BAU]" 
                         ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                         ,min_data    = 0
                         ,max_data    = 120
                         ,centre_data = 60 
  )
  

 # G0
 p3 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0$get_MIU_nty    %>% filter(year == myyear) 
                        ,title       = "COOP, $\\gamma = 0$" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 120
                        ,centre_data = 60 
                    )
 # G0.5
 p4 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_MIU_nty    %>% filter(year == myyear) 
                        ,title       = "COOP, $\\gamma = 0.5$" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 120
                        ,centre_data = 60 
 )
 
 # G1.45
 p5 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma1x45$get_MIU_nty    %>% filter(year == myyear) 
                        ,title       = "COOP, $\\gamma = 1.45$" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 120
                        ,centre_data = 60 
 )
 
 # G2
 p6 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma2$get_MIU_nty    %>% filter(year == myyear) 
                        ,title       = "COOP, $\\gamma = 2$" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = 0
                        ,max_data    = 120
                        ,centre_data = 60 
 )
                            

 # COMBO
 plottigat = RICExplot.combo.fast_combine( plotlist = list(  "NONCOOP"                   = p1
                                                             ,"NDCS Conditioned"         = p2
                                                             ,  "COOP, $\\gamma = 0$"    = p3
                                                             ,  "COOP, $\\gamma = 0.5$"  = p4
                                                             ,  "COOP, $\\gamma = 1.45$" = p5
                                                             ,  "COOP, $\\gamma = 2$"    = p6
                                                            )
                                           , title = paste0("Mitigation in ",myyear," - BHM SR, SSP2 - Different Cooperation")
                                           , columns = 2
                                           , common_legend = TRUE
                                           )

 
 plottigat
 
 
 
 
 
 
 
 
 ## -----------------  (c2) MIU .. bhmSR ssp2 2030 .. #COOP + NDCS  -----------
 
 # second (improved) version
 
 myyear = 2030
 my_min_data    = 0
 my_max_data    = 120
 my_centre_data = 60
 
 # NONCOOp
 p1 = RICEx.plot.map(   data = XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_MIU_nty    %>% filter(year == myyear) 
                        ,title       = "NONCOOP" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = my_min_data   
                        ,max_data    = my_max_data   
                        ,centre_data = my_centre_data
 )
 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 
 # NDCs PBL cond
 p3 = RICEx.plot.map(   data = ndcs_ed57_pbl_2030_cond
                        ,title       = "PBL NDCS Conditioned" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = my_min_data   
                        ,max_data    = my_max_data   
                        ,centre_data = my_centre_data
 )
 
 
 # NDCs PBL uncond
 p4 = RICEx.plot.map(   data = ndcs_ed57_pbl_2030_uncond
                       ,title       = "PBL NDCS Unconditioned" 
                       ,LaTeX_text  = TRUE
                       ,shape       = ed57shp
                       ,legend      = "Mitigation \n[% BAU]" 
                       ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                       ,min_data    = my_min_data   
                       ,max_data    = my_max_data   
                       ,centre_data = my_centre_data
 )
 
 
 # NDCs WITCH l 
 p3 = RICEx.plot.map(   data = ndcs_witch_l_miu_2030_n
                        ,title       = "WITCH NDCS L" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = my_min_data   
                        ,max_data    = my_max_data   
                        ,centre_data = my_centre_data
 )
 
 
 # NDCs WITCH h
 p4 = RICEx.plot.map(   data = ndcs_witch_h_miu_2030_n
                        ,title       = "WITCH NDCS  H" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = my_min_data   
                        ,max_data    = my_max_data   
                        ,centre_data = my_centre_data
 ); p4
 
 
 #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 
 # G0.5
 p2 = RICEx.plot.map(   data = XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_MIU_nty    %>% filter(year == myyear) 
                        ,title       = "COOP, $\\gamma = 0.5$" 
                        ,LaTeX_text  = TRUE
                        ,shape       = ed57shp
                        ,legend      = "Mitigation \n[% BAU]" 
                        ,palette     = RColorBrewer::brewer.pal(9, "OrRd")                   
                        ,min_data    = my_min_data   
                        ,max_data    = my_max_data   
                        ,centre_data = my_centre_data
 )

 

 
 # COMBO
 plottigat = RICExplot.combo.fast_combine( plotlist = list(  "NONCOOP"                = p1
                                                             ,"COOP, $\\gamma = 0.5$" = p2
                                                             ,  "NDCS Conditioned"    = p3
                                                             ,  "NDCS Unconditioned"  = p4

 )
 , title = paste0("Mitigation in ",myyear," - BHM-SR, SSP2")
 , columns = 2
 , common_legend = TRUE
 )
 
 
 plottigat
 
 
 
 ## ----------------- ♦ (c) DAMperc .. ssp2 / G0 / #year ..  #IMPACT  -----------
 
 myyear = 2030
 
 
 plottigat = RICExplot.combo.map(
   EXPdata   = list(
 "Noncoop                  " =     XPX$OPT$ssp2$noncoop_pop$damages_BURKEnSR$CBA$get_DAMAGEperc_nty  %>% filter(year == myyear)   
  , "Coop $\\gamma = 0.5$ "      =     XPX$OPT$ssp2$coop_pop$damages_BURKEnSR$CBA__gamma0x5$get_DAMAGEperc_nty  %>% filter(year == myyear)   

   )
   
   ,title  = TeX(paste0("Damages in ",myyear))
   ,legend = "Damages \n[% baseline]"
   ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys)
   , max_data = 10
   , min_data = -10
   ,LaTeX_text = TRUE
 )
 
 plottigat
 
 
 
 
 
 
 
#=============================================================================#
####          _______   SCENARIO ♦ REGIONS ____________                    ####
#=============================================================================#





###-------------  (c)  DAMFRAC(ykali) .. SSP2 .. #COOP ----------------


EXPdata   = list(
  
  "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("damfrac_estim_ykali")
  
  ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("damfrac_estim_ykali")
  ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("damfrac_estim_ykali")

)


plotlist    = list()
for(p in c(1:length(EXPdata))){
  
  
  message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
  
  plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                            ,mytitle     = TeX(names(EXPdata)[p])
                            ,myylab = "Damages [%GDPssp]") 
  
  plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
  
}


nRow = 2
nCol = 2

plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                            ,top =  text_grob("Regional Damages [%GDPssp] over time", face = "bold", size = 16)
)


plottigat


###-------------  (c)  YNET .. SSP2 .. #COOP ----------------


EXPdata   = list(
  
  "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("YNET")
  
  ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("YNET")
  ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("YNET")
  ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("YNET")
  
)


plotlist    = list()
for(p in c(1:length(EXPdata))){
  
  
  message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
  
  plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                            ,mytitle     = TeX(names(EXPdata)[p])
                            ,myylab = "GDP Net of damages [Trill USD]") 
  
  plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
  
}


nRow = 2
nCol = 2

plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                            ,top =  text_grob("Regions GDP Net of damages [Trill USD] over time", face = "bold", size = 16)
)


plottigat

###-------------  (c) Y .. SSP2 .. #COOP ----------------


EXPdata   = list(
  
  "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("Y")
  
  ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("Y")
  ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("Y")
  ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("Y")
  
)


plotlist    = list()
for(p in c(1:length(EXPdata))){
  
  
  message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
  
  plottigat = nty_plotter(  myexp =  EXPdata[[p]]
                            ,mytitle     = TeX(names(EXPdata)[p])
                            ,myylab = "GDP Net [Trill USD]") 
  
  plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
  
}


nRow = 2
nCol = 2

plottigat = annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                            ,top =  text_grob("Regions GDP Net of both damages and abatecosts [Trill USD] over time", face = "bold", size = 16)
)


plottigat




#=============================================================================#
####          _______   SCENARIO ♦ MAPS ______________                    ####
#=============================================================================#



## ----------------- (c)  MIU .. COOP +year .. #COOP -----------



myyear = 2100


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_MIU_nty   %>% filter(year==myyear)
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_MIU_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_MIU_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_MIU_nty   %>% filter(year==myyear)
  )
  
  ,title  = paste0("Mitigation in ",myyear," ")
  ,legend = "Mitigation \n[% BAU]"
  ,palette =  RColorBrewer::brewer.pal(9, "OrRd") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,min_data = 0 
  ,max_data = 120
  ,LaTeX_text = TRUE
  ,columns = 2
  
) 

plottigat

# save
custom_save(plottigat)



## ----------------- (c)  EIND .. COOP +year .. #COOP -----------



myyear = 2100


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_EMI_nty   %>% filter(year==myyear)
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_EMI_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_EMI_nty   %>% filter(year==myyear)
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_EMI_nty   %>% filter(year==myyear)
  )
  
  ,title  = paste0("Emissions in ",myyear," ")
  ,legend = "Emissions \n[GtCO2/year]"
  ,palette =  rev(RColorBrewer::brewer.pal(9, "RdBu")) #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = TRUE
  ,LaTeX_text = TRUE
  ,columns = 2
  
) 

plottigat

# save
custom_save(plottigat)



## ----------------- (c)  DAMFRAC(ykali) .. COOP +year .. #COOP -----------



myyear = 2100


plottigat = RICEx.plot.multimap(
  EXPdata   = list(
    
    "Noncoop"                     = mySC_ssp2_NONCOOP$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
    
    ,"Coop $\\gamma = 0$"          = mySC_ssp2_COOP_0$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
    ,"Coop $\\gamma = 0.5$"      = mySC_ssp2_COOP_0x5$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
    ,"Coop $\\gamma = 1.45$"    = mySC_ssp2_COOP_1x45$get_VARIABLE_nty("damfrac_estim_ykali")   %>% filter(year==myyear)
  )
  
  ,title  = paste0("Damages in ",myyear," (compared to SSP levels")
  ,legend = "Damages \n[%GDPssp]"
  ,palette =  RColorBrewer::brewer.pal(9, "RdBu") #RdBu|OrRd|PuBu|Greens|RdPu|Purples|Greys
  ,legend_symmetric = TRUE
  ,LaTeX_text = TRUE
  ,columns = 2
  
) 

plottigat

# save
custom_save(plottigat)



#=============================================================================#
####          _______   SCENARIO ♦ SINGLE REGION ______                    ####
#=============================================================================#

###-------------  (c)  EIND .. SSP2 .. #COOP ----------------

myreg = c("can","golf57","nde","rsas","usa","rsaf")



plottigat = RICEx.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop EIND"       = XPX$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_EIND_nty %>% filter(n %in% myreg)
    ,"Coop EIND g0"      = XPX$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma0$get_EIND_nty %>% filter(n %in% myreg)
    ,"BAU EIND "         = XPX$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$BAU$get_EIND_nty %>% filter(n %in%myreg)
    ,"Coop EIND g2"      = XPX$v1x00$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_disentangled$savings_fixed_converging$CBA__gamma2$get_EIND_nty %>% filter(n %in%myreg)
    
    
  )
  
  , title = "Comparison of variables"
  , columns = 2
  , LaTeX_text = TRUE
  
  
); plottigat


###-------------  (c)  EIND .. SSP2 .. #Burke ----------------

myreg = c("can","golf57","nde","rsas","usa","rsaf")



plottigat = RICEx.combo.lineplot_nty(
  
  EXPdata   = list(
    
    "Noncoop SR - EIND"       = XPX$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging$CBA$get_EIND_nty %>% filter(n %in% myreg)
    ,"Noncoop LR - EIND"      = XPX$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLR$welfare_DICE$savings_fixed_converging$CBA$get_EIND_nty %>% filter(n %in% myreg)
    ,"Noncoop SRdiff - EIND"  = XPX$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSRdiff$welfare_DICE$savings_fixed_converging$CBA$get_EIND_nty %>% filter(n %in% myreg)
    ,"Noncoop LRdiff - EIND"  = XPX$v1x00$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnLRdiff$welfare_DICE$savings_fixed_converging$CBA$get_EIND_nty %>% filter(n %in% myreg)
    
    
  )
  
  , title = "Comparison of variables"
  , columns = 2
  , LaTeX_text = TRUE
  
  
); plottigat



