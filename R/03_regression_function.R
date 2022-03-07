## ------------------------------------------------------------------------------------------------------------
##
## Script name: 04_regression_function.R
##
## Author: Erwan Harscouet
##
## Date Created: 2020-12-13
##
## Copyright (c) Erwan Harscouet
## Email: hereyoucan@putyouremail.fr
##
## ------------------------------------------------------------------------------------------------------------

#' Title
#'
#' @param suitable.df The formatted dataframe poke
#'
#' @return A R object containing the regression model and a .csv containing the model coefficients 
#' @export
#'
#' @examples
#' 

regression.attack.weight <- function(suitable_df){
  model1 <- lm(attack ~ weight_kg, suitable_df)
  save(model1, file = here::here("outputs","04_regression_weight_attack.RData"))
  coefmodel1 <- as.data.frame(summary(lm(attack ~ weight_kg, suitable_df))$coefficient)
  readr::write_csv(coefmodel1, file = here::here("outputs","04_regression_weight_attack_coef.csv"))
}
