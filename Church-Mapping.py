# Import Pandas and Nominatim
import pandas as pd
pd.options.display.max_rows = 100

# Read the data frame in as a CSV and preview
church_df = pd.read_csv("Seattle-Churches.csv")
church_df.head(10)

# Import GeoPy and Nominatim
!pip install geopy
from geopy.geocoders import Nominatim

# Geocode the central location
geolocator = Nominatim(user_agent = "Joe's Church Map", timeout=2)
location = geolocator.geocode("804 9th Ave, Seattle, WA 98104")
# Print location
location

# Install Folium to make maps
!pip install folium
import folium

# Create base map using Folium
church_map = folium.Map(location=[47.60767615, -122.32579227764282], zoom_start=12)

# Visualize map
church_map
