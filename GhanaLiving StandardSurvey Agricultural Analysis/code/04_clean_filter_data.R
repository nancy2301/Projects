# Clean Region Data only consider where locality is rural
region_info_data <- sec0a_data %>%
  select(region, district, nh, clust, ez, loc2, eanum) %>%
  filter(loc2, loc2 == "2")

# Clean and filter education data
#colnames(sec2a_data)
educ_data <- sec2a_data %>%
  select(nh, pid, clust, s2aq1, s2aq2, s2aq3) %>%
  rename(attended_school = s2aq1, highest_educ_level = s2aq2,
         highest_educ_qualification = s2aq3) %>%
  mutate(attended_school = if_else(attended_school == 1, 1, 0),
         highest_educ_level = if_else((attended_school == 0), 0, highest_educ_level),
         highest_educ_qualification = if_else((attended_school == 0), 0, highest_educ_qualification)) %>%
  filter(highest_educ_level < 96)

#Highest education per household Data
# Select highest education per household while eliminating other educational levels
# Here 96 stands for other education level
highest_educ <- educ_data %>%
  select(nh, clust, highest_educ_level) %>%
  group_by(clust, nh) %>%
  arrange(desc(highest_educ_level),.by_group = TRUE) %>%
  filter(row_number() == 1) 

# Filter out top and bottom 5 rows to eliminate outliers
# Add an offset of 25,00,000 cedis to remove -ve profit to apply log function
agri_data <- agg2_data %>%
  arrange(agri1c) %>%
  mutate(agri1c = agri1c + 2500000) %>%
  filter(row_number() > 5 & row_number() <= n()-5 )

# Get head of households
hh_head_data <- sec1_data %>%
  select(nh, clust, pid, rel) %>%
  filter(rel, rel == "1")

# Get gender of household member
gender_data <- sec1_data %>%
  select(nh,pid,clust,sex) %>%
  rename(is_male = sex) %>%
  mutate(is_male = if_else(is_male == 1, 1, 0))

# Clean and filter employment data if the household member has worked on a farm 
# Add a new field cash_crops_y which is true when agricultural activity is a cash crop(1), 
# food crop(0) otherwise
empl_occupation_data <- sec4a_data %>%
  select(nh,clust, pid,s4aq3 , s4aq6) %>%
  filter((s4aq3 == 1) & (s4aq6 == 1 | s4aq6 == 12 | 
                           s4aq6 == 13 | s4aq6 == 14 | s4aq6 == 15 |
                           s4aq6 == 16 | s4aq6 == 17 | s4aq6 == 18 |
                           s4aq6 == 20 | s4aq6 == 21 | s4aq6 == 22 )) %>%
  mutate(empl_cash_crops_y = case_when(s4aq6 == 12 | s4aq6 == 13 | s4aq6 == 14 |
                            s4aq6 == 15 | s4aq6 == 16 | s4aq6 == 17 |
                            s4aq6 == 18 | s4aq6 == 20 | s4aq6 == 21 |
                            s4aq6 == 22  ~ 0, 
                            TRUE ~ 1)) %>%
  rename(worked_on_farm = s4aq3, agricultural_activities = s4aq6)

# Clean and filter employment status data
empl_status_data <- sec4b_data %>%
  select(nh,clust, pid ,s4bq8) %>%
  filter(s4bq8 == 5 | s4bq8 == 6) %>%
  rename(employment_status = s4bq8)

# Get size of agricultural lands
farm_land_size_data <- sec8b_data %>%
  select(nh, s8bq4a, s8bq4b, clust, s8bq8) %>%
  rename(land_size = s8bq4a, unit_of_measurement = s8bq4b, own_status = s8bq8) %>%
  filter(unit_of_measurement,unit_of_measurement != 4)

# convert farm land area to a common unit of measurement (acres)
farm_land_size_data <- merge(x = farm_land_size_data, 
                             y = plot_area_conversion, 
                             by = c('unit_of_measurement'),
                             all.x = TRUE) 

# summing up all the land sizes of farm_land_size_data
farm_land_size_data <- farm_land_size_data %>%
                      mutate(area_acres = land_size * conversion_acres)%>% 
                      group_by(clust,nh) %>% 
                      summarise(farm_area_acres = sum(area_acres))

# Clean and filter community data
# Merge using columns region / district / eanum

#colnames(cs2_data)
infrastructure_data <- cs2_data %>%
  select(region, district, eanum, s2q1a, s2q4, s2q8, s2q9, s2q10, s2q11, s2q23) %>%
  rename(primary_occupation = s2q1a, motorable_road_y = s2q4, electricity_y = s2q8,
         electricity_most_few = s2q9, water_y = s2q10, water_most_few = s2q11, 
         public_transport_y = s2q23) %>%
  mutate(electricity_most_few = if_else(electricity_y == 2, 0, electricity_most_few),
         water_most_few = if_else(water_y == 2, 0, water_most_few),
         motorable_road_y = if_else(motorable_road_y == 1, 1, 0),
         water_y = if_else(water_y == 1, 1, 0),
         water_y = if_else(water_y == 1, 1, 0),
         electricity_y = if_else(electricity_y == 1, 1, 0),
         public_transport_y = if_else(public_transport_y == 1, 1, 0)) %>%
  filter(primary_occupation, primary_occupation == "1")

#colnames(cs5b_data)
agricultural_practices_data <- cs5b_data %>%
  select(region, district, eanum, s5bq5, s5bq10, s5bq13, s5bq14, s5bq15, s5bq16, s5bq17, s5bq18, s5bq24) %>%
  rename(extension_centre_y = s5bq5, cooperative_y = s5bq10,
         no_of_tractors = s5bq13, rice_husking_machine_y = s5bq14, chemical_fertilizer_y = s5bq15, 
         insecticides_herbicides_y = s5bq16, irrigated_fields_y = s5bq17, rainfall_more_less = s5bq18, 
         plot_measure_equip = s5bq24) %>%
  mutate(extension_centre_y = if_else(extension_centre_y == 1, 1, 0),
         cooperative_y = if_else(cooperative_y == 1, 1, 0),
         rice_husking_machine_y = if_else(rice_husking_machine_y == 1, 1, 0),
         chemical_fertilizer_y = if_else(chemical_fertilizer_y == 1, 1, 0),
         insecticides_herbicides_y = if_else(insecticides_herbicides_y == 1, 1, 0),
         irrigated_fields_y = if_else(irrigated_fields_y == 1, 1, 0))
