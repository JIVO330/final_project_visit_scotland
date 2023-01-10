#Import raw data, check and clean

library(tidyverse)
library(janitor)


#regional_domestic_tourism

regional_domestic_tourism <- read_csv("raw_data/regional_domestic_tourism.csv") %>% clean_names()

regional_domestic_tourism_clean<- regional_domestic_tourism %>% 
  rename(year = date_code) %>% 
  rename(area = feature_code) %>% 
  mutate(area = recode(area, 
                       "S92000003"= "Scotland",
                       "S12000015" =	"Fife","S12000024"	= "Perth and Kinross", "S12000044"	= "North Lanarkshire", "S12000046"	= "Glasgow City",
                       "S12000005"	= "Clackmannanshire","S12000006"	= "Dumfries and Galloway","S12000008"	= "East Ayrshire","S12000010"	= "East Lothian",
                       "S12000011"	= "East Renfrewshire","S12000013"	= "Na h-Eileanan Siar","S12000014"	= "Falkirk","S12000017"	= "Highland",
                       "S12000009"	= "East Dunbartonshire","S12000043"	= " Glasgow City","S12000003"	= "Angus","S12000007"	= "Dundee City",
                       "S12000037"	= "Glasgow City","S12000022"	= "North Lanarkshire","S12000018"	= "Inverclyde","S12000019"	= "Midlothian",
                       "S12000020"	= "Moray","S12000021"	= "North Ayrshire","S12000023"	= "Orkney Islands","S12000026"	= "Scottish Borders",
                       "S12000027"	= "Shetland Islands","S12000028"	= "South Ayrshire","S12000029"	= "South Lanarkshire","S12000030"	= "Stirling",
                       "S12000033"	= "Aberdeen City","S12000034"	= "Aberdeenshire","S12000035"	= "Argyll and Bute","S12000036"	= "City of Edinburgh",
                       "S12000038"	= "Renfrewshire","S12000039"	= "West Dunbartonshire","S12000040"	= "West Lothian","S12000041"	= "Angus",
                       "S12000042"	= "Dundee City","S12000045"	= "East Dunbartonshire","S12000047"	= "Fife","S12000048"	= "Perth and Kinross",
                       "S12000049"	= "Glasgow City","S12000050"	= "North Lanarkshire"))




write_csv(regional_domestic_tourism_clean,"clean_data/regional_domestic_tourism_clean.csv")


# scottish_accommodation_occupancy

scottish_accomodation_occupancy <- read_csv("raw_data/scottish_accomodation_occupancy.csv")%>% clean_names()

scottish_accomodation_occupancy_clean <- scottish_accomodation_occupancy %>%
  rename(year = date_code) %>% 
  rename(area = feature_code) %>% 
  mutate(area = recode(area, 
                       "S92000003"= "Scotland"))


write_csv(scottish_accomodation_occupancy_clean,"clean_data/scottish_accomodation_occupancy_clean.csv")

# tourism_day_visits_activities

tourism_day_visits_activities <- read_csv("raw_data/tourism_day_visits_activities.csv")%>% clean_names()

tourism_day_visits_activities_clean <- tourism_day_visits_activities %>% 
  rename(year = date_code) %>% 
  rename(area = feature_code) %>% 
  mutate(area = recode(area, 
                       "S92000003"= "Scotland"))




write_csv(tourism_day_visits_activities_clean,"clean_data/tourism_day_visits_activities_clean.csv")



# tourism_day_visits_demographics


tourism_day_visits_demmographics <- read_csv("raw_data/tourism_day_visits_demographics.csv") %>% clean_names()

tourism_day_visits_demmographics_clean<- tourism_day_visits_demmographics %>% 
  rename(year = date_code) %>% 
  rename(area = feature_code) %>% 
  mutate(area = recode(area, 
                       "S92000003"= "Scotland"))




write_csv(tourism_day_visits_demmographics_clean,"clean_data/tourism_day_visits_demmographics_clean.csv")




#tourism_day_visits_location

tourism_day_visits_location <- read_csv("raw_data/tourism_day_visits_location.csv") %>% clean_names()

tourism_day_visits_location_clean<- tourism_day_visits_location %>% 
  rename(year = date_code) %>% 
  rename(area = feature_code) %>% 
  mutate(area = recode(area, 
                       "S92000003"= "Scotland"))





write_csv(tourism_day_visits_location_clean,"clean_data/tourism_day_visits_location_clean.csv")


#tourism_day_visits_transportation

tourism_day_visits_transport <- read_csv("raw_data/tourism_day_visits_transport.csv") %>% clean_names()

tourism_day_visits_transport_clean<- tourism_day_visits_transport %>% 
  rename(year = date_code) %>% 
  rename(area = feature_code) %>% 
  mutate(area = recode(area, 
                       "S92000003"= "Scotland"))


write_csv(tourism_day_visits_transport_clean,"clean_data/tourism_day_visits_transport_clean.csv")




     #joins few tables the master tables and save as csv



# tourism_day_visits_location_clean + tourism_day_visits_activities_clean = answer question2!!!!!!


visit_sites_activity <- full_join(tourism_day_visits_location_clean, tourism_day_visits_activities_clean)

write_csv(visit_sites_activity,"clean_data/visit_sites_activity.csv")

# To answer some questions is -likely/ possibly- needed/ interesting to have a new dataset with tourism_location_activities + demographics.

tourism_demographic_location_activities <- full_join(tourism_day_visits_demmographics_clean,visit_sites_activity)

write_csv(tourism_demographic_location_activities,"clean_data/tourism_demographic_location_activities.csv")




