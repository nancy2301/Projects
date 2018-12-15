
#education of head of household
educ_hh_head <- merge(x = hh_head_data, 
                      y = educ_data, 
                      by = c('clust', 'nh','pid'), 
                      all.x = TRUE )

# Merge gender with household head
educ_gender_hh_head <- merge(x = educ_hh_head, 
                             y = gender_data, 
                             by = c("clust", "nh", "pid"), 
                             all.x = TRUE)

# Merge employment data
empl_data <- merge(x = empl_occupation_data,
                   y = empl_status_data, 
                   by = c('clust','nh', 'pid'),
                   all.x = TRUE)

# Merge household head with employment of head
educ_gender_hh_head_employ <- merge(x = educ_gender_hh_head,
                                    y = empl_data, 
                                    by = c('clust','nh', 'pid'),
                                    all.x = TRUE)

# Education of each household using head of household
# drop irrelevant columns from "educ_gender_hh_head_employ"
educ_gender_hh_head_employ <- educ_gender_hh_head_employ %>%
  select(nh, clust, highest_educ_level, is_male, employment_status, empl_cash_crops_y)

# Merge aggricultural profit with education by household head 
agri_hh_educ_gender_employ <- merge(x = agri_data, 
                                    y = educ_gender_hh_head_employ, 
                                    by = c('clust','nh'), 
                                    all.x = TRUE) %>%
  select(nh, clust, agri1c, hh_highest_educ = highest_educ_level, 
         hh_is_male = is_male, employment_status, empl_cash_crops_y)

# Merge aggricultural profit with highest education in an household
agri_educ_gender_employ <- merge(x = agri_hh_educ_gender_employ, 
                                 y = highest_educ, 
                                 by = c('clust','nh'), 
                                 all.x = TRUE) %>%
  select(nh, clust, agri1c, hh_highest_educ, highest_educ_level, 
         hh_is_male, employment_status,empl_cash_crops_y)

#merge two dataframes agri_educ_gender_employ with region_info_data (rural regions)
agri_educ_gender_employ_region <- merge(x = agri_educ_gender_employ, 
                                        y = region_info_data, 
                                        by=c("clust","nh"), 
                                        all.x = TRUE)

# merge Actual and imputed rental income at household level data with agri_educ_gender_employ_region
agri_educ_gender_employ_region_income <- merge(x = agri_educ_gender_employ_region,
                                               y = agg4_data, 
                                               by = c('clust','nh'),
                                               all.x = TRUE)

# merge agricultural profit with land area
agri_land_data <- merge(x = agri_data, y = farm_land_size_data,
                        by = c('clust', 'nh'), all = TRUE)[,c("clust","nh","farm_area_acres")]


infrastructure_data_region_farming <- merge(x=infrastructure_data,
                                   y=region_info_data,
                                   by=c('region','district','eanum'),
                                   all.y = TRUE)
  
agricultural_practices_infrastructure_data_region <- merge(x=infrastructure_data_region_farming,
                                     y=agricultural_practices_data,
                                     by=c('region','district','eanum'),
                                     all.x = TRUE)

# Remove duplicates from agricultural_practices_infrastructure_data_region data
agricultural_practices_infrastructure_data_region <- agricultural_practices_infrastructure_data_region[
                                                    !duplicated(agricultural_practices_infrastructure_data_region), ]

# Merge agri_educ_gender_employ_region_income with infrastructure data
agri_educ_gender_employ_region_income_infra_agripractice <- merge(x = agri_educ_gender_employ_region_income,
                                                                  y= agricultural_practices_infrastructure_data_region,
                                                                  by = c('clust','nh','eanum','region','district','ez','loc2'),
                                                                  all.x = TRUE)

agri_educ_gender_employ_region_income_infra_agripractice_area <- merge(x = agri_educ_gender_employ_region_income_infra_agripractice,
                                                                       y = agri_land_data, 
                                                                       by = c('clust', 'nh'),
                                                                       all.x = TRUE)

base <- agri_educ_gender_employ_region_income_infra_agripractice_area %>%
  select(agri1c, hh_highest_educ, highest_educ_level, hh_is_male, employment_status,
         empl_cash_crops_y, imprt, motorable_road_y, electricity_y, water_y, public_transport_y,
         extension_centre_y, cooperative_y, no_of_tractors, rice_husking_machine_y, 
         chemical_fertilizer_y, insecticides_herbicides_y, irrigated_fields_y, region, ez,
         farm_area_acres) %>%
  rename(agriculture_profit = agri1c, imputed_income = imprt) %>%
  drop_na()
