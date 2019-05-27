


my_Scenario = IEWexp$kaliBASALT$enerdata30$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA

#get_CUML_DAMAGES_iso3(end_year = 2100)%>%mutate(logval = log(abs(value)+1) * value/abs(value))
sDCworld_data <- joinCountryData2Map(my_Scenario$get_Variable_iso3ty("DAMFRAC")%>%filter(year==2200),
                                     joinCode       = "ISO3", 
                                     nameJoinColumn = "iso3"  )

sDCworld_title = "enerdata30 —  damages in  2200 [%GDP]"
sDCworld_palette = "RdBu"
sDCworld_attribute = "value"


#setup everything automatically ::::::::::::::::::::::::::::::::::::::::::

class_colors <- diverge.color(c( sDCworld_data[[sDCworld_attribute]], -1.7,1.0), 
                              pal_choice = sDCworld_palette, 
                              reverse = TRUE, 
                              centeredOn = 0)
sDCworld_colorpalette = class_colors[[2]]
sDCworld_catMethod= class_colors[[1]][["brks"]]

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#plot map

frame()
par(mar=c(0, 0, 3, 0))

mapParams  <- mapCountryData(sDCworld_data,
                            nameColumnToPlot = sDCworld_attribute,
                            addLegend        = FALSE,
                            borderCol        = "#181c1f", #it's a dark grey
                            mapTitle         = sDCworld_title,
                            catMethod        = sDCworld_catMethod,
                            colourPalette    = sDCworld_colorpalette )



do.call(addMapLegend
        ,c(mapParams
           ,legendLabels="all"
           ,legendWidth=1.5
           ,legendIntervals="data"# sDCworld_attribute
           ,legendMar = 3.6))








# 
# 
# plot_sDCworld(worldColor= "red", sDCworld_E_BAU, sDCworld_Title, catMethod_E_BAU)
# #colors: red, blue, green, pink, violet, grey
# # manually resize to width=1100, height=635
# file_name = "E_MAP_2100_BAU"
# savePlotLARGE()




diverge.color <- function(data,pal_choice="RdGy",centeredOn=0, reverse = FALSE, my_style="fixed"){
  nHalf=50
  Min <- min(data,na.rm=TRUE)
  Max <- max(data,na.rm=TRUE)
  Thresh <- centeredOn
  
  pal<-brewer.pal(n=11,pal_choice)
  if (reverse){ pal =  rev(pal)}
  rc1<-colorRampPalette(colors=c(pal[1],pal[2]),space="Lab")(10)
  for(i in 2:10){
    tmp<-colorRampPalette(colors=c(pal[i],pal[i+1]),space="Lab")(10)
    rc1<-c(rc1,tmp)
  }
  rb1 <- seq(Min, Thresh, length.out=nHalf+1)
  rb2 <- seq(Thresh, Max, length.out=nHalf+1)[-1]
  rampbreaks <- c(rb1, rb2)
  cuts <- classIntervals(data, style=my_style,fixedBreaks=rampbreaks)
  return(list(cuts,rc1))
}
