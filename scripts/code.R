# Prepare workspace
rm(list = ls()) # Clear environment
gc()            # Clear unused memory
cat("\f")       # Clear the console

# Define your list of packages
library(readxl)
library(dplyr)
library(stringr)
library(tidyverse)
library(BIEN)


vignette("BIEN_tutorial") #Learning how to use the 'BIEN' library for project

#Identifying Bamboo Species in the Americas
#Link: https://www.guaduabamboo.com/american-bamboo-species/

bambusa_traits <- BIEN_trait_genus(genus = "Bambusa")
guadua_traits <- BIEN_trait_genus(genus = "Guadua")
otatea_traits <- BIEN_trait_genus(genus = "Otatea")
phyllo_traits <- BIEN_trait_genus(genus = "Phyllostachys")
apoc_traits <- BIEN_trait_genus(genus = "Apoclada")
chus_traits <- BIEN_trait_genus(genus = "Chusquea")
ely_traits <- BIEN_trait_genus(genus = "Elytrostachys")
rhip_traits <- BIEN_trait_genus(genus = "Rhipidocladum")
aulo_traits <- BIEN_trait_genus(genus = "Aulonemia")



#Invasive Risk



#Let's focus on  countries in the LATAM & Caribbean region most vulnerable
#to natural disasters: 


#Re-assessing the Invasive Risk of the Land & Geography


#---------------------------------------------------------------------------+
#Extra Code

####Work in Progress
#pathways <- read_excel("data/INTRODUCTION_PATHWAYS.xls")
