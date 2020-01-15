# Dependencies
source("RICEx_datamng/RICEx_21_GDXclass.R")



#____ FUNCTION ____
# to retrieve all already-created DICE* gdxfiles (after last_import_time) 
# found in input folder
#
find_dice_gdx = function(input_directory, last_import_time) {
  
  result = list()
  
  input_gdx = file.info(Sys.glob(file.path(input_directory, paste0("DICE","*.gdx"))))
  return(rownames(input_gdx))
  
}


## Extract DICE results from gdx --------------------------



DICE_gdx_directory = "../DICE Vanillas/DICE Results/"


gdx_with_path_list  =  find_dice_gdx(DICE_gdx_directory, 0)



DICEresults = list()
for(d in gdx_with_path_list){
  
  # TEST
  #d = gdx_with_path_list[[1]]
  
  name = substr(basename(d),0,nchar(basename(d))-4)
  DICEresults[[paste0(name)]] = GDXclass(d)
  
}



