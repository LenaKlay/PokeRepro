###############################################################################
##
## Script to execute the whole project
##
## make.R
##
## 03/12/2021
##
## Camille Magneville
##
###############################################################################



# Give the relative path to the data and read the data:
data_poke <- readr::read_csv(here::here("data", "pokemon.csv"))

# Install dependencies
devtools::install_deps()


#  Load defined functions of the R folder
# source(here::here("R", "01_clean_data_function.R"))
# source(here::here("R", "02_plot_function.R"))

