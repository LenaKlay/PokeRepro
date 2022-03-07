## ------------------------------------------------------------------------------------------------------------
##
## Purpose of script: perform a linear regression between weight and attack
##
## 02_plot_function.R
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


#' Prepare data for plotting
#' 
#' This function takes as input a cleaned dataframe of Pokemons and return 
#' data to be able to plot ... . It tidies data by ...
#'
#' @param poke_cleaned a dataframe containing cleaned pokemon data. The pokemon 
#' dataframe has been cleaned using the \code{pokeclean} function. Thus,
#' suitable_df is the output of the \code{pokeclean} function.
#'
#' @return \code{pokebytype} which is a dataframe containing ... and \code{poke}
#' which is a dataframe containing ...
#' 
#' @export
#'

prep.pokeplot <- function(poke_cleaned){
  
  # create a dataframe ... 
  pokebytype <- as.data.frame(table(poke_cleaned$type1))
  colnames(pokebytype)[colnames(pokebytype)=="Var1"] <- "type"
  
  # rename the poke cleaned df so easier to call
  poke <- poke_cleaned
  
  # generation as factor
  poke$generation <- as.factor(poke$generation)
  
  # remove rows with no weight information
  poke <- poke[complete.cases(poke$weight_kg), ]
  
  # keep weight between 5% and 95% of the distribution
  poke <- poke[-which(poke$weight_kg < quantile(poke$weight_kg, probs = c(0.05, 0.95))[[1]]),]
  poke <- poke[-which(poke$weight_kg > quantile(poke$weight_kg, probs = c(0.05, 0.95))[[2]]),]
  
  # create the return list and return it
  return(list(df1 = pokebytype, df2 = poke))
  
}


#' Plot some Pokemon's information
#' 
#' This function takes as inputs two cleaned pokemon dataframes and 
#' plot the frequence pokemons's types and relationships between attack 
#' capacities and pokemon's weight according to Pokemon's generation
#'
#' @param pokebytype a dataframe containing ... . It is the output of the 
#' \code{prep.pokeplot} function.
#'
#' @param poke a dataframe containing ... . It is the output of the 
#' \code{prep.pokeplot} function.
#' 
#' @param save a logical value to say whether the final plot must be saved
#' in the outputs folder or not
#'
#' @return 
#' 
#' @export
#'


poke.plot01 <- function(pokebytype, poke, save){

  # Plot frequence of each type:
  p1 <- ggplot2::ggplot(pokebytype, ggplot2::aes(x = type, y = Freq)) +
    ggplot2::geom_bar(stat = "identity", fill = "steelblue") +
    ggplot2::theme_bw()
  
  # Plot correlation between weight and attack: 
  p2 <- ggplot2::ggplot(poke, ggplot2::aes(x = weight_kg, y = attack, 
                                           color = generation, 
                                           shape = generation)) +
    ggplot2::geom_point() + 
    ggplot2::geom_smooth(method = lm, se = FALSE, fullrange = TRUE)
  
  # Merge both graphs:
  p3 <- ggpubr::ggarrange(p1, p2, ncol = 1, nrow = 2)
  
  # Save image if asked:
  if (save == TRUE) {
    ggplot2::ggsave(filename="02_plot_function_general_plot.png", 
                    plot=p3, 
                    path = here::here("outputs/"), 
                    width=2500, height=2500, units="px",
                    bg = NULL)
  }
  
  # Return the image if not saved:
  if (save == FALSE) {
    return(p3)
  }

}

