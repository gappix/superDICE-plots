source("RICEx_datamng/RICEx_21_GDXclass.R")
source("RICEx_plots/RICEx_00_colors_settings.R")
source("OTHER_datamng/HIST_emissions_data.R")

noConstraint_Original = GDXclass("../RICEx-Data/baselines/RICExdata_ssp_baseline_sigma_calibrated_ed57_t58_reference.gdx")
constraint_2100  = GDXclass("../RICEx-Main-SSPkali/baselines/baselines_results/sigma_baseline_kali_SSP2only_HCt18.gdx")
constraint_2075  = GDXclass("../RICEx-Main-SSPkali/baselines/baselines_results/sigma_baseline_kali_SSP2only_HCt13.gdx")
constraint_2060  = GDXclass("../RICEx-Main-SSPkali/baselines/baselines_results/sigma_baseline_kali_SSP2only_HCt10.gdx")
constraint_2050  = GDXclass("../RICEx-Main-SSPkali/baselines/baselines_results/sigma_baseline_kali_SSP2only_HCt8.gdx")

#-----------: PLOT :-----------------



referenceGDX = constraint_2050

#::::::::::::::: Carbon intensity  :::::::::::::::
plottigat = ggplot() + 
  
  
  # MY DATA
  
  geom_line(data = referenceGDX$get_PARAMETER_nty("sigma"), aes(year,value, color=n), size = 1.2)  +  
  
  
  # graphic details
  
  guides(colour=guide_legend(ncol=3)) +
  scale_color_manual(
    values = colorize_regions("ed57")) +
  
  
  theme( legend.text   = element_text(size = 13),
         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "regions") + 
  ggtitle("Carbon Intensity, sigma < 1 from 2050 hard constraint") + 
  xlab("Year") +
  ylab("Carbon Intensity")  ;plottigat





#::::::::::::::: Stacked emissions  :::::::::::::::
plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= referenceGDX$get_PARAMETER_nty("emi_bau"),
            aes(x=year, y=value, group=n, fill =n)) + 
  

  
  # HISTORICAL DATA
  
  geom_line(data = E_hist_PRIMAP_world_y%>%filter(year >=1990), aes(year,value, color="historical"), size = 1.2)  +  
  
  
  
  # graphic details
  
  scale_fill_manual(values = colorize_regions("ed57") ) +
  
  scale_color_manual(values = c("black", "blue", "black")) + 
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=3)) +
  
  ggtitle("Emissions Stacked ") + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat
