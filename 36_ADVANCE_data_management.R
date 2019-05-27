


  
  
 ADV_CO2 = ADVANCE_DB.CO2ffi %>% 
  gather(year, value, X2000:X2110) %>%
  rename(model = MODEL, scenario = SCENARIO, region = REGION, variable = VARIABLE, unit = UNIT) %>%
  mutate(value = ifelse(unit == "Mt CO2/yr", value/1000, value)) %>% #from MtCO2 to GtCO2
  mutate(unit = ifelse(unit == "Mt CO2/yr", "GtCO2/yr", unit)) 
 
   
   
   
# year column changed type (was factor, now is numeric)
 ADV_CO2$year <- ADV_CO2$year %>% str_replace_all("X","")
 ADV_CO2$year <- as.numeric(as.character(ADV_CO2$year)) 
 
 
 # uniform ADVANCE policy notation
ADV_CO2$scenario <- ADV_CO2$scenario %>% str_replace_all("-","_")






ADV_CO2.DIAG_Base       <- ADV_CO2 %>% filter(scenario=="DIAG_Base") %>% filter(!is.na(value)) 
ADV_CO2.DIAG_C30_const  <- ADV_CO2 %>% filter(scenario=="DIAG_C30_const") %>% filter(!is.na(value)) 
ADV_CO2.DIAG_C30_gr5    <- ADV_CO2 %>% filter(scenario=="DIAG_C30_gr5") %>% filter(!is.na(value)) 
ADV_CO2.DIAG_C80_const  <- ADV_CO2 %>% filter(scenario=="DIAG_C80_const") %>% filter(!is.na(value)) 
ADV_CO2.DIAG_C80_gr5    <- ADV_CO2 %>% filter(scenario=="DIAG_C80_gr5") %>% filter(!is.na(value)) 





worldADV <- function(df){
  
  
  advance = df
  
  advance_world = advance %>%
    filter(region == "WORLD" | region == "World" )
  
  
  advance_region_sum = advance %>%
    filter(!(region == "WORLD" | region == "World")) %>%

    # should sum up every region >> World (unless ovelaps occur)
    group_by(model, scenario, variable, unit, year) %>%
    summarise(value = sum(value)) %>%
    ungroup()


  bind_rows(advance_world,advance_region_sum )
  
  
  
}



ADV_CO2_WORLD.DIAG_Base       <- worldADV(ADV_CO2.DIAG_Base) %>% filter(!(model == "POLES ADVANCE" | model == "POLES_ADVANCE_V2" | model ==  "KEI-Linkages_2.0" | model =="COPPE-MSB_v1.3.2"))      
ADV_CO2_WORLD.DIAG_C30_const  <- worldADV(ADV_CO2.DIAG_C30_const) %>% filter(!(model == "POLES ADVANCE" | model == "POLES_ADVANCE_V2" | model ==  "KEI-Linkages_2.0" | model =="COPPE-MSB_v1.3.2"))      
ADV_CO2_WORLD.DIAG_C80_const  <- worldADV(ADV_CO2.DIAG_C80_const) %>% filter(!(model == "POLES ADVANCE" | model == "POLES_ADVANCE_V2" | model ==  "KEI-Linkages_2.0"| model =="COPPE-MSB_v1.3.2"))      
ADV_CO2_WORLD.DIAG_C30_gr5    <- worldADV(ADV_CO2.DIAG_C30_gr5) %>% filter(!(model == "POLES ADVANCE" | model == "POLES_ADVANCE_V2" | model ==  "KEI-Linkages_2.0"| model =="COPPE-MSB_v1.3.2"))      
ADV_CO2_WORLD.DIAG_C80_gr5    <- worldADV(ADV_CO2.DIAG_C80_gr5) %>% filter(!(model == "POLES ADVANCE" | model == "POLES_ADVANCE_V2" | model ==  "KEI-Linkages_2.0"| model =="COPPE-MSB_v1.3.2"))      







extractBrazil <- function(ADVANCEdf){  ADVANCEdf %>% filter(region == "BRA" | region =="Brazil") }
extractUSA    <- function(ADVANCEdf){  ADVANCEdf %>% filter(region == "USA") }
extractChina  <- function(ADVANCEdf){  ADVANCEdf %>% filter(region == "CHN" | region =="china") }
extractIndia  <- function(ADVANCEdf){  ADVANCEdf %>% filter(region == "IND" | region =="india") }
extractRussia <- function(ADVANCEdf){  ADVANCEdf %>% filter(region == "RUS" | region =="russia") }