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


#' Title
#'
#' @param suitable.df pokeclean
#'
#' @return pokebytpe and poke
#' @export
#'
#' @examples
data_prep_pokeplot01 <- function(suitable.df){
  pokebytype <- as.data.frame(table(pokedatacleaned$type1))
  colnames(pokebytype)[colnames(pokebytype)=="Var1"] <- "type"
  poke <- pokedatacleaned
  poke$generation <- as.factor(poke$generation)
  poke <- poke[complete.cases(poke$weight_kg), ]
  poke <- poke[-which(poke$weight_kg < quantile(poke$weight_kg, probs = c(0.05, 0.95))[[1]]),]
  poke <- poke[-which(poke$weight_kg > quantile(poke$weight_kg, probs = c(0.05, 0.95))[[2]]),]
  return(list(df1=pokebytype, df2=poke))
}


#' This function take as input 
#'
#' @param suitable.df Voila
#'
#' @return
#' @export
#'
#' @examples
pokeplot01 <- function(freq.type.df, cor.df){
#Plot frequence of each type
p1 <- ggplot2::ggplot(pokebytype, ggplot2::aes(x=type, y=Freq)) +
  ggplot2::geom_bar(stat="identity", fill="steelblue") +
  ggplot2::theme_bw()
#Plot correlation between weight and attack
p2 <- ggplot2::ggplot(poke, ggplot2::aes(x=weight_kg, y=attack, color=generation, shape=generation)) +
  ggplot2::geom_point() + 
  ggplot2::geom_smooth(method=lm, se=FALSE, fullrange=TRUE)
#Merge both graphs
p3 <- ggpubr::ggarrange(p1, p2, ncol = 1, nrow = 2)
#Save image
ggplot2::ggsave(filename="02_plot_function_general_plot.png", 
       plot=p3, 
       path = here::here("outputs/"), 
       width=2500, height=2500, units="px",
       bg = NULL)
}

