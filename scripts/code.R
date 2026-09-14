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

#Plotting Guadua amplexifolia bamboo in the Americas
guadua_amplexifolia_range <- BIEN_ranges_load_species(species = "Guadua amplexifolia")

map('world', fill = TRUE,
    col = "grey",
    bg = "light blue",
    xlim = c(-180, -20),
    ylim = c(-60, 80))

plot(guadua_amplexifolia_range[1],
     col = "green",
     add = TRUE)

#Plotting Guadua Species Data on Map

monkey_puzzle <- BIEN_ranges_load_species(species = "Guadua trinii")

world_map <- map_data("world")

ggplot() +
  geom_polygon(data = world_map, aes(x = long, y = lat, group = group),
               fill = "lightgrey", color = "white") +
  geom_sf(data = monkey_puzzle, fill = "forestgreen", alpha = 0.6) +
  coord_sf(xlim = c(-80, -35), ylim = c(-60, 5)) + 
  theme_minimal() +
  labs(title = "Species Range Map: Guadua trinii",
       caption = "Data source: BIEN")

# Create a temporary directory for the shapefiles
temp_dir <- file.path(tempdir(), "BIEN_ranges")
dir.create(temp_dir, showWarnings = FALSE)


# Download range maps for a specific genus ( "Guadua")
BIEN_ranges_genus(genus = "Guadua", directory = temp_dir)


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





#Invasive Risk



#Let's focus on  countries in the LATAM & Caribbean region most vulnerable
#to natural disasters: 


#Re-assessing the Invasive Risk of the Land & Geography


#---------------------------------------------------------------------------+

# #Creating a List of Latin American & Caribbean countries to plot data with 
# 
# #Occurrence data for the genus 'Guadua' bamboo
# guadua_data <- BIEN_occurrence_genus(genus = "Guadua")
# 
# selected_countries <- c("Brazil", "Peru", "Ecuador")
# filtered_data <- guadua_data[guadua_data$country %in% selected_countries, ]
# 
# #plot_data <- BIEN_plot_country(country=c("Brazil", "Ecuador"))
# 
# world_map <- map_data("world")




# ggplot() +
#   geom_polygon(data = world_map, aes(x = long, y = lat, group = group),
#                fill = "gray90", color = "white") +
#   geom_point(data = filtered_data, aes(x = longitude, y = latitude, color = "green"),
#              alpha = 0.6, size = 1.5) +
#   coord_quickmap() +
#   theme_minimal() +
#   labs(title = "Genus Distribution Across South America",
#        x = "Longitude", y = "Latitude", color = "Species")
