# Prepare workspace
rm(list = ls()) # Clear environment
gc()            # Clear unused memory
cat("\f")       # Clear the console

# Define your list of packages
my_packages <- c("tidyverse")

# Load them all at once
lapply(my_packages, library, character.only = TRUE)


#Work in Progress


#Let's focus on 4 countries in the region most vulnerable
#to natural disasters: Hait, Cuba, Honduras & Guatemala 