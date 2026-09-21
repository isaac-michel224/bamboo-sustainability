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
otatea_traits <- BIEN_trait_genus(genus = "Otatea")
apoc_traits <- BIEN_trait_genus(genus = "Apoclada")
chus_traits <- BIEN_trait_genus(genus = "Chusquea")
rhip_traits <- BIEN_trait_genus(genus = "Rhipidocladum")


#Occurrence data for the genus 'Guadua' bamboo
guadua_data <- BIEN_occurrence_genus(genus = "Guadua")

# Plot occurrence points on a map zooming in on the Americas
ggplot(guadua_data, aes(x = longitude, y = latitude)) +
  annotation_borders("world", color = "gray85", fill = "gray90") +
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
  annotation_borders("world", color = "gray85", fill = "gray90") +
  geom_point(colour = "darkgreen", size =1, alpha = 0.6) +
  coord_sf(xlim = c(-105, -35), ylim = c(-55, 25)) +
  theme_minimal() +
  labs(title = "Occurrence Records for Genus Chusquea",
       color = "Botanical Genus",
       x = "Longitude", y = "Latitude",
       caption = "Data source: BIEN")

#ggsave("visualizations/chusquea.png")


#Occurrence data for Arthrostylidium genus
arthro_data <- BIEN_occurrence_genus(genus = "Arthrostylidium")

ggplot(arthro_data, aes(x = longitude, y = latitude)) +
  annotation_borders("world", color = "gray85", fill = "gray90") +
  geom_point(colour = "darkgreen", size =1, alpha = 0.6) +
  coord_sf(xlim = c(-105, -35), ylim = c(-55, 25)) +
  theme_minimal() +
  labs(title = "Occurrence Records for Genus Arthrostylidium",
       color = "Botanical Genus",
       x = "Longitude", y = "Latitude",
       caption = "Data source: BIEN")

#ggsave("visualizations/arthrostylidium.png")

#Occurrence data for Aulonemia genus
aulo_data <- BIEN_occurrence_genus(genus = "Aulonemia")

ggplot(aulo_data, aes(x = longitude, y = latitude)) +
  annotation_borders("world", color = "gray85", fill = "gray90") +
  geom_point(colour = "darkgreen", size =1, alpha = 0.6) +
  coord_sf(xlim = c(-105, -35), ylim = c(-55, 25)) +
  theme_minimal() +
  labs(title = "Occurrence Records for Genus Aulonemia",
       color = "Botanical Genus",
       x = "Longitude", y = "Latitude",
       caption = "Data source: BIEN")

#ggsave("visualizations/aulonemia.png")

#Pick One Species of Bamboo to Look at:
Guadua_angustifolia_range <- BIEN_ranges_load_species(species = "Guadua angustifolia")

map('world', fill = TRUE ,
    col= "grey",
    bg = "light blue",
    xlim = c(-160, -30),
    ylim = c(-60, 35))

#Now, we can add the range map:
plot(Guadua_angustifolia_range[1],
     col = "green",
     add = TRUE)


#Gather Data on Predictor Variables: Annual mean temperature, Rainfall, and Elevation
library(geodata)
library(terra)

path <- tempdir()

clim_data <- worldclim_global(var = "bio", res = 10, path = path)
elev_data <- worldclim_global(var = "elev", res = 10, path = path)

#bio_ht <- worldclim_country(country="BGD", var = "bio", res = 0.5 / 60, path = "data/")


#jpeg("visualizations/gua-angus.jpg")
#Let us start with Haiti at first to check on invasive species of bamboo
#Let us try 'Guadua angustifolia' -
#https://github.com/ShawanChowdhury/InvasiveSpecies_SocialMedia_Bd
#Question: Do this and other  countries have the conditions to match other country's bamboo biodiverstiy?
#Since the country lacks bamboo data, it may be best to make a prediction model 
#https://www.google.com/search?q=predicting+invasive+species+%2B+r&sca_esv=9828cd16d3c42ece&sxsrf=APpeQnsMll-IYaHvf-kgVdqB-kO1JSKlAQ%3A1789966687342&source=hp&ei=X7mwaoeIE8DaptQP4pvb6Aw&iflsig=ABILxe8AAAAAarDHbxLQwDxHkLbxfUWpIwTnz9o0aYFL&ved=0ahUKEwjHs7rE8f6WAxVArYkEHeLNFs0Q4dUDCC0&uact=5&oq=predicting+invasive+species+%2B+r&gs_lp=Egdnd3Mtd2l6Ih9wcmVkaWN0aW5nIGludmFzaXZlIHNwZWNpZXMgKyByMgUQIRigATIFECEYqwIyBRAhGKsCMgUQIRirAjIFECEYnwUyBRAhGJ8FMgUQIRifBTIFECEYnwVIpktQAFjuSXAAeACQAQCYAXKgAf4PqgEEMTkuNbgBA8gBAPgBAZgCGKACixHCAgQQIxgnwgILEAAYgAQYigUYkQLCAg4QLhiABBiKBRixAxiDAcICDhAAGIAEGIoFGLEDGIMBwgIIEAAYgAQYsQPCAgsQLhiABBixAxiDAcICBRAAGIAEwgIIEC4YgAQYsQPCAgsQABiABBixAxiDAcICDhAuGIAEGLEDGMcBGNEDwgIEEAAYA8ICCBAAGIAEGLQHwgIKEAAYgAQYFBiHAsICBhAAGBYYHsICCxAAGIAEGIoFGIYDwgIFEAAY7wWYAwCSBwQxNi44oAfmpgGyBwQxNi44uAeLEcIHBjAuOC4xNsgHUoAIAQ&sclient=gws-wiz



#Next Step: Re-assessing the Invasive Risk of the Land & Geography

#Read GBIF CSV file into dataset to check
#library(rgbif) #Documentation: https://cran.r-project.org/web/packages/rgbif/refman/rgbif.html



#Let's focus on  countries in the LATAM & Caribbean region most vulnerable
#to natural disasters:



#Read: https://www.google.com/search?q=assessing+invasive+species+data+in+r&sca_esv=e76e82dc2fdda140&sxsrf=APpeQntnPRzks11x49vxFKdA1_VhjHm7ag%3A1789349421107&source=hp&ei=LU6naqOJBMD-ptQP9d-d2Ak&iflsig=ABILxe8AAAAAaqdcPVtJqkkQ60y16Z3zvsIuGilSJ4Zl&oq=assessing+invasive+&gs_lp=Egdnd3Mtd2l6IhNhc3Nlc3NpbmcgaW52YXNpdmUgKgUIARigATIFECEYoAEyBRAhGKABMgUQIRigATIFECEYoAEyBRAhGKsCMgUQIRifBTIFECEYnwUyBRAhGJ8FMgUQIRifBTIFECEYnwVImkJQAFilNnADeACQAQCYAXWgAdYQqgEEMTQuOLgBA8gBAPgBAZgCGaACgxLCAgQQIxgnwgILEAAYgAQYigUYkQLCAhEQLhiABBixAxiDARjHARjRA8ICDhAuGIAEGIoFGLEDGIMBwgIREC4YgwEYxwEYsQMY0QMYgATCAg4QABiABBiKBRixAxiDAcICDhAuGIAEGMcBGK8BGI4FwgIKEC4YgAQYigUYQ8ICCxAAGIAEGLEDGIMBwgIIEAAYgAQYsQPCAhEQABiABBiKBRiNBhixAxiDAcICChAAGIAEGIoFGEPCAgUQLhiABMICDRAuGIAEGIoFGEMYsQPCAhAQABiABBiKBRhDGLEDGIMBwgINEAAYgAQYigUYQxixA8ICBRAAGIAEwgIOEC4YrwEYxwEYgAQYjgXCAggQABiABBi0B8ICBxAAGIAEGArCAgYQABgWGB7CAgsQABiABBiKBRiGA8ICBRAAGO8FwgIIEAAYiQUYogTCAgcQIRgKGKABwgIHECEYqwIYCpgDAOIDBRIBMSBAkgcFMTMuMTKgB8y_AbIHBTEwLjEyuAfwEcIHCDAuNy4xNy4xyAdngAgB&sclient=gws-wiz
#Further Information: https://www.sciencedirect.com/science/article/pii/S0006320725007050#ec-research-data
#https://rpubs.com/MLGolub36/1180357







# my_countries <- c("Brazil","Peru","Colombia","Jamaica",
#                   "Ecuador","Chile","Mexico","Costa Rica","Venezuela",
#                   "Belize","Guatemala","Nicaragua", "Honduras",
#                   "Panama","Colombia","Argentina","Bolivia",
#                   "Argentina","El Salvador","Guyana","Paraguay",
#                   "Uruguay","Haiti","Dominican Republic", "Cuba",
#                   "Puerto Rico")


# guadua_traits <- BIEN_trait_genus(genus = "Guadua")
# phyllo_traits <- BIEN_trait_genus(genus = "Phyllostachys")
# ely_traits <- BIEN_trait_genus(genus = "Elytrostachys") #No Data from BIEN database produced on this particular species
# aulo_traits <- BIEN_trait_genus(genus = "Aulonemia")
# arthro_traits <- BIEN_trait_genus(genus = "Arthrostylidium")
