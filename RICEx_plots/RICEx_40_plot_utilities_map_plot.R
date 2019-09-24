require_package("wesanderson")

define.legend <- function(chunks = 100,...){
  x <- c(...)
  sum(...)       
}




# 
# 
# plot_sDCworld(worldColor= "red", sDCworld_E_BAU, sDCworld_Title, catMethod_E_BAU)
# #colors: red, blue, green, pink, violet, grey
# # manually resize to width=1100, height=635
# file_name = "E_MAP_2100_BAU"
# savePlotLARGE()




map.diverge.color <- function(data,
                          pal_choice="RdGy",
                          centeredOn=0, 
                          reverse = FALSE, 
                          my_style="fixed"){
  
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





map.normal.color <- function(data,
                             pal_choice = "OrRd",
                             my_ramps = 9,
                             reverse = FALSE, 
                             my_style = "jenks"){
  
  
  rc1  <-  brewer.pal(my_ramps, pal_choice)
  if (reverse){ rc1 =  rev(rc1)}
  cuts <- classIntervals( data,style = my_style, n=my_ramps)


return(list(cuts,rc1))
 
  
}



get_map_plots_layout <- function(nplots = 2){
  
  
  
  #___________________
  if(nplots==2){
    
    my_layout = layout(matrix(c(1,3,2,3),
                              nrow=2,
                              ncol=2), 
                       widths=c(4,4), 
                       heights=c(2,0.5), 
                       TRUE) 
    return(my_layout)
  } 
  #___________________  
  if(nplots==3){
    
    my_layout = layout(matrix(c(1,3,4,2,3,4),
                              nrow=3,
                              ncol=2), 
                       widths=c(4,4), 
                       heights=c(2,2,0.5), 
                       FALSE) 
    return(my_layout)
  }  
  #___________________  
  if(nplots==4){
    
    my_layout = layout(matrix(c(1,3,5,2,4,5),
                              nrow=3,
                              ncol=2), 
                       widths=c(4,4), 
                       heights=c(2,2,0.5), 
                       FALSE) 
    return(my_layout)
  }  
  #___________________  
  if(nplots==5){
    
    my_layout = layout(matrix( c(1,4,6,   1,4,6,   2,4,6,   2,5,6,   3,5,6,  3,5,6),
                              nrow=3,
                              ncol=6), 
                       widths=c(2,2,2,2,2,2), 
                       heights=c(2,2,0.5), 
                       FALSE)  
    return(my_layout)
  }  
  #___________________  
  if(nplots==6){
    
    my_layout = layout(matrix( c(1,4,7,      2,5,7,   3,6,7  ),
                               nrow=3,
                               ncol=3), 
                       widths=c(4,4,4), 
                       heights=c(2,2,0.5), 
                       FALSE)  
    return(my_layout)
  }  
  
  #___________________ 
  print("Error! Too much plots!")
}





multiple_map_plotter <- function(plot_this_list){
  
  plot.new()

  par(oma=c(0,0,3,0))

  #par(mar=c(3, 3, 3, 3))
  
  
  #layout that
  my_layout = get_map_plots_layout(length(plot_this_list$elements))

  # plot each plot
  
  for(p in plot_this_list$elements){
    
    
    mapParams  <- mapCountryData(p$data,
                                 nameColumnToPlot = p$attribute,
                                 addLegend        = FALSE,
                                 borderCol        = "#181c1f", #it's a dark grey
                                 mapTitle         = p$title,
                                 catMethod        = plot_this_list$catMethod,
                                 colourPalette    = plot_this_list$colorpalette )
  }
  
  par(oma=c(0,0,0,0))
  #add common legend
  par(mfrow = c(1,1))

  
  do.call(addMapLegend
          ,c(mapParams
             ,legendLabels="all"
             ,legendWidth=1.5
             ,legendIntervals="data"# sDCworld_attribute
             ,legendMar = 2.0))
  
  

  
  title(y=9, plot_this_list$title)

  
}










