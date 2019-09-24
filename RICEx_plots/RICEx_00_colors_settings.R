# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
require_package("wesanderson")

#Cool Palette
somecol= c(
  

  

  "#0000FF", #Blue
  "#000066", #Darkblue
  "#000033", #SuperDarkBlue


  "#FFCCCC", #SkinPink
  "#FF3399", #Pink
  "#FF00FF", #VibrantPink
  "#FF33CC", #DarkPink
  

  

  "#FFCC00", #Yellow
  "#FFFF99", #SuperLightYellow
  "#FFFF00", #PaleYellow
  "#FF9900", #LightOrange
  "#FF6600", #OrangeYellow
  "#FF3300", #IntenseOrange
  
  "#0099FF", #Cyan
  "#33CCFF", #lightCyan
  "#6699FF", #FadedCyan
  "#3366CC", #Darkcyan
  

  
  "#330000", #darkBrown
  "#993300", #Brown
  "#663300", #LightBrown
  "#996633", #Palebrown
  
  
  "#CC0000", #Darkred
  "#FF0000", #Red
  "#FF3333", #Lightred
  "#FF6666", #PaleRed
  "#CC0033", #Coral



  
  "#003300", #VeryDarkgreen
  "#006600", #DarkGreen
  "#336633", #SmokedGreen
  "#669966", #LightSmokedgreen
  "#00FF00", #Greem
  "#66FF66", #Lightgreen
  "#99FF33", #Lightyellowgreen
  "#CCFF00", #yeallowgreen
  
  
  "#003366", #Darkpetrolgreen
  "#006699", #Petrolgreen
  "#00CCCC", #Lightpetrolgreen
  "#33FFCC", #SuperlihtpetrolGreen
  
  "#9900FF", #LightPurple
  "#6600FF", #Purple
  "#9966FF", #FadedPurple
  "#3300CC", #Violet
  "#330099", #DarkViolet
  
  "#000000", #Black
  "#333333", #Grey
  "#CCCCCC" #LightGrey
  
  
)
  
  
  
#LEGACY PALETTE
 c( "#0988e3",
           "#d109e3",
           "#1be309",
           "#e36409",
           "#093fe3",
           "#e3091b",
           "#e3d109",
           "#767676",
           "#000000",
           "#e30988",
           "#88e309",
           "#033050",
           "#8bccfa",
           "#767676",
           "#f7b80a",
           "#0af7e0",
           "#0a21f7",
           "#808080",
           "#21f70a",
           "#e00af7",
           "#0a98f7",
           "#0af769",
           "#690af7",
           "#652a03",
           "#fcc49e",
           "#808080")


# my_colors = colorRampPalette(brewer.pal(9,"Set1"))(57)
# 
# my_colors = brewer.pal(9, "Paired") 
# 
# my_colors = cbind(my_colors, c())
# 
# my_colors = rainbow(60)


# USE THIS
my_colors = colorRampPalette(somecol)(60)



# my_colors = colorRampPalette(cbind(wes_palette(name="Darjeeling"),
#                                    wes_palette(name="Moonrise3"),
#                                    wes_palette(name="Cavalcanti")))(60)
# 

# RANDOMIZATION
my_colors = sample(my_colors) 



gino_rain = sample(rainbow(20))



# FUNCTION RANDOMIZING COLORS
randomize_my_colors = function(){
  
  my_colors = sample(my_colors) 
}




##---------------: REGIONAL COLOR PALETTE :-----------------------



colorize_regions <- function(region_id = "ed57"){
  
  
  #ED57 color palette  
  if(region_id == "ed57"){
    
    c(
      "arg"     =  "#000000",
      "aus"     =  "#48D1CC",
      "aut"     =  "#ae8000",
      "bel"     =  "#800000",
      "bgr"     =  "#003366",
      "blt"     =  "#bf4040",
      "bra"     =  "#ffd633", #Yellow           # <
      "can"     =  "#6600cc", #Violet           # <
      "chl"     =  "#ffece6",
      "chn"     =  "#ff531a", #Red              # ==
      "cor"     =  "#adebad",
      "cro"     =  "#808080",
      "dnk"     =  "#ff9933",
      "egy"     =  "#0044cc", #Purple           # <
      "esp"     =  "#ffd6cc",
      "fin"     =  "#00cccc",
      "fra"     =  "#cc0000",
      "gbr"     =  "#FFFFFF",
      "golf57"  =  "#33d6ff", #Light blue      # ==
      "grc"     =  "#00ffcc",
      "hun"     =  "#9999ff",
      "idn"     =  "#996633",
      "irl"     =  "#ff4dff",
      "ita"     =  "#FFFF00",
      "jpn"     =  "#006600", #Petrolgreen      # < 
      "meme"    =  "#b32d00",
      "mex"     =  "#ccff33", #Bluette          # <
      "mys"     =  "#145252",
      "nde"     =  "#00d900", #Green            # ==
      "nld"     =  "#C309BD",
      "noan"    =  "#ffff99",
      "noap"    =  "#ecf2f9",
      "nor"     =  "#ff3399",
      "oeu"     =  "#ffb3ff",
      "osea"    =  "#008fb3", #Pink             # <
      "pol"     =  "#d6f5d6",
      "prt"     =  "#003300",
      "rcam"    =  "#4d1919", #Coral            # <
      "rcz"     =  "#00FFFF",
      "rfa"     =  "#DEB887",
      "ris"     =  "#000080", #Darkblue         # <
      "rjan57"  =  "#bf00ff",
      "rom"     =  "#FF00FF",
      "rsaf"    =  "#ff8000", #Orange           # ==
      "rsam"    =  "#0000FF", #DarkPink         # <
      "rsas"    =  "#CCD6DD", #darkBrown        # < 
      "rsl"     =  "#00FF00",
      "rus"     =  "#66757F", #Chocolate        # ==
      "slo"     =  "#ff3091",
      "sui"     =  "#61A62F",
      "swe"     =  "#CB1942",
      "tha"     =  "#EFFF14",
      "tur"     =  "#4B0082", #DarkViolet       # <
      "ukr"     =  "#c198ff", #Lightviolet      # <
      "usa"     =  "#FFCC00", #Gold             # ==
      "vnm"     =  "#3377ff", #LightGreen       # <
      "zaf"     =  "#b3ccff"  #DarkSlateGray
    )
    
    
    
  }
  
  
} 

