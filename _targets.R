# _targets.R file

# load the targets package:
library(targets)

# source R functions that we have coded in the project:
source("R/01_clean_data_function.R")
source("R/02_plot_function.R")
source("R/03_regression_function.R")


list(
  
  # name of the first file to use ie Pokemon dataset:
  tar_target(
    pokedata_file,
    "data/pokemon.csv",
    format = "file",
  ),
  
  # read the Pokemon file:
  tar_target(
    pokedata,
    read_csv(here::here("data", "pokemon.csv"))
  ),
  
  # clean the Pokemon dataset:
  tar_target(
    pokecleaned,
    pokeclean(pokedata)
  ),
  
  # prepare data for plot:
  tar_target(
    list_df,
    prep.pokeplot(pokecleaned)
  ),
  
  # plot frequence by type and regression and save it in outputs:
  tar_target(
    poke_plot,
    poke.plot01(list_df$df1, list_df$df2, save = TRUE)
  )
  
)


