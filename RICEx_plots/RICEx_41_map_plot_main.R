#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 
#  
#  
# 
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



## -----------------   Source files   ---------------------------------

source("RICEx_plots/RICEx_40_map_plot_utilities.R")
# library(gridExtra)
library(ggpubr)




## ____ FUNCTION ____
# to evaluate multiple MAPS sharing the same dimensions and legend
# on the same chart
RICEx.plot.multimap <- function( EXPdata 
                                ,legend 
                                ,title
                                ,palette  = NULL 
                                ,shape    = NULL 
                                ,min_data = NULL 
                                ,max_data = NULL 
                                ,legend_symmetric = TRUE
                                ,legend_centre    = 0
                            ){



  
  # Retrieve general informations
  myTitle   =  title
  myLegend  =  legend
  
  myShape   =  shape  
  
  myPalette =  palette 
  # Default palette adopted
  if(is.null(myPalette)) myPalette = rev(RColorBrewer::brewer.pal(9, "RdBu")) 
  
  # General informations
  mydf  <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  min_measure = min(mydf$value)
  max_measure = max(mydf$value)

  if(is.null(min_data)){ 
    if(legend_symmetric){ min_data = min(c(min_measure, legend_centre-max_measure))
    }else{  min_data = min_measure   }
  }
  if(is.null(max_data)){ 
      if(legend_symmetric){ max_data = max(c(max_measure+legend_centre, -min_measure))
    }else{ max_data = max_measure  }   
  }  

  if(!legend_symmetric){ legend_centre = (abs(max_measure)-abs(min_measure))/2 }
  # Check df correctness
  #if("year" %in% colnames(mydf)) if(nrow(mydf %>% dplyr::select("year") %>% distinct() ) > 1) stop("More than one year found! No temporal dimension in maps!")
   
  
  # Get number of plots 
  nplots     = length(EXPdata)
  map_layout = get_map_plots_layout(nplots)

  
  plotlist    = list()
  plotlegend  = NULL
  
  
  # Alternative approach (much slower! )
  # plotlist <- lapply(names(EXPdata), RICEx.plot.map 
  #                    ,data     = mydf
  #                    ,shape    = myShape
  #                    ,legend   = myLegend 
  #                    ,palette  = myPalette                     
  #                    ,min_data = min_data
  #                    ,max_data = max_data)
  # 
  # plottigat = do.call("grid.arrange", c(plotlist, ncol=floor(sqrt(nplots))))

  
  for(p in c(1:length(EXPdata))){
  
    
    message( paste0("preparing plot < ",names(EXPdata)[p]," > ...") )
  

    # stupid guessing for most used shape mappings
    if(is.null(myShape)){ 
      regions = nrow(EXPdata[[p]]%>%select(n)%>%distinct())
      if (regions > 50)         myShape = ed57shp  
      else if(regions >30)    myShape = ed35shp 
           else   if(regions > 16)  myShape = wt17shp 
                  else    if(regions > 4)   myShape = r5shp   
                          else  if(regions < 2)   myShape = global1shp 
                                else stop(paste0("please specify shape mapping for ", names(EXPdata)[p], " regions!")) 
    }
    # Plottigat ...........................
    plottigat = RICEx.plot.map( data     = EXPdata[[p]]
                               ,title    = names(EXPdata)[p]
                               ,shape    = myShape
                               ,legend   = myLegend 
                               ,palette  = myPalette                     
                               ,min_data = min_data
                               ,max_data = max_data
                               ,centre_data = legend_centre )
      
    # if(p == 1){plotlegend <- get_plotlegend(plottigat)} 
    plotlist[[p]] <- local(print(plottigat  + theme(legend.position="none")))
    myShape = NULL 
  }
  
  message( paste0("putting all together (maps are an hard job, it may take some MINUTES!)") )
  nRow = ceiling(nplots/2)
  nCol = ceiling(nplots/nRow)

  annotate_figure(do.call("ggarrange", c(plotlist, ncol=nCol, nrow=nRow,  common.legend = TRUE, legend="right")) 
                  ,top =  text_grob(myTitle, face = "bold", size = 16)
  )
  
                            

}
