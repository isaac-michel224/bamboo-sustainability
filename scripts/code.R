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
#Second Link: https://bambubatu.com/bamboo-of-south-america-ornamental-and-economic-species/

bambusa_traits <- BIEN_trait_genus(genus = "Bambusa")
guadua_traits <- BIEN_trait_genus(genus = "Guadua")
otatea_traits <- BIEN_trait_genus(genus = "Otatea")
phyllo_traits <- BIEN_trait_genus(genus = "Phyllostachys")
apoc_traits <- BIEN_trait_genus(genus = "Apoclada")
chus_traits <- BIEN_trait_genus(genus = "Chusquea")
ely_traits <- BIEN_trait_genus(genus = "Elytrostachys") #No Data from BIEN database produced on this particular species
rhip_traits <- BIEN_trait_genus(genus = "Rhipidocladum")
aulo_traits <- BIEN_trait_genus(genus = "Aulonemia")

#Creating a List of Latin American & Caribbean countries to plot data with 
latam_carib <- c("Brazil","Peru","Colombia","Jamaica",
               "Ecuador","Chile","Mexico","Costa Rica","Venezuela",
               "Belize","Guatemala","Nicaragua", "Honduras",
               "Panama","Colombia","Argentina","Bolivia",
               "Argentina","El Salvador","Guyana","Paraguay",
               "Uruguay","Haiti","Dominican Republic")

#Invasive Risk



#Let's focus on  countries in the LATAM & Caribbean region most vulnerable
#to natural disasters: 


#Re-assessing the Invasive Risk of the Land & Geography


#---------------------------------------------------------------------------+

