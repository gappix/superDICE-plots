plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= sunRC_r5_kaliBASALT_expIEW__ssp2_noncoop_clWITCHco2_damOFF__polBAU$get_Emissions_nty,
            aes(x=year, y=value, group=n, fill =n)) + 
  
  
  
  
  # graphic details
  scale_fill_manual(values= my_colors ) +
  scale_color_manual(values = "black" ) +
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=)) +
  
  labs(fill='r5 Regions')+
  ggtitle("Emissions Stacked in BAU noncoop - ssp2 - r5 regionalization") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2/year]")  ; plottigat


# ...if you need to readjust colors.....
my_colors = sample(my_colors)


