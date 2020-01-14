# Script to evaluate different transitions of the MACCurves and CPrices
# and determine their impact on the overall model

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




## -----------------   source file   -----------------------------------------------


source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_plots/RICEx_00_colors_settings.R")
source("OTHER_datamng/ADVANCE_data_management.R")
source("OTHER_datamng/HIST_emissions_data.R")
source("RICEx_utils/RICEx_10_regions_mappings.R")

## -----------------   EXPERIMENTS   -----------------------------------------------
# Retrieve experiments

MCCtrns = list()

MCCtrns = experiments_load_as_list(MCCtrns,"MCCtrns")
Base_noncoop = MCCtrns$v0x9$OPTIM$ed57$ssp2$noncoop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging
Base_coop = MCCtrns$v0x9$OPTIM$ed57$ssp2$coop_pop$mcEDct4$climate_WITCHco2$damages_BURKEnSR$welfare_DICE$savings_fixed_converging



## -----------------   Plotting FUNCTIONS   -----------------------------------------------

# >>>  run section ad close  



## ____ FUNCTION ____
# to PLOT MIU 
#
plotMIU <- function(){
  
  
  
  mytitle  =  paste0( "MIU values for DIAG 30 gr5 - ", expName  )
  myYlabel =  "Abatement [%BAU]"
  myLegend =  "Regions"
  
  plottigat = ggplot() + 
    
    
    # MY DATA
    
    geom_line(data = MIUdata_nty, aes(year,value, color=n), size = 1.2)  +  
    
    
    # graphic details
    
    guides(colour=guide_legend(ncol=3)) +
    scale_color_manual(
      values = colorize_regions("ed57")) +
    
    
    theme( legend.text   = element_text(size = 13),
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ;
  return(plottigat)
  
}

# PLOT CPRICE :::::::::::::::::::::::::::::::::::::::

plotCPrice <- function(){
  
  
  
  mytitle  =  paste0( "CPrice values for DIAG 30 gr5 - ", expName  )
  myYlabel =  "CPrice [$/tCO2]"
  myLegend =  "Regions"
  
  # Plotter .......................
  
  plottigat = ggplot() + 
    
    
    # MY DATA
    
    geom_line(data = CPRICEdata_nty, aes(year,value, color=n), size = 1.2)  +  
    
    
    # graphic details
    
    guides(colour=guide_legend(ncol=3)) +
    scale_color_manual(
      values = colorize_regions("ed57")) +
    
    
    theme( legend.text   = element_text(size = 13),
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ;
  return(plottigat)
  
}

## -------- plot : CARBON PRICE  ---------------------


plotLINES <- function( EXPdata,
                       EXPtitle,
                       EXPylabel,
                       EXPlegend,
                       categories = NULL, 
                       colors_per_category=NULL ){
  
  
  # Retrieve informations
  mytitle  =  EXPtitle
  myYlabel =  EXPylabel
  myLegend =  EXPlegend
  
  
  # number of columns needed to sho all legends
  legendColumns = ifelse(length(EXPdata) < 13, 1, 2) 
  
  
  # Create dataframe
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  # Create legend names and colors associated
  
  if(is.null(categories)){ncolors = length(EXPdata)}else{ncolors=NULL}
  
  my_legend_elements_with_colors = c("grey","black","black",  
                                     i_want_pollos_colors( howmany_colors      = ncolors,
                                                           howmany_categories  = categories,
                                                           colors_per_category = colors_per_category ))
  
  names(my_legend_elements_with_colors) = c("ADVANCE","MEDIAN","historical",names(EXPdata))
  
  
  my_legend_elements_with_colors = c("black",
                                   i_want_pollos_colors( howmany_colors      = ncolors,
                                                         howmany_categories  = categories,
                                                         colors_per_category = colors_per_category ))
  
  
  names(my_legend_elements_with_colors) = c("BAU",names(EXPdata))
  
  
  # Plotter .......................
  
  plottigat = ggplot() + 
    
    
    
    # MY DATA
    
    geom_line(data = mydf, aes(year,value, color=cat), size = 1.2)  +  
    
    
    # graphic details
    
    guides(colour=guide_legend(ncol=legendColumns)) +
    scale_color_manual( breaks = names(my_legend_elements_with_colors),
                        values = my_legend_elements_with_colors ) +
    theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
           #legend.spacing.y = unit(10.0, 'mm'),
           
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 16),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ; 
  
  return(plottigat)
}


# PLOT CTAX :::::::::::::::::::::::::::::::::::::::

# Plottigat
plotCTAX <- function( EXPdata,
                      EXPtitle,
                      EXPylabel,
                      EXPlegend,
                      ADVANCE_MODELS,
                      categories = NULL, 
                      colors_per_category=NULL ){
  
  
  # Retrieve informations
  mytitle  =  EXPtitle
  myYlabel =  EXPylabel
  myLegend =  EXPlegend
  
  
  # number of columns needed to sho all legends
  legendColumns = ifelse(length(EXPdata) < 13, 1, 2) 
  
  
  # Create dataframe
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  # Create legend names and colors associated
  
  if(is.null(categories)){ncolors = length(EXPdata)}else{ncolors=NULL}
  
  my_legend_elements_with_colors = c("grey","black","black",  
                                     i_want_pollos_colors( howmany_colors      = ncolors,
                                                           howmany_categories  = categories,
                                                           colors_per_category = colors_per_category ))
  
  names(my_legend_elements_with_colors) = c("ADVANCE","MEDIAN","historical",names(EXPdata))
  
  
  # Plotter .......................
  
  plottigat = ggplot() + 
    
    #ADVANCE
    
    geom_line(data= ADVANCE_MODELS,
              aes(x=year, y=value, group = model, color = "ADVANCE"),
              size = 0.8)  +
    
    geom_smooth(data= ADVANCE_MODELS,
                aes(x=year, y=value,  color = "MEDIAN"),
                method="auto",
                size = 1.1,  linetype = "dashed", se = T) +

    # MY DATA
    
    geom_line(data = mydf, aes(year,value, color=cat), size = 1.2)  +  
    
    # HISTORICAL DATA
    
    geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="historical"), size = 1.2)  +  
    
    # graphic details
    
    guides(colour=guide_legend(ncol=legendColumns)) +
    scale_color_manual( breaks = names(my_legend_elements_with_colors),
                        values = my_legend_elements_with_colors ) +
    theme( legend.text   = element_text(size = 12),# margin = margin(t = 10)),
           #legend.spacing.y = unit(10.0, 'mm'),
           
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 16),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ; 
  
  return(plottigat)
}



# PLOT CBAs :::::::::::::::::::::::::::::::::::::::

# Plottigat
plotCBAs <- function(){
  
  mytitle  =  EXPtitle
  myYlabel =  EXPylabel
  myLegend =  EXPlegend
  legendColumns = ifelse(length(EXPdata) < 13, 1, 2) 
  
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  
  
  plottigat = ggplot() + 
    
    
    
    # MY DATA
    
    geom_line(data = mydf, aes(year,value, color=cat), size = 1.2)  +  
    
    # HISTORICAL DATA
    
    geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="historical"), size = 1.2)  +  
    
    # graphic details
    
    guides(colour=guide_legend(ncol=legendColumns)) +
    scale_color_manual(breaks= c("BAU","historical",names(EXPdata)[order(names(EXPdata))]),
                       values = c("black","black", wes_palette(name = "Darjeeling1"), #wes_palette(name = "GrandBudapest2"),
                                  
                                  
                                  "blue",   #blue
                                  #???"#0f86db",
                                  #"#0ccfab",
                                  
                                  "green",  #greens
                                  "#d64cf5", # pink
                                  
                                  "#8232c7", #violet
                                  "#450094",
                                  "#32c738",  
                                  "#046918",
                                  
                                  
                                  "#f77f2f", #orange
                                  "#db0f20", 
                                  "red",      # red
                                  
                                  
                                  
                                  
                                  
                                  
                                  "#c4570e",  # brown
                                  "#fff100",  #yellow
                                  "#9c4317"
                       )) +
    
    
    theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
           #legend.spacing.y = unit(10.0, 'mm'),
           
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 16),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ; 
  
  return(plottigat)
}



## ----  :B: SHAPE analysis ----------------------------


# CTAX 30gr5  .................

EXPdata   = list(  
   "pb18 | trMU[7-28] | linear " =    Base_noncoop$CTAX30gr5__linear_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.01  " =    Base_noncoop$CTAX30gr5__logk0x01_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX30gr5__logk0x25_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX30gr5__logk0x40_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX30gr5__logk0x50_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX30gr5__logk0x75_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k1     " =    Base_noncoop$CTAX30gr5__logk1x00_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k1.5   " =    Base_noncoop$CTAX30gr5__logk1x50_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k2     " =    Base_noncoop$CTAX30gr5__logk2x00_pb18_MUtrn_7_28$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence 2100"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = NULL
                       ,colors_per_category = NULL ); plottigat + xlim(2015,2125)


# CTAX 80gr5  .................

EXPdata   = list(  
  "pb18 | trMU[7-28] | linear " =    Base_noncoop$CTAX80gr5__linear_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.01  " =    Base_noncoop$CTAX80gr5__logk0x01_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX80gr5__logk0x25_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX80gr5__logk0x40_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX80gr5__logk0x50_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX80gr5__logk0x75_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k1     " =    Base_noncoop$CTAX80gr5__logk1x00_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k1.5   " =    Base_noncoop$CTAX80gr5__logk1x50_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k2     " =    Base_noncoop$CTAX80gr5__logk2x00_pb18_MUtrn_7_28$get_worldEMIffi_ty
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence 2100"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = NULL
                       ,colors_per_category = NULL ); plottigat + xlim(2015,2125)




# --- CPrice values over time per Region

my_region = "chn"
my_miu    = 1 


EXPdata   = list(  
   "pb18 | trMU[7-28] | linear " =    Base_noncoop$CTAX80gr5__linear_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.01  " =    Base_noncoop$CTAX80gr5__logk0x01_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX80gr5__logk0x25_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX80gr5__logk0x40_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX80gr5__logk0x50_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX80gr5__logk0x75_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k1     " =    Base_noncoop$CTAX80gr5__logk1x00_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k1.5   " =    Base_noncoop$CTAX80gr5__logk1x50_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k2     " =    Base_noncoop$CTAX80gr5__logk2x00_pb18_MUtrn_7_28$get_PARAMETER("xmacc") %>% filter(V1=="KALI", n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(str_sub(iyear, start= -4))) %>% select(n,year,value)
)
my_region_description = (ed57 %>% filter(ed57==my_region))$ed57_description 
EXPtitle  = paste0("Carbon Price for MIU=",my_miu, ", region ",my_region_description)
EXPylabel = "Carbon Price [$/tCO2]"
EXPlegend = "Experiments"


#show
plottigat <- plotLINES( EXPdata
                        ,EXPtitle
                        ,EXPylabel
                        ,EXPlegend
                        ); plottigat


# --- ABATECOSTS values over time per Region

my_region = "chn"
my_miu    = 1 


EXPdata   = list(  
  "pb18 | trMU[7-28] | linear " =    Base_noncoop$CTAX80gr5__linear_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.01  " =    Base_noncoop$CTAX80gr5__logk0x01_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX80gr5__logk0x25_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX80gr5__logk0x40_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX80gr5__logk0x50_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX80gr5__logk0x75_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k1     " =    Base_noncoop$CTAX80gr5__logk1x00_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k1.5   " =    Base_noncoop$CTAX80gr5__logk1x50_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
  ,"pb18 | trMU[7-28] | k2     " =    Base_noncoop$CTAX80gr5__logk2x00_pb18_MUtrn_7_28$get_PARAMETER("xABATECOST") %>% filter( n==my_region, imiu==(my_miu*10)) %>%mutate(year= as.numeric(t)*5 +2010) %>% select(n,year,value)
)
my_region_description = (ed57 %>% filter(ed57==my_region))$ed57_description 
EXPtitle  = paste0("Abate Costs for MIU=",my_miu, ", region ",my_region_description)
EXPylabel = "Abate Costs [Trill USD /year]"
EXPlegend = "Experiments"


#show
plottigat <- plotLINES( EXPdata
                        ,EXPtitle
                        ,EXPylabel
                        ,EXPlegend
); plottigat





## ----  :C: PB CONVERGENCE analysis ----------------------------


# CTAX 30gr5  .................

EXPdata   = list(  

  "pb18 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX30gr5__logk0x25_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX30gr5__logk0x40_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX30gr5__logk0x50_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX30gr5__logk0x75_pb18_MUtrn_7_28$get_worldEMIffi_ty
  
  ,"pb23 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX30gr5__logk0x25_pb23_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb23 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX30gr5__logk0x40_pb23_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb23 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX30gr5__logk0x50_pb23_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb23 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX30gr5__logk0x75_pb23_MUtrn_7_28$get_worldEMIffi_ty
  
  ,"pb28 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX30gr5__logk0x25_pb28_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb28 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX30gr5__logk0x40_pb28_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb28 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX30gr5__logk0x50_pb28_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb28 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX30gr5__logk0x75_pb28_MUtrn_7_28$get_worldEMIffi_ty


  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 - PBconvergence in 2100 (18), 2125 (23), 2150 (28)"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = 3
                       ,colors_per_category = 4 ); plottigat + xlim(2015,2125)


# CTAX 80gr5  .................

EXPdata   = list(  
  
  "pb18 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX80gr5__logk0x25_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX80gr5__logk0x40_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX80gr5__logk0x50_pb18_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb18 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX80gr5__logk0x75_pb18_MUtrn_7_28$get_worldEMIffi_ty
  
  ,"pb23 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb23 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb23 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX80gr5__logk0x50_pb23_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb23 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX80gr5__logk0x75_pb23_MUtrn_7_28$get_worldEMIffi_ty
  
  ,"pb28 | trMU[7-28] | k0.25  " =    Base_noncoop$CTAX80gr5__logk0x25_pb28_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb28 | trMU[7-28] | k0.4   " =    Base_noncoop$CTAX80gr5__logk0x40_pb28_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb28 | trMU[7-28] | k0.5   " =    Base_noncoop$CTAX80gr5__logk0x50_pb28_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb28 | trMU[7-28] | k0.75  " =    Base_noncoop$CTAX80gr5__logk0x75_pb28_MUtrn_7_28$get_worldEMIffi_ty
  
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 - PBconvergence in 2100 (18), 2125 (23), 2150 (28)"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = 3
                       ,colors_per_category = 4 ); plottigat + xlim(2015,2125)




## ----  :D: MIU-up transition analysis ----------------------------


# CTAX 80gr5  all  .................


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

EXPdata   = list(  
  
  

  
   "pb23 | k0.4 | trMU [2045-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_7_28$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2075-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_13_28$get_worldEMIffi_ty 
  ,"pb23 | k0.4 | trMU [2090-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2100-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_18_28$get_worldEMIffi_ty
  
  ,"pb23 | k0.4 | trMU [2045-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_7_38$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2075-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_13_38$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2090-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_38$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2100-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_18_38$get_worldEMIffi_ty
  
  ,"pb23 | k0.4 | trMU [2045-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_7_23$get_worldEMIffi_ty 
  ,"pb23 | k0.4 | trMU [2075-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_13_23$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2090-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_23$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2100-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_18_23$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 - Different MIU.up intervals"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = 3
                       ,colors_per_category = 4 ); plottigat + xlim(2015,2200)






# CTAX 80gr5  seleting some  .................


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

EXPdata   = list(  
  
  
  
  
  "pb23 | k0.4 | trMU [2045-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_7_28$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb23 | k0.4 | trMU [2075-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_13_28$get_worldEMIffi_ty %>% filter(t==1)
  ,"pb23 | k0.4 | trMU [2090-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_28$get_worldEMIffi_ty 
  ,"pb23 | k0.4 | trMU [2100-2150]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_18_28$get_worldEMIffi_ty%>% filter(t==1)
  
  ,"pb23 | k0.4 | trMU [2045-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_7_38$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb23 | k0.4 | trMU [2075-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_13_38$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb23 | k0.4 | trMU [2090-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_38$get_worldEMIffi_ty
  ,"pb23 | k0.4 | trMU [2100-2200]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_18_38$get_worldEMIffi_ty%>% filter(t==1)
  
  ,"pb23 | k0.4 | trMU [2045-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_7_23$get_worldEMIffi_ty %>% filter(t==1)
  ,"pb23 | k0.4 | trMU [2075-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_13_23$get_worldEMIffi_ty %>% filter(t==1)
  ,"pb23 | k0.4 | trMU [2090-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_23$get_worldEMIffi_ty%>% filter(t==1) 
  ,"pb23 | k0.4 | trMU [2100-2125]" =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_18_23$get_worldEMIffi_ty%>% filter(t==1)
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 - Different MIU.up intervals"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = 3
                       ,colors_per_category = 4 ); plottigat + xlim(2015,2200)









## COMBOOOOS ---------------





# varying shape / tr  ----------

EXPdata   = list(  
  
  
   "pb23 | trMU [2090-2150] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb23 | trMU [2090-2200] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_38$get_worldEMIffi_ty
  
  ,"pb23 | trMU [2090-2150] | k0.75" =    Base_noncoop$CTAX80gr5__logk0x75_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb23 | trMU [2090-2200] | k0.75" =    Base_noncoop$CTAX80gr5__logk0x75_pb23_MUtrn_16_38$get_worldEMIffi_ty
  
  ,"pb23 | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb23 | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_16_38$get_worldEMIffi_ty
  
  

  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 - Different interesting alternatives "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = 3
                       ,colors_per_category = 2 ); plottigat + xlim(2015,2200)




# varying shape / PB /  tr ------




EXPdata   = list(  

   "pb23  | trMU [2090-2150] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb23  | trMU [2090-2200] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_38$get_worldEMIffi_ty
  
  ,"pb23  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb23  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_16_38$get_worldEMIffi_ty
    

  ,"pb28  | trMU [2090-2150] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_28$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb28  | trMU [2090-2200] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb23_MUtrn_16_38$get_worldEMIffi_ty%>% filter(t==1)
  
  ,"pb28  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_16_28$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb28  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_16_38$get_worldEMIffi_ty%>% filter(t==1)
  
  ,"pb18  | trMU [2090-2150] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb18_MUtrn_16_28$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb18  | trMU [2090-2200] | k0.4 " =    Base_noncoop$CTAX80gr5__logk0x40_pb18_MUtrn_16_38$get_worldEMIffi_ty%>% filter(t==1)
  
  ,"pb18  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb18_MUtrn_16_28$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb18  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb18_MUtrn_16_38$get_worldEMIffi_ty%>% filter(t==1)
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 - Different interesting alternatives "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = NULL
                       ,colors_per_category = 2 ); plottigat 
# wanna zoom?
plottigat + coord_cartesian(xlim=c(2080,2110), ylim = c(-5,10))







#### c30gr5 -----------

EXPdata   = list(  
  
  
   "pb23  | trMU [2090-2150] | k0.4 " =    Base_noncoop$CTAX30gr5__logk0x40_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb23  | trMU [2090-2200] | k0.4 " =    Base_noncoop$CTAX30gr5__logk0x40_pb23_MUtrn_16_38$get_worldEMIffi_ty%>% filter(t==1)
  
  ,"pb23  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb23_MUtrn_16_28$get_worldEMIffi_ty%>% filter(t==1)
  ,"pb23  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb23_MUtrn_16_38$get_worldEMIffi_ty%>% filter(t==1)
  
  
  ,"pb28  | trMU [2090-2150] | k0.4 " =    Base_noncoop$CTAX30gr5__logk0x40_pb23_MUtrn_16_28$get_worldEMIffi_ty  %>% filter(t==1)
  ,"pb28  | trMU [2090-2200] | k0.4 " =    Base_noncoop$CTAX30gr5__logk0x40_pb23_MUtrn_16_38$get_worldEMIffi_ty  %>% filter(t==1)
  
  
  ,"pb28  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb23_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb28  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb23_MUtrn_16_38$get_worldEMIffi_ty%>% filter(t==1)
  
  
  ,"pb18  | trMU [2090-2150] | k0.4 " =    Base_noncoop$CTAX30gr5__logk0x40_pb18_MUtrn_16_28$get_worldEMIffi_ty  %>% filter(t==1)
  ,"pb18  | trMU [2090-2200] | k0.4 " =    Base_noncoop$CTAX30gr5__logk0x40_pb18_MUtrn_16_38$get_worldEMIffi_ty  %>% filter(t==1)
  
  ,"pb18  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb18_MUtrn_16_28$get_worldEMIffi_ty  %>% filter(t==1)
  ,"pb18  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb18_MUtrn_16_38$get_worldEMIffi_ty  %>% filter(t==1)
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 - Different interesting alternatives "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = NULL
                       ,colors_per_category = 2 ); plottigat 


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2080,2120), ylim = c(-10,20))




## BEST RESULTS --------------------

## 80gr55

EXPdata   = list(  
  
  
    "pb28  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb28_MUtrn_16_28$get_worldEMIffi_ty
   ,"pb28  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb28_MUtrn_16_38$get_worldEMIffi_ty
   ,"pb18  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb18_MUtrn_16_38$get_worldEMIffi_ty
   
   ,"pb23  | trMU [2075-2150] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_13_28$get_worldEMIffi_ty
   ,"pb23  | trMU [2075-2200] | k0.25" =    Base_noncoop$CTAX80gr5__logk0x25_pb23_MUtrn_13_38$get_worldEMIffi_ty
   ,"pb28  | trMU [2045-2200] | k0.25 " =   Base_noncoop$CTAX80gr5__logk0x25_pb28_MUtrn_7_38$get_worldEMIffi_ty

)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 - Most interesting alternatives "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = NULL
                       ,colors_per_category = 2 ); plottigat 


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2085,2105), ylim = c(-5,10))



## 30gr55

EXPdata   = list(  
  
  
   "pb28  | trMU [2090-2150] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb28_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb28  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb28_MUtrn_16_38$get_worldEMIffi_ty
  ,"pb18  | trMU [2090-2200] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb18_MUtrn_16_38$get_worldEMIffi_ty
  
  ,"pb23  | trMU [2075-2150] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb23_MUtrn_13_28$get_worldEMIffi_ty
  ,"pb23  | trMU [2075-2200] | k0.25" =    Base_noncoop$CTAX30gr5__logk0x25_pb23_MUtrn_13_38$get_worldEMIffi_ty
  ,"pb28  | trMU [2045-2200] | k0.25 " =   Base_noncoop$CTAX30gr5__logk0x25_pb28_MUtrn_7_38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 - Most interesting alternatives "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"
ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5

#show
plottigat <- plotCTAX( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,ADVANCE_MODELS =  ADVANCE_MODELS
                       ,EXPlegend      =  EXPlegend
                       ,categories          = NULL
                       ,colors_per_category = 2 ); plottigat 


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2080,2125), ylim = c(-10,20))







## CBAs  --------------------


## NONCOOP

EXPdata   = list(  
  
  "BAU" =    Base_noncoop$BAU$get_worldEMIffi_ty
  ,"pb28  | trMU [2090-2150] | k0.25" =    Base_noncoop$CBA__logk0x25_pb28_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb28  | trMU [2090-2200] | k0.25" =    Base_noncoop$CBA__logk0x25_pb28_MUtrn_16_38$get_worldEMIffi_ty%>%filter(t==1)
  ,"pb18  | trMU [2090-2200] | k0.25" =    Base_noncoop$CBA__logk0x25_pb18_MUtrn_16_38$get_worldEMIffi_ty
  
  ,"pb23  | trMU [2075-2150] | k0.25" =    Base_noncoop$CBA__logk0x25_pb23_MUtrn_13_28$get_worldEMIffi_ty
  ,"pb23  | trMU [2075-2200] | k0.25" =    Base_noncoop$CBA__logk0x25_pb23_MUtrn_13_38$get_worldEMIffi_ty%>%filter(t==1)
  ,"pb28  | trMU [2045-2200] | k0.25 " =   Base_noncoop$CBA__logk0x25_pb28_MUtrn_7_38$get_worldEMIffi_ty %>%filter(t==1)
  
)
EXPtitle  = "World Emissions under CBA NONCOOP - Most interesting alternatives "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"

#show
plottigat <- plotLINES( EXPdata =   EXPdata
                       ,EXPtitle       =  EXPtitle
                       ,EXPylabel      =  EXPylabel
                       ,EXPlegend      =  EXPlegend
                       ,categories          = NULL
                       ,colors_per_category = 2 ); plottigat 







## COOP
EXPdata   = list(  
  
  "BAU" =    Base_noncoop$BAU$get_worldEMIffi_ty
  ,"pb28  | trMU [2090-2150] | k0.25" =    Base_coop$CBA__logk0x25_pb28_MUtrn_16_28$get_worldEMIffi_ty
  ,"pb28  | trMU [2090-2200] | k0.25" =    Base_coop$CBA__logk0x25_pb28_MUtrn_16_38$get_worldEMIffi_ty
  ,"pb18  | trMU [2090-2200] | k0.25" =    Base_coop$CBA__logk0x25_pb18_MUtrn_16_38$get_worldEMIffi_ty
  
  ,"pb23  | trMU [2075-2150] | k0.25" =    Base_coop$CBA__logk0x25_pb23_MUtrn_13_28$get_worldEMIffi_ty
  ,"pb23  | trMU [2075-2200] | k0.25" =    Base_coop$CBA__logk0x25_pb23_MUtrn_13_38$get_worldEMIffi_ty
  ,"pb28  | trMU [2045-2200] | k0.25 " =   Base_coop$CBA__logk0x25_pb28_MUtrn_7_38$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CBA COOP - Most interesting alternatives "
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


#show
plottigat <- plotLINES( EXPdata =   EXPdata
                        ,EXPtitle       =  EXPtitle
                        ,EXPylabel      =  EXPylabel
                        ,EXPlegend      =  EXPlegend
                        ,categories          = NULL
                        ,colors_per_category = 2 ); plottigat 


# wanna zoom?
plottigat + coord_cartesian(xlim=c(2100,2175), ylim = c(-15,5))



