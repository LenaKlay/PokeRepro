## ------------------------------------------------------------------------------------------------------------
##
## Purpose of script: perform a linear regression between weight and attack
##
## 01_clean_data_function.R
##
## Author: Erwan Harscouet
##
## Date Created: 2020-12-13
##
## Notes:
## This script create 2 outputs, a linear model in a .RData and coefficient's linear model in a .csv
## 
## Email: thisismyemail@goratatac.fr
##
## ------------------------------------------------------------------------------------------------------------


#' Clean the pokemon data 
#' 
#' This function takes as input the intial pokemon dataset and clean it 
#' by removing the 3 first generations of pokemons, the japanese name and 
#' classfication.  
#'
#' @param initial.df the pokemon dataset in a dataframe
#'
#' @return a dataframe with all informations about pokemons except for the 
#' first three generations, pokemons japanese names and classification
#' 
#' @export
#'


pokeclean <- function(initial.df){
  
  pokedata <- pokedata[-which(pokedata$generation %in% c("4", "5", "6", "7")), ]
  pokedata <- pokedata[, -which(names(pokedata) %in% c("japanese_name", 
                                                       "classfication"))]
}
