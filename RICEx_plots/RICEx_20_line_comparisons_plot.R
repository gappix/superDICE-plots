
source("RICEx_plots/RICEx_00_colors_settings.R")
require_package("ggplot2")



RICEx.plot.lineplot <- function(EXPdata, EXPtitle, EXPylabel, EXPlegend){

mytitle  =  EXPtitle
myYlabel =  EXPylabel
myLegend =  EXPlegend

mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))

plottigat = ggplot(mydf, aes(year,value, color=cat)) + geom_line(size = 1.2)+
  
  # graphic details
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks=names(EXPdata),
                     values = c("black", pollo_20
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


