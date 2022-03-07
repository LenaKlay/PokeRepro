## ------------------------------------------------------------------------------------------------------------
##
## Script name: 01_clean_data_function.R
##
## Author: Erwan Harscouet
##
## Date Created: 2020-12-13
## 
## Email: hereyoucan@putyouremail.fr
##
## ------------------------------------------------------------------------------------------------------------


#' Clean the pokemon data 
#' 
#' This function takes as input the intial pokemon dataset and clean it 
#' by removing the 3 first generations of pokemons, the japanese name and 
#' classfication.  
#'
#' @param initial_df the pokemon dataset in a dataframe
#'
#' @return a dataframe that contain the information about pokemons but without the  
#' japanese names and classification and only for the first three generations.
#' 
#' 
#' @export
#'

pokeclean <- function(initial_df){
  
  # remove the last pokemon generations and two columns
  pokedata <- pokedata[-which(pokedata$generation %in% c("4", "5", "6", "7")), ]
  pokedata <- pokedata[, -which(names(pokedata) %in% c("japanese_name", 
                                                       "classfication"))]
}
