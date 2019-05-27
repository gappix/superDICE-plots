#  SINGLE
#    - ykali vs Y_sR
#  Block
#    - ykali vs Y_sR



####
dir_plots <- paste0(dir_data_analysis, "Plots\\") 
dir_plots = gsub("\\", "/", dir_plots, fixed=TRUE)

#"EMI_sR_Enerdata_hist_THA.jpeg"
#"EMI_Witch_sR_USA.jpeg"






####  WORLD TATM
plottigat = ggplot()+ 
  geom_line(data=TATM_ty, 
            aes(x=year, y=value, color = "TATM", group = 1),
            size=1.2)  +
  xlab("Year") +
  ylab("?C Increase") + 
  scale_color_discrete(name = "superRICE"); plottigat




##### WITCH WORLD TATM
plottigat = ggplot()+ 
  geom_line(data=TATM_WITCH_y, 
            aes(x=year, y=value, color = "TATM", group = 1),
            size=1.2)  +
  xlab("Year") +
  ylab("ºC Increase") + 
  scale_color_discrete(name = "WITCH"); plottigat





#### ykali vs Y_sR
# must be a single line (full equivalence)

regionToPlot = "chn" # <<<<< select this

dataToPlot = y_sR_nty[y_sR_nty$n==regionToPlot,]

plottigat = ggplot()+ 
  geom_line(data=dataToPlot, 
            aes(x=year, y=value,  color = "ssp2", group = 1), 
            size=1.2)  +  
  xlab("Year") +
  ylab("GDP    [trill USD]") + 
  scale_color_discrete(name = "Model"); plottigat









####  WORLD GDP Stacked Area Chart


plottigat= ggplot(data=y_sR_nty, aes(x=year, y=value, group=n, fill =n)) + 
  geom_area() + 
  scale_fill_manual(values= my_colors ) +
  xlab("Year") +
  ylab("GDP    [Trill USD]")  ; plottigat







### EMISSIONS ++   WITCH   ++ WORLD STACKED  -------------------------------------------
plottigat= ggplot() + 
  geom_area(data=E_WITCH_nty, aes(x=year, y=value, group=n, fill =n)) + 
  #ssps
  geom_line(data=E_SSP2_Baseline, aes(x=Year, y=Value, group = Model, colour = Model), size = 1.1) +
  scale_fill_manual(values= my_colors ) +
  xlab("Year") +
  ylab("Emissions    [GtCO2eq]")  ; plottigat








## PL1 ## EMISSIONS ++ superRICE ++ WORLD STACKED  --------------------------------------


scenarioToPlot = E_sR_BAU_nty.ctax_DIAG_Base   #<<<< change this


plottigat= ggplot() + 
  
  # Scenario
  geom_area(data=scenarioToPlot, aes(x=year, y=value, group=n, fill =n)) + 
  
  
  # SSP trends comparison
  geom_line(data= E_SSP2_Baseline, 
            aes(x=year, y=value, group = model, colour = model), 
            size = 1.1) +
  
  # EnerdataWorld 
  geom_line(data= E_EnerData_Blue_WORLD_BAU_nty,
            aes(x=year, y=value, group = 1, colour = "EnerData BAU"),
            size = 1.8) +
  
  
  # graphic details
  #scale_color_brewer(palette = "PRGn") +
  scale_color_manual(values = c("purple", "#000000", rainbow(6) ))+
  scale_fill_manual(values= my_colors ) +
  xlab("Year") +
  ylab("Emissions    [GtCO2eq]")  ; plottigat

# ..if you need to readjust colors..
#my_colors = sample(my_colors)

#.................. save plot?
experiment_code = "300sc1_weight5e4"

plot_code = "PL1"
plot_type = "WORLD_EMISSIONS_STACKED"
extension = "jpeg"
file_name = paste0(dir_plots,plot_code, "_", 
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________

## PL2 ## EMISSIONS superRICE vs SSP2 WORLD EXPERIMENTS COMPARISONS ----------------

plottigat= ggplot() + 
  
  # BLUE Unconstrained
  geom_line(data=E_sR_WORLD_ty, 
            aes(x=year, y=value, group=1, colour = "sR Blue Unconstrained"), 
            size = 1.2) + 
  
  # BROWN Unconstrained
  # geom_line(data=E_sR_WORLD_ty.brown,
  #           aes(x=year, y=superRICE, group=1, colour = "sR Brown Unconstrained"),
  #           size = 1.2) +
   
  # SSP trends compared
  geom_line(data=E_SSP2_Baseline, 
            aes(x=year, y=value, group = model, color = "SSP2 emissions"  ), size = 1.1) +
  
  ### BROWN COnstraint experiments
  # geom_line(data=E_sR_WORLD_ty.brown_15sPRIMAP_3hPRIMAP_300s1, 
  #           aes(x=year, y=superRICE, group=1, colour = "sR Brown HistKali s2300<0.1"), 
  #           size = 1.2) + 
  # 
  # geom_line(data=E_sR_WORLD_ty.brown_15sPRIMAP_3hPRIMAP, 
  #           aes(x=year, y=superRICE, group=1, colour = "sR Brown HistKali Unconstrained"), 
  #           size = 1.2) + 
  # 


  ### HIST constraint Experiments
  geom_line(data=E_sR_WORLD_ty.15sPRIMAP_3hPRIMAP,
          aes(x=year, y=value, group=1, colour = "Hist-Calib Unconstrained"),
          size = 1.2) +
  
  geom_line(data=E_sR_WORLD_ty.15sPRIMAP_3hPRIMAP_300s3,
            aes(x=year, y=value, group=1, colour = "Hist-Calib HARD s2300<0.3"),
            size = 1.2) +
  
  geom_line(data=E_sR_WORLD_ty.15sPRIMAP_3hPRIMAP_300s1,
            aes(x=year, y=value, group=1, colour = "Hist-Calib HARD s2300<0.1"),
            size = 1.2) +
  
  
  ### HARD Constraint Experiments
  # geom_line(data=E_sR_WORLD_ty.100s4_200s1,
  #           aes(x=year, y=value, group=1, colour = "HARD s2100<0.4; s2200<0.1"),
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.100s7_200s2,
  #           aes(x=year, y=value, group=1, colour = "HARD s2100<0.7; s2200<0.2"),
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300s1,
  #           aes(x=year, y=value, group=1, colour = "HARD s2300<0.1"),
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300s1_x,
  #           aes(x=year, y=value, group=1, colour = "HARD s2300<0.1 passing 2040"),
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300s2,
  #           aes(x=year, y=value, group=1, colour = "HARD s2300<0.2"),
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300s3,
  #           aes(x=year, y=value, group=1, colour = "HARD s2300<0.3"),
  #           size = 1.2) +
  # 
  

  ### SOFT Constraints
  # geom_line(data=E_sR_WORLD_ty.300sc1, 
  #           aes(x=year, y=value, group=1, colour = "soft s2300<0.1 "), 
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300sc1_weight05, 
  #           aes(x=year, y=value, group=1, colour = "soft s2300<0.1, weight 0.5"), 
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300sc1_weight1e2, 
  #           aes(x=year, y=value, group=1, colour = "soft s2300<0.1, weight 0.01 "), 
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300sc1_weight1e3, 
  #           aes(x=year, y=value, group=1, colour = "soft s2300<0.1, weight 0.001 "), 
  #           size = 1.2) +
  # 
  # geom_line(data=E_sR_WORLD_ty.300sc1_weight5e4, 
  #           aes(x=year, y=value, group=1, colour = "soft s2300<0.1, weight 0.0005 "), 
  #           size = 1.2) +
  

  # EnerdataWorld 
  geom_line(data= E_EnerData_Blue_WORLD_BAU_nty,
            aes(x=year, y=value, group = 1, colour = "EnerData BAU"),
            size = 1.8) +
  

  # graphic details
  
  xlab("Year") +
  ylab("Emissions    [GtCO2eq]")  ; plottigat




#........................ save plot?
experiment_code = "HARDCOnst"

plot_code = "PL2"
plot_type = "WORLD_EMISSIONS_COMPARED"
extension = "jpeg"
file_name = paste0(dir_plots,plot_code, "_", 
                   plot_type, "_", 
                                                                                                         if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________

## PL3 ## SIGMA EXPERIMENTS COMPARISON  --------------------------------------------

regionToPlot = "chn" # <<<<< select this

plottigat= ggplot()+ 
  
  ### unconstrained
  geom_line(data = sigma_sR_nty %>% filter(n==regionToPlot), 
            aes(x=year, y=value, color="Reference unconstrained", group = n), size=1.2) + 
  
  
  ### SOFT constraints
  # geom_line(data = sigma_sR_nty.300sc1 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="soft s2300<0.1", group = n), size=1.2) + 
  # 
  # geom_line(data = sigma_sR_nty.300sc1_weight05 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="soft s2300<0.1, weight 0.5", group = n), size=1.2) + 
  # 
  # geom_line(data = sigma_sR_nty.300sc1_weight1e2 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="soft s2300<0.1, weight 0.01", group = n), size=1.2) + 
  # 
  # geom_line(data = sigma_sR_nty.300sc1_weight1e3 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="soft s2300<0.1, weight 0.001", group = n), size=1.2) + 
  # 
  # geom_line(data = sigma_sR_nty.300sc1_weight5e3 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="soft s2300<0.1, weight 0.005", group = n), size=1.2) + 
  # 
  # geom_line(data = sigma_sR_nty.300sc1_weight5e4 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="soft s2300<0.1, weight 0.0005", group = n), size=1.2) + 
  # 
  
  
  # ### BROWN
  # geom_line(data = sigma_sR_nty.brown %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="Brown unconstrained", group = n), size=1.2) + 
  # 
  # ### BROWN
  # geom_line(data = sigma_sR_nty.brown_15sPRIMAP %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="Brown s2015(PRIMAP) unconstrained", group = n), size=1.2) + 
  


  ### historical/future data variations
  # geom_line(data = sigma_sR_OECD_nty %>% filter(n==regionToPlot),
  #           aes(x=year, y=value, color="OECD all hist", group = n),  size=1.2) +
  # 
  # geom_line(data = sigma_sR_OECDv1_nty %>% filter(n==regionToPlot),
  #           aes(x=year, y=value, color="OECD v1", group = n),  size=1.2) +
  # 
  # geom_line(data = sigma_sR_OECDv5_nty %>% filter(n==regionToPlot),
  #           aes(x=year, y=value, color="OECD v5", group = n),  size=1.2) +
  # 
  # geom_line(data = sigma_sR_v6_nty %>% filter(n==regionToPlot),
  #           aes(x=year, y=value, color="unc v6", group = n),  size=1.2) +
  # 
  # geom_line(data = sigma_sR_v1_nty %>% filter(n==regionToPlot),
  #           aes(x=year, y=value, color="unc v1", group = n),  size=1.2) +


  ### HIST constraint Experiments
  geom_line(data=sigma_sR_nty.15sPRIMAP_3hPRIMAP %>% filter(n==regionToPlot),
          aes(x=year, y=value, group=1, colour = "Hist-Calib Unconstrained"),
          size = 1.2) +
  
  geom_line(data=sigma_sR_nty.15sPRIMAP_3hPRIMAP_300s3 %>% filter(n==regionToPlot),
            aes(x=year, y=value, group=1, colour = "Hist-Calib HARD s2300<0.3"),
            size = 1.2) +
  
  geom_line(data=sigma_sR_nty.15sPRIMAP_3hPRIMAP_300s1 %>% filter(n==regionToPlot),
            aes(x=year, y=value, group=1, colour = "Hist-Calib HARD s2300<0.1"),
            size = 1.2) +


  ### HARD constraints
  # geom_line(data = sigma_sR_nty.300s3 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="s2300 <0.3", group = n),  size=1.2) + 
  # 
  # geom_line(data = sigma_sR_nty.300s2 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="s2300 <0.2", group = n),  size=1.2) + 
  # 
  # geom_line(data = sigma_sR_nty.300s1 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="s2100 <0.1", group = n),  size=1.2) + 
  # 
  # geom_line(data=sigma_sR_nty.300s1_x %>% filter(n==regionToPlot),
  #           aes(x=year,  color="s2100 <0.1 passing 2040", y=value, group = n),
  #           size=1.2)   +
  # 
  # geom_line(data=sigma_sR_nty.100s7_200s2 %>% filter(n==regionToPlot),
  #           aes(x=year,  color="s2100<0.7; s2200< 0.2", y=value, group = n),
  #           size=1.2)   +
  # 
  # geom_line(data=sigma_sR_nty.100s4_200s1 %>% filter(n==regionToPlot),
  #           aes(x=year,  color="s2100<0.4; s2200<0.1", y=value, group = n),
  #           size=1.2)   +

  #### constraint points
  # geom_point(data = get_sigma_constraints("300s1"), 
  #            aes(x=year, y=value, color = "constraints")) +
  # 
  # geom_point(data = get_sigma_constraints("100s7_200s2"), 
  #            aes(x=year, y=value, color = "constraints")) +
  # 
  # geom_point(data = get_sigma_constraints("100s7_200s2"), 
  #            aes(x=year, y=value, color = "constraints")) +
  



  ### reference points
  # geom_point(data = sigma_2015_ny.Regr_OECD_BLUE %>% filter(n==regionToPlot), 
  #            aes(x=year, y= value, color = "sigma2015 by regression"),
  #            size = 2) +
  # 
  
  geom_line(data = sigma_hist_ny.PRIMAP %>% filter(n==regionToPlot),
            aes(x=year, y= value, color = "sigma Hist PRIMAP"),
            size = 1.2) +
  
  # geom_line(data = sigma_hist_ny.OECD %>% filter(n==regionToPlot), 
  #            aes(x=year, y= value, color = "sigma Hist OECD"), 
  #            size = 1.2) +
  
  geom_line(data = sigma_fut_ny.BLUE %>% filter(n==regionToPlot), 
             aes(x=year, y= value, color = "sigma EData Blue"),
             size = 1.2) +
  

  # graphic details
  labs(title = paste0(regionToPlot,": ", "sigma comparison") )+
  xlab("Year") +
  ylab("Carbon Intensity [GtCO2eq/Trill USD]"); plottigat


regionToPlot = "rus"

#........................ save plot?
experiment_code = "SOFTconstr"

plot_code = "PL3"
plot_type = "SIGMA_COMPARISON"
country = regionToPlot
extension = "jpeg"
file_name = paste0(dir_plots,plot_code, "_", 
                   country, "_",
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)











#__________________________________________________________

## PL4 ## EMISSIONS ++ superRICE vs EnerData ++ SINGLE-n COMPARISON ----------------



regionToPlot = "chn"   # <<<<< select this

plottigat= ggplot()+ 
  
  
  geom_line(data = E_sR_BAU_nty.ctax_DIAG_Base %>% filter(n==regionToPlot), 
            aes(x=year, y=value, color="Blue unconstrained", group = n),  size=1.2) + 
  
  ## BROWN SCENARIOS
  
  # geom_line(data = E_sR_BAU_nty.brown_15sPRIMAP %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color = "sR brown s2015(PRIMAP) unconstrained", group = 1),
  #           size=1.2)  +
  # 
  # 
  # geom_line(data = E_sR_BAU_nty.brown_15sPRIMAP_3hPRIMAP %>% filter(n==regionToPlot),
  #           aes(x=year, y=value, color = "sR brown s2015(PRIMAP) + Hist Calib + unconstrained", group = 1),
  #           size=1.2)  + # is equal to s2300<0.1
  # 
  # geom_line(data = E_sR_BAU_nty.brown_15sPRIMAP_3hPRIMAP_300s1 %>% filter(n==regionToPlot),
  #           aes(x=year, y=value, color = "sR Brown s2015(PRIMAP) + Hist Calib + s2300<0.1", group = 1),
  #           size=1.2)  +
  #  


  ### HIST constraint Experiments
  geom_line(data=E_sR_BAU_nty.15sPRIMAP_3hPRIMAP %>% filter(n==regionToPlot),
          aes(x=year, y=value, group=1, colour = "Hist-Calib Unconstrained"),
          size = 1.2) +
  
  geom_line(data=E_sR_BAU_nty.15sPRIMAP_3hPRIMAP_300s3 %>% filter(n==regionToPlot),
            aes(x=year, y=value, group=1, colour = "Hist-Calib HARD s2300<0.3"),
            size = 1.2) +
  
  geom_line(data=E_sR_BAU_nty.15sPRIMAP_3hPRIMAP_300s1 %>% filter(n==regionToPlot),
            aes(x=year, y=value, group=1, colour = "Hist-Calib HARD s2300<0.1"),
            size = 1.2) +


  ### Blue constraints
  # geom_line(data = E_sR_BAU_nty.300s3 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="s2300 <0.3", group = n),  size=1.2) + 
  # 
  # geom_line(data = E_sR_BAU_nty.300s2 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="s2300 <0.2", group = n),  size=1.2) + 
  # 
  # geom_line(data = E_sR_BAU_nty.300s1 %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value, color="s2100 <0.1", group = n),  size=1.2) + 
  # 
  # geom_line(data=E_sR_BAU_nty.300s1_x %>% filter(n==regionToPlot),
  #           aes(x=year,  color="s2100 <0.1 passing 2040", y=value, group = n),
  #           size=1.2)   +
  # 
  # geom_line(data=E_sR_BAU_nty.100s7_200s2 %>% filter(n==regionToPlot),
  #           aes(x=year,  color="s2100<0.7; s2200< 0.2", y=value, group = n),
  #           size=1.2)   +
  # 
  # geom_line(data=E_sR_BAU_nty.100s4_200s1 %>% filter(n==regionToPlot),
  #           aes(x=year,  color="s2100<0.4; s2200<0.1", y=value, group = n),
  #           size=1.2)   +
  
  



  ### SOFT CONSTRAINTS
# 
#   geom_line(data = E_sR_BAU_nty.300sc1 %>% filter(n==regionToPlot), 
#             aes(x=year, y=value, color="soft s2300<0.1", group = n), size=1.2) + 
#   
#   geom_line(data = E_sR_BAU_nty.300sc1_weight05 %>% filter(n==regionToPlot), 
#             aes(x=year, y=value, color="soft s2300<0.1, weight 0.5", group = n), size=1.2) + 
#   
#   geom_line(data = E_sR_BAU_nty.300sc1_weight1e2 %>% filter(n==regionToPlot), 
#             aes(x=year, y=value, color="soft s2300<0.1, weight 0.01", group = n), size=1.2) + 
#   
#   geom_line(data = E_sR_BAU_nty.300sc1_weight1e3 %>% filter(n==regionToPlot), 
#             aes(x=year, y=value, color="soft s2300<0.1, weight 0.001", group = n), size=1.2) + 
#   
#   geom_line(data = E_sR_BAU_nty.300sc1_weight5e3 %>% filter(n==regionToPlot), 
#             aes(x=year, y=value, color="soft s2300<0.1, weight 0.005", group = n), size=1.2) + 
#   
#   geom_line(data = E_sR_BAU_nty.300sc1_weight5e4 %>% filter(n==regionToPlot), 
#             aes(x=year, y=value, color="soft s2300<0.1, weight 0.0005", group = n), size=1.2) + 
#   
  
  

  
  ## REFERENCE POINTS
  
  # HISTORICAL measured emissions
  # geom_line(data= E_hist_OECD_ny %>% filter(n==regionToPlot), 
  #           aes(x=year, y=value,     color = "OECD Historical Emissions", group=1), 
  #           size=1.2)   +
  
  geom_line(data= E_hist_PRIMAP_ny %>% filter(n==regionToPlot),
            aes(x=year, y=value,     color = "PRIMAP Historical Emissions", group=1),
            size=1.2)   +
  
  # ENERDATA projected emissions
  geom_line(data=E_EnerData_Blue_BAU_nty %>% filter(n==regionToPlot),
            aes(x=year, y=value,  color = "EnerData Blue projections", group = 1),
            size=1.2)  +
  
  # geom_line(data=E_EnerData_Brown_BAU_nty %>% filter(n==regionToPlot),
  #           aes(x=year, y=value,  color = "EnerData Brown projections", group = 1),
  #           size=1.2)  +
  
  # WITCH
  # geom_line(data = E_WITCH_nty %>% filter(n=="usa"),
  #           aes(x=year, y= value, color = "WITCH"),
  #           size = 1.2) +
  
  ## Graphic details
  labs(title = paste0(regionToPlot,": ", "emissions comparison") )+
  xlab("Year")         +
  ylab("Emissions    [GtCO2eq]")   + 
  scale_color_discrete(name = "Legend");plottigat


regionToPlot = "chn"

#........................ save plot?
experiment_code = "SOFTCOnst"

plot_code = "PL4"
plot_type = "EMISSION_COMPARISON"
country = regionToPlot
extension = "jpeg"
file_name = paste0(dir_plots,plot_code, "_", 
                   country, "_",
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)







#### SIGMA ++ superRICE ++ ALL COUNTRIES --------------------------------------

dataToPlot = sigma_sR_nty.brown_15sPRIMAP_3hPRIMAP

plottigat= ggplot()+ 
  
  geom_line(data=dataToPlot, 
            aes(x=year, y=value, color=n, group = n),
            size=1.2)   +
  
  scale_color_manual(values= my_colors ) +
  geom_point(data = get_sigma_constraints("300s1"), aes(x=year, y=value, color = "constraints")) +
  xlab("Year") +
  ylab("Carbon Intensity [GtCO2eq/Trill USD]"); plottigat




#### SIGMA SINGLE COUNTRY detailed   ------------------------------------------

regionToPlot = "ukr" # <<<<< select this

plottigat= ggplot()+ 
  

  ## Experiment
  geom_line(data = sigma_sR_nty.brown_15sPRIMAP %>% filter(n==regionToPlot), 
            aes(x=year, y=value, color="Brown s2015-PRIMAP unconstrained", group = n), 
            size=1.2) + 
 
  geom_line(data = sigma_sR_nty.brown_15sPRIMAP_3hPRIMAP %>% filter(n==regionToPlot), 
            aes(x=year, y=value, color="Brown s2015-PRIMAP Hist-Cali Unconst", group = n), 
            size=1.2) + 
  
  ## reference points
  geom_point(data = sigma_2015_ny.PRIMAP %>% filter(n==regionToPlot), 
             aes(x=year, y= value, color = "sigma2015 as PRIMAP") ) +
  
  geom_point(data = sigma_2015_ny.Regr_OECD_BLUE %>% filter(n==regionToPlot), 
            aes(x=year, y= value, color = "sigma2015 as regression OECD-Blue") ) +
  
  geom_line(data = sigma_hist_ny.PRIMAP %>% filter(n==regionToPlot), 
            aes(x=year, y= value, color = "sigmaHist as PRIMAP"),
            size=1.2) +
  
  geom_line(data = sigma_hist_ny.OECD %>% filter(n==regionToPlot), 
            aes(x=year, y= value, color = "sigmaHist as OECD") ,
            size=1.2) +
  
  geom_line(data = sigma_fut_ny.BROWN %>% filter(n==regionToPlot), 
            aes(x=year, y= value, color = "sigmaEData Brown"),
            size=1.2) +
  
  geom_line(data = sigma_fut_ny.BLUE %>% filter(n==regionToPlot), 
            aes(x=year, y= value, color = "sigmaEData Blue"), 
            size=1.2) +
  
  ## Graphics
  xlab("Year") +
  ylab("Carbon Intensity [GtCO2eq/Trill USD]"); plottigat








#### EMISSIONS ++ WITCH  vs superRICE ++ SINGLE n COMPARISON ------------------

E_WITCH_nty %>% select(n) %>% distinct() #if you don't remember WITCH regions


regionToPlot = "nde"  


dataToPlot = merge(E_WITCH_nty[E_WITCH_nty$n== "india",], 
                   
                   E_sR_ED_hist%>% filter(n==regionToPlot),  
                   by=c("year"),
                   all.y = TRUE, 
                   all.x=TRUE)  %>%
  rename(WITCH = value) %>% 
  make_year_integer()


plottigat = ggplot()+ 
  geom_line(data=dataToPlot, 
            aes(x=year,   y=superRICE, color = "superRICE unconstrained", group = 1),
            size=1.2)  +
  geom_line(data=dataToPlot, 
            aes(x=year,   y=WITCH,     color = "WITCH", group = 1), 
            size=1.2)  +  
  geom_line(data=dataToPlot, 
            aes(x=year,   y=EnerData,  color = "EnerData", group = 1), 
            size=1.2)  +  
  geom_point(data=dataToPlot, 
             aes(x=year,  y=Hist,      color = "2010 Measured Emissions", group=1),
             size=1.2)  +  
  #with onstraints
  geom_line(data=E_sR_BAU_nty.100s4_200s1 %>% filter(n==regionToPlot), 
            aes(x=year,  color="s2100 <0.4; s2200 < 0.1", y=value, group = n),size=1.2)   +

  geom_line(data=E_sR_BAU_nty.300s1 %>% filter(n==regionToPlot), 
            aes(x=year,  color="s2300 < 0.1", y=value, group = n),size=1.2)   +
  
  geom_line(data=E_sR_BAU_nty.300s1_x %>% filter(n==regionToPlot), 
            aes(x=year,  color="s2300 < 0.1 and passage", y=value, group = n),size=1.2)   +
  
  xlab("Year") +
  ylab("Emissions    [GtCO2eq]") + 
  scale_color_discrete(name = "Model"); plottigat












##### WORLD  Emissions --------

dataToPlot = merge(merge(merge(
  
  E_sR_WORLD_ty, 
  E_WITCH_WORLD_ty,  
  by=c("year"),
  all.y = TRUE, 
  all.x=TRUE    ), 
                   
       E_EnerData_WORLD_ty,  
       by=c("year"),
       all.y = TRUE, 
       all.x=TRUE ),
              
            E_hist_WORLD_y,  
            by=c("year"),
            all.y = TRUE, 
            all.x=TRUE)     

dataToPlot$year = as.integer(dataToPlot$year ) 

plottigat = ggplot()+ 
  geom_line(data=dataToPlot, 
            aes(x=year,   y=superRICE, color = "superRICE", group = 1),
            size=1.2)  +
  geom_line(data=dataToPlot, 
            aes(x=year,   y=WITCH,     color = "WITCH", group = 1), 
            size=1.2)  +  
  geom_point(data=dataToPlot, 
             aes(x=year,  y=History,      color = "2010 Emissions", group=1),
             size=1.2) +
  geom_line(data=dataToPlot, 
            aes(x=year,   y=EnerData,  color = "EnerData", group = 1), 
            size=1.2)  +  
  xlab("Year") +
  ylab("World Emissions    [GtCO2eq]") + 
  scale_color_discrete(name = "Model"); plottigat




##### WORLD  GDP  WITCH vs superRICE 

dataToPlot = merge(
  y_WORLD_sR_y, 
  y_WORLD_WITCH_y,  
  by=c("year"),
  all.y = TRUE, 
  all.x=TRUE    )

dataToPlot$year = as.integer(dataToPlot$year ) 

plottigat = ggplot()+ 
  geom_line(data=dataToPlot, 
            aes(x=year,   y=superRICE, color = "superRICE", group = 1),
            size=1.2)  +
  geom_line(data=dataToPlot, 
            aes(x=year,   y=WITCH,     color = "WITCH", group = 1), 
            size=1.2) +
  xlab("Year") +
  ylab("World GDP [Trill USD]
       ") + 
  scale_color_discrete(name = "Model"); plottigat

