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
# ely_traits <- BIEN_trait_genus(genus = "Elytrostachys") #No Data from BIEN database produced on this particular species
rhip_traits <- BIEN_trait_genus(genus = "Rhipidocladum")
aulo_traits <- BIEN_trait_genus(genus = "Aulonemia")
arthro_traits <- BIEN_trait_genus(genus = "Arthrostylidium")

#Occurrence data for the genus 'Guadua' bamboo
guadua_data <- BIEN_occurrence_genus(genus = "Guadua")

# Plot occurrence points on a map zooming in on the Americas
ggplot(guadua_data, aes(x = longitude, y = latitude)) +
  borders("world", color = "gray85", fill = "gray90") +
  geom_point(colour = "darkgreen", size =1, alpha = 0.6) +
  coord_sf(xlim = c(-105, -35), ylim = c(-55, 25)) +
  theme_minimal() +
  labs(title = "Occurrence Records for Genus Guadua",
       color = "Botanical Genus",
       x = "Longitude", y = "Latitude",
       caption = "Data source: BIEN")

#ggsave("visualizations/guadua.png")



#Occurrence data for Chusquea genus
chus_data <- BIEN_occurrence_genus(genus = "Chusquea")

ggplot(chus_data, aes(x = longitude, y = latitude)) +
  borders("world", color = "gray85", fill = "gray90") +
  geom_point(colour = "darkgreen", size =1, alpha = 0.6) +
  coord_sf(xlim = c(-105, -35), ylim = c(-55, 25)) +
  theme_minimal() +
  labs(title = "Occurrence Records for Genus Chusquea",
       color = "Botanical Genus",
       x = "Longitude", y = "Latitude",
       caption = "Data source: BIEN")

#ggsave("visualizations/chusquea.png")



#Invasive Risk
#Read: https://www.google.com/search?q=assessing+invasive+species+data+in+r&sca_esv=e76e82dc2fdda140&sxsrf=APpeQntnPRzks11x49vxFKdA1_VhjHm7ag%3A1789349421107&source=hp&ei=LU6naqOJBMD-ptQP9d-d2Ak&iflsig=ABILxe8AAAAAaqdcPVtJqkkQ60y16Z3zvsIuGilSJ4Zl&oq=assessing+invasive+&gs_lp=Egdnd3Mtd2l6IhNhc3Nlc3NpbmcgaW52YXNpdmUgKgUIARigATIFECEYoAEyBRAhGKABMgUQIRigATIFECEYoAEyBRAhGKsCMgUQIRifBTIFECEYnwUyBRAhGJ8FMgUQIRifBTIFECEYnwVImkJQAFilNnADeACQAQCYAXWgAdYQqgEEMTQuOLgBA8gBAPgBAZgCGaACgxLCAgQQIxgnwgILEAAYgAQYigUYkQLCAhEQLhiABBixAxiDARjHARjRA8ICDhAuGIAEGIoFGLEDGIMBwgIREC4YgwEYxwEYsQMY0QMYgATCAg4QABiABBiKBRixAxiDAcICDhAuGIAEGMcBGK8BGI4FwgIKEC4YgAQYigUYQ8ICCxAAGIAEGLEDGIMBwgIIEAAYgAQYsQPCAhEQABiABBiKBRiNBhixAxiDAcICChAAGIAEGIoFGEPCAgUQLhiABMICDRAuGIAEGIoFGEMYsQPCAhAQABiABBiKBRhDGLEDGIMBwgINEAAYgAQYigUYQxixA8ICBRAAGIAEwgIOEC4YrwEYxwEYgAQYjgXCAggQABiABBi0B8ICBxAAGIAEGArCAgYQABgWGB7CAgsQABiABBiKBRiGA8ICBRAAGO8FwgIIEAAYiQUYogTCAgcQIRgKGKABwgIHECEYqwIYCpgDAOIDBRIBMSBAkgcFMTMuMTKgB8y_AbIHBTEwLjEyuAfwEcIHCDAuNy4xNy4xyAdngAgB&sclient=gws-wiz







# #Plotting Guadua amplexifolia bamboo in the Americas
# guadua_amplexifolia_range <- BIEN_ranges_load_species(species = "Guadua amplexifolia")
# 
# map('world', fill = TRUE,
#     col = "grey",
#     bg = "light blue",
#     xlim = c(-180, -20),
#     ylim = c(-60, 80))
# 
# plot(guadua_amplexifolia_range[1],
#      col = "green",
#      add = TRUE)
# 
# #Plotting Guadua Species Data on Map
# 
# monkey_puzzle <- BIEN_ranges_load_species(species = "Guadua trinii")
# 
# world_map <- map_data("world")
# 
# ggplot() +
#   geom_polygon(data = world_map, aes(x = long, y = lat, group = group),
#                fill = "lightgrey", color = "white") +
#   geom_sf(data = monkey_puzzle, fill = "forestgreen", alpha = 0.6) +
#   coord_sf(xlim = c(-80, -35), ylim = c(-60, 5)) + 
#   theme_minimal() +
#   labs(title = "Species Range Map: Guadua trinii",
#        caption = "Data source: BIEN")


#sgenus_ranges <- BIEN_ranges_load_species(BIEN_metadata_match_data("Guadua")$species)

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




#Let's focus on  countries in the LATAM & Caribbean region most vulnerable
#to natural disasters: 


#Re-assessing the Invasive Risk of the Land & Geography


#---------------------------------------------------------------------------+
