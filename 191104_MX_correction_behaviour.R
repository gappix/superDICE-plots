


mygdx <- gdx("../RICEx-Main-Production/RICExdata_ed57_t58/RICExdata_mod_macc_PERC_kali.gdx")


plottigat = ggplot() + 
  
  
  # MY DATA
  
  geom_line(data = mygdx["MXkali"] %>% filter(pbcases==18) %>% mutate(year = 2010+(as.integer(t)*5)), aes(year,value, color=n), size = 1.2)  +  
  
  
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
  ggtitle("Multiplier MX values over time") + 
  xlab("Year") +
  ylab("")  ; plottigat







plottigat = ggplot() + 
  
  
  # MY DATA
  
  geom_line(data = mygdx["cprice_fullabat"] %>% filter(pbcases==18) %>% mutate(year = 2010+(as.integer(t)*5)), aes(year,value, color=n), size = 1.2)  +  
  
  
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
  ggtitle("CPrice (full abatement) values over time") + 
  xlab("Year") +
  ylab("CPrice [$/tCO2]")  ; plottigat