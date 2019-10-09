source("OTHER_datamng/ADVANCE_data_management.R")
source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_00_colors_settings.R")
pkgs <- c('tidyr','broom','data.table','stringr','dplyr','dtplyr','purrr', 'colf', 'gdxtools', "minpack.lm")
res <- suppressWarnings(lapply(pkgs,require_package))
require_package("ggplot2")


## FUNCTION
# to evaluate abated regional emissions

eval_abatement_region <- function(DF_BASE,DF_CTAX){

merge( DF_BASE %>% select(model,region, year, value), 
       DF_CTAX %>% select(model,region, year, value),
       by = c("model", "region", "year"))        %>%
  rename(emi_base = value.x, emi_with_ctax = value.y) %>%
  mutate(emi_abated = emi_base - emi_with_ctax)       %>%
  filter(year >= 2020)

}

## FUNCTION
# to evaluate abated world emissions

eval_abatement_world <- function(DF_BASE,DF_CTAX){
  
  merge( DF_BASE %>% select(model, year, value), 
         DF_CTAX %>% select(model, year, value),
         by = c("model", "year"))                  %>%
    rename(emi_base = value.x, emi_with_ctax = value.y) %>%
    mutate(emi_abated = emi_base - emi_with_ctax)       %>% 
    filter(year >= 2020)
  
}



## FUNCTION
# to evaluate ctax value from DIAG and year

apply_ctax <- function(DF, CTAX){
  
  
  if(CTAX == "DIAG_C30_const") return( DF %>% mutate(ctax = 30) %>% mutate(diag = "DIAG_C30_const"))
  if(CTAX == "DIAG_C80_const") return( DF %>% mutate(ctax = 80 )%>% mutate(diag = "DIAG_C80_const")) 
  if(CTAX == "DIAG_C30_gr5")   return( DF %>% mutate(ctax = 30 * (1.05^(year-2040))) %>% mutate(diag = "DIAG_C30_gr5"))
  if(CTAX == "DIAG_C80_gr5")   return( DF %>% mutate(ctax = 80 * (1.05^(year-2040))) %>% mutate(diag = "DIAG_C80_gr5"))
                                       
  #default: DIAG_Base = no cost
  return( DF %>% mutate(ctax = 0) %>% mutate(diag = "DIAG_Base"))
}



## FUNCTION
# which extracts MACC points (ctax value - abated emissions), given 5-Diag exps
# NOTE: DFs must have at least "model" "year" "value(emi)" fields!

extract_MACC_from_Diags <- function(DF_DIAG_Base,
                                    DF_DIAG_C30_const ,
                                    DF_DIAG_C80_const ,
                                    DF_DIAG_C30_gr5   ,
                                    DF_DIAG_C80_gr5    ){
  
  
  world_abate = list()
  
  if(!is.null( DF_DIAG_C30_const )){
  world_abate$DIAG_C30_const = eval_abatement_world(DF_BASE = DF_DIAG_Base, 
                                                    DF_CTAX = DF_DIAG_C30_const)  %>% apply_ctax("DIAG_C30_const")}
  if(!is.null( DF_DIAG_C30_gr5 )){
  world_abate$DIAG_C30_gr5   = eval_abatement_world(DF_BASE = DF_DIAG_Base, 
                                                    DF_CTAX = DF_DIAG_C30_gr5)    %>% apply_ctax("DIAG_C30_gr5")  }
  
  if(!is.null( DF_DIAG_C80_const )){
  world_abate$DIAG_C80_const = eval_abatement_world(DF_BASE = DF_DIAG_Base, 
                                                    DF_CTAX = DF_DIAG_C80_const)  %>% apply_ctax("DIAG_C80_const")}

  if(!is.null( DF_DIAG_C80_gr5 )){
  world_abate$DIAG_C80_gr5   = eval_abatement_world(DF_BASE = DF_DIAG_Base, 
                                                    DF_CTAX = DF_DIAG_C80_gr5)    %>% apply_ctax("DIAG_C80_gr5")  }
  
  if(!is.null( DF_DIAG_Base )){
  world_abate$DIAG_Base      = eval_abatement_world(DF_BASE = DF_DIAG_Base, 
                                                    DF_CTAX = DF_DIAG_Base)       %>% apply_ctax("DIAG_Base")     }
  
  # gathering all together
  MACC = bind_rows(world_abate) %>% distinct()  %>% mutate(emi_abat_perc = emi_abated /emi_base ) %>% arrange(ctax)
  
  
  
  
  
  
  
  return(MACC)
  
}







# Evaluate CTAX-Abatements points for ADVANCE

MACC_ADV =extract_MACC_from_Diags( DF_DIAG_Base      = ADVANCE_CO2_WORLD$DIAG_Base,
                                   DF_DIAG_C30_const = ADVANCE_CO2_WORLD$DIAG_C30_const,
                                   DF_DIAG_C80_const = ADVANCE_CO2_WORLD$DIAG_C80_const,
                                   DF_DIAG_C30_gr5   = ADVANCE_CO2_WORLD$DIAG_C30_gr5 ,
                                   DF_DIAG_C80_gr5   = ADVANCE_CO2_WORLD$DIAG_C80_gr5  )





#---------------------: RICEx MACCs  :--------------------------------




# Retrieve experiments

CTAXexp = list()
CTAXexp = experiments_load_as_list(CTAXexp,"MYEXPERIMENT")

baseexp = CTAXexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv
BAU     = CTAXexp$v0x092$OPT$ed57$ssp2$cooppop$maccED$clWITCHco2$damBURKEnSR$savFXconv$runBAU








# Tide Experiments

MyX = list()
MACC_EXP = list()


## A
expName = "minMU7 maxMUt28 \npback550 gback025 \n      fullpb28 "

MyX$DIAG_C30_gr5   = baseexp$runCTAX_DIAG_C30_gr5_xxA$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C80_gr5   = baseexp$runCTAX_DIAG_C80_gr5_xxA$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C30_const = baseexp$runCTAX_DIAG_C30_const_xxA$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_C80_const = baseexp$runCTAX_DIAG_C80_const_xxA$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_Base      = BAU$get_worldEMIffi_ty                                  %>% mutate(model = expName )


MACC_EXP$A   = extract_MACC_from_Diags( DF_DIAG_Base      = MyX$DIAG_Base,
                                    DF_DIAG_C30_const = MyX$DIAG_C30_const,
                                    DF_DIAG_C80_const = MyX$DIAG_C80_const,
                                    DF_DIAG_C30_gr5   = MyX$DIAG_C30_gr5 ,
                                    DF_DIAG_C80_gr5   = MyX$DIAG_C80_gr5  )





## B
expName =  "minMU7 maxMUt28 \npback550 gback025 \n      fullpb10 "

MyX$DIAG_C30_gr5   = baseexp$runCTAX_DIAG_C30_gr5_xxB$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C80_gr5   = baseexp$runCTAX_DIAG_C80_gr5_xxB$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C30_const = baseexp$runCTAX_DIAG_C30_const_xxB$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_C80_const = baseexp$runCTAX_DIAG_C80_const_xxB$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_Base      = BAU$get_worldEMIffi_ty                                  %>% mutate(model = expName )


MACC_EXP$B   = extract_MACC_from_Diags( DF_DIAG_Base      = MyX$DIAG_Base,
                                        DF_DIAG_C30_const = MyX$DIAG_C30_const,
                                        DF_DIAG_C80_const = MyX$DIAG_C80_const,
                                        DF_DIAG_C30_gr5   = MyX$DIAG_C30_gr5 ,
                                        DF_DIAG_C80_gr5   = MyX$DIAG_C80_gr5  )





## C
expName =  "minMU14 maxMUt28 \npback550 gback025 \n      fullpb10 "

MyX$DIAG_C30_gr5   = baseexp$runCTAX_DIAG_C30_gr5_xxC$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C80_gr5   = baseexp$runCTAX_DIAG_C80_gr5_xxC$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C30_const = baseexp$runCTAX_DIAG_C30_const_xxC$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_C80_const = baseexp$runCTAX_DIAG_C80_const_xxC$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_Base      = BAU$get_worldEMIffi_ty                                  %>% mutate(model = expName )


MACC_EXP$C  = extract_MACC_from_Diags( DF_DIAG_Base      = MyX$DIAG_Base,
                                         DF_DIAG_C30_const = MyX$DIAG_C30_const,
                                         DF_DIAG_C80_const = MyX$DIAG_C80_const,
                                         DF_DIAG_C30_gr5   = MyX$DIAG_C30_gr5 ,
                                         DF_DIAG_C80_gr5   = MyX$DIAG_C80_gr5  )




## D
expName =  "minMU7 maxMUt28 \npback344 gback05 \n       fullpb28 "


MyX$DIAG_C30_gr5   = baseexp$runCTAX_DIAG_C30_gr5_xxD$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C80_gr5   = baseexp$runCTAX_DIAG_C80_gr5_xxD$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C30_const = baseexp$runCTAX_DIAG_C30_const_xxD$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_C80_const = baseexp$runCTAX_DIAG_C80_const_xxD$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_Base      = BAU$get_worldEMIffi_ty                                  %>% mutate(model = expName )


MACC_EXP$D  = extract_MACC_from_Diags( DF_DIAG_Base      = MyX$DIAG_Base,
                                         DF_DIAG_C30_const = MyX$DIAG_C30_const,
                                         DF_DIAG_C80_const = MyX$DIAG_C80_const,
                                         DF_DIAG_C30_gr5   = MyX$DIAG_C30_gr5 ,
                                         DF_DIAG_C80_gr5   = MyX$DIAG_C80_gr5  )




## E
expName =  "minMU7 maxMUt28 \npback344 gback025 \n      fullpb28 "

MyX$DIAG_C30_gr5   = baseexp$runCTAX_DIAG_C30_gr5_xxE$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C80_gr5   = baseexp$runCTAX_DIAG_C80_gr5_xxE$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C30_const = baseexp$runCTAX_DIAG_C30_const_xxE$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_C80_const = baseexp$runCTAX_DIAG_C80_const_xxE$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_Base      = BAU$get_worldEMIffi_ty                                  %>% mutate(model = expName )


MACC_EXP$E  = extract_MACC_from_Diags( DF_DIAG_Base      = MyX$DIAG_Base,
                                         DF_DIAG_C30_const = MyX$DIAG_C30_const,
                                         DF_DIAG_C80_const = MyX$DIAG_C80_const,
                                         DF_DIAG_C30_gr5   = MyX$DIAG_C30_gr5 ,
                                         DF_DIAG_C80_gr5   = MyX$DIAG_C80_gr5  )



## F
expName =  "minMU14 maxMUt28 \npback344 gback05 \n      fullpb10 "

MyX$DIAG_C30_gr5   = baseexp$runCTAX_DIAG_C30_gr5_xxF$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C80_gr5   = baseexp$runCTAX_DIAG_C80_gr5_xxF$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C30_const = baseexp$runCTAX_DIAG_C30_const_xxF$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_C80_const = baseexp$runCTAX_DIAG_C80_const_xxF$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_Base      = BAU$get_worldEMIffi_ty                                  %>% mutate(model = expName )


MACC_EXP$F  = extract_MACC_from_Diags( DF_DIAG_Base      = MyX$DIAG_Base,
                                         DF_DIAG_C30_const = MyX$DIAG_C30_const,
                                         DF_DIAG_C80_const = MyX$DIAG_C80_const,
                                         DF_DIAG_C30_gr5   = MyX$DIAG_C30_gr5 ,
                                         DF_DIAG_C80_gr5   = MyX$DIAG_C80_gr5  )




## G
expName =  "minMU14 maxMUt28 \npback344 gback05 \n      fullpb14 "

MyX$DIAG_C30_gr5   = baseexp$runCTAX_DIAG_C30_gr5_xxG$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C80_gr5   = baseexp$runCTAX_DIAG_C80_gr5_xxG$get_worldEMIffi_ty     %>% mutate(model = expName )
MyX$DIAG_C30_const = baseexp$runCTAX_DIAG_C30_const_xxG$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_C80_const = baseexp$runCTAX_DIAG_C80_const_xxG$get_worldEMIffi_ty   %>% mutate(model = expName )
MyX$DIAG_Base      = BAU$get_worldEMIffi_ty                                  %>% mutate(model = expName )


MACC_EXP$G   = extract_MACC_from_Diags( DF_DIAG_Base      = MyX$DIAG_Base,
                                        DF_DIAG_C30_const = MyX$DIAG_C30_const,
                                        DF_DIAG_C80_const = MyX$DIAG_C80_const,
                                        DF_DIAG_C30_gr5   = MyX$DIAG_C30_gr5 ,
                                        DF_DIAG_C80_gr5   = MyX$DIAG_C80_gr5  )












#---------------------:  MACC Plot  :----------------------------------


myMACC = bind_rows(MACC_EXP) %>% distinct()
my_year = 2100


ggplot() + 

   geom_line(data = MACC_ADV %>% filter(year==my_year),
              aes(x = emi_abat_perc,
                  y = ctax,
                  group = model,
                  color = "_ADVANCE"), size = 1   ) +

  geom_point(data = myMACC %>% filter(year==my_year),
           aes(x = emi_abat_perc, 
               y = ctax, 
               group = model, 
               color = model), size = 4 ) +
  
  geom_line(data = myMACC %>% filter(year==my_year),
             aes(x = emi_abat_perc, 
                 y = ctax, 
                 group = model, 
                 color = model), size = 1.1 ) +
  
  # geom_smooth(data= myMACC %>% filter(year==my_year), 
  #             aes(x=emi_abat_perc, 
  #                 y=ctax,  
  #                 group = model, 
  #                 color = model),
  #             size = 1.1,  
  #             se = F, 
  #             method = "lm",
  #             #formula =  log(y + 0.000000000001) ~ x ,
  #             # formula = y ~ I(exp(x))  ,
  #             # formula= y  ~ x + I(x^2) -1,
  #             formula = y ~poly(x,2),
  #             span = 0.2  ) +
  # 

  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual( values = c("grey", wes_palette(name = "Darjeeling1"), wes_palette(name = "GrandBudapest2"))) +
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         #legend.spacing.y = unit(10.0, 'mm'),
         
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  

  
  labs (color = "Model") + 
  ggtitle(paste0("MACC from ADVANCE Models - ", my_year )) + 
  ylab("Cost [$/tCO2]") +
  xlab("Abated Emissions [% BAU]")  





