

# 
# bubba <- function(df){
#   
#   
#   return(df$get_TATM_ty %>% filter(year == 2100))
#   
# }

# df %>% bubba()


# data 
# eval(parse(text = paste0('original_list',
#                          '$',regions,
#                          '$',policy,
#                          '$',baseline,
#                          '$',impacts,
#                          '$',run_mode,
#                          '$',extra_and_data,
#                          ' <- RICEx_S3data')))
# 




#' Create a custom selection function for RICExclass
#'
#' @param command_string string containing command that has to follor '$'-operator 
#' in RICEx_S3class 
#'
RICEx.utils.RICExs3class_custom_selection_function  <- function(command_string){
  
  
  return( function(.df){ return(eval(parse(text =paste0('.df$',command_string)))) })
  
}





# #' Create a custom selection function for RICExclass
# #'
# #'
# #'
# #' @noRd
# RICEx.utils.RICExs3class_custom_selection_function <- function( element_nty = NULL,
#                                                                element_ty = NULL,
#                                                                element_simple = NULL,
#                                                                specific_year = NULL,
#                                                                time_interval_year_start = NULL,
#                                                                time_interval_year_end = NULL ){
  


#   # nty - element -------------------
  
#   if(!is.null(element_nty)){
    
#     # TODO
    
#   }else{
    
    
#     # ty - element -------------------
    
#     if(!is.null(element_ty)){
      
      
#       return( function(.df){
      
#         .df$get_VARIABLE_nty(variable_name = element_nty)
#       })
      
    
      
#     }else{
      
      
      
#       # simple - element -------------------
      
#       if(!is.null(element_simple)){
        
        
#         # TODO
        
#       }else{
        
        
#         stop("Error!  must provide at least one specification among <element_nty, element_ty, element_simple >!  ")
        
        
#       }
      
      
#     }
    
      
  
#   }
  

  
  
#}
