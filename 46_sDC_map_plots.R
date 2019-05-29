# Main script to plot maps of data and scenarios
# - single world-map
# - multiple world map paired




source("30_sDC_experiments_central_storage.R")
source("45_sDC_plot_utilities_map_plot.R")


## SINGLE MAP, full page ----------------------------------------------------------------




my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA


sDCworld = list()


# SETUP :::::::::::::


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_Variable_iso3ty("DAMFRAC")%>%filter(year==2200),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )


sDCworld$title     = "enerdata30 —  damages in  2200 [%GDP]"
sDCworld$palette   = "RdBu"
sDCworld$attribute = "value"



# COLORS AND CATS :::::::::::::

sDCworld$class_colors <- diverge.color( c(  sDCworld$data[[sDCworld$attribute]], -1.7,  1   ), 
                                        pal_choice = sDCworld$palette,  
                                        reverse = TRUE, 
                                        centeredOn = 0)

sDCworld$colorpalette = sDCworld$class_colors[[2]]
sDCworld$catMethod    = sDCworld$class_colors[[1]][["brks"]]



# PLOT IT   ::::::::::::::::

mapParams  <- mapCountryData(sDCworld$data,
                             nameColumnToPlot = sDCworld$attribute,
                             addLegend        = FALSE,
                             borderCol        = "#181c1f", #it's a dark grey
                             mapTitle         = sDCworld$title,
                             catMethod        = sDCworld$catMethod,
                             colourPalette    = sDCworld$colorpalette )


do.call(addMapLegend
        ,c(mapParams
           ,legendLabels="all"
           ,legendWidth=1.5
           ,legendIntervals="data"# sDCworld$attribute
           ,legendMar = 2.5))

#__________________________________ END SINGLE PLOT __________________________________________
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

 




## MULTIPLE MAPS, AUTOSCALE ----------------------------------------------------------------
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



# SETUP EACH PLOT :::::::::


### 1

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_Variable_iso3ty("DAMFRAC")%>%filter(year==2200),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "Burke SR"
sDCworld$attribute = "value"



burkeI <- sDCworld


### 2

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELR$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_Variable_iso3ty("DAMFRAC")%>%filter(year==2200),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "Burke LR"
sDCworld$attribute = "value"



burkeII <- sDCworld



### 3

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKESRdiff$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_Variable_iso3ty("DAMFRAC")%>%filter(year==2200),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "Burke SRdiff"
sDCworld$attribute = "value"



burkeIII <- sDCworld



### 4

my_Scenario = IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKELRdiff$polCBA
sDCworld = list()


#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld$data <- joinCountryData2Map(my_Scenario$get_Variable_iso3ty("DAMFRAC")%>%filter(year==2200),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld$title  = "Burke LRdiff"
sDCworld$attribute = "value"



burkeIV <- sDCworld



# ADD PLOTS TO LIST :::::::::


plot_this_list = list()

plot_this_list$elements$burkeI   <- burkeI
plot_this_list$elements$burkeII  <- burkeII
plot_this_list$elements$burkeIII   <- burkeIII
plot_this_list$elements$burkeIV  <- burkeIV



plot_this_list$title    <- "Damages in  2200 [%GDP] according to different Burke's functions" 
plot_this_list$palette  <- "RdBu"




# COLORS AND CATS ::::::::::::::

# extract data
dataaaa = 0
for(p in plot_this_list$elements){ dataaaa = c(dataaaa, p$data[[p$attribute]])  }

# evaluate colors
plot_this_list$class_colors <- diverge.color( dataaaa, 
                                              pal_choice = plot_this_list$palette,  
                                              reverse = TRUE, 
                                              centeredOn = 0)
# assign
plot_this_list$colorpalette = plot_this_list$class_colors[[2]]
plot_this_list$catMethod    = plot_this_list$class_colors[[1]][["brks"]]


# PLOT IT   ::::::::::::::::::

multiple_map_plotter(plot_this_list)


#__________________________________ END SINGLE PLOT __________________________________________
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


