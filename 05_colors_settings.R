#install.packages("wesanderson")

library(wesanderson)

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
