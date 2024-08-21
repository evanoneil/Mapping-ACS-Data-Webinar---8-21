# Install basic packages you'll need  dependencies
install.packages(c("tidycensus", "tidyverse"))

# Install what you'll need to turn the data into geography files to view
install.packages(c("mapview", "survey", "srvyr"))

# Census API Key (to bypass 500 query restriction)
census_api_key("your_key", install = TRUE)

# Start Tidyverse and Tidycensus
library(tidycensus)
library(tidyverse)

# A basic query
texas_med_income_county <- get_acs(
     geography = "county",
     state = "TX",
     variables = "B19013_001",
     year = 2022
 )

# To get 1-year estimates instead of the default 5-year
geography = "place"
survey = "acs1"

# View as a table
view(texas_med_income_county)

# Search variables
vars <- load_variables(2022, "acs5")
view(vars)
     
# Query tract level data for Harris County
texas_med_income_harris_tract <- get_acs(
     geography = "tract",
     state = "TX",
     county = "HARRIS COUNTY",
     variables = "B19013_001",
     year = 2022,
     )

# Query tract level data for Harris County, rename variable
texas_med_income_harris_tract <- get_acs(
     geography = "tract",
     state = "TX",
     county = "HARRIS COUNTY",
     variables = c(median_income = "B19013_001"),
     year = 2022,
     )

# Add geometry
texas_med_income_harris_tract_sf <- get_acs(
     geography = "tract",
     state = "TX",
     county = "HARRIS COUNTY",
     variables = "B19013_001",
     year = 2022,
     geometry = TRUE
     )

# View map
library(mapview)
mapview(wfh, zcol = "estimate")

# List of variables
vars <- load_variables(2022, "acs5")
view(vars)

#List of variable profile
vars <- load_variables(2022, "acs5/profile")
view(vars)

# Export as shapefile
library(sf)
st_write(texas_med_income_harris_tract_sf, "texas_med_income_harris_tract_sf.shp")

# Then compress all the files into a .zip, and go over to Felt

