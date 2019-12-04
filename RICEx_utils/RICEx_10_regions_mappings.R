


require_package("tibble")


regions_markers = list()

## -------------- ED57  -------------------


ed57 <- tribble(
  
  ~ed57      ,      ~ed57_description, 
  "chn"      ,      "China",
  "vnm"      ,      "Vietnam",
  "osea"     ,      "Rest of South East Asia including Taiwan (GROUP)",
  "jpn"      ,      "Japan",
  "aus"      ,      "Australia",
  "rjan57"   ,      "New Zealand, Papua New Guinea and Pacific Islands (GROUP)",
  "bra"      ,      "Brazil",
  "mex"      ,      "Mexico",
  "chl"      ,      "Chile",
  "arg"      ,      "Argentina",
  "rcam"     ,      "Rest of Central America (GROUP)",
  "rsam"     ,      "Rest of South America (GROUP)",
  "egy"      ,      "Egypt",
  "noan"     ,      "Marocco and Tunisia",
  "noap"     ,      "Algeria and Libya",
  "golf57"   ,      "Saudi Arabia, Iran, Arab Emirates, Iraq, Kuwait, Oman, Qatar, Bahrain, Yemen (GROUP)",
  "meme"     ,      "Israel, Jordan, Lebanon, Syria (GROUP)",
  "bgr"      ,      "Bulgaria",
  "cro"      ,      "Croatia",
  "hun"      ,      "Hungary",
  "rsl"      ,      "Slovakia",
  "pol"      ,      "Poland",
  "rcz"      ,      "Czech Republic",
  "rom"      ,      "Romania",
  "slo"      ,      "Slovenia",
  "oeu"      ,      "Eastern Europe (GROUP)",
  "prt"      ,      "Portugal",
  "nor"      ,      "Norway",
  "rfa"      ,      "Germany",
  "irl"      ,      "Ireland",
  "ita"      ,      "Italy",
  "grc"      ,      "Greece",
  "esp"      ,      "Spain",
  "fin"      ,      "Finland",
  "fra"      ,      "France",
  "gbr"      ,      "UK",
  "dnk"      ,      "Denmark",
  "aut"      ,      "Austria",
  "bel"      ,      "Belgium",
  "nld"      ,      "The Netherlands",
  "sui"      ,      "Switzerland",
  "swe"      ,      "Sweden",
  "tur"      ,      "Turkey",
  "rus"      ,      "Russia",
  "ukr"      ,      "Ukraine",
  "ris"      ,      "Rest of ex Former Union (GROUP)",
  "blt"      ,      "Baltic States (GROUP)",
  "mys"      ,      "Malaysia",
  "tha"      ,      "Thailand",
  "idn"      ,      "Indonesia",
  "cor"      ,      "South Korea",
  "nde"      ,      "India",
  "rsas"     ,      "Rest of South Asia (GROUP)",
  "can"      ,      "Canada",
  "usa"      ,      "USA",
  "zaf"      ,      "South Africa",
  "rsaf"     ,      "all other countries in Sub Saharan Africa  (GROUP)"
  
   )







## -------------- message_globiom11  -------------------


# SSP2 marker 


message_globiom11 <- tribble(
  
  ~mglo,      ~mglo_description, 
  "afr",    "Subsaharian Africa",
  "cpa",    "Centrally planned Asia and china",
  "eeu",    "Central & Eastern Europe",
  "fsu",    "Former Soviet Union",
  "lam",    "Latin america and the Caribbean",
  "mea",    "Middle east and north africa",
  "nam",    "North America",
  "pao",    "Pacific OECD",
  "pas",    "Other pacific Asia",
  "sas",    "South asia",
  "weu",    "Western europe",
  "afr",    "Subsaharian Africa",
  "cpa",    "Centrally planned Asia and china",
  "eeu",    "Central & Eastern Europe",
  "fsu",    "Former Soviet Union",
  "lam",    "Latin america and the Caribbean",
  "mea",    "Middle east and north africa",
  "nam",    "North America",
  "pao",    "Pacific OECD",
  "pas",    "Other pacific Asia",
  "sas",    "South asia",
  "weu",    "Western europe"

  )%>% mutate(ssp = "ssp2") %>% as.data.frame()


regions_markers$ssp2 = message_globiom11

## -------------- remind_magpie11  -------------------

# SSP5 marker 

remind_magpie11  <- tribble(
  
  ~rmag,      ~rmag_description, 
  
  "afr",     "Subsaharian africa",
  "chn",     "China",
  "eur",     "Europe",
  "ind",     "India",
  "jpn",     "Japan",
  "lam",     "Latin America",
  "mea",     "Middle east north africa",
  "oas",     "Other asian countries",
  "row",     "Rest of the World",
  "rus",     "Russia",
  "usa",     "Usa"

  )%>% mutate(ssp = "ssp5") %>% as.data.frame()



regions_markers$ssp5 = remind_magpie11


## --------------  imagex24   -------------------

# SSP1 marker 


imagex24  <- tribble(
  
  ~img,      ~img_description, 
  
  "bra"   ,  "Brazil",
  "can"   ,  "Canada",
  "ceu"   ,  "Central Europe",
  "chn"   ,  "China (Mainland, Hongkong, Macao; excl. Taiwan)",
  "india" ,  "India",
  "indo"  ,  "Indonesia",
  "jap"   ,  "Japan",
  "kor"   ,  "South Korea",
  "me"    ,  "Middle East",
  "mex"   ,  "Mexico",
  "naf"   ,  "Northern Africa",
  "oce"   ,  "Oceania (including Australia and New Zealand)",
  "rcam"  ,  "Central America",
  "xxaf"  ,  "XX Rest of Subsaharian Africa (excl. South Africa)",
  "rsam"  ,  "Latin America (Excl. Mexico, Brazil; incl. Carribean islands)",
  "rsas"  ,  "Rest of South Asia (Pakistan+Afganistan)",
  "rus"   ,  "Russia",
  "saf"   ,  "South Africa",
  "seas"  ,  "Southeast Asia",
  "stan"  ,  "Central Asia (-stan countries)",
  "tur"   ,  "Turkey",
  "ukr"   ,  "Ukraine region",
  "usa"   ,  "United States of America",
  "weu"   ,  "Western Europe"
  
)%>% mutate(ssp = "ssp1") %>% as.data.frame()


regions_markers$ssp1 = imagex24

## ----------------- aim_cge17 -----------------------

# SSP3 marker

aim_cge17  <- tribble(
  
  ~acg,      ~acg_description, 
  
  "jpn",    "Japan",
  "chn",    "China",
  "ind",    "India",
  "xse",    "South-est Asia",
  "xsa",    "Rest of Asia",
  "xoc",    "Oceania",
  "xe25",   "EU25",
  "xer",    "Rest of Europe",
  "cis",    "Former Soviet Union",
  "tur",    "Turkey",
  "can",    "Canada",
  "usa",    "United States",
  "bra",    "Brazil",
  "xlm",    "Rest of South America",
  "xme",    "Middle East",
  "xnf",    "North Africa",
  "xaf",    "Rest of Africa"

  )%>% mutate(ssp = "ssp3") %>% as.data.frame()



regions_markers$ssp3 = aim_cge17

## ----------------- gcamx27 -----------------------

# SSP4 marker

gcamx27  <- tribble(
  
  ~gcam,      ~gcam_description, 
  

"africa_xxsub",                    "XX Subsaharian Africa",                                    
"africa_northern",                 "Northern Africa",                                       
"argentina",                       "Argentina",                                 
"australia_nz",                    "Australia and New Zealand",                                    
"brazil",                          "Brazil",                              
"canada",                          "Canada",                              
"central_america_and_caribbean",   "Central America and Caribbean",                                                     
"central_asia",                    "Central Asia",                                    
"china",                           "China",                             
"rxx_south_america",               "XX South America",                                         
"eu_12",                           "EU 12",                             
"eu_15",                           "EU 15",                             
"europe_eastern",                  "Europe Eastern",                                      
"europe_non_eu",                   "Europe non-EU",                                     
"uropean_free_trade_association",  "European Free Trade Association",                                                      
"india",                           "India",                                                                             
"indonesia",                       "Indonesia",                                 
"japan",                           "Japan",                             
"mexico",                          "Mexico",                              
"middle_east",                     "Middle East",                                   
"russia",                          "Russia",                              
"south_africa",                    "South Africa",                                    
"south_xxasia",                    "XX South Asia",                                    
"south_korea",                     "South Korea",                                   
"southeast_asia",                  "Southeast Asia",                                      
"taiwan",                          "Taiwan",                              
"usa",                             "USA"   

)%>% mutate(ssp = "ssp4") %>% as.data.frame()


regions_markers$ssp4 = gcamx27
