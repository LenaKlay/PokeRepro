## ------------------------------------------------------------------------------------------------------------
##
## Script name: 04_regression_weight_attack
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
## Email: hello@timfarewell.co.uk
##
## ------------------------------------------------------------------------------------------------------------

#load data
poke <- readr::read_csv(here::here("data", "pokemon.csv"))
#clean data
source(here::here("R", "01_clean_data_function.R"))
poke <- pokeclean(poke)
#create linear model and save it
model1 <- lm(attack ~ weight_kg, poke)
save(model1, file = here::here("outputs","04_regression_weight_attack.RData"))
coefmodel1 <- as.data.frame(summary(lm(attack ~ weight_kg, poke))$coefficient)
readr::write_csv(coefmodel1, file = here::here("outputs","04_regression_weight_attack_coef.csv"))
