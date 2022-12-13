#### Mapping Seattle Catholic Church Locations
# Install tidyverse and tidygeocoder -- once per machine.
#install.packages("tidyverse")
#install.packages("tidygeocoder")

# Load libraries -- once per script.
library("tidygeocoder")
library("dplyr")
library("ggplot2")

# Load church locations
church_df <- read.csv("Churches.csv", stringsAsFactors = FALSE)

# Geocode church locations
church_map <- church_df %>%
  geocode(street = ADDRESS, method = 'osm',
          lat = latitude , long = longitude)

# Put church locations onto a map using leaflet
leaflet() %>%
  addTiles() %>% 
  # Centering view on St. James, the main Catholic church in the diocese
  setView(lng = -122.33410, lat = 47.606, zoom = 12) %>%  
  # Add markers
  addMarkers(lat = church_map$latitude,
             lng = church_map$longitude, 
             popup = church_map$LABEL,
             label = church_map$LABEL)
