## ------------------------------------------------------------------------------------------------------------
##
## Script name: 04_regression_function.R
##
## Purpose of script: perform a linear regression between weight and attack
##
## Author: Erwan Harscouet
##
## Date Created: 2020-12-13
##
## Notes:
## This script create 2 outputs, a linear model in a .RData and coefficient's linear model in a .csv
## 
## Copyright (c) Erwan Harscouet
## Email: thisismyemail@goratatac.fr
##
## ------------------------------------------------------------------------------------------------------------

list_df <- data_prep_pokeplot01(suitable.df = pokedatacleaned)
pokebytype <- list_df$df1
poke <- list_df$df2
pokeplot01(freq.type.df = pokebytype, cor.df = poke)
