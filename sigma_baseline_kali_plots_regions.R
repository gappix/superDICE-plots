


##  REGIONAL EMISSIONS COMPARED R5    ------------------------------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# function
extract_mgemi_region <- function(experiment){
  
  experiment$get_Variable_GENERAL_ty("mg_emi") %>% 
    filter(ssp == my_ssp)%>%
    filter(mg == my_region) 
}

extract_mgeminorm_region <- function(experiment){
  
  t1emi = experiment$get_Variable_GENERAL_ty("mg_emi") %>% 
    filter(ssp == my_ssp)%>%
    filter(mg == my_region) %>% filter(t == 1) %>% select(-c("t","year")) %>%
    rename(emi1 = value)
  
  experiment$get_Variable_GENERAL_ty("mg_emi") %>% 
    filter(ssp == my_ssp)%>%
    filter(mg == my_region)  %>% 
    merge(t1emi, by = c("ssp", "mg")) %>%
    mutate(value = value/emi1 ) %>% select(-emi1)
}



#....................

my_ssp = "ssp2"      


my_region = "afr" # | r5oecd | r5asia | r5ref | r5maf | r5lam |
my_region = "cpa"
my_region = "eeu"
my_region = "weu"
my_region = "fsu"
my_region = "pao"
my_region = "lam"
my_region = "mea"
my_region = "nam"
my_region = "pas"
my_region = "sas"
# test: verificare accrocchio anche con popuation
# vengono fuori risultati consistenti across R5 regions? 
#..................


plotregion <- function(){

plottigat= ggplot() +
  

  
  # Baseline calibrated (world emissions from sigma kali)
  

  
  geom_line(data= extract_mgeminorm_region(ssplist$m_A_m),
            aes(x=year, y=value, group=1, color = "test_A"),
            size = 1.1) +

  geom_line(data= extract_mgeminorm_region(ssplist$m_B_m),
            aes(x=year, y=value, group=1, color = "test_B"),
            size = 1.1) +
  
  geom_line(data= extract_mgeminorm_region(ssplist$m_C_m),
            aes(x=year, y=value, group=1, color = "test_C"),
            size = 1.1) +
  
  
# SSP median

geom_line(data= sspDB_ssp2_native_regions_CO2_ffi_normalized %>%
            filter(nssp2 == tolower(my_region)) %>%
            mutate(year = 2010 + (5 * t)) ,
          aes(x=year, y=value, color = "Marker"),
          linetype = 4,
          size = 1.2) +




# graphic details
guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(
    values =  c("soft_constraint" = "black",
                "IIASA SSP Baselines"= "#8585ad", #dark blue
                "Marker" = "black",
                
                "test_A"  =  "#fff100", #yellow
                
                "test_B"  =  "#f77f2f", #orange
                "test_C"  =  "#db0f20", 
                "test_D"  =  "red",      # red
                
                "test_E"  =  "#d64cf5", # pink
                
                "test_F"  =  "#8232c7", #violet
                "test_G"  =  "#450094",
                
                "test_H"  =  "blue",   #blue
                "test_I"  =  "#0f86db",
                "test_J"  =  "#0ccfab",
                
                "test_K"  =  "green",  #greens
                
                "test_L"  =  "#32c738",  
                "test_M"  =  "#046918",
                
                
                
                "test_N"  =  "#c4570e",  # brown
                "test_O"  =  "#9c4317")) +
  
  theme( legend.text   = element_text(size = 13),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = "Tests") + 
  ggtitle(paste0("Baselines ", my_ssp, ", region ", my_region)) + 
  xlab("Year") +
  ylab("FFI Emissions [GtCO2]")  ; plottigat

}

# Region selection

my_region = "afr" ; plotregion()
my_region = "cpa" ; plotregion()
my_region = "eeu" ; plotregion()
my_region = "weu" ; plotregion()
my_region = "fsu" ; plotregion()
my_region = "pao" ; plotregion()
my_region = "lam" ; plotregion()
my_region = "mea" ; plotregion()
my_region = "nam" ; plotregion()
my_region = "pas" ; plotregion()
my_region = "sas" ; plotregion()
