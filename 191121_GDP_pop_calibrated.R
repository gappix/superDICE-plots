source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_datamng/RICEx_21_GDXclass.R")

# Retrieve experiments


baseline = GDXclass("../RICEx-Main-FIX/input/build/RICExdata_baseline_ssp_pop_ykali.gdx")

baselogistic = gdx("../RICEx-Main-FIX/input/build/RICExdata_baseline_ssp_pop_ykali_logistic.gdx")
baselinear   =  gdx("../RICEx-Main-FIX/input/build/RICExdata_baseline_ssp_pop_ykali_linear.gdx")

##-------  STACKED LOGISTIC GDP  ------------


plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= baselogistic["ssp_ykali"] %>% filter(V1 == 'PPP' &  ssp =='ssp2') %>% mutate(t= (as.numeric(year) - 2010)/5),
            aes(x=t, y=value, group=iso3, fill =iso3)) +
  
  
  #ADVANCE
  
  geom_line(data= baselogistic["gdp_dice"] %>% mutate(t= (as.numeric(year) - 2010)/5), 
            aes(x=t, y=value, group = 1, color = "DICE-global"),
            size = 0.6)  +
  
  
  
  # graphic details
  
  scale_fill_manual(values = c(my_colors,my_colors,my_colors,my_colors )) +
  
  scale_color_manual(values = c("black", "blue", "black")) +
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=5)) +
  
  
  
  
  
  ggtitle("GDP stacked ISO3") + 
  xlab("Year") +
  ylab("GDP gross PPP [Trill USD/year]")   ; plottigat



##-------  STACKED LOGISTIC POP  ------------


plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= baseline["ssp_pop"] %>% filter( ssp =='ssp2') %>% mutate(t= (as.numeric(year) - 2010)/5),
            aes(x=t, y=value, group=iso3, fill =iso3)) +
  
  
  #ADVANCE
  
  geom_line(data= baseline["pop_dice"] %>% mutate(t= (as.numeric(year) - 2010)/5), 
            aes(x=t, y=value, group = 1, color = "DICE-global"),
            size = 0.6)  +
  
  
  
  # graphic details
  
  scale_fill_manual(values = c(my_colors,my_colors,my_colors,my_colors )) +
  
  scale_color_manual(values = c("black", "blue", "black")) +
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=5)) +
  
  
  
  
  
  ggtitle("POP stacked ISO3") + 
  xlab("Year") +
  ylab("POP [Billion]")   ; plottigat






##-------  STACKED LINEAR GDP  ------------


plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= baselinear["ssp_ykali"] %>% filter(V1 == 'PPP' &  ssp =='ssp2') %>% mutate(t= (as.numeric(year) - 2010)/5),
            aes(x=t, y=value, group=iso3, fill =iso3)) +
  
  
  #ADVANCE
  
  geom_line(data= baselinear["gdp_dice"] %>% mutate(t= (as.numeric(year) - 2010)/5), 
            aes(x=t, y=value, group = 1, color = "DICE-global"),
            size = 0.6)  +
  
  
  
  # graphic details
  
  scale_fill_manual(values = c(my_colors,my_colors,my_colors,my_colors )) +
  
  scale_color_manual(values = c("black", "blue", "black")) +
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=5)) +
  
  
  
  
  
  ggtitle("GDP stacked ISO3") + 
  xlab("Year") +
  ylab("GDP gross [Trill USD/year]")   ; plottigat



##-------  STACKED LINEAR POP  ------------


plottigat= ggplot() + 
  
  
  # Scenario
  geom_area(data= baselinear["ssp_pop"] %>% filter( ssp =='ssp2') %>% mutate(t= (as.numeric(year) - 2010)/5),
            aes(x=t, y=value, group=iso3, fill =iso3)) +
  
  
  #ADVANCE
  
  geom_line(data= baselinear["pop_dice"] %>% mutate(t= (as.numeric(year) - 2010)/5), 
            aes(x=t, y=value, group = 1, color = "DICE-global"),
            size = 0.6)  +
  
  
  
  # graphic details
  
  scale_fill_manual(values = c(my_colors,my_colors,my_colors,my_colors )) +
  
  scale_color_manual(values = c("black", "blue", "black")) +
  
  
  guides(colour=guide_legend(ncol=2), fill=guide_legend(ncol=5)) +
  
  
  
  
  
  ggtitle("POP stacked ISO3") + 
  xlab("Year") +
  ylab("POP [Billion]")   ; plottigat




