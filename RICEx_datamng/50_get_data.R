source("RICEx_datamng/40_new_experiments_import.R")
source("RICEx_datamng/41_import_experiment_table.R")
source("RICEx_datamng/13_utils_RICExclass_custom_selection_function.R")




#' 
#'
#' @param experiment_id current experiment codename
#' @param selection (TATM2100, VARIABLE_nty)
#' @param variable_name 
#'
RICEx.load.experiment_space <- function(experiment_id 
                                             ,selection = NULL
                                             ,variable_name = NULL ){

    if(is.null(selection)){ stop("Must select a variable case")}
                                             

    my_selection_function <- switch(selection,
    
        TATM2100 = {

         RICEx.utils.RICExs3class_custom_selection_function("get_TATM_ty %>% filter(year == 2100)")
    }

        ,TATM = {

         RICEx.utils.RICExs3class_custom_selection_function("get_TATM_ty")
    }

    

        ,world_EMIffi = {

         RICEx.utils.RICExs3class_custom_selection_function("get_world_EMIffi_ty")
    }

    

         ,VARIABLE_nty = {

         RICEx.utils.RICExs3class_custom_selection_function(paste0("get_VARIABLE_nty(variable_name=\"",variable_name,"\")"))
    }

        ,VARIABLE_ty = {

         RICEx.utils.RICExs3class_custom_selection_function(paste0("get_VARIABLE_ty(variable_name=\"",variable_name,"\")"))
    }
    )

    result_table = RICEx.import.experiment_table(experiment_id, my_selection_function) 


    return(result_table)
                                             
} 

  