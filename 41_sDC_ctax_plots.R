# DIRECTORIES

# plot main directory
dir_plots            <-     gsub("\\", "/", paste0(dir_data_analysis, "Plots\\"),  fixed=TRUE)
# experiment plot sub-directory
dir_experiment_plots <-     gsub("\\", "/", paste0(dir_plots, "ctax\\linCComb_ct2200\\") , fixed=TRUE)


  
  
## PL1 --  EMISSIONS superDICE ++ WORLD STACKED  #######


plot1title = "Emissions: superDICE-Stacked (with convex combinated MACC) and ADVANCE World Models with DIAG_C30_g5 carbon tax"


scenarioToPlot = sDCx_DIAG_80_gr5_p550g05_ltpb2150_90mu105progr$get_Emissions_nty   #<<<< change this
advanceToCompare = ADV_CO2_WORLD.DIAG_C80_gr5  #<<<< change this


plottigat= ggplot() + 
  
  # Scenario
  geom_area(data=scenarioToPlot, aes(x=year, y=value, group=n, fill =n)) + 


  # ADVANCE trends
  geom_line(data= advanceToCompare,
            aes(x=year, y=value, group = model, color = model),
            size = 1.2) +
  
  # graphic details
  #scale_color_brewer(palette = "PRGn") +
  scale_color_manual(values = c("purple", "#000000", rainbow(24) )) +
  scale_fill_manual(values= my_colors ) +

  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=4)) +
 # ggtitle(plot1title) + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat


# ...if you need to readjust colors.....
#my_colors = sample(my_colors)



#.................. save plot?
experiment_code = "linCComb_ct2200_DIAG_C80_const"

plot_code = "PL1"
plot_type = "EMISSIONS_STACKED"
extension = "jpeg"
file_name = paste0(dir_experiment_plots,plot_code, "_", 
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________





## PL2 -- EMISSIONS WORLD superDICE vs ADVANCE Models   ##### 


plot2title = "World Emissions: superDICE and ADVANCE Models with no carbon tax"

plottigat= ggplot() + 
  

  # ADVANCE trends
  geom_line(data= ADV_CO2_WORLD.DIAG_C80_gr5,
            aes(x=year, y=value, group = model, color = model),
            size = 1.1) +
  
  geom_line(data= sDCx_Amber_DIAG_80_gr5_powerfit$get_WORLDEmissions_ty, 
            aes(x=year, y=value, group=1, color = "3 ctax_DIAG_C80_gr5  OFF"), 
            size = 1.5) + 
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__ctax_DIAG_C80_gr5_LINT$get_WORLDEmissions_ty, 
            aes(x=year, y=value, group=1, color = "2 ctax_DIAG_C80_gr5  LINT"), 
            size = 1.5) + 
  
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__ctax_DIAG_C80_gr5_LIN$get_WORLDEmissions_ty, 
            aes(x=year, y=value, group=1, color = "1 ctax_DIAG_C80_gr5  LIN"), 
            size = 1.5) + 
  

  
  # graphic details
  guides(colour=guide_legend(ncol=2)) +
  scale_color_manual(values = c( "brown", "#000000", "blue", gino_rain )) +




  #ggtitle(plot2title) + 
  xlab("Year") +
  ylab("Emissions FFI  [GtCO2eq]")  ; plottigat

# color by gino rain
# gino_rain = sample(rainbow(21))
  

#........................ save plot?
experiment_code = "DIAG_c80_const_ct2100_2200"

plot_code = "PL2"
plot_type = "WORLD_EMISSIONS_COMPARED"
extension = "jpeg"
file_name = paste0(dir_experiment_plots,plot_code, "_", 
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________







## PL 3 -- MIU superDICE compared by region ######

plot3title = "MIU superDICE: USA"
regionToCompare = "usa"


plottigat= ggplot() + 
  
  
  # superDICE
  geom_line(data= MIU_sDC_nty.ctax_DIAG_C30_gr5 %>% filter(n  == regionToCompare),
            aes(x=year, y=value, group = 1, color = "EData only"),
            size = 1.1) +
  
  # geom_line(data= MIU_sDC_nty.ctax_DIAG_C80_gr5%>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "DIAG_C80_gr5"),
  #           size = 1.1) +
  # 
  # geom_line(data= MIU_sDC_nty.ctax_DIAG_C30_const%>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "DIAG_C30_const"),
  #           size = 1.1) +
  # 
  # geom_line(data= MIU_sDC_nty.ctax_DIAG_C80_const%>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "DIAG_C80_const"),
  #           size = 1.1) +
  
  # superDICE
  geom_line(data= MIU_sDC_linCComb_nty.ctax_DIAG_C30_gr5 %>% filter(n  == regionToCompare),
            aes(x=year, y=value, group = 1, color = "Back Linear CComb"),
            size = 1.1) +
  
  # graphic details

  #ggtitle(plot3title) + 
  xlab("Year") +
  ylab("MIU [%]")  ; plottigat




#........................ save plot?
experiment_code = "USA"

plot_code = "PL3"
plot_type = "MIU_ctax_comparison"
extension = "jpeg"
file_name = paste0(dir_experiment_plots,plot_code, "_", 
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________








## PL 4 -- MIU superDICE OVERVIEW #######

plot4title = "MIU superDICE with ctax_DIAG_C30_gr5 carbon tax"

plottigat= ggplot() + 
  
  
  # superDICE
  geom_line(data= sDCx_noncoop_ssp2_AmberPW__ctax_DIAG_C80_gr5_EINe$get_MIU_nty,
            aes(x=year, y=value, group = n, color = n),
            size = 1.1) +
  

  
  # graphic details
  scale_color_manual(values = my_colors)+
  
  guides(colour=guide_legend(ncol=4)) +
  
  #ggtitle(plot4title) + 
  xlab("Year") +
  ylab("MIU [%]")  ; plottigat




#........................ save plot?
experiment_code = "linCComb_DIAG_C30_const_ct2200"

plot_code = "PL4"
plot_type = "MIU_General"
extension = "jpeg"
file_name = paste0(dir_experiment_plots,plot_code, "_", 
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________





##  PL5: REGIONAL EMISSIONS COMPARISONS   ######  


plot5title = "Regional Emissions Comparison: Brazil  (Diag_C30_gr5)"

regionToCompare = "usa"


plottigat= ggplot() + 
  
  
  
  
  # ADVANCE EMISSIONS extract Brazil, China, India, Russia, USA
  
  # geom_line(data= extractIndia(ADV_CO2.DIAG_C30_gr5),
  #           aes(x=year, y=value, group = model, color = model),
  #           size = 1.1) +

  # geom_line(data= extractUSA(ADV_CO2.DIAG_C80_gr5),
  #           aes(x=year, y=value, group = model, color = model),
  #           size = 1.1) +

#   geom_line(data= extractUSA(ADV_CO2.DIAG_C30_const),
#             aes(x=year, y=value, group = model, color = model),
#             size = 1.1) +
# 
    geom_line(data=extractUSA(ADV_CO2.DIAG_C80_const),
              aes(x=year, y=value, group = model, color = model),
              size = 1.1) +


  
  # superDICE EMISSIONS
  # geom_line(data= E_sDC_nty.ctax_DIAG_C30_gr5 %>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "superDICE"),
  #           size = 1.1) +

  # geom_line(data= E_sDC_nty.ctax_DIAG_C80_gr5%>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "superDICE"),
  #           size = 1.1) +

  # geom_line(data= E_sDC_nty.ctax_DIAG_C30_const%>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "superDICE"),
  #           size = 1.1) +
  #
  # geom_line(data= E_sDC_nty.ctax_DIAG_C80_const%>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "superDICE"),
  #           size = 1.1) +
  #

  

  # superDICE ct2200 EMISSIONS 

  # geom_line(data= E_sDC_nty.ctax_DIAG_C30_gr5_ct2200 %>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "_superDICE MACC_ED Only"),
  #           size = 1.1) +
# 
#   geom_line(data= E_sDC_nty.ctax_DIAG_C80_gr5_ct2200 %>% filter(n  == regionToCompare),
#             aes(x=year, y=value, group = 1, color = "_superDICE MACC_ED Only"),
#             size = 1.1) +
# 
#   geom_line(data= E_sDC_nty.ctax_DIAG_C30_const_ct2200 %>% filter(n  == regionToCompare),
#             aes(x=year, y=value, group = 1, color = "_superDICE MACC_ED Only"),
#             size = 1.1) +

  geom_line(data= E_sDC_nty.ctax_DIAG_C80_const_ct2200 %>% filter(n  == regionToCompare),
            aes(x=year, y=value, group = 1, color = "_superDICE MACC_ED Only"),
            size = 1.1) +



  # superDICE linCComb ct2200 EMISSIONS

  
  #   geom_line(data= E_sDC_linCComb_nty.ctax_DIAG_C30_gr5_ct2200 %>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "_superDICE MACC linCComb"),
  #           size = 1.1) +
  # 
  # geom_line(data= E_sDC_linCComb_nty.ctax_DIAG_C80_gr5_ct2200 %>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "_superDICE MACC linCComb"),
  #           size = 1.1) +
  # 
  # geom_line(data= E_sDC_linCComb_nty.ctax_DIAG_C30_const_ct2200 %>% filter(n  == regionToCompare),
  #           aes(x=year, y=value, group = 1, color = "_superDICE MACC linCComb"),
  #           size = 1.1) +

  geom_line(data= E_sDC_linCComb_nty.ctax_DIAG_C80_const_ct2200 %>% filter(n  == regionToCompare),
            aes(x=year, y=value, group = 1, color = "_superDICE MACC linCComb"),
            size = 1.1) +


              
  
  # graphic details
  #scale_color_brewer(palette = "PRGn") +
  scale_color_manual(values = c( "brown", "#000000", gino_rain )) +
  scale_fill_manual(values= my_colors ) +
  #ggtitle(plot5title) + 
  xlab("Year") +
  ylab("Emissions FFI [GtCO2]")  ; plottigat




#........................ save plot?
experiment_code = "USA_linCComb_DIAG_C80_const_ct2200"

plot_code = "PL5"
plot_type = "EMI_Regional"
extension = "jpeg"
file_name = paste0(dir_experiment_plots,plot_code, "_", 
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________





## PL 6:  MIU  DICE 2016  ######## 

#plot4title = "MIU superDICE with ctax_DIAG_C30_gr5 carbon tax"

plottigat= ggplot() + 
  
  
  # DICE 2016 gr5
  # geom_line(data= MIU_DICE_nty.ctax_DIAG_C30_gr5,
  #           aes(x=year, y=value, group = 1, color = "DIAG_C30_gr5"),
  #           size = 1.1) +
  geom_line(data= MIU_DICE_nty.ctax_DIAG_C80_gr5,
            aes(x=year, y=value, group = 1, color = "DIAG_C80_gr5"),
            size = 1.1) +
  # geom_line(data= MIU_DICE_nty.ctax_DIAG_C30_const,
  #           aes(x=year, y=value, group = 1, color = "DIAG_C30_const"),
  #           size = 1.1) +
  geom_line(data= MIU_DICE_nty.ctax_DIAG_C80_const,
            aes(x=year, y=value, group = 1, color = "DIAG_C80_const"),
            size = 1.1) +
  
  
  
  # graphic details
  #scale_color_manual(values = my_colors)+
  
  guides(colour=guide_legend(ncol=1)) +
  theme(legend.position="bottom") +
  #ggtitle(plot4title) + 
  xlab("Year") +
  ylab("MIU [%]")  ; plottigat




#........................ save plot?
experiment_code = "DIAG_C30_gr5"

plot_code = "PL4"
plot_type = "MIU_General"
extension = "jpeg"
file_name = paste0(dir_experiment_plots,plot_code, "_", 
                   plot_type, "_", 
                   if(str_length(experiment_code)>0){
                     paste0("__", experiment_code)}, ".", 
                   extension)

ggsave(file_name,plot=plottigat, device= extension, width= 12, height = 8)


#__________________________________________________________


