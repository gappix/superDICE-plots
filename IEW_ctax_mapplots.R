## CTAX-ABATECOSTS MULTIMAP COMPARISON ----------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



# SETUP EACH PLOT :::::::::


### 1

my_Scenario = IEWexp$kaliBASALT$enerdata30$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "enerdata30"
sDCworld$attribute = "value"



plot1 <- sDCworld


### 2

my_Scenario = IEWexp$kaliBASALT$witch17$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "witch17"
sDCworld$attribute = "value"



plot2 <- sDCworld



### 3

my_Scenario = IEWexp$kaliBASALT$r5$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "r5"
sDCworld$attribute = "value"



plot3 <- sDCworld



### 4
my_Scenario = IEWexp$kaliBASALT$global$ssp2$noncoop$clWITCHco2$damOFF$polCTAX_DIAG_C30_const
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_CUML_ABATECOST_perc_iso3(end_year = 2100),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "global"
sDCworld$attribute = "value"



plot4 <- sDCworld



# ADD PLOTS TO LIST :::::::::


plot_this_list = list()

plot_this_list$elements$plot1  <- plot1
plot_this_list$elements$plot2  <- plot2
plot_this_list$elements$plot3  <- plot3
plot_this_list$elements$plot4  <- plot4



plot_this_list$title    <- "Abatement costs up to  2100 [%cumulated GDP] according to different regional detail" 
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


#__________________________________ END MULTIPLE PLOT __________________________________________
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::