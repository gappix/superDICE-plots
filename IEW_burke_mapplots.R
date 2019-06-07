
## BURKE COMPARISON MITIGATION COSTS  ----------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



# SETUP EACH PLOT :::::::::


### 1

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke SR"
sDCworld$attribute = "value"



plot1 <- sDCworld


### 2

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELR$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke LR"
sDCworld$attribute = "value"



plot2 <- sDCworld



### 3

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESRdiff$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke SRdiff"
sDCworld$attribute = "value"



plot3 <- sDCworld



### 4
my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELRdiff$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke LRdiff"
sDCworld$attribute = "value"



plot4 <- sDCworld



# ADD PLOTS TO LIST :::::::::


plot_this_list = list()

plot_this_list$elements$plot1  <- plot1
plot_this_list$elements$plot2  <- plot2
plot_this_list$elements$plot3  <- plot3
plot_this_list$elements$plot4  <- plot4



plot_this_list$title    <- "Abatement costs up to  2100 [%cumulated GDP] according to different Burke's functions" 
plot_this_list$palette  <- "OrRd"




# COLORS AND CATS ::::::::::::::

# extract data
dataaaa = 0
for(p in plot_this_list$elements){ dataaaa = c(dataaaa, p$data[[p$attribute]])  }

# evaluate colors

plot_this_list$class_colors <- map.normal.color(dataaaa, 
                                                pal_choice = plot_this_list$palette,
                                                reverse = FALSE)
# plot_this_list$class_colors <- diverge.color( dataaaa, 
#                                               pal_choice = plot_this_list$palette,  
#                                               reverse = TRUE, 
#                                               centeredOn = 0)
# assign
plot_this_list$colorpalette = plot_this_list$class_colors[[2]]
plot_this_list$catMethod    = plot_this_list$class_colors[[1]][["brks"]]


# PLOT IT   ::::::::::::::::::

multiple_map_plotter(plot_this_list)











































## BURKE DAMAGES COMPARED  ----------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



# SETUP EACH PLOT :::::::::


### 1

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_DAMAGES_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke SR"
sDCworld$attribute = "value"



plot1 <- sDCworld


### 2

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELR$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_DAMAGES_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke LR"
sDCworld$attribute = "value"



plot2 <- sDCworld



### 3

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESRdiff$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_DAMAGES_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke SRdiff"
sDCworld$attribute = "value"



plot3 <- sDCworld



### 4
my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELRdiff$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_DAMAGES_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "burke LRdiff"
sDCworld$attribute = "value"



plot4 <- sDCworld



# ADD PLOTS TO LIST :::::::::


plot_this_list = list()

plot_this_list$elements$plot1  <- plot1
plot_this_list$elements$plot2  <- plot2
plot_this_list$elements$plot3  <- plot3
plot_this_list$elements$plot4  <- plot4



plot_this_list$title    <- "Total damages up to  2100 [%cumulated GDP] according to different Burke's functions" 
plot_this_list$palette  <- "RdBu"




# COLORS AND CATS ::::::::::::::

# extract data
dataaaa = 0
for(p in plot_this_list$elements){ dataaaa = c(dataaaa, p$data[[p$attribute]])  }

# evaluate colors

# plot_this_list$class_colors <- map.normal.color(dataaaa, 
#                                                 pal_choice = plot_this_list$palette,
#                                                 reverse = TRUE)
plot_this_list$class_colors <- map.diverge.color( dataaaa,
                                                  pal_choice = plot_this_list$palette,
                                                  reverse = TRUE,
                                                  centeredOn = 0)
# assign
plot_this_list$colorpalette = plot_this_list$class_colors[[2]]
plot_this_list$catMethod    = plot_this_list$class_colors[[1]][["brks"]]


# PLOT IT   ::::::::::::::::::

multiple_map_plotter(plot_this_list)






