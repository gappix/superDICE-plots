


RICEx.plot.map <- function(myshape, mydata, mypalette, min_data, max_data, mylegend, mytitle ){


ggplot() +
  
  # data
  geom_sf(data =  merge(  myshape,
                          mydata,
                          by =c("n"))) + 
  aes(fill = value) + 
  
  # appearance
  scale_fill_gradientn(colors = mypalette
                       ,limits=c(min_data, max_data) #symmetric scale (0 in the middle)
                       ) +
  labs (fill = mylegend) + 
  ggtitle(mytitle)

}
