
source("RICEx_plots/RICEx_00_colors_settings.R")
require_package("ggplot2")


RICEx.plot.lineplot  <- function( EXPdata, 
                                  title,
                                  legend,
                                  yLabel,
                                  xLabel = "Year",
                                  categories = NULL, 
                                  colors_per_category=NULL ){
  
  
  # Retrieve informations
  mytitle  =  title
  myYlabel =  yLabel
  myXlabel =  xLabel
  myLegend =  legend

  # number of columns needed to show all legends
  legendColumns = ifelse(length(EXPdata) < 13, 1, 2) 
  
  
  # Create dataframe
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  # Create legend names and colors associated
  if(is.null(categories)){ncolors = length(EXPdata)}else{ncolors=NULL}
  
  # my_legend_elements_with_colors = c("grey","black","black",  
  #                                    i_want_pollos_colors( howmany_colors      = ncolors,
  #                                                          howmany_categories  = categories,
  #                                                          colors_per_category = colors_per_category ))
  # 
  # names(my_legend_elements_with_colors) = c("ADVANCE","MEDIAN","Historical",names(EXPdata))
  # 
  
  my_legend_elements_with_colors = c("black","black","#505050", "#383838",
                                   i_want_pollos_colors( howmany_colors      = ncolors,
                                                         howmany_categories  = categories,
                                                         colors_per_category = colors_per_category ))

  names(my_legend_elements_with_colors) = c("BAU","BAU nodmg","BAU dmg","Historical", names(EXPdata)[!names(EXPdata) %in% c("BAU","BAU nodmg","BAU dmg","Historical")])
  
  
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
    xlab(myXlabel) +
    ylab(myYlabel)  ; 
  
  return(plottigat)
}



# RICEx.plot.lineplot <- function(EXPdata, EXPtitle, EXPylabel, EXPlegend){

# mytitle  =  EXPtitle
# myYlabel =  EXPylabel
# myLegend =  EXPlegend

# mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))

# plottigat = ggplot(mydf, aes(year,value, color=cat)) + geom_line(size = 1.2)+
  
#   # graphic details
#   guides(colour=guide_legend(ncol=1)) +
#   scale_color_manual(breaks=names(EXPdata),
#                      values = c("black", pollo_20
#                      )) +
  
  
#   theme( legend.text   = element_text(size = 13),
#          legend.title  = element_text(size = 16),
#          plot.title    = element_text(size = 18),
#          axis.title.x  = element_text(size = 16),
#          axis.text.x   = element_text(size = 14),
#          axis.title.y  = element_text(size = 16)  ) +
  
#   labs (color = myLegend) + 
#   ggtitle(mytitle) + 
#   xlab("Year") +
#   ylab(myYlabel)  ; 

# return(plottigat)
# }





RICEx.plot.lineplot_compare <- function(EXPdata, EXPtitle, EXPylabel, EXPlegend, 
COMPAREdata){

# Prepare data

mytitle  =  EXPtitle
myYlabel =  EXPylabel
myLegend =  EXPlegend

CMPdf    = as.data.frame(COMPAREdata$df)
CMPx     = as.character(COMPAREdata$x)
CMPy     = as.character(COMPAREdata$y)
CMPgroup = as.character(COMPAREdata$group)
CMPcolor = as.character(COMPAREdata$color)

mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))

## Plot

plottigat = ggplot() + 

geom_line(data = CMPdf, aes(x = paste0(CMPx), y = paste0(CMPy), group = paste0(CMPgroup), color = CMPcolor), size = 1) + 

geom_line(data = mydf, aes(year,value, color=cat), size = 1.2) +
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=names(EXPdata),
                     values = c("black", wes_palette(name = "Darjeeling1"), wes_palette(name = "GrandBudapest2"),
                       
                       
                       
                       
                       "#f77f2f", #orange
                       "#db0f20", 
                       "red",      # red
                       
                       "#d64cf5", # pink
                       
                       "#8232c7", #violet
                       "#450094",
                       
                       "blue",   #blue
                       "#0f86db",
                       "#0ccfab",
                       
                       "green",  #greens
                       
                       "#32c738",  
                       "#046918",
                       
                       
                       
                       "#c4570e",  # brown
                       "#fff100",  #yellow
                       "#9c4317"
                     )) +
  
  
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


