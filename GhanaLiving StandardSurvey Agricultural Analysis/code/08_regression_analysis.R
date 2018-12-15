colnames(base)
model1 <- lm(log(agriculture_profit) ~ highest_educ_level
             + I(hh_highest_educ^2) + factor(hh_is_male) + factor(empl_cash_crops_y)
             + imputed_income + motorable_road_y + electricity_y + factor(water_y)
             + public_transport_y + extension_centre_y + cooperative_y
             + no_of_tractors + insecticides_herbicides_y
             + rice_husking_machine_y + chemical_fertilizer_y + irrigated_fields_y
             + region + factor(ez) + farm_area_acres, data = base)
summary(model1)

summary(model1)$r.squared
summary(model1)$coef

res_model1 <- resid(model1) # extract model residuals
std_res_model1 <- rstandard(model1) #compute regression
fit_model1 <- fitted(model1) # 

breaks1 <- pretty(range(std_res_model1), n = nclass.FD(std_res_model1), min.n = 1)
bwidth1 <- breaks1[2]-breaks1[1]
qplot(std_res_model1, 
      geom="histogram", 
      binwidth = bwidth1,
      xlab = "standardized residuals",
      ylab = "agricultural profit")
ggsave(here("figures", "Standardized_Histogram_1.pdf"))

ggplot(model1, 
       aes(x=fit_model1, y=std_res_model1)) +
  geom_point(shape=1) 
ggsave(here("figures", "Residuals_VS_Fitted_1.pdf"))


# Analysis of dummies
# Our Equation Coefficients
b0 <- coef(model1)["(Intercept)"]
b1 <- coef(model1)["base$highest_educ_level"]
b2 <- coef(model1)["base$I(hh_highest_educ^2)"]
b3 <- coef(model1)["base$factor(hh_is_male)1"]
b4 <- coef(model1)["base$factor(empl_cash_crops_y)1"]
b5 <- coef(model1)["base$imputed_income"]
b6 <- coef(model1)["base$motorable_road_y"]
b7 <- coef(model1)["base$electricity_y"]
b8 <- coef(model1)["base$factor(water_y)1"]
b9 <- coef(model1)["base$public_transport_y"]
b10 <- coef(model1)["base$extension_centre_y"]
b11 <- coef(model1)["base$cooperative_y"]
b12 <- coef(model1)["base$no_of_tractors"]
b13 <- coef(model1)["base$insecticides_herbicides_y"]
b14 <- coef(model1)["base$rice_husking_machine_y"]
b15 <- coef(model1)["base$chemical_fertilizer_y"]
b16 <- coef(model1)["base$irrigated_fields_y"]
b17 <- coef(model1)["base$region"]
b18 <- coef(model1)["base$factor(ez)2"]
b19 <- coef(model1)["base$factor(ez)3"]
b20 <- coef(model1)["base$farm_area_acres"]

# equation would be log(y) = b0 + b1 * highest_educ_level + b2 * hh_highest_educ^2 
#                           + b3 * factor(hh_is_male)1 + b4 * factor(empl_cash_crops_y)1 
#                           + b5 * imputed_income + b6 * motorable_road_y + b7 * electricity_y
#                           + b8 * factor(water_y)1 + b9 * public_transport_y + b10 * extension_centre_y 
#                           + b11 * cooperative_y + b12 * no_of_tractors + b13 * insecticides_herbicides_y 
#                           + b14 * rice_husking_machine_y + b15 * chemical_fertilizer_y 
#                           + b16 * irrigated_fields_y + b17 * region + b18 * factor(ez)2
#                           + b19 * factor(ez)3 + b20 * farm_area_acres

# Equation incase hh_is_male = 1
# equation would be log(y) = b0 + b1 * highest_educ_level + b2 * hh_highest_educ^2 
#                           + b3 * 1 + b4 * factor(empl_cash_crops_y)1 
#                           + b5 * imputed_income + b6 * motorable_road_y + b7 * electricity_y
#                           + b8 * factor(water_y)1 + b9 * public_transport_y + b10 * extension_centre_y 
#                           + b11 * cooperative_y + b12 * no_of_tractors + b13 * insecticides_herbicides_y 
#                           + b14 * rice_husking_machine_y + b15 * chemical_fertilizer_y 
#                           + b16 * irrigated_fields_y + b17 * region + b18 * factor(ez)2
#                           + b19 * factor(ez)3 + b20 * farm_area_acres

# Equation incase hh_is_male = 0
# equation would be log(y) = b0 + b1 * highest_educ_level + b2 * hh_highest_educ^2 
#                           + b3 * 0 + b4 * factor(empl_cash_crops_y)1 
#                           + b5 * imputed_income + b6 * motorable_road_y + b7 * electricity_y
#                           + b8 * factor(water_y)1 + b9 * public_transport_y + b10 * extension_centre_y 
#                           + b11 * cooperative_y + b12 * no_of_tractors + b13 * insecticides_herbicides_y 
#                           + b14 * rice_husking_machine_y + b15 * chemical_fertilizer_y 
#                           + b16 * irrigated_fields_y + b17 * region + b18 * factor(ez)2
#                           + b19 * factor(ez)3 + b20 * farm_area_acres

# water_y and empl_cash_crops_y will be similar to hh_is_male

# Equation incase ez = 1
# equation would be log(y) = b0 + b1 * highest_educ_level + b2 * hh_highest_educ^2 
#                           + b3 * factor(hh_is_male)1 + b4 * factor(empl_cash_crops_y)1 
#                           + b5 * imputed_income + b6 * motorable_road_y + b7 * electricity_y
#                           + b8 * factor(water_y)1 + b9 * public_transport_y + b10 * extension_centre_y 
#                           + b11 * cooperative_y + b12 * no_of_tractors + b13 * insecticides_herbicides_y 
#                           + b14 * rice_husking_machine_y + b15 * chemical_fertilizer_y 
#                           + b16 * irrigated_fields_y + b17 * region + b18 * 0
#                           + b19 * 0 + b20 * farm_area_acres

# Equation incase ez = 2
# equation would be log(y) = b0 + b1 * highest_educ_level + b2 * hh_highest_educ^2 
#                           + b3 * factor(hh_is_male)1 + b4 * factor(empl_cash_crops_y)1 
#                           + b5 * imputed_income + b6 * motorable_road_y + b7 * electricity_y
#                           + b8 * factor(water_y)1 + b9 * public_transport_y + b10 * extension_centre_y 
#                           + b11 * cooperative_y + b12 * no_of_tractors + b13 * insecticides_herbicides_y 
#                           + b14 * rice_husking_machine_y + b15 * chemical_fertilizer_y 
#                           + b16 * irrigated_fields_y + b17 * region + b18 * 1
#                           + b19 * 0 + b20 * farm_area_acres

# Equation incase ez = 3
# equation would be log(y) = b0 + b1 * highest_educ_level + b2 * hh_highest_educ^2 
#                           + b3 * factor(hh_is_male)1 + b4 * factor(empl_cash_crops_y)1 
#                           + b5 * imputed_income + b6 * motorable_road_y + b7 * electricity_y
#                           + b8 * factor(water_y)1 + b9 * public_transport_y + b10 * extension_centre_y 
#                           + b11 * cooperative_y + b12 * no_of_tractors + b13 * insecticides_herbicides_y 
#                           + b14 * rice_husking_machine_y + b15 * chemical_fertilizer_y 
#                           + b16 * irrigated_fields_y + b17 * region + b18 * 0
#                           + b19 * 1 + b20 * farm_area_acres



