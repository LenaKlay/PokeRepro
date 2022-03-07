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

# Install dependencies
#devtools::install_deps()

# Give the relative path to the data and read the data:
pokedata <- readr::read_csv(here::here("data", "pokemon.csv"))

# Load defined functions from the R folder
source(here::here("R", "01_clean_data_function.R"))
source(here::here("R", "02_plot_function.R"))
source(here::here("R", "03_regression_function.R"))

# Run analyses scripts
source(here::here("analysis", "01_clean_data.R"))
source(here::here("analysis", "02_plot.R"))
# source(here::here("analysis", "03_regression.R")) Update when Erwan has done the 03_regression_function analysis script

