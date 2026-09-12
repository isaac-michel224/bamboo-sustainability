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
library(maps)
library(ggplot2)

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
arthro_traits <- BIEN_trait_genus(genus = "Arthrostylidium")

#Creating a List of Latin American & Caribbean countries to plot data with 

#Occurrence data for the genus 'Guadua' bamboo
guadua_data <- BIEN_occurrence_genus(genus = "Guadua")

selected_countries <- c("Brazil", "Peru", "Ecuador")

#plot_data <- BIEN_plot_country(country=c("Brazil", "Ecuador"))

world_map <- map_data("world")


ggplot() +
  geom_polygon(data = world_map, aes(x = long, y = lat, group = group)
               fill = "gray90", color = "white") +
  geom_point(data = )







# my_countries <- c("Brazil","Peru","Colombia","Jamaica",
#                   "Ecuador","Chile","Mexico","Costa Rica","Venezuela",
#                   "Belize","Guatemala","Nicaragua", "Honduras",
#                   "Panama","Colombia","Argentina","Bolivia",
#                   "Argentina","El Salvador","Guyana","Paraguay",
#                   "Uruguay","Haiti","Dominican Republic", "Cuba",
#                   "Puerto Rico")
# 
# 
# latam_carib <- BIEN_list_country(country = my_countries)
# 
# head(latam_carib)





#Invasive Risk



#Let's focus on  countries in the LATAM & Caribbean region most vulnerable
#to natural disasters: 


#Re-assessing the Invasive Risk of the Land & Geography


#---------------------------------------------------------------------------+

